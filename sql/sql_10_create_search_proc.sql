
IF NOT EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND OBJECT_ID = OBJECT_ID('dbo._disc_searchTracks'))
   exec('CREATE PROCEDURE [dbo].[_disc_searchTracks] AS BEGIN SET NOCOUNT ON; END')
GO

ALTER PROCEDURE [dbo].[_disc_searchTracks] (@idArtist INT, @tracknumber INT, @idAlbumtype INT, @idAlbum INT, @maxtime INT, @mintime INT, @writers VARCHAR(1024) = NULL, @minyear INT = 0, @maxyear INT = 9999)
AS
BEGIN
    if (ISNULL(@idArtist, 0) = 0)
    BEGIN
        SET @idArtist = NULL
    END

    if (ISNULL(@tracknumber, 0) = 0)
    BEGIN
        SET @tracknumber = NULL
    END

    if (ISNULL(@idAlbumtype, 0) = 0)
    BEGIN
        SET @idAlbumtype = NULL
    END

    if (ISNULL(@idAlbum, 0) = 0)
    BEGIN
        SET @idAlbum = NULL
    END

    if (ISNULL(@maxtime, 0) = 0)
    BEGIN
        SET @maxtime = NULL
    END

    if (ISNULL(@mintime, 0) = 0)
    BEGIN
        SET @mintime = NULL
    END

    if (ltrim(rtrim(ISNULL(@writers, ''))) = '')
    BEGIN
        set @writers = ''
    END

    declare @writersList TABLE (id int, item VARCHAR(1024))
    declare @writersIgnoreList TABLE (id int, item VARCHAR(1024))
    declare @strictWriterSearch BIT, @temp INT

    SET @strictWriterSearch = 0

    INSERT INTO @writersList
        (id,item)
    select ROW_NUMBER() OVER(ORDER BY Item ASC) AS id, Item from dbo.split(@writers,',')
    delete from @writersList where item = ''

    select @temp = count(*) from @writersList 

    if exists (select 1 from @writersList where item = -1) AND @temp = 1
    BEGIN
        delete from @writersList
    END

    if not exists (select 1 from @writersList)
    BEGIN
        insert into @writersList
            (id, item)
        select id, id from _bandwriter where idBand = ISNULL(@idArtist, idBand)
    END

    select @temp = count(*) from @writersList

    if exists (select 1 from @writersList where item = -1) AND @temp > 1
    BEGIN
        print 'strict list'
        set @strictWriterSearch = 1
        delete from @writersList where item = -1
        insert into @writersIgnoreList
            select id, id from _bandwriter where idBand = ISNULL(@idArtist, idBand) AND id not in (select item from @writersList)
    END

    DECLARE @results TABLE (idAlbum INT, [track title] VARCHAR(1024), [length] CHAR(8), album VARCHAR(1024), releaseYear INT, [track number] INT, [album type] VARCHAR(20), artist VARCHAR(1024), [writer(s)] VARCHAR(1024), writerids varchar(50))

    insert into @results
    SELECT c.trackname AS [track title]
        , RIGHT(CONVERT(CHAR(8),DATEADD(second,c.seconds,0),108),5) AS [length]
        , b.albumname AS album
        , b.albumYear AS [releaseYear]
        , c.tracknumber AS [track number]
        , d.albumtype as [album type]
        , a.bandname AS artist
        , ltrim(
                rtrim(
                        ISNULL(
                                STUFF(
                                    (SELECT N', ' + f.writer FROM _BandTrack2Writer e INNER JOIN _BandWriter f on f.id = e.idwriter WHERE e.idTrack = c.id ORDER BY f.writer FOR XML PATH(''))
                                    , 1
                                    , 1
                                    , '')
                                ,''
                            )
                    )
                )
            AS [writer(s)]
        , ltrim(
                rtrim(
                        ISNULL(
                                STUFF(
                                    (SELECT N',' + CONVERT(VARCHAR, f.id) FROM _BandTrack2Writer e INNER JOIN _BandWriter f on f.id = e.idwriter WHERE e.idTrack = c.id ORDER BY f.id FOR XML PATH(''))
                                    , 1
                                    , 1
                                    , '')
                                ,''
                            )
                    )
                )
            AS [writerids]
        FROM _Band a
            InNER JOIN _bandAlbum b on b.idBand = a.id
            INNER JOIN _bandtrack c on c.idAlbum = b.id
            INNER JOIN _BandAlbumType d ON d.id = b.idAlbumType
            INNER JOIN _bandTrack2Writer g ON g.idTrack = c.id
        WHERE a.id = ISNULL(@idArtist, a.id)
            AND ((c.tracknumber = ISNULL(@tracknumber, c.tracknumber) AND ISNULL(@tracknumber, c.tracknumber) != 99) --99 is last track on album
                OR
                  (@tracknumber = 99 AND c.tracknumber = (SELECT MAX(cc.tracknumber) from _BandTrack cc WHERE cc.idAlbum = ISNULL(@idAlbum, b.id)))
                )
            AND d.id = ISNULL(@idAlbumtype, d.id)
            AND b.id = ISNULL(@idAlbum, b.id)
            AND c.seconds BETWEEN ISNULL(@mintime, c.seconds) AND ISNULL(@maxtime, c.seconds)
            AND (g.idWriter IN (SELECT item from @writersList))
            AND (b.albumYear >= @minyear AND b.albumYear <= @maxyear)
        GROUP BY c.trackname, c.seconds, b.albumname, b.albumYear, c.tracknumber, d.albumtype, a.bandname, c.id
        ORDER BY b.albumYear, c.tracknumber

        if @strictWriterSearch = 1
        BEGIN
            declare @allowed VARCHAR(50)
            select @allowed = ltrim(
                rtrim(
                        ISNULL(
                                STUFF(
                                    (SELECT N',' + CONVERT(VARCHAR, item) FROM @writersList ORDER BY item FOR XML PATH(''))
                                    , 1
                                    , 1
                                    , '')
                                ,''
                            )
                    )
                )
            if ISNULL(@allowed,'') != ''
            BEGIN
                delete from @results where writerids != @allowed
            END
        END

        select * from @results
        ORDER BY releaseYear, idAlbum, track_number
END
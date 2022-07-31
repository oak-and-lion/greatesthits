declare @idBand int, @idAlbum INT

declare @tracks TABLE (id int identity, idAlbum int, trackNumber int, seconds int, trackname varchar(1024), writers VARCHAR(1024))
declare @writersList TABLE (id int, item VARCHAR(1024))

select @idBand = id from _Band where bandname = 'Rush'
select @idAlbum = id from _BandAlbum where idBand = @idBand and albumname = 'Rush'

Insert into @tracks
    (idAlbum, trackNumber, seconds, trackname,writers)
VALUES
    (@idAlbum, 1, 5*60+3, 'Finding My Way','Lee|Lifeson')
    , (@idAlbum, 2, 2*60+26, 'Need Some Love','Lee|Lifeson')
    , (@idAlbum, 3, 4*60+27,'Take a Friend','Lee|Lifeson')
    , (@idAlbum, 4, 7*60+30, 'Here Again','Lee|Lifeson')
    , (@idAlbum, 5, 7*60+30, 'What You''re Doing','Lee|Lifeson')
    , (@idAlbum, 6, 4*60+19, 'In the Mood','Lee')
    , (@idAlbum, 7, 3*60+36, 'Before and After','Lee|Lifeson')
    , (@idAlbum, 8, 7*60+7, 'Working Man','Lee|Lifeson')

if not exists (select 1 from INFORMATION_SCHEMA.TABLES where TABLE_NAME = '_BandTrack')
BEGIN
    create TABLE _BandTrack (
        id INT IDENTITY,
        idAlbum INT,
        trackname VARCHAR(1024),
        seconds INT,
        tracknumber INT
    )
END

if not exists (select 1 from INFORMATION_SCHEMA.TABLES where TABLE_NAME = '_BandTrack2Writer')
BEGIN
    create TABLE _BandTrack2Writer (
        id INT IDENTITY,
        idTrack INT,
        idWriter INT
    )
END

declare @count INT, @total INT, @name VARCHAR(1024), @seconds INT, @number INT, @id INT, @writers VARCHAR(1024), @count2 INT, @total2 INT, @idWriter INT, @writerName VARCHAR(250)

set @count = 1

select @total = count(*) from @tracks

while @count <= @total
BEGIN
    select @name = trackname, @number = trackNumber, @idAlbum = idAlbum, @seconds = seconds, @writers = writers from @tracks where id = @count
    select @idBand = idBand from _BandAlbum where id = @idAlbum
    if not exists (select 1 from _BandTrack where trackname = @name and idAlbum = @idAlbum)
    BEGIN
        insert into _BandTrack
            (trackname, idAlbum, seconds, tracknumber)
        VALUES
            (@name, @idAlbum, @seconds, @number)
    END
    ELSE
    BEGIN
        select @id = id from _BandTrack where trackname = @name and idAlbum = @idAlbum
        update _BandTrack
            set tracknumber = @number
                , seconds = @seconds
            where id = @id
    END
    select @id = id from _BandTrack where trackname = @name and idAlbum = @idAlbum
    delete from @writersList
    INSERT INTO @writersList
        (id,item)
    select ROW_NUMBER() OVER(ORDER BY Item ASC) AS id, Item from dbo.split(@writers,'|')
    set @count2 = 1
    select @total2 = count(*) FROM @writersList
    while @count2 <= @total2
    BEGIN
        select @writerName = item from @writersList where id = @count2
        if ltrim(rtrim(ISNULL(@writerName,''))) != ''
        begin
            select @idWriter = id from _BandWriter where idBand = @idBand and writer = @writerName
            if not exists (select 1 from _BandTrack2Writer where idTrack = @id and idwriter = @idwriter)
            BEGIN
            insert into _BandTrack2Writer
                    (idTrack, idWriter)
                VALUES
                    (@id, @idwriter)
            END
        END
        set @count2 = @count2 + 1
    END
    set @count = @count + 1
END
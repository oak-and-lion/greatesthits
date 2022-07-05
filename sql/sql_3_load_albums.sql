truncate table _BandAlbum

declare @album as TABLE (id int identity, idBand int, albumName VARCHAR(1024), albumYear int, idAlbumType int)

declare @id INT, @studioAlbumId INT

select @studioAlbumId = id from _BandAlbumType where albumtype = 'Studio'

-- Iron Maiden Albums
select @id = id from _Band where bandname = 'Iron Maiden'
insert into @album
    (idBand, albumName, albumYear, idAlbumType)
VALUES
    (@id, 'Iron Maiden', 1980, @studioAlbumId), 
    (@id, 'Killers', 1981, @studioAlbumId), 
    (@id, 'Number of the Beast', 1982, @studioAlbumId)
    , (@id, 'Piece of Mind', 1983, @studioAlbumId)
    , (@id, 'Powerslave', 1984, @studioAlbumId)
    , (@id, 'Somewhere in Time', 1986, @studioAlbumId)
    , (@id, 'Seventh Son of a Seventh Son', 1988, @studioAlbumId)
    , (@id, 'No Prayer for the Dying', 1990, @studioAlbumId)
    , (@id, 'Fear of the Dark', 1992, @studioAlbumId)
    , (@id, 'The X Factor', 1995, @studioAlbumId)
    , (@id, 'Virtual XI', 1988, @studioAlbumId)
    , (@id, 'Brave New World', 2000, @studioAlbumId)
    , (@id, 'Dance of Death', 2003, @studioAlbumId)
    , (@id, 'A Matter of Life and Death', 2006, @studioAlbumId)
    , (@id, 'The Final Frontier', 2010, @studioAlbumId)
    , (@id, 'The Book of Souls', 2015, @studioAlbumId)
    , (@id, 'Senjutsu', 2021, @studioAlbumId)

-- Alice Cooper Albums

select @id = id from _Band where bandname = 'Alice Cooper'
insert into @album
    (idBand, albumName, albumYear, idAlbumType)
VALUES
    (@id, 'Pretties for You', 1969, @studioAlbumId)

-- RUSH Albums

select @id = id from _Band where bandname = 'Rush'
insert into @album
    (idBand, albumName, albumYear, idAlbumType)
VALUES
    (@id, 'Rush', 1974, @studioAlbumId),
    (@id, 'Fly by Night', 1975, @studioAlbumId)


if not exists (select 1 from INFORMATION_SCHEMA.TABLES where TABLE_NAME = '_BandAlbum')
BEGIN
    create TABLE _BandAlbum (
        id INT IDENTITY,
        idBand int, 
        albumName VARCHAR(1024), 
        albumYear int, 
        idAlbumType int
    )
END

declare @count INT, @total INT, @name VARCHAR(50), @bandId int, @year int, @type int

set @count = 1

select @total = count(*) from @album

while @count <= @total
BEGIN
    select @name = albumName, @bandId = idBand, @year = albumYear, @type = idAlbumType from @album where id = @count
    if not exists (select 1 from _BandAlbum where albumName = @name and idBand = @bandId and albumYear = @year and idAlbumType = @type)
    BEGIN
        insert into _BandAlbum
            (idBand, albumName, albumYear, idAlbumType)
        VALUES
            (@bandId, @name, @year, @type)
    END
    set @count = @count + 1
END

select * from _BandAlbum
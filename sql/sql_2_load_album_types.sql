declare @type as TABLE (albumtype varchar(50), id int identity)

insert into @type
    (albumtype)
VALUES
	  ('Studio')
	, ('Live')
	, ('Collection')

if not exists (select 1 from INFORMATION_SCHEMA.TABLES where TABLE_NAME = '_BandAlbumType')
BEGIN
    create TABLE _BandAlbumType (
        id INT IDENTITY,
        albumtype VARCHAR(1024)
    )
END

declare @count INT, @total INT, @name VARCHAR(50)

set @count = 1

select @total = count(*) from @type

while @count <= @total
BEGIN
    select @name = albumtype from @type where id = @count
    if not exists (select 1 from _BandAlbumType where albumtype = @name)
    BEGIN
        insert into _BandAlbumType
            (albumtype)
        VALUES
            (@name)
    END
    set @count = @count + 1
END

select * from _BandAlbumType
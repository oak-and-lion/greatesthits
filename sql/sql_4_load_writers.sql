declare @writers as TABLE (writer varchar(250), idBand int, id int identity)

declare @idBand INT

select @idBand = id from _Band where bandname = 'Iron Maiden'

insert into @writers
    (writer, idBand)
VALUES
    ('Harris', @idBand), ('Dickinson', @idBand), ('Murray', @idBand), ('Di''Anno', @idBand), ('Smith', @idBand), ('McBrain', @idBand), ('Gers', @idBand), ('Bayley', @idBand), ('Burr', @idBand)

select @idBand = id from _Band where bandname = 'Alice Cooper'

insert into @writers
    (writer, idBand)
VALUES
    ('Cooper', @idBand)
    
if not exists (select 1 from INFORMATION_SCHEMA.TABLES where TABLE_NAME = '_BandWriter')
BEGIN
    create TABLE _BandWriter (
        id INT IDENTITY,
        writer VARCHAR(250),
        idBand INT
    )
END

declare @count INT, @total INT, @name VARCHAR(250)

set @count = 1

select @total = count(*) from @writers

WHILE @count <= @total
BEGIN
    select @name = writer, @idBand = idBand from @writers where id = @count
    if not exists (select 1 from _BandWriter where writer = @name and idBand = @idBand)
    BEGIN
        insert into _BandWriter
            (writer, idBand)
        VALUES
            (@name, @idBand)
    END
    set @count = @count + 1
END

select * from _BandWriter order by idBand, writer
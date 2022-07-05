declare @bands TABLE (bandname VARCHAR(1024), id int identity)

insert into @bands
    (bandname)
VALUES
    ('Iron Maiden'), ('Alice Cooper'), ('Rush'), ('Motorhead')



if not exists (select 1 from INFORMATION_SCHEMA.TABLES where TABLE_NAME = '_Band')
BEGIN
    create TABLE _Band (
        id INT IDENTITY,
        bandname VARCHAR(1024)
    )
END

declare @count INT, @total INT, @name VARCHAR(1024)

set @count = 1

select @total = count(*) from @bands

while @count <= @total
BEGIN
    select @name = bandname from @bands where id = @count
    if not exists (select 1 from _Band where bandname = @name)
    BEGIN
        insert into _band
            (bandname)
        VALUES
            (@name)
    END
    set @count = @count + 1
END

select * from _Band
declare @idBand int, @idAlbum INT

declare @tracks TABLE (id int identity, idAlbum int, trackNumber int, seconds int, trackname varchar(1024), writers VARCHAR(1024))
declare @writersList TABLE (id int, item VARCHAR(1024))

select @idBand = id from _Band where bandname = 'Iron Maiden'
select @idAlbum = id from _BandAlbum where idBand = @idBand and albumname = 'Iron Maiden'

Insert into @tracks
    (idAlbum, trackNumber, seconds, trackname,writers)
VALUES
    (@idAlbum, 1, 3*60+56, 'Prowler','Harris')
    , (@idAlbum, 3, 5*60+30, 'Remember Tomorrow','Harris|Di''Anno')
    , (@idAlbum, 4, 3*60+22,'Running Free','Harris|Di''Anno')
    , (@idAlbum, 5, 7*60+2, 'Phantom of the Opera','Harris')
    , (@idAlbum, 2, 3*60+16, 'Sanctuary','Harris|Di''Anno|Murray')
    , (@idAlbum, 6, 4*60+19, 'Transylvania (Instrumental)','Harris')
    , (@idAlbum, 7, 5*60+32, 'Strange World','Harris')
    , (@idAlbum, 8, 4*60+13, 'Charlotte the Harlotte','Murray')
    , (@idAlbum, 9, 3*60+36, 'Iron Maiden','Harris')

select @idAlbum = id from _BandAlbum where idBand = @idBand and albumname = 'Killers'

Insert into @tracks
    (idAlbum, trackNumber, seconds, trackname,writers)
VALUES
    (@idAlbum, 1, 1*60+46, 'The Ides of March (Instrumental)','Harris')
    , (@idAlbum, 2, 2*60+55, 'Wrathchild','Harris')
    , (@idAlbum, 3, 4*60+19, 'Murders in the Rue Morgue','Harris')
    , (@idAlbum, 4, 3*60+36, 'Another Life','Harris')
    , (@idAlbum, 5, 3*60+9, 'Genghis Khan (Instrumental)','Harris')
    , (@idAlbum, 6, 3*60+54, 'Innocent Exile','Harris')
    , (@idAlbum, 7, 5*60+1, 'Killers','Harris|Di''Anno')
    , (@idAlbum, 8, 6*60+12, 'Prodigal Son','Harris')
    , (@idAlbum, 9, 3*60+20, 'Purgatory','Harris')
    , (@idAlbum, 10, 2*60+33, 'Twilight Zone','Harris|Murray')
    , (@idAlbum, 11, 4*60+49, 'Drifter','Harris')

select @idAlbum = id from _BandAlbum where idBand = @idBand and albumname = 'Number of the Beast'

Insert into @tracks
    (idAlbum, trackNumber, seconds, trackname,writers)
VALUES
    (@idAlbum, 1, 3*60+22, 'Invaders','Harris')
    , (@idAlbum, 2, 4*60+33, 'Children of the Damned','Harris')
    , (@idAlbum, 3, 6*60,'The Prisoner','Harris|Smith')
    , (@idAlbum, 4, 6*60+38, '22 Acacia Avenue','Smith|Harris')
    , (@idAlbum, 5, 4*60+51, 'The Number of the Beast','Harris')
    , (@idAlbum, 6, 3*60+50, 'Run to the Hills','Harris')
    , (@idAlbum, 7, 3*60+47, 'Gangland','Harris|Burr')
    , (@idAlbum, 8, 3*60+46, 'Hallowed be thy Name','Harris')

select @idAlbum = id from _BandAlbum where idBand = @idBand and albumname = 'Piece of Mind'

Insert into @tracks
    (idAlbum, trackNumber, seconds, trackname,writers)
VALUES
    (@idAlbum, 1, 6*60+8, 'Where Eagles Dare','Harris')
    , (@idAlbum, 2, 6*60+51, 'Revelations','Dickinson')
    , (@idAlbum, 3, 3*60+49,'Flight of Icarus','Smith|Dickinson')
    , (@idAlbum, 4, 5*60+22, 'Die With Your Boots On','Smith|Dickinson|Harris')
    , (@idAlbum, 5, 4*60+10, 'The Trooper','Harris')
    , (@idAlbum, 6, 4*60+37, 'Still Life','Murray|Harris')
    , (@idAlbum, 7, 3*60+40, 'Quest for Fire','Harris')
    , (@idAlbum, 8, 3*60+25, 'Sun and Steel','Dickinson|Smith')
    , (@idAlbum, 9, 7*60+26, 'To Tame a Land','Harris')

select @idAlbum = id from _BandAlbum where idBand = @idBand and albumname = 'Powerslave'

Insert into @tracks
    (idAlbum, trackNumber, seconds, trackname,writers)
VALUES
    (@idAlbum, 1, 4*60+31, 'Aces High','Harris')
    , (@idAlbum, 2, 6*60+4, '2 Minutes to Midnight','Smith|Dickinson')
    , (@idAlbum, 3, 4*60+15,'Losfer Words (Big ''Orra)','Smith|Dickinson')
    , (@idAlbum, 4, 4*60+5, 'Flash of the Blade','Dickinson')
    , (@idAlbum, 5, 6*60+18, 'The Duelists','Harris')
    , (@idAlbum, 6, 5*60+2, 'Back in the Village','Smith|Harris')
    , (@idAlbum, 7, 7*60+12, 'Powerslave','Dickinson')
    , (@idAlbum, 8, 13*60+45, 'Rime of the Ancient Mariner','Harris')

select @idAlbum = id from _BandAlbum where idBand = @idBand and albumname = 'Somewhere in Time'

Insert into @tracks
    (idAlbum, trackNumber, seconds, trackname,writers)
VALUES
    (@idAlbum, 1, 7*60+22, 'Caught Somewhere in Time','Harris')
    , (@idAlbum, 2, 5*60+6, 'Wasted Years','Smith')
    , (@idAlbum, 3, 5*60+42,'Sea of Madness','Smith')
    , (@idAlbum, 4, 7*60+24, 'Heaven Can Wait','Harris')
    , (@idAlbum, 5, 6*60+31, 'The Lonliness of the Long Distance Runner','Harris')
    , (@idAlbum, 6, 5*60+43, 'Stranger in a Strange Land','Smith')
    , (@idAlbum, 7, 4*60+55, 'Deja-Vu','Murray|Harris')
    , (@idAlbum, 8, 8*60+35, 'Alexander the Great','Harris')

select @idAlbum = id from _BandAlbum where idBand = @idBand and albumname = 'Seventh Son of a Seventh Son'

Insert into @tracks
    (idAlbum, trackNumber, seconds, trackname,writers)
VALUES
    (@idAlbum, 1, 5*60+38, 'Moonchild','Dickinson|Smith')
    , (@idAlbum, 2, 6*60+8, 'Infinite Dreams','Harris')
    , (@idAlbum, 3, 3*60+30,'Can I Play with Madness','Smith|Dickinson|Harris')
    , (@idAlbum, 4, 4*60+33, 'The Evil That Men Do','Smith|Dickinson|Harris')
    , (@idAlbum, 5, 9*60+52, 'Seventh Son of a Seventh Son','Harris')
    , (@idAlbum, 6, 5*60+4, 'The Prophecy','Murray|Harris')
    , (@idAlbum, 7, 4*60+26, 'The Clairvoyant','Harris')
    , (@idAlbum, 8, 4*60+40, 'Only the Good Die Young','Harris|Dickinson')

select @idAlbum = id from _BandAlbum where idBand = @idBand and albumname = 'No Prayer for the Dying'

Insert into @tracks
    (idAlbum, trackNumber, seconds, trackname,writers)
VALUES
    (@idAlbum, 1, 4*60+13, 'Tailgunner','Dickinson|Harris')
    , (@idAlbum, 2, 3*60+47, 'Holy Smoke','Harris|Dickinson')
    , (@idAlbum, 3, 4*60+22,'No Prayer for the Dying','Harris')
    , (@idAlbum, 4, 4*60+3, 'PUblic Enema Number One','Murray|Dickinson')
    , (@idAlbum, 5, 4*60+9, 'Fates Warning','Harris|Murray')
    , (@idAlbum, 6, 4*60+16, 'The Assassin','Harris')
    , (@idAlbum, 7, 4*60+34, 'Run Silent Run Deep','Harris|Dickinson')
    , (@idAlbum, 8, 4*60+06, 'Hooks in You','Smith|Dickinson')
    , (@idAlbum, 9, 4*60+42, 'Bring Your Daughter... to the Slaughter','Dickinson')
    , (@idAlbum, 10, 5*60+30, 'Mother Russia','Harris')

select @idAlbum = id from _BandAlbum where idBand = @idBand and albumname = 'Fear of the Dark'

Insert into @tracks
    (idAlbum, trackNumber, seconds, trackname,writers)
VALUES
    (@idAlbum, 1, 3*60+21, 'Be Quick or Be Dead','Dickinson|Gers')
    , (@idAlbum, 2, 3*60+35, 'From Here to Eternity','Harris')
    , (@idAlbum, 3, 6*60+52, 'Afraid to Shoot Strangers','Harris')
    , (@idAlbum, 4, 5*60+30, 'Fear is the Key','Dickinson|Gers')
    , (@idAlbum, 5, 4*60+37, 'Childhood''s End','Harris')
    , (@idAlbum, 6, 5*60+46, 'Wasting Love','Dickinson|Gers')
    , (@idAlbum, 7, 4*60+52, 'The Fugitive','Harris')
    , (@idAlbum, 8, 3*60+33, 'Chains of Misery','Murray|Dickinson')
    , (@idAlbum, 9, 3*60+53, 'The Apparition','Harris|Gers')
    , (@idAlbum, 10, 3*60+6, 'Judas Be My Guide','Dickinson|Murray')
    , (@idAlbum, 11, 5*60+37, 'Weekend Warrior','Harris|Gers')
    , (@idAlbum, 12, 7*60+16, 'Fear of the Dark','Harris')

select @idAlbum = id from _BandAlbum where idBand = @idBand and albumname = 'The X Factor'

Insert into @tracks
    (idAlbum, trackNumber, seconds, trackname,writers)
VALUES
    (@idAlbum, 1, 11*60+16, 'Sign of the Cross','Harris')
    , (@idAlbum, 2, 5*60+2, 'Lord of the Flies','Harris|Gers')
    , (@idAlbum, 3, 4*60+10, 'Man on the Edge','Gers|Bayley')
    , (@idAlbum, 4, 7*60+25, 'Fortunes of War','Harris')
    , (@idAlbum, 5, 5*60+10, 'Look for the Truth','Harris|Bayley|Gers')
    , (@idAlbum, 6, 6*60+20, 'The Aftermath','Harris|Gers|Bayley')
    , (@idAlbum, 7, 5*60+10, 'Judgement of Heaven','Harris')
    , (@idAlbum, 8, 6*60, 'Blodd on the World''s Hands','Harris')
    , (@idAlbum, 9, 6*60+39, 'The Edge of Darkness','Harris|Gers|Bayley')
    , (@idAlbum, 10, 5*60+37, '2 A.M.','Harris|Gers|Bayley')
    , (@idAlbum, 11, 8*60+5, 'The Unbeliever','Harris|Gers')


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

select * from _BandTrack order by idAlbum, tracknumber
select * from _BandTrack2Writer

--TRUNCATE TABLE _BandTrack2Writer
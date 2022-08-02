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
    , (@idAlbum, 4, 4*60+3, 'Public Enema Number One','Murray|Dickinson')
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

set @idAlbum = null
select @idAlbum = id from _BandAlbum where idBand = @idBand and albumname = 'The X Factor'

if @idAlbum is not NULL
BEGIN
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
        , (@idAlbum, 8, 6*60, 'Blood on the World''s Hands','Harris')
        , (@idAlbum, 9, 6*60+39, 'The Edge of Darkness','Harris|Gers|Bayley')
        , (@idAlbum, 10, 5*60+37, '2 A.M.','Harris|Gers|Bayley')
        , (@idAlbum, 11, 8*60+5, 'The Unbeliever','Harris|Gers')
END

set @idAlbum = null
select @idAlbum = id from _BandAlbum where idBand = @idBand and albumname = 'Virtual XI'

if @idAlbum is not NULL
BEGIN
    Insert into @tracks
        (idAlbum, trackNumber, seconds, trackname,writers)
    VALUES
        (@idAlbum, 1, 3*60+0, 'Futureal','Bayley|Harris')
        , (@idAlbum, 2, 9*60+51, 'The Angel and the Gambler','Harris')
        , (@idAlbum, 3, 4*60+49, 'Lightning Strikes Twice','Harris|Murray')
        , (@idAlbum, 4, 9*60+6, 'The Clansman','Harris')
        , (@idAlbum, 5, 6*60+13, 'When Two Worlds Collide','Harris|Bayley|Murray')
        , (@idAlbum, 6, 6*60+46, 'The Educated Fool','Harris')
        , (@idAlbum, 7, 8*60+11, 'Don''t Look to the Eyes of a Stranger','Harris')
        , (@idAlbum, 8, 5*60+26, 'Como Estais Amigos','Bayley|Gers')
END

set @idAlbum = null
select @idAlbum = id from _BandAlbum where idBand = @idBand and albumname = 'Brave New World'

if @idAlbum is not NULL
BEGIN
    Insert into @tracks
        (idAlbum, trackNumber, seconds, trackname,writers)
    VALUES
        (@idAlbum, 1, 4*60+35, 'The Wicker Man','Smith|Dickinson|Harris')
        , (@idAlbum, 2, 6*60+50, 'Ghost of Navigator','Harris|Gers|Dickinson')
        , (@idAlbum, 3, 6*60+18, 'Brave New World','Harris|Murray|Dickinson')
        , (@idAlbum, 4, 7*60+14, 'Blood Brothers','Harris')
        , (@idAlbum, 5, 4*60+42, 'The Mercenary','Harris|Gers')
        , (@idAlbum, 6, 9*60+21, 'Dream of Mirrors','Harris|Gers')
        , (@idAlbum, 7, 4*60+0, 'The Fallen Angel','Harris|Smith')
        , (@idAlbum, 8, 9*60+6, 'The Nomad','Harris|Murray')
        , (@idAlbum, 9, 6*60+25, 'Out of the Silent Planet','Harris|Dickinson|Gers')
        , (@idAlbum, 10, 8*60+28, 'The Thin Line Between Love and Hate','Murray|Harris')
END

set @idAlbum = null
select @idAlbum = id from _BandAlbum where idBand = @idBand and albumname = 'Dance of Death'

if @idAlbum is not NULL
BEGIN
    Insert into @tracks
        (idAlbum, trackNumber, seconds, trackname,writers)
    VALUES
        (@idAlbum, 1, 3*60+52, 'Wildest Dreams','Smith|Harris')
        , (@idAlbum, 2, 3*60+48, 'Rainmaker','Harris|Murray|Dickinson')
        , (@idAlbum, 3, 7*60+21, 'No More Lies','Harris')
        , (@idAlbum, 4, 5*60+50, 'Montsegur','Harris|Gers|Dickinson')
        , (@idAlbum, 5, 8*60+36, 'Dance of Death','Harris|Gers')
        , (@idAlbum, 6, 5*60+12, 'Gates of Tomorrow','Harris|Gers|Dickinson')
        , (@idAlbum, 7, 5*60+04, 'New Frontier','McBrain|Dickinson|Smith')
        , (@idAlbum, 8, 8*60+27, 'Pashendale','Harris|Smith')
        , (@idAlbum, 9, 6*60+31, 'Face in the Sand','Harris|Dickinson|Smith')
        , (@idAlbum, 10, 6*60+10, 'Age of Innocence','Murray|Harris')
        , (@idAlbum, 11, 7*60+6, 'Journeyman','Smith|Dickinson|Harris')
END

set @idAlbum = null
select @idAlbum = id from _BandAlbum where idBand = @idBand and albumname = 'A Matter of Life and Death'

if @idAlbum is not NULL
BEGIN
    Insert into @tracks
        (idAlbum, trackNumber, seconds, trackname,writers)
    VALUES
        (@idAlbum, 1, 4*60+17, 'Different World','Smith|Harris')
        , (@idAlbum, 2, 6*60+52, 'These Colors Don''t Run','Harris|Smith|Dickinson')
        , (@idAlbum, 3, 8*60+44, 'Brighter Than a Thousand Suns','Harris|Smith|Dickinson')
        , (@idAlbum, 4, 5*60+07, 'The Pilgrim','Harris|Gers')
        , (@idAlbum, 5, 7*60+48, 'The Longest Day','Harris|Smith|Dickinson')
        , (@idAlbum, 6, 5*60+36, 'Out of the Shadows','Harris|Dickinson')
        , (@idAlbum, 7, 7*60+21, 'The Reincarnation of Benjamin Breeg','Murray|Harris')
        , (@idAlbum, 8, 9*60+23, 'For the Greater Good of God','Harris')
        , (@idAlbum, 9, 7*60+25, 'Lord of Light','Harris|Dickinson|Smith')
        , (@idAlbum, 10, 9*60+20, 'The Legacy','Gers|Harris')
END

set @idAlbum = null
select @idAlbum = id from _BandAlbum where idBand = @idBand and albumname = 'The Final Frontier'
if @idAlbum is not NULL
BEGIN
    Insert into @tracks
        (idAlbum, trackNumber, seconds, trackname,writers)
    VALUES
        (@idAlbum, 1, 8*60+40, 'Satellite 15... The Final Frontier','Smith|Harris')
        , (@idAlbum, 2, 6*60+49, 'El Dorado','Harris|Smith|Dickinson')
        , (@idAlbum, 3, 5*60+20, 'Mother of Mercy','Harris|Smith')
        , (@idAlbum, 4, 5*60+52, 'Coming Home','Harris|Smith|Dickinson')
        , (@idAlbum, 5, 4*60+29, 'The Alchemist','Harris|Gers|Dickinson')
        , (@idAlbum, 6, 9*60+6, 'Isle of Avalon','Harris|Smith')
        , (@idAlbum, 7, 7*60+48, 'Starblind','Smith|Dickinson|Harris')
        , (@idAlbum, 8, 9*60+3, 'The Talisman','Harris|Gers')
        , (@idAlbum, 9, 8*60+28, 'The Man Who Would Be King','Harris|Murray')
        , (@idAlbum, 10, 10*60+59, 'When the Wild Wind Blows','Harris')
END

set @idAlbum = null
select @idAlbum = id from _BandAlbum where idBand = @idBand and albumname = 'The Book of Souls'
if @idAlbum is not NULL
BEGIN
    Insert into @tracks
        (idAlbum, trackNumber, seconds, trackname,writers)
    VALUES
        (@idAlbum, 1, 8*60+28, 'If Eternity Should Fail','Dickinson')
        , (@idAlbum, 2, 5*60+01, 'Speed of Light','Smith|Dickinson')
        , (@idAlbum, 3, 6*60+37, 'The Great Unknown','Harris|Smith')
        , (@idAlbum, 4, 13*60+33, 'The Red and the Black','Harris')
        , (@idAlbum, 5, 5*60+52, 'When the River Runs Deep','Harris|Smith')
        , (@idAlbum, 6, 10*60+27, 'The Book of Souls','Harris|Gers')
        , (@idAlbum, 7, 5*60+13, 'Death or Glory','Smith|Dickinson')
        , (@idAlbum, 8, 7*60+32, 'Shadows of the Valley','Harris|Gers')
        , (@idAlbum, 9, 4*60+59, 'Tears of a Clown','Harris|Smith')
        , (@idAlbum, 10, 6*60+28, 'The Man of Sorrows','Harris|Murray')
        , (@idAlbum, 11, 18*60+01, 'Empire of the Clouds','Dickinson')
END

set @idAlbum = null
select @idAlbum = id from _BandAlbum where idBand = @idBand and albumname = 'Senutsu'
if @idAlbum is not NULL
BEGIN
    Insert into @tracks
        (idAlbum, trackNumber, seconds, trackname,writers)
    VALUES
        (@idAlbum, 1, 8*60+20, 'Senjutsu','Smith|Harris')
        , (@idAlbum, 2, 4*60+59, 'Stratego','Gers|Harris')
        , (@idAlbum, 3, 6*60+13, 'The Writing on the Wall','Dickinson|Smith')
        , (@idAlbum, 4, 9*60+31, 'Lost in a Lost World','Harris')
        , (@idAlbum, 5, 4*60+3, 'Days of Future Past','Dickinson|Smith')
        , (@idAlbum, 6, 7*60+9, 'The Time Machine','Harris|Gers')
        , (@idAlbum, 7, 7*60+20, 'Darkest Hour','Smith|Dickinson')
        , (@idAlbum, 8, 10*60+20, 'Death of the Celts','Harris')
        , (@idAlbum, 9, 12*60+39, 'The Parchment','Harris')
        , (@idAlbum, 10, 11*60+19, 'Hell on Earth','Harris')
END

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
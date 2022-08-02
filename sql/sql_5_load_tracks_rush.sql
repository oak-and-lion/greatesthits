declare @idBand int, @idAlbum INT

declare @tracks TABLE (id int identity, idAlbum int, trackNumber int, seconds int, trackname varchar(1024), writers VARCHAR(1024))
declare @writersList TABLE (id int, item VARCHAR(1024))

select @idBand = id from _Band where bandname = 'Rush'
select @idAlbum = id from _BandAlbum where idBand = @idBand and albumname = 'Rush'

if @idAlbum is not NULL
BEGIN
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
END
set @idAlbum = null
select @idAlbum = id from _BandAlbum where idBand = @idBand and albumname = 'Fly By Night'

if @idAlbum is not NULL
BEGIN
    Insert into @tracks
        (idAlbum, trackNumber, seconds, trackname,writers)
    VALUES
        (@idAlbum, 1, 4*60+21, 'Anthem','Lee|Lifeson')
        , (@idAlbum, 2, 3*60+24, 'Best I Can','Lee')
        , (@idAlbum, 3, 3*60+1,'Beneath, Between and Behind','Lifeson')
        , (@idAlbum, 4, 8*60+37, 'By-Tor and the Snow Dog','Lee|Lifeson')
        , (@idAlbum, 5, 3*60+18, 'Fly By Night','Lee')
        , (@idAlbum, 6, 2*60+58, 'Making Memories','Lee|Lifeson')
        , (@idAlbum, 7, 4*60+52, 'Rivendell','Lee')
        , (@idAlbum, 8, 6*60+44, 'In the End','Lee|Lifeson')
END
set @idAlbum = null
select @idAlbum = id from _BandAlbum where idBand = @idBand and albumname = 'Caress of Steel'

if @idAlbum is not NULL
BEGIN
    Insert into @tracks
        (idAlbum, trackNumber, seconds, trackname,writers)
    VALUES
        (@idAlbum, 1, 4*60+34, 'Bastille Day','Lee|Lifeson|Peart')
        , (@idAlbum, 2, 3*60+41, 'I Think I''m Going Bald','Lee|Lifeson|Peart')
        , (@idAlbum, 3, 4*60+9,'Lakeside Park','Lee|Lifeson|Peart')
        , (@idAlbum, 4, 12*60+28, 'The Necromancer','Lee|Lifeson|Peart')
        , (@idAlbum, 5, 19*60+57, 'Fountains of Lamneth','Lee|Lifeson|Peart')
END

set @idAlbum = null
select @idAlbum = id from _BandAlbum where idBand = @idBand and albumname = 'Caress of Steel'

if @idAlbum is not NULL
BEGIN
    Insert into @tracks
        (idAlbum, trackNumber, seconds, trackname,writers)
    VALUES
        (@idAlbum, 1, 4*60+34, 'Bastille Day','Lee|Lifeson|Peart')
        , (@idAlbum, 2, 3*60+41, 'I Think I''m Going Bald','Lee|Lifeson|Peart')
        , (@idAlbum, 3, 4*60+9,'Lakeside Park','Lee|Lifeson|Peart')
        , (@idAlbum, 4, 12*60+28, 'The Necromancer','Lee|Lifeson|Peart')
        , (@idAlbum, 5, 19*60+57, 'Fountains of Lamneth','Lee|Lifeson|Peart')
END

set @idAlbum = null
select @idAlbum = id from _BandAlbum where idBand = @idBand and albumname = '2112'

if @idAlbum is not NULL
BEGIN
    Insert into @tracks
        (idAlbum, trackNumber, seconds, trackname,writers)
    VALUES
        (@idAlbum, 1, 20*60+34, '2112','Lee|Lifeson|Peart')
        , (@idAlbum, 2, 3*60+32, 'A Passage to Bangkok','Lee|Lifeson|Peart')
        , (@idAlbum, 3, 3*60+16,'The Twilight Zone','Lee|Lifeson|Peart')
        , (@idAlbum, 4, 3*60+51, 'Lessons','Lifeson')
        , (@idAlbum, 5, 3*60+30, 'Tears','Lee')
        , (@idAlbum, 6, 3*60+59, 'Something for Nothing','Lee|Peart')
END

set @idAlbum = null
select @idAlbum = id from _BandAlbum where idBand = @idBand and albumname = 'A Farewell to Kings'

if @idAlbum is not NULL
BEGIN
    Insert into @tracks
        (idAlbum, trackNumber, seconds, trackname,writers)
    VALUES
        (@idAlbum, 1, 5*60+51, 'A Farewell to Kings','Lee|Lifeson|Peart')
        , (@idAlbum, 2, 11*60+5, 'Xanadu','Lee|Lifeson|Peart')
        , (@idAlbum, 3, 2*60+54,'Closer to the Heart','Lee|Lifeson|Peart|Talbot')
        , (@idAlbum, 4, 3*60+51, 'Cinderella Man','Lee|Lifeson')
        , (@idAlbum, 5, 2*60+35, 'Madrigal','Lee|Lifeson|Peart')
        , (@idAlbum, 6, 10*60+25, 'Cygnus X-1 Book I: The Voyage','Lee|Peart|Lifeson')
END

set @idAlbum = null
select @idAlbum = id from _BandAlbum where idBand = @idBand and albumname = 'Hemisperes'

if @idAlbum is not NULL
BEGIN
    Insert into @tracks
        (idAlbum, trackNumber, seconds, trackname,writers)
    VALUES
        (@idAlbum, 1, 18*60+08, 'Cygnus X-1 Book II: Hemispheres','Lee|Lifeson|Peart')
        , (@idAlbum, 2, 3*60+42, 'Circumstances','Lee|Lifeson|Peart')
        , (@idAlbum, 3, 4*60+46,'The Trees','Lee|Lifeson|Peart')
        , (@idAlbum, 4, 9*60+35, 'La Villa Strangiato','Lee|Lifeson|Peart')
END

set @idAlbum = null
select @idAlbum = id from _BandAlbum where idBand = @idBand and albumname = 'Permanent Waves'

if @idAlbum is not NULL
BEGIN
    Insert into @tracks
        (idAlbum, trackNumber, seconds, trackname,writers)
    VALUES
        (@idAlbum, 1, 4*60+58, 'The Spirit of the Radio','Lee|Lifeson|Peart')
        , (@idAlbum, 2, 5*60+23, 'Freewill','Lee|Lifeson|Peart')
        , (@idAlbum, 3, 7*60+50,'Jacob''s Ladder','Lee|Lifeson|Peart|Talbot')
        , (@idAlbum, 4, 3*60+51, 'Entre Nous','Lee|Lifeson|Peart')
        , (@idAlbum, 5, 3*60+50, 'Different Strings','Lee|Lifeson')
        , (@idAlbum, 6, 9*60+27, 'Natural Science','Lee|Peart|Lifeson')
END

set @idAlbum = null
select @idAlbum = id from _BandAlbum where idBand = @idBand and albumname = 'Moving Pictures'

if @idAlbum is not NULL
BEGIN
    Insert into @tracks
        (idAlbum, trackNumber, seconds, trackname,writers)
    VALUES
        (@idAlbum, 1, 4*60+34, 'Tom Sawyer','Lee|Lifeson|Peart|Dubois')
        , (@idAlbum, 2, 6*60+10, 'Red Barchetta','Lee|Lifeson|Peart')
        , (@idAlbum, 3, 4*60+26,'YYZ (Instrumental)','Lee|Peart')
        , (@idAlbum, 4, 4*60+20, 'Limelight','Lee|Lifeson|Peart')
        , (@idAlbum, 5, 10*60+58, 'The Camera Eye','Lee|Lifeson|Peart')
        , (@idAlbum, 6, 4*60+46, 'Witch Hunt (Part III of Fear)','Lee|Peart|Lifeson')
        , (@idAlbum, 7, 4*60+46, 'Vital Signs','Lee|Lifeson|Peart')
END

set @idAlbum = null
select @idAlbum = id from _BandAlbum where idBand = @idBand and albumname = 'Signals'

if @idAlbum is not NULL
BEGIN
    Insert into @tracks
        (idAlbum, trackNumber, seconds, trackname,writers)
    VALUES
        (@idAlbum, 1, 5*60+35, 'Subdivisions','Lee|Lifeson|Peart')
        , (@idAlbum, 2, 4*60+47, 'The Analog Kid','Lee|Lifeson|Peart')
        , (@idAlbum, 3, 4*60+57,'Chemistry','Lifeson|Lee|Peart')
        , (@idAlbum, 4, 6*60+23, 'Digital Man','Lee|Lifeson|Peart')
        , (@idAlbum, 5, 6*60+24, 'The Weapon (Part II of Fear)','Lee|Lifeson|Peart')
        , (@idAlbum, 6, 3*60+42, 'New World Man','Lee|Peart|Lifeson')
        , (@idAlbum, 7, 5*60+49, 'Losing It','Lee|Lifeson|Peart|Mink')
        , (@idAlbum, 8, 5*60+49, 'Countdown','Lee|Peart|Lifeson')
END

set @idAlbum = null
select @idAlbum = id from _BandAlbum where idBand = @idBand and albumname = 'Grace Under Pressure'

if @idAlbum is not NULL
BEGIN
    Insert into @tracks
        (idAlbum, trackNumber, seconds, trackname,writers)
    VALUES
        (@idAlbum, 1, 4*60+56, 'Distant Early Warning','Lee|Lifeson|Peart')
        , (@idAlbum, 2, 5*60+4, 'Afterimage','Lee|Lifeson|Peart')
        , (@idAlbum, 3, 5*60+10,'Red Sector A','Lifeson|Lee|Peart')
        , (@idAlbum, 4, 4*60+33, 'The Enemy Within (Part I of Fear)','Lee|Lifeson|Peart')
        , (@idAlbum, 5, 5*60+0, 'The Body Electric','Lee|Lifeson|Peart')
        , (@idAlbum, 6, 4*60+18, 'Kid Gloves','Lee|Peart|Lifeson')
        , (@idAlbum, 7, 4*60+42, 'Red Lenses','Lee|Lifeson|Peart')
        , (@idAlbum, 8, 5*60+44, 'Between the Wheels','Lee|Peart|Lifeson')
END

set @idAlbum = null
select @idAlbum = id from _BandAlbum where idBand = @idBand and albumname = 'Power Windows'

if @idAlbum is not NULL
BEGIN
    Insert into @tracks
        (idAlbum, trackNumber, seconds, trackname,writers)
    VALUES
        (@idAlbum, 1, 5*60+36, 'The Big Money','Lee|Lifeson|Peart')
        , (@idAlbum, 2, 5*60+7, 'Grand Designs','Lee|Lifeson|Peart')
        , (@idAlbum, 3, 5*60+9,'Manhattan Project','Lifeson|Lee|Peart')
        , (@idAlbum, 4, 6*60+11, 'Marathon','Lee|Lifeson|Peart')
        , (@idAlbum, 5, 6*60+20, 'Territories','Lee|Lifeson|Peart')
        , (@idAlbum, 6, 5*60+19, 'Middletown Dreams','Lee|Peart|Lifeson')
        , (@idAlbum, 7, 5*60+11, 'Emotion Detector','Lee|Lifeson|Peart')
        , (@idAlbum, 8, 5*60+54, 'Mystic Rhythms','Lee|Peart|Lifeson')
END

set @idAlbum = null
select @idAlbum = id from _BandAlbum where idBand = @idBand and albumname = 'Hold Your Fire'

if @idAlbum is not NULL
BEGIN
    Insert into @tracks
        (idAlbum, trackNumber, seconds, trackname,writers)
    VALUES
        (@idAlbum, 1, 4*60+31, 'Force Ten','Lee|Lifeson|Peart|Dubois')
        , (@idAlbum, 2, 5*60+9, 'Time Stand Still','Lee|Lifeson|Peart')
        , (@idAlbum, 3, 5*60+38,'Open Secrets','Lifeson|Lee|Peart')
        , (@idAlbum, 4, 4*60+36, 'Second Nature','Lee|Lifeson|Peart')
        , (@idAlbum, 5, 5*60+19, 'Prime Mover','Lee|Lifeson|Peart')
        , (@idAlbum, 6, 5*60+9, 'Lock and Key','Lee|Peart|Lifeson')
        , (@idAlbum, 7, 5*60+16, 'Mission','Lee|Lifeson|Peart')
        , (@idAlbum, 8, 4*60+55, 'Turn the Page','Lee|Peart|Lifeson')
        , (@idAlbum, 9, 4*60+17, 'Tai Shan','Lee|Lifeson|Peart')
        , (@idAlbum, 10, 5*60+33, 'High Water','Lee|Peart|Lifeson')
END

set @idAlbum = null
select @idAlbum = id from _BandAlbum where idBand = @idBand and albumname = 'Presto'

if @idAlbum is not NULL
BEGIN
    Insert into @tracks
        (idAlbum, trackNumber, seconds, trackname,writers)
    VALUES
        (@idAlbum, 1, 5*60+1, 'Show Don''t Tell','Lee|Lifeson|Peart')
        , (@idAlbum, 2, 4*60+33, 'Chain Lightning','Lee|Lifeson|Peart')
        , (@idAlbum, 3, 4*60+52,'The Pass','Lifeson|Lee|Peart')
        , (@idAlbum, 4, 5*60+24, 'War Paint','Lee|Lifeson|Peart')
        , (@idAlbum, 5, 4*60+7, 'Scars','Lee|Lifeson|Peart')
        , (@idAlbum, 6, 5*60+45, 'Presto','Lee|Peart|Lifeson')
        , (@idAlbum, 7, 4*60+47, 'Superconductor','Lee|Lifeson|Peart')
        , (@idAlbum, 8, 4*60+0, 'Red Tide','Lee|Peart|Lifeson')
        , (@idAlbum, 9, 4*60+29, 'Tai Shan','Lee|Lifeson|Peart')
        , (@idAlbum, 10, 4*60+11, 'Hand Over Fist','Lee|Peart|Lifeson')
        , (@idAlbum, 11, 5*60+3, 'Available Light','Lee|Peart|Lifeson')
END

set @idAlbum = null
select @idAlbum = id from _BandAlbum where idBand = @idBand and albumname = 'Roll the Bones'

if @idAlbum is not NULL
BEGIN
    Insert into @tracks
        (idAlbum, trackNumber, seconds, trackname,writers)
    VALUES
        (@idAlbum, 1, 4*60+37, 'Dreamline','Lee|Lifeson|Peart')
        , (@idAlbum, 2, 4*60+35, 'Bravado','Lee|Lifeson|Peart')
        , (@idAlbum, 3, 5*60+30,'Roll the Bones','Lifeson|Lee|Peart')
        , (@idAlbum, 4, 3*60+54, 'Face Up','Lee|Lifeson|Peart')
        , (@idAlbum, 5, 3*60+49, 'Where''s My Thing? (Part IV, Gangster of Boats Trilogy','Lee|Lifeson|Peart')
        , (@idAlbum, 6, 5*60+13, 'The Big Wheel','Lee|Peart|Lifeson')
        , (@idAlbum, 7, 5*60+27, 'Heresy','Lee|Lifeson|Peart')
        , (@idAlbum, 8, 5*60+18, 'Ghost of a Chance','Lee|Peart|Lifeson')
        , (@idAlbum, 9, 4*60+39, 'Neurotica','Lee|Lifeson|Peart')
        , (@idAlbum, 10, 5*60+1, 'You Bet Your Life','Lee|Peart|Lifeson')
END

set @idAlbum = null
select @idAlbum = id from _BandAlbum where idBand = @idBand and albumname = 'Counterparts'

if @idAlbum is not NULL
BEGIN
    Insert into @tracks
        (idAlbum, trackNumber, seconds, trackname,writers)
    VALUES
        (@idAlbum, 1, 6*60+4, 'Animate','Lee|Lifeson|Peart')
        , (@idAlbum, 2, 4*60+30, 'Stick It Out','Lee|Lifeson|Peart')
        , (@idAlbum, 3, 4*60+48,'Cut to the Chase','Lifeson|Lee|Peart')
        , (@idAlbum, 4, 4*60+55, 'Nobody''s Hero','Lee|Lifeson|Peart')
        , (@idAlbum, 5, 4*60+37, 'Between the Sun and Moon','Lee|Lifeson|Peart|Dubois')
        , (@idAlbum, 6, 5*60+47, 'Alien Shore','Lee|Peart|Lifeson')
        , (@idAlbum, 7, 5*60+2, 'The Speed of Love','Lee|Lifeson|Peart')
        , (@idAlbum, 8, 4*60+52, 'Double Agent','Lee|Peart|Lifeson')
        , (@idAlbum, 9, 4*60+5, 'Leave That Thing Alone (Instrumental)','Lee|Lifeson')
        , (@idAlbum, 10, 4*60+27, 'Cold Fire','Lee|Peart|Lifeson')
        , (@idAlbum, 11, 5*60+11, 'Everyday Glory','Lee|Peart|Lifeson')
END

set @idAlbum = null
select @idAlbum = id from _BandAlbum where idBand = @idBand and albumname = 'Test For Echo'

if @idAlbum is not NULL
BEGIN
    Insert into @tracks
        (idAlbum, trackNumber, seconds, trackname,writers)
    VALUES
        (@idAlbum, 1, 5*60+56, 'Test for Echo','Lee|Lifeson|Peart|Dubois')
        , (@idAlbum, 2, 4*60+27, 'Driven','Lee|Lifeson|Peart')
        , (@idAlbum, 3, 3*60+43,'Half the World','Lifeson|Lee|Peart')
        , (@idAlbum, 4, 4*60+48, 'The Color of Right','Lee|Lifeson|Peart')
        , (@idAlbum, 5, 5*60+1, 'Time and Motion','Lee|Lifeson|Peart')
        , (@idAlbum, 6, 4*60+58, 'Totem','Lee|Peart|Lifeson')
        , (@idAlbum, 7, 4*60+55, 'Dog Years','Lee|Lifeson|Peart')
        , (@idAlbum, 8, 5*60+44, 'Virtuality','Lee|Peart|Lifeson')
        , (@idAlbum, 9, 4*60+23, 'Resist','Lee|Lifeson|Peart')
        , (@idAlbum, 10, 5*60+29, 'Limbo (Instrumental)','Lee|Peart|Lifeson')
        , (@idAlbum, 11, 4*60+6, 'Carve Away the Stone','Lee|Peart|Lifeson')
END

set @idAlbum = null
select @idAlbum = id from _BandAlbum where idBand = @idBand and albumname = 'Vapor Trails'

if @idAlbum is not NULL
BEGIN
    Insert into @tracks
        (idAlbum, trackNumber, seconds, trackname,writers)
    VALUES
        (@idAlbum, 1, 5*60+8, 'One Little Victory','Lee|Lifeson|Peart')
        , (@idAlbum, 2, 5*60+28, 'Ceiling Unlimited','Lee|Lifeson|Peart')
        , (@idAlbum, 3, 5*60+41,'Ghost Rider','Lifeson|Lee|Peart')
        , (@idAlbum, 4, 5*60+23, 'Peaceable Kingdom','Lee|Lifeson|Peart')
        , (@idAlbum, 5, 4*60+28, 'The Stars Look Down','Lee|Lifeson|Peart')
        , (@idAlbum, 6, 4*60+5, 'How it Is','Lee|Peart|Lifeson')
        , (@idAlbum, 7, 4*60+57, 'Vapor Trail','Lee|Lifeson|Peart')
        , (@idAlbum, 8, 6*60+34, 'Secrest Touch','Lee|Peart|Lifeson')
        , (@idAlbum, 9, 5*60+38, 'Earthshine','Lee|Lifeson|Peart')
        , (@idAlbum, 10, 3*60+40, 'Sweet Miracle','Lee|Peart|Lifeson')
        , (@idAlbum, 11, 4*60+49, 'Nocturne','Lee|Peart|Lifeson')
        , (@idAlbum, 12, 6*60+21, 'Freeze (Part IV of Fear)','Lee|Peart|Lifeson')
        , (@idAlbum, 13, 5*60+3, 'Out of the Cradle','Lee|Peart|Lifeson')
END

set @idAlbum = null
select @idAlbum = id from _BandAlbum where idBand = @idBand and albumname = 'Snakes & Arrows'

if @idAlbum is not NULL
BEGIN
    Insert into @tracks
        (idAlbum, trackNumber, seconds, trackname,writers)
    VALUES
        (@idAlbum, 1, 5*60+21, 'Far Cry','Lee|Lifeson|Peart')
        , (@idAlbum, 2, 6*60+36, 'Armor and Sword','Lee|Lifeson|Peart')
        , (@idAlbum, 3, 4*60+47,'Workin'' Them Angels','Lifeson|Lee|Peart')
        , (@idAlbum, 4, 4*60+7, 'The Larger Bowl (A Pantoum)','Lee|Lifeson|Peart')
        , (@idAlbum, 5, 5*60+24, 'Spindrift','Lee|Lifeson|Peart')
        , (@idAlbum, 6, 6*60+1, 'The Main Monkey Business (Instrumental)','Lee|Lifeson')
        , (@idAlbum, 7, 6*60+28, 'The Way the Wind Blows','Lee|Lifeson|Peart')
        , (@idAlbum, 8, 2*60+3, 'Hope (Instrumental)','Lifeson')
        , (@idAlbum, 9, 5*60+31, 'Faithless','Lee|Lifeson|Peart')
        , (@idAlbum, 10, 5*60+12, 'Bravest Face','Lee|Peart|Lifeson')
        , (@idAlbum, 11, 4*60+51, 'Good News First','Lee|Peart|Lifeson')
        , (@idAlbum, 12, 2*60+17, 'Malignant Narcissism (Instrumental)','Lee|Lifeson')
        , (@idAlbum, 13, 4*60+13, 'We Hold On','Lee|Peart|Lifeson')
END

set @idAlbum = null
select @idAlbum = id from _BandAlbum where idBand = @idBand and albumname = 'Clockwork Angels'

if @idAlbum is not NULL
BEGIN
    Insert into @tracks
        (idAlbum, trackNumber, seconds, trackname,writers)
    VALUES
        (@idAlbum, 1, 5*60+39, 'Caravan','Lee|Lifeson|Peart')
        , (@idAlbum, 2, 5*60+10, 'BU2B','Lee|Lifeson|Peart')
        , (@idAlbum, 3, 7*60+31,'Clockwork Angels','Lifeson|Lee|Peart')
        , (@idAlbum, 4, 6*60+52, 'The Anarchist','Lee|Lifeson|Peart')
        , (@idAlbum, 5, 4*60+53, 'Carnies','Lee|Lifeson|Peart')
        , (@idAlbum, 6, 3*60+14, 'Halo Effect','Lee|Lifeson|Peart')
        , (@idAlbum, 7, 6*60+32, 'Seven Cities of Gold','Lee|Lifeson|Peart')
        , (@idAlbum, 8, 5*60+1, 'The Wreckers','Lifeson|Lee|Peart')
        , (@idAlbum, 9, 7*60+19, 'Headlong Fight','Lee|Lifeson|Peart')
        , (@idAlbum, 10, 1*60+28, 'BU2B2','Lee|Peart|Lifeson')
        , (@idAlbum, 11, 5*60+25, 'Wish Them Well','Lee|Peart|Lifeson')
        , (@idAlbum, 12, 6*60+59, 'The Garden','Lee|Lifeson|Peart')
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
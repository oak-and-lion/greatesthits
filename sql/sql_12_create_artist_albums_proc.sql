IF NOT EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND OBJECT_ID = OBJECT_ID('dbo._disc_getBandAlbums'))
   exec('CREATE PROCEDURE [dbo].[_disc_getBandAlbums] AS BEGIN SET NOCOUNT ON; END')
GO

ALTER PROCEDURE [dbo].[_disc_getBandAlbums] (@idArtist INT, @idAlbumtype INT, @minyear INT = 0, @maxyear INT = 9999)
AS
BEGIN
    if (ISNULL(@idAlbumtype, 0) = 0)
    BEGIN
        SET @idAlbumtype = NULL
    END

    SELECT DISTINCT a.id
					, a.idBand
					, a.albumName
					, a.albumYear
					, a.idAlbumType
					, COUNT(b.id) as tracks
					, LTRIM(RTRIM(RIGHT(CONVERT(CHAR(8),DATEADD(second,SUM(b.seconds),0),108),8))) AS [length]
		FROM _BandAlbum a
			INNER JOIN _BandTrack b ON b.idAlbum = a.id
        WHERE a.idBand = @idArtist
            AND a.idAlbumType = ISNULL(@idAlbumtype, a.idAlbumType)
            AND a.albumYear >= @minyear
            AND a.albumYear <= @maxyear
		GROUP BY a.id
					, a.idBand
					, a.albumName
					, a.albumYear
					, a.idAlbumType
END
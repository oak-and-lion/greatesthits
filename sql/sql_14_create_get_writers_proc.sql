IF NOT EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND OBJECT_ID = OBJECT_ID('dbo._disc_getBandWriters'))
   exec('CREATE PROCEDURE [dbo].[_disc_getBandWriters] AS BEGIN SET NOCOUNT ON; END')
GO

ALTER PROCEDURE dbo._disc_getBandWriters (@idArtist INT)
AS
BEGIN
	SELECT *
		FROM _BandWriter a
		WHERE a.idBand = @idArtist
			AND a.id IN (SELECT DISTINCT idWriter 
							FROM _BandTrack2Writer b 
								INNER JOIN _BandTrack c ON c.id = b.idTrack 
								INNER JOIN _BandAlbum d ON d.id = c.idAlbum 
								WHERE d.idBand = @idArtist)
		ORDER BY a.writer
END
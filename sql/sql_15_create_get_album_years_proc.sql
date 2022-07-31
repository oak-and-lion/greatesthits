IF NOT EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND OBJECT_ID = OBJECT_ID('dbo._disc_getBandAlbumYears'))
   exec('CREATE PROCEDURE [dbo].[_disc_getBandAlbumYears] AS BEGIN SET NOCOUNT ON; END')
GO

ALTER PROCEDURE dbo._disc_getBandAlbumYears
(@idArtist INT)
AS
BEGIN
	SELECT DISTINCT b.albumYear, b.id AS [idBand]
		FROM _BandAlbum b
			INNER JOIN _BandTrack c ON c.idAlbum = b.id
		WHERE b.idBand = @idArtist
END
GO

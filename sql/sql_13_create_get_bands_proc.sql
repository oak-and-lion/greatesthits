IF NOT EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND OBJECT_ID = OBJECT_ID('dbo._disc_getBands'))
   exec('CREATE PROCEDURE [dbo].[_disc_getBands] AS BEGIN SET NOCOUNT ON; END')
GO

ALTER PROCEDURE dbo._disc_getBands
AS
BEGIN
	SELECT DISTINCT a.id, a.bandName
		FROM _Band a
			INNER JOIN _BandAlbum b ON b.idBand = a.id
			INNER JOIN _BandTrack c ON c.idAlbum = b.id
END
GO

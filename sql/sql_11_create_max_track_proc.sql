IF NOT EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND OBJECT_ID = OBJECT_ID('dbo._disc_getMaxTracks'))
   exec('CREATE PROCEDURE [dbo].[_disc_getMaxTracks] AS BEGIN SET NOCOUNT ON; END')
GO

ALTER PROCEDURE [dbo].[_disc_getMaxTracks] (@idArtist INT)
AS
BEGIN
    SELECT MAX(a.tracknumber) AS maxTracks
        FROM _bandtrack a
            INNER JOIN _bandAlbum b on b.id = a.idAlbum
        WHERE b.idBand = @idArtist
END
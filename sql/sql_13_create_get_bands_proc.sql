
ALTER PROCEDURE dbo._disc_getBands
AS
BEGIN
	SELECT DISTINCT a.id, a.bandName
		FROM _Band a
			INNER JOIN _BandAlbum b ON b.idBand = a.id
			INNER JOIN _BandTrack c ON c.idAlbum = b.id
END
GO

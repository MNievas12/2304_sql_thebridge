SELECT *
FROM tracks
WHERE composer LIKE "%AC/DC%";

SELECT DISTINCT composer
FROM tracks;


SELECT 
    tracks.Name as Nombre_cancion, 
    artists.Name as Nombre_artista
FROM tracks
INNER JOIN albums ON tracks.AlbumId = albums.AlbumId
INNER JOIN artists ON albums.ArtistId = artists.ArtistId
WHERE artists.Name = "AC/DC";

SELECT * FROM artists WHERE name ="AC/DC";
SELECT * FROM albums WHERE ArtistId =1;
SELECT * FROM tracks WHERE AlbumId IN (1,4);


SELECT tracks.*
FROM tracks
INNER JOIN albums ON tracks.AlbumId = albums.AlbumId
--INNER JOIN artists ON albums.ArtistId = artists.ArtistId
WHERE albums.AlbumId IN (1,4);
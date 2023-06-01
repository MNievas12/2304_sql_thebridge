--ex4
SELECT FirstName || ' ' || LastName AS Nombre_completo,
--LastName,
CustomerId,
Country
FROM customers
WHERE NOT country = "USA";
--LIMIT 10;

--ex5
SELECT 
FirstName || ' ' || LastName AS Nombre_completo,
City || ' ' || State || ' ' || Country AS Direccion,
email
FROM employees
WHERE title = "Sales Support Agent";

--ex6
SELECT DISTINCT
BillingCountry
FROM invoices
--LIMIT 10
;

--ex7
SELECT 
    State,
    COUNT(CustomerId)
FROM 
    customers
WHERE 
    Country = "USA"
GROUP BY 
    State
ORDER BY 
    2 DESC;
    
--ex8
SELECT 
InvoiceId,
SUM(Quantity) as Total_articulos
FROM invoice_items 
WHERE InvoiceId IN (37)
GROUP BY 1
--LIMIT 10
;

--ex9
SELECT 
    artists.Name as Nombre_artista,
    COUNT(TrackId) as N_canciones
FROM tracks
INNER JOIN albums ON tracks.AlbumId = albums.AlbumId
INNER JOIN artists ON albums.ArtistId = artists.ArtistId
WHERE artists.Name = "AC/DC"
GROUP BY 1;

--ex10
SELECT 
InvoiceId,
SUM(Quantity) as Total_articulos
FROM invoice_items 
--WHERE InvoiceId IN (37)
GROUP BY 1;

--ex11
SELECT BillingCountry,
COUNT(InvoiceId)
FROM Invoices
GROUP BY 1
ORDER BY 2 DESC;

--ex12
SELECT
 strftime("%Y",InvoiceDate) AS anio,
 COUNT(InvoiceId)
FROM Invoices
WHERE Anio IN ("2009", "2011")
GROUP BY 1;

--ex13
SELECT
 strftime("%Y",InvoiceDate) AS anio,
 COUNT(InvoiceId)
FROM Invoices
WHERE Anio BETWEEN "2009" AND "2011"
GROUP BY 1;


--ex14
SELECT
    Country,
    COUNT(CustomerId)
FROM customers
WHERE country IN ("Spain","Brazil")
GROUP BY 1;

--ex15
SELECT Name
FROM tracks
WHERE Name LIKE "You%";


--Parte2 
--ex1
SELECT 
c.FirstName || " " || c.LastName as Nombre_del_cliente,
i.InvoiceId,
i.InvoiceDate,
i.BillingCountry
FROM invoices AS i
INNER JOIN customers AS c ON i.CustomerId = c.CustomerId
WHERE c.Country = "Brazil"
;

--ex2
SELECT e.FirstName || " " || e.LastName AS Nombre_empleado,
i.*
FROM invoices AS i
INNER JOIN customers AS c ON i.CustomerId = c.CustomerId
INNER JOIN employees AS e ON c.SupportRepId = e.EmployeeId;


--ex3
SELECT
c.FirstName || " " || c.Lastname AS Nombre_cliente,
c.Country,
e.FirstName || " " || e.Lastname AS Nombre_empleado,
sum(i.Total)
FROM invoices AS i
INNER JOIN customers AS c ON i.CustomerId = c.CustomerId
INNER JOIN employees AS e ON c.SupportRepId = e.EmployeeId
WHERE e.Title = "Sales Support Agent"
GROUP BY 1,2,3
ORDER BY 4 DESC;

--ex4
SELECT
--ii.InvoiceLineId,
ii.InvoiceId,
--ii.TrackId,
t.Name
FROM invoice_items AS ii
INNER JOIN tracks AS t ON ii.TrackId = t.trackId;

--ex5
SELECT DISTINCT
t.Name AS Nombre_cancion,
mt.Name AS Nombre_formato,
g.Name AS Nombre_genero,
a.Title AS Titulo_album
FROM tracks AS t
INNER JOIN albums AS a ON t.AlbumId = a.AlbumId
INNER JOIN genres AS g ON t.GenreId = g.GenreId
INNER JOIN media_types AS mt ON t.MediaTypeId = mt.MediaTypeId
ORDER BY Titulo_album;

--ex6
SELECT
pt.PlaylistId,
p.Name,
COUNT(pt.trackId)
FROM playlist_track AS pt
INNER JOIN playlists AS p ON p.PlaylistId = pt.PlaylistId
GROUP BY 1,2
ORDER BY 3 DESC;

--ex7
SELECT
e.FirstName || " " || e.Lastname AS Nombre_empleado,
sum(i.Total)
FROM invoices AS i
INNER JOIN customers AS c ON i.CustomerId = c.CustomerId
INNER JOIN employees AS e ON c.SupportRepId = e.EmployeeId
WHERE e.Title = "Sales Support Agent"
GROUP BY 1
ORDER BY 2 DESC;

--ex8
SELECT
e.FirstName || " " || e.Lastname AS Nombre_empleado,
sum(i.Total)
FROM invoices AS i
INNER JOIN customers AS c ON i.CustomerId = c.CustomerId
INNER JOIN employees AS e ON c.SupportRepId = e.EmployeeId
WHERE e.Title = "Sales Support Agent" AND strftime("%Y", i.InvoiceDate) = "2009"
GROUP BY 1
ORDER BY 2 DESC;

--ex9
SELECT
ar.ArtistID,
ar.Name,
SUM(i.Total)
FROM invoices AS I
INNER JOIN invoice_items AS ii ON i.InvoiceId = ii.InvoiceId
INNER JOIN tracks AS t ON ii.trackId = t.trackId
INNER JOIN albums AS a ON t.AlbumId = a.AlbumId
INNER JOIN artists AS ar ON a.ArtistId = ar.ArtistId
GROUP BY 1,2
ORDER BY 3 DESC
LIMIT 3;
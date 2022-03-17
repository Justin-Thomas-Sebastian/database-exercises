USE codeup_test_db;

-- BEFORE --
-- All albums in your table.
SELECT name AS 'All Albums', sales
FROM albums;

-- All albums released before 1980
SELECT name AS 'Albums released before 1980', release_date
FROM albums
WHERE release_date < 1980;

-- All albums by Michael Jackson
SELECT name AS 'Albums by Michael Jackson'
FROM albums
WHERE artist = 'Michael Jackson';




-- UPDATE --
-- Make all the albums 10 times more popular (sales * 10)
UPDATE albums
SET sales = sales * 10;

-- Move all the albums before 1980 back to the 1800s.
UPDATE albums
SET release_date = release_date - 100
WHERE release_date < 1980;

-- Change 'Michael Jackson' to 'Peter Jackson'
UPDATE albums
SET artist = 'Peter Jackson'
WHERE artist = 'Michael Jackson';




-- AFTER --
-- All albums in your table after update
SELECT name AS 'All albums after updating sales', sales
FROM albums;

-- All albums released in 1800s
SELECT name AS 'Albums released before 1900', release_date
FROM albums
WHERE release_date < 1900;

-- All albums by Peter Jackson
SELECT name AS 'Albums by Peter Jackson'
FROM albums
WHERE artist = 'Peter Jackson';
-- Select all from this table
SELECT * FROM table_name;

SELECT column1, column2 
FROM table_name;

SELECT  column_name 
FROM table_name
WHERE column_nameoperator
value;

CREATE TABLE
INSERT INTO
SELECT
ALTER TABLE
UPDATE
DELETE FROM

-- INTEGER, a positive or negative whole number
-- TEXT, a text string
-- DATE, the date formatted as YYYY-MM-DD
-- REAL, a decimal value

-- CREATE TABLE table_name (
--    column_1 data_type, 
--    column_2 data_type, 
--    column_3 data_type
-- );

CREATE TABLE celebs (
   id INTERGER,
   name TEXT,
   age INTEGER
);

SELECT * FROM celebs;
~~~~~~~

INSERT INTO celebs (id, name, age) 
VALUES (1, 'Justin Bieber', 22);

INSERT INTO celebs (id, name, age) 
VALUES (2, 'Beyonce Knowles', 33); 
 
INSERT INTO celebs (id, name, age) 
VALUES (3, 'Jeremy Lin', 26); 
~~~~~~~~~

ALTER TABLE celebs 
ADD COLUMN twitter_handle TEXT;
SELECT * FROM table_name;
~~~~~~~

UPDATE celebs 
SET twitter_handle = '@jLin2' 
WHERE id = 3; 
SELECT * FROM celebs;
~~~~~~~

-- IS NULL is a condition in SQL that returns true when the value is NULL and false otherwise
DELETE FROM celebs 
WHERE twitter_handle IS NULL;
~~~~~~

CREATE TABLE celebs (
   id INTEGER PRIMARY KEY, 
   name TEXT UNIQUE,
   date_of_birth TEXT NOT NULL,
   date_of_death TEXT DEFAULT 'Not Applicable'
);
------------------------------------------------------
-- Here we renamed the name column as Titles
SELECT name AS 'Titles'
FROM movies;

-- DISTINCT is used to return unique values in the output. It filters out all duplicate values in the specified column(s).
SELECT DISTINCT genre 
FROM movies;

-- Comparison operators used with the WHERE clause are:
-- = equal to
-- != not equal to
-- > greater than
-- < less than
-- >= greater than or equal to
-- <= less than or equal to

-- LIKE is a special operator used with the WHERE clause to search for a specific pattern in a column.
-- name LIKE 'Se_en' is a condition evaluating the name column for a specific pattern.
-- Se_en represents a pattern with a wildcard character.
-- The _ means you can substitute any individual character here without breaking the pattern. The names Seven and Se7en both match this pattern.
SELECT * 
FROM movies
WHERE name LIKE 'Se_en';

-- % is a wildcard character that matches zero or more missing letters in the pattern. For example:
-- A% matches all movies with names that begin with letter ‘A’
-- %a matches all movies that end with ‘a’
SELECT * 
FROM movies
WHERE name LIKE '%man%';
-- EX Iron Man Batman Spider-Man

SELECT * 
FROM movies
WHERE name LIKE 'The %';
-- EX The Avengers The Dark Knight

-- BETWEEN
SELECT *
FROM movies
WHERE year BETWEEN 1990 AND 1999;

-- AND
SELECT * 
FROM movies
WHERE year BETWEEN 1990 AND 1999
   AND genre = 'romance';

-- OR
SELECT *
FROM movies
WHERE year > 2014
   OR genre = 'action';

-- ORDER
-- DESC is a keyword used in ORDER BY to sort the results in descending order (high to low or Z-A).
-- ASC is a keyword used in ORDER BY to sort the results in ascending order (low to high or A-Z)
SELECT *
FROM movies
WHERE imdb_rating > 8
ORDER BY year DESC;

-- LIMIT
SELECT *
FROM movies
LIMIT 10;

-- EX
SELECT *
FROM movies
ORDER BY imdb_rating DESC
LIMIT 3;

-- CASE if else statement
SELECT name,
 CASE
  WHEN imdb_rating > 8 THEN 'Fantastic'
  WHEN imdb_rating > 6 THEN 'Poorly Received'
  ELSE 'Avoid at All Costs'
 END AS 'Review'
FROM movies;

-- SELECT is the clause we use every time we want to query information from a database.
-- AS renames a column or table.
-- DISTINCT return unique values.
-- WHERE is a popular command that lets you filter the results of the query based on conditions that you specify.
-- LIKE and BETWEEN are special operators.
-- AND and OR combines multiple conditions.
-- ORDER BY sorts the result.
-- LIMIT specifies the maximum number of rows that the query will return.
-- CASE creates different outputs.
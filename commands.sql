-- querie
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
-----------------------------------------------------------

-- Calculations performed on multiple rows of a table are called aggregates
-- COUNT(): count the number of rows
-- SUM(): the sum of the values in a column
-- MAX()/MIN(): the largest/smallest value
-- AVG(): the average of the values in a column
-- ROUND(): round the values in the column

SELECT COUNT(*)
FROM table_name;
-- COUNT() is a function that takes the name of a column as an argument and counts the number of non-empty values in that column

SELECT SUM(downloads)
FROM fake_apps;
-- SQL makes it easy to add all values in a particular column using SUM().

SELECT MAX(downloads)
FROM fake_apps;

SELECT MIN(downloads)
FROM fake_apps;

SELECT AVG(downloads)
FROM fake_apps;

SELECT name, ROUND(price, 0)
FROM fake_apps;

SELECT ROUND(AVG(price), 2)
FROM fake_apps;

-- Group By 1.
-- GROUP BY is a clause in SQL that is used with aggregate functions. It is used in collaboration with the SELECT statement to arrange identical data into groups.
-- The GROUP BY statement comes after any WHERE statements, but before ORDER BY or LIMIT.
SELECT year,
   AVG(imdb_rating)
FROM movies
GROUP BY year
ORDER BY year;

SELECT price, COUNT(*) 
FROM fake_apps
WHERE downloads > 20000
GROUP BY price;

SELECT category, SUM(downloads)
FROM fake_apps
GROUP BY category;

-- Group By 2.
SELECT category, 
   price,
   AVG(downloads)
FROM fake_apps
GROUP BY 1, 2;

-- HAVING is very similar to WHERE. In fact, all types of WHERE clauses you learned about thus far can be used with HAVING.
SELECT year,
   genre,
   COUNT(name)
FROM movies
GROUP BY 1, 2
HAVING COUNT(name) > 10;
-- HAVING statement always comes after GROUP BY, but before ORDER BY and LIMIT

SELECT price, 
   ROUND(AVG(downloads)),
   COUNT(*)
FROM fake_apps
GROUP BY price
HAVING COUNT(*) > 10;

-- COUNT(): count the number of rows
-- SUM(): the sum of the values in a column
-- MAX()/MIN(): the largest/smallest value
-- AVG(): the average of the values in a column
-- ROUND(): round the values in the column
-- GROUP BY is a clause used with aggregate functions to combine data from one or more columns.
-- HAVING limit the results of a query based on an aggregate property.
_____________________________________________________

-- order_id
-- customer_id
-- customer_name
-- customer_address
-- subscription_id
-- subscription_description
-- subscription_monthly_price
-- subscription_length
-- purchase_date

SELECT *
FROM orders
LIMIT 5;
 
SELECT *
FROM subscriptions
LIMIT 5;
 
SELECT * 
FROM customers
LIMIT 5;

SELECT *
FROM orders
JOIN customers
  ON orders.customer_id = customers.customer_id;


-- JOIN will combine rows from different tables if the join condition is true.

-- LEFT JOIN will return every row in the left table, and if the join condition is not met, NULL values are used to fill in the columns from the right table.

-- Primary key is a column that serves a unique identifier for the rows in the table.

-- Foreign key is a column that contains the primary key to another table.

-- CROSS JOIN lets us combine all rows of one table with all rows of another table.

-- UNION stacks one dataset on top of another.

-- WITH allows us to define one or more temporary tables that can be used in the final query.
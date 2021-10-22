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

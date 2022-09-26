-- Intermediate SQL
-- CHAPTER 1 | SELECTING DATA
-------------------------------------------------------------------------------------------

-- Practice with COUNT()
-- Count the number of records in the people table

SELECT COUNT(*) AS count_records
FROM people;

-- Count the number of birthdates in the people table

SELECT COUNT(birthdate) AS count_birthdate
FROM people;

-- Count the languages and countries represented in the films table

SELECT COUNT(language) AS count_languages, COUNT(country) AS count_countries
FROM films;


-- Return the unique countries from the films table

SELECT DISTINCT country
FROM films;

-- Count the distinct countries from the films table

SELECT COUNT( DISTINCT country ) AS count_distinct_countries
FROM films;

-------------------------------------------------------------------------------------

-- CHAPTER 2 | FILTERING RECORDS

-- Select film_ids and imdb_score with an imdb_score over 7.0

SELECT film_id, imdb_score
FROM reviews
WHERE imdb_score > 7.0;


-- Select film_ids and imdb_score for ten records with less than 7.0 

SELECT film_id, imdb_score
FROM reviews
WHERE imdb_score < 7.0
LIMIT 10;


-- Count the records with at least 100,000 votes

SELECT COUNT(num_votes) AS films_over_100k_votes
FROM reviews
WHERE num_votes >= 100000;


-- Count the Spanish-language films

SELECT COUNT(language) AS count_spanish
FROM films
WHERE language = 'Spanish';

-- Select the title and release_year for all German-language films released before 2000

SELECT title, release_year
FROM films
WHERE language = 'German'
	AND release_year < 2000;

-- Select all records for German-language films released after 2000 and before 2010

SELECT *
FROM films
WHERE language = 'German'
    AND (release_year > 2000 AND release_year < 2010);
	
-- Find the title and year of films from the 1990 or 1999

SELECT title, release_year
FROM films
WHERE release_year = 1990 OR release_year = 1999;

------------------------------------------------------------------------------

SELECT title, release_year
FROM films
WHERE (release_year = 1990 OR release_year = 1999)
-- Add a filter to see only English or Spanish-language films
	AND (language = 'Spanish' OR language = 'English');
	

SELECT title, release_year
FROM films
WHERE (release_year = 1990 OR release_year = 1999)
	AND (language = 'English' OR language = 'Spanish')
-- Filter films with more than $2,000,000 gross
	AND (gross > 2000000);	

-- Select the title and release_year for films released between 1990 and 2000
SELECT title, release_year
FROM films
WHERE release_year BETWEEN 1990 AND 2000;


SELECT title, release_year
FROM films
WHERE release_year BETWEEN 1990 AND 2000
-- Narrow down your query to films with budgets > $100 million
	AND budget > 100000000;
	

-- Restrict the query only for Spanish Language
SELECT title, release_year
FROM films
WHERE release_year BETWEEN 1990 AND 2000
	AND budget > 100000000
-- Restrict the query to only Spanish-language films
	AND language = 'Spanish';
	
-- Select the names that start with B
SELECT name
FROM people
WHERE name LIKE 'B%';


SELECT name
FROM people
-- Select the names that have r as the second letter
WHERE name LIKE '_r%';


SELECT name
FROM people
-- Select names that don't start with A
WHERE name NOT LIKE 'A%';


-- Find the title and release_year for all films over two hours in length released in 1990 and 2000
SELECT title, release_year
FROM films
WHERE duration > 120
    AND release_year IN (1990, 2000);
	
-- Find the title and language of all films in English, Spanish, and French
SELECT title, language
FROM films
WHERE language IN ('English', 'Spanish', 'French');


-- Find the title, certification, and language all films certified NC-17 or R that are in English, Italian, or Greek

SELECT title, certification, language
FROM films
WHERE certification IN ('NC-17', 'R')
    AND language IN ('English', 'Italian', 'Greek');
	
-- Count the unique titles
SELECT COUNT(DISTINCT title) AS nineties_english_films_for_teens
FROM films
-- Filter to release_years to between 1990 and 1999
WHERE release_year BETWEEN 1990 AND 1999
-- Filter to English-language films
	AND language = 'English'
-- Narrow it down to G, PG, and PG-13 certifications
	AND certification IN ('G', 'PG', 'PG-13');
	
	
-- List all film titles with missing budgets

SELECT title AS no_budget_info
FROM films
WHERE budget IS NULL;


-- Count the number of films we have language data for

SELECT COUNT(*) AS count_language_known
FROM films
WHERE language IS NOT NULL;


-----------------------------------------------------------------------------------------

-- CHAPTER 3 | AGGREAGATE FUNCTIONS

-- Query the sum of film durations
SELECT SUM(duration) AS total_duration
FROM films;


-- Calculate the average duration of all films
SELECT AVG(duration) AS average_duration
FROM films;


-- Find the latest release_year

SELECT MAX(release_year) AS latest_year
FROM films;


-- Find the duration of the shortest film

SELECT MIN(duration) AS shortest_film
FROM films;


-- Calculate the sum of gross from the year 2000 or later

SELECT SUM(gross) AS total_gross
FROM films
WHERE release_year >= 2000;


-- Calculate the average gross of films that start with A

SELECT AVG(gross) AS avg_gross_A
FROM films
WHERE title LIKE 'A%';


-- Calculate the lowest gross film in 1994

SELECT MIN(gross) AS lowest_gross
FROM films
WHERE release_year = 1994;


-- Calculate the highest gross film released between 2000-2012

SELECT MAX(gross) AS highest_gross
FROM films
WHERE release_year BETWEEN 2000 AND 2012;


-- Calculate the average budget rounded to the thousands

SELECT ROUND(AVG(budget), -3) AS avg_budget_thousands
FROM films;


-- Calculate the title and duration_hours from films
SELECT title, (DURATION / 60.0) AS duration_hours
FROM films;


-- Calculate the percentage of people who are no longer alive
SELECT COUNT(deathdate) * 100.0 / COUNT(*) AS percentage_dead
FROM people;


-- Find the number of decades in the films table
SELECT (MAX(release_year) - MIN(release_year)) / 10.0 AS number_of_decades
FROM films;


-- CHAPTER 4 | SORTING AND GROUPING

-- Select name from people and sort alphabetically

SELECT name
FROM people
ORDER BY name ASC;


-- Select the title and duration from longest to shortest film

SELECT title, duration
FROM films
ORDER BY duration DESC;

-- Select the release year, duration, and title sorted by release year and duration

SELECT release_year, duration, title
FROM films
ORDER BY release_year, duration ASC;


-- Select the certification, release year, and title sorted by certification and release year

SELECT certification, release_year, title
FROM films
ORDER BY certification ASC, release_year DESC;


-- Find the release_year and film_count of each year
SELECT release_year, COUNT(*) AS film_count
FROM films
GROUP BY release_year;



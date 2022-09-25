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


	

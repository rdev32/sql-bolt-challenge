-- LESSON 1
SELECT title FROM movies;

SELECT director FROM movies;

SELECT title, director FROM movies;

SELECT title, year FROM movies;

SELECT * FROM movies;

-- LESSON 2
SELECT title FROM movies 
    WHERE id = 6;

SELECT * FROM movies 
    WHERE year >= 2000 AND year <= 2010;

SELECT title FROM movies 
    WHERE NOT (year >= 2000 AND year <= 2010);

SELECT title FROM movies 
    WHERE id <= 5;

-- LESSON 3
SELECT title FROM movies 
    WHERE title LIKE 'Toy Story%';

SELECT title FROM movies 
    WHERE director = 'John Lasseter';

SELECT title, director FROM movies 
    WHERE director IS NOT 'John Lasseter';

SELECT title FROM movies 
    WHERE title LIKE 'WALL-%';

-- LESSON 4
SELECT DISTINCT director FROM movies 
    ORDER BY director ASC;

SELECT title FROM movies 
    ORDER BY year DESC LIMIT 4;

SELECT title FROM movies 
    ORDER BY title ASC LIMIT 5;

SELECT title FROM movies 
    ORDER BY title ASC LIMIT 5 offset 5;

-- LESSON 5
SELECT city, population FROM north_american_cities 
    WHERE country = 'Canada';

SELECT city FROM north_american_cities 
    WHERE country = 'United States' 
    ORDER BY latitude DESC;

SELECT * FROM north_american_cities 
    WHERE (longitude < (
        (SELECT longitude FROM north_american_cities 
            WHERE city = 'Chicago' ORDER BY longitude ASC
        ))
    ) ORDER BY longitude ASC;

SELECT * FROM north_american_cities 
    WHERE country = 'Mexico' 
    ORDER BY population DESC LIMIT 2;

SELECT city FROM north_american_cities 
    WHERE country = 'United States' 
    ORDER BY population DESC LIMIT 2 offset 2;

-- LESSON 6
SELECT title, domestic_sales, international_sales FROM boxoffice 
    INNER JOIN movies ON movie_id = movies.id;

SELECT international_sales, domestic_sales, title FROM boxoffice 
    INNER JOIN movies ON boxoffice.movie_id = movies.id 
    WHERE international_sales > domestic_sales;

SELECT title, rating FROM boxoffice 
    INNER JOIN movies ON movies.id = boxoffice.movie_id 
    ORDER BY rating DESC;

-- LESSON 7
SELECT DISTINCT building FROM employees;

SELECT building_name, capacity FROM buildings;

SELECT DISTINCT building_name, role FROM buildings 
    LEFT JOIN employees 
    ON buildings.building_name = employees.building;

-- LESSON 8
SELECT name, role FROM employees 
    WHERE building IS NULL;

SELECT building_name FROM buildings 
    LEFT JOIN employees ON building_name = building 
    WHERE building IS NULL;

-- LESSON 9
SELECT title, (domestic_sales + international_sales) / 1000000 AS combined_sales FROM movies
    INNER JOIN boxoffice ON id = movie_id;

SELECT title, (rating * 10) AS rating FROM movies 
    INNER JOIN boxoffice ON movie_id = id;

SELECT title, year FROM movies 
    WHERE year % 2 IS 0;

-- LESSON 10
SELECT MAX(years_employed) FROM employees;

SELECT role, AVG(years_employed) AS avg_years FROM employees 
    GROUP BY role;

SELECT SUM(years_employed) AS all_those_years, building FROM employees 
    GROUP BY building;

-- LESSON 11
SELECT role, COUNT(*) AS total_artists FROM employees 
    WHERE role = 'Artist';

SELECT role, COUNT(role) FROM employees 
    GROUP BY role;

SELECT role, SUM(years_employed) AS total_years_employed FROM employees 
    GROUP BY role HAVING role = 'Engineer';

-- LESSON 12
SELECT director, count(director) AS no_movies FROM movies GROUP BY director;

SELECT sum(domestic_sales + international_sales), director FROM boxoffice 
INNER JOIN movies ON movie_id = id GROUP BY director;

-- LESSON 13
INSERT INTO movies 
    VALUES (4, 'Toy Story 4', 'John Lasseter', 2018, 93);

INSERT INTO boxoffice 
    VALUES (4, 8.7, 340000, 270000);

-- LESSON 14
UPDATE movies SET director = 'John Lasseter' 
    WHERE title = "A Bug's Life";

UPDATE movies SET year = 1999 
    WHERE title = "Toy Story 2";

UPDATE movies SET title = "Toy Story 3", director = "Lee Unkrich" 
    WHERE title = "Toy Story 8";

-- LESSON 15
DELETE FROM movies 
    WHERE year < 2005;

DELETE FROM movies 
    WHERE director = "Andrew Stanton";

-- LESSON 16
CREATE TABLE database (
    name TEXT,
    version INT,
    download_count INT
); 

-- LESSON 17
ALTER TABLE movies ADD aspect_ratio FLOAT DEFAULT 0;

ALTER TABLE movies ADD language TEXT DEFAULT "English";

-- LESSON 18
DROP TABLE movies;

DROP TABLE boxoffice;
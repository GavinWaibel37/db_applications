SELECT full_name
FROM teams;

SELECT full_name, city, state
FROM teams;

SELECT full_name
FROM teams
WHERE state = 'Ohio';

SELECT full_name, year_founded
FROM teams
WHERE year_founded < 1950;

SELECT full_name, year_founded
FROM teams
ORDER BY year_founded ASC;

SELECT full_name, year_founded
FROM teams
ORDER By year_founded DESC
LIMIT 5;


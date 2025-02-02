USE hr;
-- 1 TASK
SELECT COUNT(*) AS employee_count FROM employees;

-- 2 TASK
SELECT COUNT(*) AS department_count FROM departments;
-- 3 TASK
USE World;

-- 4 TASK
SELECT AVG(Population) AS average_population
FROM city
WHERE CountryCode = 'IND';

-- 5 TASK
SELECT MIN(Population) AS min_population, MAX(Population) AS max_population
FROM city
WHERE CountryCode = 'IND';
-- 6 TASK
SELECT MAX(SurfaceArea) AS largest_area
FROM country;
-- 7 TASK
SELECT Name, LifeExpectancy 
FROM country
WHERE LifeExpectancy IS NOT NULL;
-- 8 TASK
SELECT Name AS city, Population
FROM city
WHERE Population = (SELECT MAX(Population) FROM city);
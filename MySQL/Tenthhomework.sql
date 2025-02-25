-- 1 TASK
USE world;
-- 2 TASK
SELECT CountryCode, SUM(Population) AS TotalPopulation
FROM city
GROUP BY CountryCode;
-- 3 TASK
SELECT CountryCode, SUM(Population) AS TotalPopulation
FROM city
GROUP BY CountryCode
HAVING TotalPopulation > 3000000;
-- 4 TASK
SELECT COUNT(*) AS RecordCount
FROM (
    SELECT CountryCode, SUM(Population) AS TotalPopulation
    FROM city
    GROUP BY CountryCode
    HAVING TotalPopulation > 3000000
) AS Subquery;
-- 5 TASK
SELECT country.Name AS CountryName, SUM(city.Population) AS TotalPopulation
FROM city
JOIN country ON city.CountryCode = country.Code
GROUP BY country.Name
HAVING TotalPopulation > 3000000;
-- 6 TASK
SELECT CountryCode, COUNT(*) AS AmountOfCities
FROM city
GROUP BY CountryCode;
-- 7 TASK
SELECT country.Name AS CountryName, COUNT(city.ID) AS AmountOfCities
FROM city
JOIN country ON city.CountryCode = country.Code
GROUP BY country.Name;
-- 8 TASK
-- PART 1
SELECT CountryCode, COUNT(*) AS AmountOfCities
FROM city
GROUP BY CountryCode;
-- PART 2

SELECT AVG(AmountOfCities) AS AvgCitiesPerCountry
FROM (
    SELECT CountryCode, COUNT(*) AS AmountOfCities
    FROM city
    GROUP BY CountryCode
) AS CityCounts;
-- PART 3
SELECT country.Name AS CountryName, CityCounts.AmountOfCities
FROM (
    SELECT CountryCode, COUNT(*) AS AmountOfCities
    FROM city
    GROUP BY CountryCode
) AS CityCounts
JOIN country ON CityCounts.CountryCode = country.Code;
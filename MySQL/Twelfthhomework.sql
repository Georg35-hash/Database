

-- 1 TASK
USE world;
SELECT CountryCode, COUNT(*) AS CityCount
FROM city
GROUP BY CountryCode;

SELECT country.Name AS CountryName, COUNT(city.ID) AS CityCount
FROM city
JOIN country ON city.CountryCode = country.Code
GROUP BY country.Name;

-- 2 TASK
SELECT Name AS CountryName, LifeExpectancy, 
       AVG(LifeExpectancy) OVER () AS AvgLifeExpectancy
FROM country;

-- 3 TASK

SELECT Name AS CountryName, LifeExpectancy, 
       RANK() OVER (ORDER BY LifeExpectancy DESC) AS LifeRank
FROM country;

-- 4 TASK
SELECT CountryName, LifeExpectancy
FROM (
    SELECT Name AS CountryName, LifeExpectancy, 
           RANK() OVER (ORDER BY LifeExpectancy DESC) AS LifeRank
    FROM country
) AS RankedCountries
WHERE LifeRank = 3;
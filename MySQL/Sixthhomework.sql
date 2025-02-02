-- 1. TASK 
SELECT country.Name AS Country, countrylanguage.Language 
FROM country
JOIN countrylanguage ON country.Code = countrylanguage.CountryCode;

-- 2. TASK 
SELECT city.Name AS City, city.Population, country.Name AS Country 
FROM city
JOIN country ON city.CountryCode = country.Code;

-- 3. TASK 
SELECT Name FROM city WHERE CountryCode = (SELECT Code FROM country WHERE Name = 'South Africa');

-- 4. TASK 
SELECT country.Name AS Country, city.Name AS Capital
FROM country
JOIN city ON country.Capital = city.ID;

-- 5. TASK 
SELECT country.Name AS Country, city.Name AS Capital, city.Population AS Capital_Population
FROM country
JOIN city ON country.Capital = city.ID;

-- 6. TASK 
SELECT city.Name AS Capital
FROM country
JOIN city ON country.Capital = city.ID
WHERE country.Name = 'United States';

-- 7. TASK 
SELECT employees.first_name, employees.last_name, locations.city
FROM employees
JOIN departments ON employees.department_id = departments.department_id
JOIN locations ON departments.location_id = locations.location_id;

-- 8. TASK 
SELECT locations.city, countries.country_name
FROM locations
JOIN countries ON locations.country_id = countries.country_id;

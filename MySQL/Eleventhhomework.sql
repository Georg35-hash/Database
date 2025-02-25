-- 1 TASK
USE hr;
-- 2 TASK

SELECT region_id, 
       SUM(COUNT(country_id)) OVER () AS total_countries
FROM countries
GROUP BY region_id;

-- 3 TASK
SELECT region_id, 
       COUNT(country_id) AS total_countries, 
       SUM(COUNT(country_id)) OVER (PARTITION BY region_id) AS region_countries
FROM countries
GROUP BY region_id;

-- 4 TASK
SELECT location_id, 
       department_name, 
       COUNT(department_id) OVER (PARTITION BY location_id) AS dept_total
FROM departments;

-- 5 TASK
SELECT d.location_id, 
       l.city, 
       d.department_name, 
       COUNT(d.department_id) OVER (PARTITION BY d.location_id) AS dept_total
FROM departments d
JOIN locations l ON d.location_id = l.location_id;

-- 6 TASK
SELECT e.manager_id, 
       m.last_name, 
       SUM(e.salary) AS total_manager_salary
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id
GROUP BY e.manager_id, m.last_name;
USE hr;
SELECT * FROM employees;

SELECT COUNT(*) AS total_empl
FROM employees;

SELECT COUNT(department_id)
FROM employees;

SELECT MAX(salary) AS max_salary
FROM employees;

SELECT MIN(salary) AS min_salary
FROM employees;

SELECT AVG(salary) AS avg_salary
FROM employees;

SELECT first_name, last_name, salary
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);

USE hr;
SELECT MAX(salary) AS max_salary
FROM employees;

-- 2. Найти имя и фамилию сотрудника с самой высокой зарплатой

SELECT COUNT(*) AS total_empl
FROM employees;

SELECT first_name, last_name
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);
USE hr;
SELECT AVG(salary) AS average
FROM employees;

SELECT first_name, last_name, salary
FROM employees
WHERE salary < (
    SELECT AVG(salary)
    FROM employees
);
SELECT employees
FROM employees
WHERE AVG(department);

-- 7 
SELECT *
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id
WHERE e.employee_id IS NULL;

-- 8. Найти количество сотрудников из департамента с айди 100, которые зарабатывают более 5000
SELECT COUNT(*) AS employee_count
FROM employees
WHERE department_id = 100
  AND salary > 5000;
  
  -- Посчитаем количество сотрудников в каждом отделе (выведем номер отдела и количество сотрудников)
SELECT department_id, COUNT(*) AS total_empl
FROM employees
GROUP BY department_id
HAVING department_id IS NOT NULL;

-- Можно с помощью join вывести названия отделов и количество сотрудников в каждом
SELECT d.department_name, COUNT(*) AS total_empl
FROM employees e
JOIN departments d
	ON e.department_id = d.department_id
GROUP BY d.department_name;

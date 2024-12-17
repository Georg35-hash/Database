-- THE FIRST HOMEWORK
USE hr;
-- 1
SELECT 
    *
FROM
    employees
WHERE
    job_id = 'IT_PROG';
-- 2
SELECT 
    *
FROM
    employees
WHERE
    job_id = 'AD_VP';

-- 3

SELECT 
    *
FROM
    employees
WHERE
    salary >= 10000 AND salary <= 20000;

-- 4

SELECT 
    *
FROM
    employees
WHERE
    department_id NOT IN (60 , 30, 100);

SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE '%_ll_%';
SELECT 
    *
FROM
    employees
WHERE
    last_name LIKE '%a';

-- 5
SELECT 
    *
FROM
    employees
WHERE
    salary > 10000;
-- 6
SELECT 
    *
FROM
    employees
WHERE
    salary > 10000 AND last_name LIKE 'L%';
-- 7
-- SQL вернет нам те поля где зп больше 10000 и меньше либо равно 10000
-- 8
-- SQL вернет нам те поля где зп больше 10000 и меньше 10000
-- SQL вернет нам те поля где зп в диапазоне между больше 10000 и меньше 5000

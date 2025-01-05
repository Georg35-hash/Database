USE hr;
-- 1 TASK

SELECT 
* FROM employees;
 -- 2 TASK
 
SELECT salary
FROM employees;
-- 3 TASK

SELECT
	CASE
		WHEN salary > 10000 THEN 1
		ELSE 0
    END AS SALARY_GROUP
FROM employees;
-- 4 TASK

-- мы фактически создаём новый виртуальный столбец с названием SALARY_GROUP, 
--  куда "запихиваем" результат проверки для каждой строки(true 1, false 0)
-- 5 TASK

SELECT 
    first_name,
    CASE 
        WHEN salary > 10000 THEN 1
        ELSE 0
    END AS SALARY_GROUP
FROM employees;
-- 6 TASK

SELECT 
    department_id, AVG(salary) AS avg_salary
FROM
    employees
WHERE
    department_id IN (60 , 90, 100)
GROUP BY department_id;
-- 7 TASK

SELECT 
    first_name,
    last_name,
    CASE
        WHEN salary < 10000 THEN 'junior'
        WHEN salary BETWEEN 10000 AND 15000 THEN 'mid'
        ELSE 'senior'
    END AS level
FROM
    employees;
-- 8 TASK

SELECT * FROM jobs; -- проверили содержимое таблички, убедились что все правильно)
SELECT 
    job_id,
    CASE 
        WHEN max_salary > 10000 THEN 'high_payer'
        ELSE 'low_payer'
    END AS payer_rank
FROM employees
GROUP BY job_id;
-- 9 TASK

SELECT 
    job_id, 
    IF(max_salary > 10000, 'high_payer', 'low_payer') AS payer_rank 
FROM employees
GROUP BY job_id;
-- 10 TASK

SELECT 
    job_id, 
    IF(max_salary > 10000, 'high_payer', 'low_payer') AS payer_rank,
    max_salary
FROM jobs
ORDER BY max_salary DESC;




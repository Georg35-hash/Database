USE hr;

-- задания
SELECT * FROM employees;
SELECT * FROM employees WHERE job_id  = 'IT_PROG';
SELECT * FROM employees WHERE salary >= 10000 AND salary <= 20000;
SELECT * FROM employees WHERE department_id NOT IN  (60, 30, 100);
SELECT * FROM employees WHERE first_name LIKE '%_ll_%';
SELECT * FROM employees WHERE last_name LIKE '%a';
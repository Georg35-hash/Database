
-- HOW TO DATE
-- SELECT DATEDIFF('2023-03-05', '2023-01-01') as diff_date;
-- SELECT TIMESTAMPDIFF(MONTH, '2026-03-05', '2023-01-01');
-- SELECT TIMESTAMPDIFF(MINUTE,'2003-05-01 12:02:55','2003-05-01 12:05:55');

-- SELECT DAYOFWEEK('2025-01-25');
-- SELECT DAYNAME('2025-01-28');

-- 1. Написать запрос, который отображает сотрудников, нанятых в 2005 году 
SELECT *
FROM employees
WHERE hire_date BETWEEN STR_TO_DATE('2005-01-1', '%Y-%m-%d') 
	AND STR_TO_DATE('2005-12-31', '%Y-%m-%d');
SELECT *
FROM employees
WHERE hire_date BETWEEN '2005-1-1' AND '2005-12-31';


-- 2. Написать запрос, который отображает среднюю AMT (сумма заказа) в марте 2022 года  
SELECT ROUND(AVG(AMT), 2) AS avg_amt_2022
FROM ORDERS
WHERE ODATE BETWEEN '2022-3-1' AND '2022-3-31';

SELECT ROUND(AVG(AMT), 2) AS avg_amt_2022
FROM ORDERS
WHERE DATE_FORMAT(ODATE, '%Y-%m') = '2022-03';

SELECT NOW() + INTERVAL 1 DAY;

SELECT NOW() - INTERVAL 1 HOUR;

SELECT DATE_ADD('2025-01-10', INTERVAL 6 MONTH);
SELECT DATE_SUB('2025-01-10', INTERVAL 3 DAY);
SELECT *
FROM employees
WHERE hire_date > NOW() - INTERVAL 5 YEAR;

USE hr;

SELECT * FROM employees;

-- 3. Определите кого из сотрудников приняли на работу в пятницу
SELECT DAYOFWEEK('2025-01-25'); -- SUN (1) - SAT (7)
SELECT WEEKDAY('2025-01-28');	-- MON (0) - SUN (6)

-- 3. Определите кого из сотрудников приняли на работу в пятницу
SELECT *
FROM employees
WHERE WEEKDAY(hire_date) = 4;

-- 4. Испытательный срок после трудоустройства длится три месяца, начиная с календарного месяца 
-- после трудоустройства, напишите скрипт, который рассчитывает дату окончания испытательного срока. 
-- Выведите в результате дату найма и дату окончания испытательного срока. 
-- Улучшите результат, исключив записи, у которых дата найма null.
SELECT first_name, last_name, hire_date, 
	DATE_ADD(hire_date, INTERVAL 3 MONTH) AS probation_finish
FROM employees;
INTERVAL 3 MONTH) AS probation_finish
FROM employees;

-- 5. Определите месяц, в который чаще всего принимают на работу
SELECT MONTH(hire_date) AS hire_month, COUNT(*) AS total_empl
FROM employees
GROUP BY hire_month
ORDER BY total_empl DESC
LIMIT 1;

Teacher03 11:12
USE shop;

SHOW TABLES;

SELECT * FROM ORDERS;
-- 6. Выведите количество заказов по месяцам (номер месяца - количество заказов в этом месяце)
-- 7. Выведите список заказов в марте
SELECT *
FROM ORDERS
WHERE EXTRACT(MONTH FROM ODATE) = 3;

SELECT *
FROM ORDERS
WHERE MONTH(ODATE) = 3;

-- 10. Выведите количество заказов по месяцам (название месяца, количество заказов)
SELECT MONTHNAME(ODATE) AS month_name, COUNT(*) AS total_orders
FROM ORDERS
GROUP BY month_name;
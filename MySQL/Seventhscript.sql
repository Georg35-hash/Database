USE world;
SHOW TABLES;

-- 1. Создайте SQL запрос, который позволяет вывести информацию о населении стран в двух столбцах: 
-- 'CountryCode' и 'Население', где 'Население' представляет собой суммарное количество 
-- жителей всех городов в каждой стране.

SELECT * FROM city;
SELECT * FROM country;
SELECT * FROM countrylanguage;

-- 1. Создайте SQL запрос, который позволяет вывести информацию о населении стран в двух столбцах: 
-- 'CountryCode' и 'Population', где 'Population' представляет собой суммарное количество 
-- жителей всех городов в каждой стране.
SELECT 
    CountryCode, 
    SUM(Population) AS Population
FROM 
    city
GROUP BY 
    CountryCode;

-- 1.1 Создайте SQL запрос, который позволяет вывести информацию о населении стран в двух столбцах: 
-- 'CountryCode' и 'Population', где 'Population' представляет собой суммарное количество 
-- жителей всех городов в каждой стране.
SELECT CountryCode, SUM(Population) AS Population
FROM city

-- 2. Отобразите результат аналогично заданию 1, однако вместо 'CountryCode' включите названия стран. 
-- Для этого примените операцию JOIN между таблицами 'city' и 'country', используя условие 
-- соединения 'city.CountryCode = country.Code'.
GROUP BY CountryCode;
SELECT 
    country.Code AS CountryCode, 
    SUM(city.Population) AS Population
FROM 
    city
JOIN 
    country ON city.CountryCode = country.Code
GROUP BY 
    country.Code;
    
    
-- 2.1 Отобразите результат аналогично заданию 1, однако вместо 'CountryCode' включите названия стран. 
-- Для этого примените операцию JOIN между таблицами 'city' и 'country', используя условие 
-- соединения 'city.CountryCode = country.Code'.

SELECT country.Name, SUM(city.Population) AS Population
FROM city
JOIN country
	ON city.CountryCode = country.Code
GROUP BY country.Name;
SELECT 
    country.Name AS CountryName,
    SUM(city.Population) AS Population
FROM
    city
        JOIN
    country ON city.CountryCode = country.Code
GROUP BY country.Name;




-- 3. Предоставьте список стран, указав количество используемых языков в каждой из них, 
-- выводя отчёт в формате (CountryCode, COUNT(Language)).

SELECT CountryCode, COUNT(Language) AS countLang
FROM countrylanguage
GROUP BY CountryCode;

-- 3.1 Предоставьте список стран, указав количество используемых языков в каждой из них, 
-- выводя отчёт в формате (CountryCode, COUNT(Language)).
SELECT CountryCode, COUNT(Language) AS Languages
FROM countrylanguage
GROUP BY CountryCode;

SELECT c.Name, COUNT(cl.Language) AS Languages
FROM countrylanguage cl
JOIN country c
	ON cl.CountryCode = c.Code
GROUP BY c.Name;

-- 4. Выведите название страны, в которой разговариют на наибольшем количестве языков
SELECT co.Name, COUNT(cl.Language) AS Languages
FROM countrylanguage cl
JOIN country co
	ON cl.CountryCode = co.Code
GROUP BY co.Name
HAVING COUNT(cl.Language) = (
	SELECT MAX(max_l.Languages)
    FROM (		
		SELECT CountryCode, COUNT(Language) AS Languages
		FROM countrylanguage
		GROUP BY CountryCode
    ) max_l
);
SELECT c.Name, COUNT(cl.Language) AS Languages
FROM countrylanguage cl
JOIN country c
	ON cl.CountryCode = c.Code
GROUP BY c.Name
ORDER BY Languages DESC
LIMIT 5;

-- 5. Выведите количество сотрудников, работающих в отделах Marketing и IT
SELECT d.department_name, COUNT(*) AS total_emp
FROM employees e
JOIN departments d
	ON e.department_id = d.department_id
WHERE d.department_name IN ('Marketing', 'IT')
GROUP BY d.department_name;

-- 6. Посчитайте сумму зарплат всех сотрудников
SELECT SUM(salary) AS total_salary
FROM employees;

-- 7. Посчитайте сумму зарплат сотрудников по департаментам вывести department_id, salary
SELECT department_id, SUM(salary) AS total_salary
FROM employees
GROUP BY department_id;

-- 8. Посчитайте сумму зарплат сотрудников по департаментам вывести department_name, total_salary.
-- Тех департаментов, у которых total_salary больше 30000. Отсортируйте по убыванию total_salary
SELECT d.department_name, SUM(e.salary) AS total_salary
FROM employees e
JOIN departments d
	ON e.department_id = d.department_id
GROUP BY d.department_name
HAVING SUM(e.salary) > 30000
ORDER BY total_salary DESC;

USE students;

-- 9. Вывести имена студентов и названия курсов, которые они проходят.


use students;

select * from Competencies;
select * from Courses;
select * from Students;
select * from Students2Courses;
select * from Teachers;
select * from Teachers2Competencies;

-- 10. Вывести имена всех преподавателей с их компетенциями. Если компетенций нет, вывести NULL
SELECT t.name, c.title
FROM Teachers t
LEFT JOIN Teachers2Competencies tc
	ON t.id = tc.teacher_id
LEFT JOIN Competencies c
	ON c.id = tc.competencies_id;


-- 11. Найти курсы, которые не посещает ни один студент
SELECT c.title, sc.student_id
FROM Courses c
LEFT JOIN Students2Courses sc
	ON c.id = sc.course_id
WHERE sc.student_id IS NULL;
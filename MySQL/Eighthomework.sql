USE students;
-- 1 TASK
SELECT * 
FROM Students
WHERE AGE = (SELECT MAX(age) FROM Students);

-- 2 TASK
USE students;
SELECT * 
FROM Students
WHERE AGE = (SELECT MAX(age) FROM Students)
AND AGE IS NOT NULL;

-- 3 TASK
SELECT * 
FROM Teachers
WHERE AGE = (SELECT MAX(age) FROM Teachers)
AND AGE IS NOT NULL;

-- 4 TASK
SELECT Teachers.name, COUNT(Teachers2Competencies.competencies_id) AS competencies_count
FROM Teachers
JOIN Teachers2Competencies ON Teachers.id = Teachers2Competencies.teacher_id
GROUP BY Teachers.name;

-- 5 TASK
SELECT Students.name, COUNT(Students2Courses.course_id) AS courses_count
FROM Students
JOIN Students2Courses ON Students.id = Students2Courses.student_id
GROUP BY Students.name;


-- 6 TASK Не понял как решать, прошу ответить мне в комментариях





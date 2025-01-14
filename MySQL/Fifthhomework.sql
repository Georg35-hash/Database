-- 1 TASK
USE world;

-- 2 TASK
SELECT * FROM city;
SELECT * FROM country;


SELECT Name, Population FROM city
UNION
SELECT Name, Population FROM country;


SHOW TABLES;
DESCRIBE city;
DESCRIBE country;

-- 3 TASK
-- Описание ограничений в таблице city:
-- Поле id имеет тип данных INT, ограничение PRIMARY KEY (уникальность и отсутствие NULL),
-- а также AUTO_INCREMENT, что автоматически увеличивает значение при добавлении новых записей.

-- 4 TASK
USE 090924_Heorhii;

DROP TABLE IF EXISTS citizen;
CREATE TABLE citizen (
    social_security_number INT PRIMARY KEY,
    id INT UNIQUE,
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    email VARCHAR(150) CHECK (email LIKE '%_@gmail')
);


-- 5 TASK
-- Выбор всех данных из таблицы citizen
SELECT * FROM citizen;


DESCRIBE citizen;


ALTER TABLE citizen
MODIFY COLUMN social_security_number INT NOT NULL;

DROP TABLE IF EXISTS Homework5;
CREATE TABLE Homework5 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50)
);

-- 6 TASK

INSERT INTO Homework5 (firstname, lastname) VALUES
('John', 'Smith'),       
('John', 'Doe'),         
('John', 'Bar'),          
('Alice', NULL),         
('Emma', NULL);


-- 7 TASK
SELECT * FROM Homework5;


ALTER TABLE Homework5
MODIFY COLUMN firstname VARCHAR(50) NOT NULL;
ALTER TABLE Homework5
MODIFY COLUMN lastname VARCHAR(50) NOT NULL;

-- 8 TASK
ALTER TABLE Homework5
ADD CONSTRAINT unique_name UNIQUE (firstname, lastname);


-- 9 TASK
DESCRIBE Homework5;


DROP TABLE Homework5;


CREATE TABLE Homework5 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    CONSTRAINT unique_name UNIQUE (firstname, lastname)
);

-- 10 TASK
INSERT INTO Homework5 (firstname, lastname) VALUES
('John', 'Smith'),  -- Существует, можно пропустить
('John', 'Doe'),    -- Уникальное значение
('Alice', 'White'), -- Исправлен NULL
('Emma', 'Brown');  -- Уникальное значение






USE 090924_Heorhii;

-- 1 TASK

CREATE TABLE weather (
    city VARCHAR(50),
    forecast_date DATE,
    temperature INT
);
-- 2 TASK

SELECT * FROM weather;
-- 3 TASK

INSERT INTO weather (city, forecast_date, temperature)
VALUES ('Berlin', '2024-01-07', 30);
-- 4 TASK

INSERT INTO weather (city, forecast_date, temperature) 
VALUES 
    ('Kyiv', '2023-09-01', 25),
    ('London', '2023-09-02', 20),
    ('Rome', '2023-09-03', 28);
-- 5 TASK

SELECT * FROM weather;
-- 6 TASK

UPDATE weather 
SET temperature = 26 
WHERE city = 'Berlin' AND temperature = 30;
-- 7 TASK

UPDATE weather 
SET city = 'Paris' 
WHERE temperature > 25;
-- 8 TASK

ALTER TABLE weather 
ADD COLUMN min_temp INT;
-- 9 TASK

UPDATE weather 
SET min_temp = 0;




//TASK 1

SELECT 
    title AS Название_фильма,
    rating AS Рейтинг,
    CASE rating
        WHEN 'G' THEN 'General Audience – подходит для всех возрастов.'
        WHEN 'PG' THEN 'Parental Guidance – рекомендуется родительский контроль.'
        WHEN 'PG-13' THEN 'Parents Strongly Cautioned – детям до 13 лет просмотр не рекомендуется.'
        WHEN 'R' THEN 'Restricted – до 17 лет просмотр только с родителями.'
        WHEN 'NC-17' THEN 'Adults Only – просмотр только с 18 лет.'
        ELSE 'Неизвестный рейтинг.'
    END AS Описание_рейтинга
FROM film;

//TASK 2
SELECT 
    rating AS Рейтинг, 
    COUNT(*) AS Количество_фильмов
FROM film
GROUP BY rating;

//TASK 3
SELECT 
    title AS Название_фильма,
    rating AS Рейтинг,
    COUNT(*) OVER (PARTITION BY rating) AS Количество_фильмов_в_рейтинге
FROM film;
Разница между GROUP BY и PARTITION BY:

GROUP BY агрегирует данные и сводит их в одну строку на группу.

PARTITION BY создает окно внутри набора данных, позволяя отображать агрегированные данные рядом с каждой строкой, не объединяя их.


//TASK 4
SELECT 
    customer.first_name AS Имя,
    customer.last_name AS Фамилия,
    payment.payment_date AS Дата_платежа,
    payment.amount AS Сумма
FROM payment
JOIN customer ON payment.customer_id = customer.customer_id;

//TASK 5
    customer.first_name AS Имя,
    customer.last_name AS Фамилия,
    DATE_FORMAT(payment.payment_date, '%d %M %Y') AS Дата_платежа,
    payment.amount AS Сумма
FROM payment
JOIN customer ON payment.customer_id = customer.customer_id;
MongoDB – Запросы для коллекции sample_data.restaurants

//TASK 6
db.restaurants.find(
    { 
        borough: "Staten Island", 
        name: { $regex: "pizza", $options: "i" } 
    },
    { name: 1, _id: 0 }
);

//TASK 7
db.restaurants.aggregate([
    { $unwind: "$grades" },
    { 
        $group: { 
            _id: "$name",
            avgScore: { $avg: "$grades.score" }
        } 
    },
    { $sort: { avgScore: -1 } },
    { $limit: 5 }
]);
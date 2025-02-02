-- 1. TASK Вывести все заказы, отсортированные по убыванию по стоимости
SELECT * FROM orders ORDER BY cost DESC;

-- 2. TASK Вывести всех заказчиков, у которых почта зарегистрирована на gmail.com
SELECT * FROM customers WHERE email LIKE '%@gmail.com';

-- 3. TASK Вывести заказы с вычисляемым столбцом status
SELECT *,
  CASE 
    WHEN cost < 100 THEN 'low'
    WHEN cost BETWEEN 100 AND 500 THEN 'middle'
    ELSE 'high'
  END AS status
FROM orders;

-- 4. TASK Вывести заказчиков по убыванию рейтинга
SELECT * FROM customers ORDER BY rating DESC;

-- 5. TASK Вывести всех заказчиков из выбранного города (например, 'Kyiv')
SELECT * FROM customers WHERE city = 'Kyiv';

-- 6. TASK Написать запрос, который вернет самый часто продаваемый товар
SELECT product_id, COUNT(*) AS count
FROM order_items
GROUP BY product_id
ORDER BY count DESC
LIMIT 1;

-- 7. TASK Вывести список заказов с максимальной скидкой
SELECT * FROM orders WHERE discount = (SELECT MAX(discount) FROM orders);

-- 8. TASK Ответ: Скидка определяется как разница между нормальной ценой и ценой со скидкой.

-- 9. TASK Ответ: Да, это может быть разница между нормальной ценой и скидочной ценой.

-- 10. TASK Вывести все заказы с дополнительным столбцом процент_скидки
SELECT *, 
  ((normal_price - discount_price) / normal_price) * 100 AS процент_скидки
FROM orders;

-- 1. TASK 
SELECT * FROM orders ORDER BY cost DESC;

-- 2. TASK 
SELECT * FROM customers WHERE email LIKE '%@gmail.com';

-- 3. TASK 
SELECT *,
  CASE 
    WHEN cost < 100 THEN 'low'
    WHEN cost BETWEEN 100 AND 500 THEN 'middle'
    ELSE 'high'
  END AS status
FROM orders;

-- 4. TASK 
SELECT * FROM customers ORDER BY rating DESC;

-- 5. TASK 
SELECT * FROM customers WHERE city = 'Kyiv';

-- 6. TASK 
SELECT product_id, COUNT(*) AS count
FROM order_items
GROUP BY product_id
ORDER BY count DESC
LIMIT 1;

-- 7. TASK 
SELECT * FROM orders WHERE discount = (SELECT MAX(discount) FROM orders);

-- 8. TASK Ответ: Скидка определяется как разница между нормальной ценой и ценой со скидкой.

-- 9. TASK Ответ: Да, это может быть разница между нормальной ценой и скидочной ценой.

-- 10. TASK 
SELECT *, 
  ((normal_price - discount_price) / normal_price) * 100 AS процент_скидки
FROM orders;

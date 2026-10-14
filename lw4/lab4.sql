-- Лабораторная работа №4. Задание №3.
-- Предметная область: Аптеки, лекарства, наличие лекарств в аптеках.
-- СУБД: PostgreSQL


-- 3.1 INSERT
-- ==========

-- 3.1.a. Без указания списка полей 
INSERT INTO category VALUES (DEFAULT, 'Обезболивающие', 'Средства для снятия боли', 0.10, TRUE);

-- 3.1.b. С указанием списка полей
INSERT INTO manufacturer (name, country, phone, license_number) 
VALUES ('ФармаТек', 'Россия', '+74951234567', 'LIC-998877');

-- 3.1.c. С чтением значения из другой таблицы
INSERT INTO manufacturer (name, country, phone, license_number)
SELECT name || ' (Дубль)', country, phone, license_number 
FROM manufacturer 
WHERE country = 'Россия';


-- 3.2 DELETE
-- ==========

-- 3.2.a. Всех записей 
-- DELETE FROM stock;

-- 3.2.b. По условию
DELETE FROM medicine 
WHERE requires_prescription = TRUE AND base_price < 100;


-- 3.3 UPDATE
-- ==========

-- 3.3.a. Всех записей (повышаем налоговую ставку на 1% для всех категорий)
UPDATE category SET tax_rate = tax_rate + 0.01;

-- 3.3.b. По условию обновляя один атрибут
UPDATE medicine SET base_price = 250.00 WHERE name = 'Аспирин';

-- 3.3.c. По условию обновляя несколько атрибутов
UPDATE pharmacy 
SET phone = '+74950000000', working_hours = 'Круглосуточно' 
WHERE name = 'Аптека №1';


-- 3.4 SELECT
-- ==========

-- 3.4.a. С набором извлекаемых атрибутов
SELECT name, base_price FROM medicine;

-- 3.4.b. Со всеми атрибутами
SELECT * FROM pharmacy;

-- 3.4.c. С условием по атрибуту
SELECT * FROM medicine WHERE requires_prescription = FALSE;


-- 3.5 SELECT ORDER BY + LIMIT (в PostgreSQL LIMIT вместо TOP)
-- ===========================================================

-- 3.5.a. С сортировкой по возрастанию ASC + ограничение вывода
SELECT name, base_price FROM medicine ORDER BY base_price ASC LIMIT 5;

-- 3.5.b. С сортировкой по убыванию DESC
SELECT name, base_price FROM medicine ORDER BY base_price DESC LIMIT 5;

-- 3.5.c. С сортировкой по двум атрибутам + ограничение вывода
SELECT name, base_price, release_form 
FROM medicine 
ORDER BY release_form ASC, base_price DESC 
LIMIT 10;

-- 3.5.d. С сортировкой по первому атрибуту, из списка извлекаемых
SELECT base_price, name FROM medicine ORDER BY base_price LIMIT 5;


-- 3.6 Работа с датами
-- ===================

-- 3.6.a. WHERE по дате
SELECT * FROM stock WHERE arrival_date = '2023-10-15';

-- 3.6.b. WHERE дата в диапазоне
SELECT * FROM stock WHERE arrival_date BETWEEN '2023-01-01' AND '2023-12-31';

-- 3.6.c. Извлечь из таблицы не всю дату, а только год
SELECT id, arrival_date, EXTRACT(YEAR FROM arrival_date) AS arrival_year FROM stock;


-- 3.7 Функции агрегации
-- =====================

-- 3.7.a. Посчитать количество записей в таблице
SELECT COUNT(*) AS total_medicines FROM medicine;

-- 3.7.b. Посчитать количество уникальных записей в таблице
SELECT COUNT(DISTINCT release_form) AS unique_forms FROM medicine;

-- 3.7.c. Вывести уникальные значения столбца
SELECT DISTINCT release_form FROM medicine;

-- 3.7.d. Найти максимальное значение столбца
SELECT MAX(base_price) AS max_price FROM medicine;

-- 3.7.e. Найти минимальное значение столбца
SELECT MIN(base_price) AS min_price FROM medicine;

-- 3.7.f. Написать запрос COUNT() + GROUP BY
SELECT category_id, COUNT(*) AS medicines_in_category 
FROM medicine 
GROUP BY category_id;


-- 3.8 SELECT GROUP BY + HAVING
-- ============================

-- 3.8.a.1. Вывести ID категорий, в которых зарегистрировано более 5 лекарств
SELECT category_id, COUNT(*) AS total_medicines
FROM medicine
GROUP BY category_id
HAVING COUNT(*) > 5;

-- 3.8.a.2. Вывести ID аптек, где суммарное количество товаров на складе превышает 1000 единиц
SELECT pharmacy_id, SUM(quantity) AS total_quantity
FROM stock
GROUP BY pharmacy_id
HAVING SUM(quantity) > 1000;

-- 3.8.a.3. Вывести ID производителей, у которых средняя цена лекарств выше 500 рублей
SELECT manufacturer_id, AVG(base_price) AS avg_price
FROM medicine
GROUP BY manufacturer_id
HAVING AVG(base_price) > 500;


-- 3.9 SELECT JOIN
-- ===============

-- 3.9.a. LEFT JOIN двух таблиц и WHERE по одному из атрибутов
SELECT p.name AS pharmacy_name, s.quantity
FROM pharmacy p
LEFT JOIN stock s ON p.id = s.pharmacy_id
WHERE s.quantity > 50;

-- 3.9.b. RIGHT JOIN. Получить такую же выборку, как и в 3.9.a
SELECT p.name AS pharmacy_name, s.quantity
FROM stock s
RIGHT JOIN pharmacy p ON p.id = s.pharmacy_id
WHERE s.quantity > 50;

-- 3.9.c. LEFT JOIN трех таблиц + WHERE по атрибуту из каждой таблицы
SELECT p.name AS pharmacy_name, m.name AS medicine_name, s.quantity
FROM pharmacy p
LEFT JOIN stock s ON p.id = s.pharmacy_id
LEFT JOIN medicine m ON s.medicine_id = m.id
WHERE p.name LIKE 'Аптека%' 
  AND m.requires_prescription = FALSE 
  AND s.quantity > 10;

-- 3.9.d. INNER JOIN двух таблиц
SELECT m.name AS medicine_name, c.name AS category_name
FROM medicine m
INNER JOIN category c ON m.category_id = c.id;


-- 3.10 Подзапросы
-- ===============

-- 3.10.a. Написать запрос с условием WHERE IN (подзапрос)
-- Найти лекарства из категорий с налогом выше 15%
SELECT name FROM medicine
WHERE category_id IN (
    SELECT id FROM category WHERE tax_rate > 0.15
);

-- 3.10.b. Написать запрос SELECT atr1, atr2, (подзапрос) FROM...
-- Вывести название, цену и среднюю цену по всей таблице в одной строке
SELECT name, base_price, 
       (SELECT AVG(base_price) FROM medicine) AS avg_price_all
FROM medicine;

-- 3.10.c. Написать запрос вида SELECT * FROM (подзапрос)
SELECT * FROM (
    SELECT m.name, m.base_price, c.name AS category_name
    FROM medicine m
    JOIN category c ON m.category_id = c.id
) AS medicine_with_categories
WHERE base_price > 300;

-- 3.10.d. Написать запрос вида SELECT * FROM table JOIN (подзапрос) ON ...
-- Присоединить к аптекам агрегированные данные о количестве товаров на складе
SELECT p.name, stock_summary.total_items
FROM pharmacy p
JOIN (
    SELECT pharmacy_id, SUM(quantity) AS total_items
    FROM stock
    GROUP BY pharmacy_id
) AS stock_summary ON p.id = stock_summary.pharmacy_id;

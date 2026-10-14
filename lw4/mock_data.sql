-- ==========================================================================
-- Моковые данные для Лабораторной работы №4
-- Сгенерировано автоматически
-- ==========================================================================

SET search_path TO public;

-- Очистка таблиц
DELETE FROM stock;
DELETE FROM medicine;
DELETE FROM pharmacy;
DELETE FROM category;
DELETE FROM manufacturer;

-- Сброс счётчиков
ALTER SEQUENCE manufacturer_id_seq RESTART WITH 1;
ALTER SEQUENCE category_id_seq RESTART WITH 1;
ALTER SEQUENCE medicine_id_seq RESTART WITH 1;
ALTER SEQUENCE pharmacy_id_seq RESTART WITH 1;
ALTER SEQUENCE stock_id_seq RESTART WITH 1;

-- ==========================================================================
-- Производители
-- ==========================================================================
INSERT INTO manufacturer (name, country, phone, license_number) VALUES ('ФармаТек', 'Россия', '+74951234567', 'LIC-001');
INSERT INTO manufacturer (name, country, phone, license_number) VALUES ('Байер', 'Германия', '+49215123456', 'LIC-002');
INSERT INTO manufacturer (name, country, phone, license_number) VALUES ('Пфайзер', 'США', '+12123456789', 'LIC-003');
INSERT INTO manufacturer (name, country, phone, license_number) VALUES ('Акрихин', 'Россия', '+74959876543', 'LIC-004');
INSERT INTO manufacturer (name, country, phone, license_number) VALUES ('Новартис', 'Швейцария', '+41442345678', 'LIC-005');
INSERT INTO manufacturer (name, country, phone, license_number) VALUES ('Фармстандарт', 'Россия', '+74951112233', 'LIC-006');
INSERT INTO manufacturer (name, country, phone, license_number) VALUES ('Сандоз', 'Австрия', '+43123456789', 'LIC-007');
INSERT INTO manufacturer (name, country, phone, license_number) VALUES ('Тева', 'Израиль', '+97232345678', 'LIC-008');

-- ==========================================================================
-- Категории
-- ==========================================================================
INSERT INTO category (name, description, tax_rate, is_active) VALUES ('Обезболивающие', 'Средства для снятия боли', 0.1, TRUE);
INSERT INTO category (name, description, tax_rate, is_active) VALUES ('Жаропонижающие', 'Снижение температуры', 0.1, TRUE);
INSERT INTO category (name, description, tax_rate, is_active) VALUES ('Антибиотики', 'Противомикробные средства', 0.2, TRUE);
INSERT INTO category (name, description, tax_rate, is_active) VALUES ('Витамины', 'Витаминные комплексы', 0.05, TRUE);
INSERT INTO category (name, description, tax_rate, is_active) VALUES ('Сердечно-сосудистые', 'Для лечения сердечно-сосудистых заболеваний', 0.15, TRUE);
INSERT INTO category (name, description, tax_rate, is_active) VALUES ('ЖКТ', 'Для желудочно-кишечного тракта', 0.18, TRUE);
INSERT INTO category (name, description, tax_rate, is_active) VALUES ('Респираторные', 'От простуды и кашля', 0.12, TRUE);
INSERT INTO category (name, description, tax_rate, is_active) VALUES ('Успокоительные', 'Седативные средства', 0.25, TRUE);

-- ==========================================================================
-- Лекарства
-- ==========================================================================
INSERT INTO medicine (name, release_form, requires_prescription, base_price, manufacturer_id, category_id) VALUES ('Аспирин', 'Таблетки', TRUE, 85, 1, 1);
INSERT INTO medicine (name, release_form, requires_prescription, base_price, manufacturer_id, category_id) VALUES ('Ибупрофен', 'Таблетки', FALSE, 150, 1, 1);
INSERT INTO medicine (name, release_form, requires_prescription, base_price, manufacturer_id, category_id) VALUES ('Анальгин', 'Таблетки', FALSE, 95, 4, 1);
INSERT INTO medicine (name, release_form, requires_prescription, base_price, manufacturer_id, category_id) VALUES ('Кеторол', 'Ампулы', TRUE, 320, 2, 1);
INSERT INTO medicine (name, release_form, requires_prescription, base_price, manufacturer_id, category_id) VALUES ('Парацетамол', 'Таблетки', FALSE, 60, 1, 2);
INSERT INTO medicine (name, release_form, requires_prescription, base_price, manufacturer_id, category_id) VALUES ('Нурофен', 'Таблетки', FALSE, 280, 3, 2);
INSERT INTO medicine (name, release_form, requires_prescription, base_price, manufacturer_id, category_id) VALUES ('Эффералган', 'Шипучие', FALSE, 220, 5, 2);
INSERT INTO medicine (name, release_form, requires_prescription, base_price, manufacturer_id, category_id) VALUES ('Панадол', 'Таблетки', FALSE, 180, 3, 2);
INSERT INTO medicine (name, release_form, requires_prescription, base_price, manufacturer_id, category_id) VALUES ('Терафлю', 'Порошок', FALSE, 450, 6, 2);
INSERT INTO medicine (name, release_form, requires_prescription, base_price, manufacturer_id, category_id) VALUES ('Колдрекс', 'Порошок', FALSE, 380, 6, 2);
INSERT INTO medicine (name, release_form, requires_prescription, base_price, manufacturer_id, category_id) VALUES ('Амоксициллин', 'Капсулы', TRUE, 250, 2, 3);
INSERT INTO medicine (name, release_form, requires_prescription, base_price, manufacturer_id, category_id) VALUES ('Аугментин', 'Таблетки', TRUE, 520, 5, 3);
INSERT INTO medicine (name, release_form, requires_prescription, base_price, manufacturer_id, category_id) VALUES ('Сумамед', 'Капсулы', TRUE, 680, 8, 3);
INSERT INTO medicine (name, release_form, requires_prescription, base_price, manufacturer_id, category_id) VALUES ('Флемоксин', 'Таблетки', TRUE, 420, 2, 3);
INSERT INTO medicine (name, release_form, requires_prescription, base_price, manufacturer_id, category_id) VALUES ('Ципролет', 'Таблетки', TRUE, 310, 8, 3);
INSERT INTO medicine (name, release_form, requires_prescription, base_price, manufacturer_id, category_id) VALUES ('Доксициклин', 'Капсулы', TRUE, 180, 4, 3);
INSERT INTO medicine (name, release_form, requires_prescription, base_price, manufacturer_id, category_id) VALUES ('Кларитромицин', 'Таблетки', TRUE, 490, 5, 3);
INSERT INTO medicine (name, release_form, requires_prescription, base_price, manufacturer_id, category_id) VALUES ('Витамин C', 'Таблетки', FALSE, 120, 1, 4);
INSERT INTO medicine (name, release_form, requires_prescription, base_price, manufacturer_id, category_id) VALUES ('Витамин D', 'Капли', FALSE, 380, 3, 4);
INSERT INTO medicine (name, release_form, requires_prescription, base_price, manufacturer_id, category_id) VALUES ('Компливит', 'Таблетки', FALSE, 290, 6, 4);
INSERT INTO medicine (name, release_form, requires_prescription, base_price, manufacturer_id, category_id) VALUES ('Супрадин', 'Шипучие', FALSE, 650, 5, 4);
INSERT INTO medicine (name, release_form, requires_prescription, base_price, manufacturer_id, category_id) VALUES ('Валокордин', 'Капли', FALSE, 210, 4, 5);
INSERT INTO medicine (name, release_form, requires_prescription, base_price, manufacturer_id, category_id) VALUES ('Корвалол', 'Капли', FALSE, 95, 4, 5);
INSERT INTO medicine (name, release_form, requires_prescription, base_price, manufacturer_id, category_id) VALUES ('Нитроглицерин', 'Таблетки', TRUE, 150, 2, 5);
INSERT INTO medicine (name, release_form, requires_prescription, base_price, manufacturer_id, category_id) VALUES ('Анаприлин', 'Таблетки', TRUE, 80, 4, 5);
INSERT INTO medicine (name, release_form, requires_prescription, base_price, manufacturer_id, category_id) VALUES ('Омез', 'Капсулы', FALSE, 280, 8, 6);
INSERT INTO medicine (name, release_form, requires_prescription, base_price, manufacturer_id, category_id) VALUES ('Смекта', 'Порошок', FALSE, 190, 5, 6);
INSERT INTO medicine (name, release_form, requires_prescription, base_price, manufacturer_id, category_id) VALUES ('Мезим', 'Таблетки', FALSE, 240, 2, 6);
INSERT INTO medicine (name, release_form, requires_prescription, base_price, manufacturer_id, category_id) VALUES ('Линекс', 'Капсулы', FALSE, 420, 5, 6);
INSERT INTO medicine (name, release_form, requires_prescription, base_price, manufacturer_id, category_id) VALUES ('АЦЦ', 'Шипучие', FALSE, 350, 2, 7);
INSERT INTO medicine (name, release_form, requires_prescription, base_price, manufacturer_id, category_id) VALUES ('Мукалтин', 'Таблетки', FALSE, 75, 4, 7);
INSERT INTO medicine (name, release_form, requires_prescription, base_price, manufacturer_id, category_id) VALUES ('Лазолван', 'Сироп', FALSE, 280, 5, 7);
INSERT INTO medicine (name, release_form, requires_prescription, base_price, manufacturer_id, category_id) VALUES ('Амбробене', 'Сироп', FALSE, 260, 2, 7);
INSERT INTO medicine (name, release_form, requires_prescription, base_price, manufacturer_id, category_id) VALUES ('Валериана', 'Таблетки', FALSE, 90, 4, 8);
INSERT INTO medicine (name, release_form, requires_prescription, base_price, manufacturer_id, category_id) VALUES ('Пустырник', 'Настойка', FALSE, 70, 4, 8);
INSERT INTO medicine (name, release_form, requires_prescription, base_price, manufacturer_id, category_id) VALUES ('Новопассит', 'Сироп', FALSE, 380, 8, 8);

-- ==========================================================================
-- Аптеки
-- ==========================================================================
INSERT INTO pharmacy (name, address, phone, working_hours) VALUES ('Аптека №1', 'ул. Ленина, 10', '+74951111111', '08:00-22:00');
INSERT INTO pharmacy (name, address, phone, working_hours) VALUES ('Аптека №2', 'ул. Мира, 25', '+74952222222', 'Круглосуточно');
INSERT INTO pharmacy (name, address, phone, working_hours) VALUES ('Аптека №3', 'пр. Победы, 5', '+74953333333', '09:00-21:00');
INSERT INTO pharmacy (name, address, phone, working_hours) VALUES ('Аптека Центральная', 'ул. Советская, 1', '+74954444444', '08:00-23:00');
INSERT INTO pharmacy (name, address, phone, working_hours) VALUES ('Аптека Здоровье', 'ул. Гагарина, 15', '+74955555555', '09:00-22:00');
INSERT INTO pharmacy (name, address, phone, working_hours) VALUES ('Аптека Вита', 'ул. Пушкина, 42', '+74956666666', 'Круглосуточно');
INSERT INTO pharmacy (name, address, phone, working_hours) VALUES ('Аптека Горздрав', 'ул. Чехова, 7', '+74957777777', '08:00-21:00');
INSERT INTO pharmacy (name, address, phone, working_hours) VALUES ('Аптека Ригла', 'пр. Мира, 100', '+74958888888', '09:00-22:00');

-- ==========================================================================
-- Наличие на складе
-- ==========================================================================
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (1, 4, 60, '2023-01-15', 291.20, 'B0004-01');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (1, 11, 73, '2023-02-20', 230.00, 'B0011-01');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (1, 18, 86, '2023-03-10', 111.60, 'B0018-01');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (1, 25, 99, '2023-04-05', 75.20, 'B0025-01');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (1, 32, 112, '2023-05-18', 266.00, 'B0032-01');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (1, 3, 125, '2023-06-22', 91.20, 'B0003-01');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (1, 10, 138, '2023-07-14', 368.60, 'B0010-01');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (1, 17, 151, '2023-08-30', 480.20, 'B0017-01');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (1, 24, 164, '2023-09-11', 148.50, 'B0024-01');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (1, 31, 177, '2023-10-15', 75.00, 'B0031-01');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (1, 2, 190, '2023-10-15', 151.50, 'B0002-01');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (1, 9, 63, '2023-11-03', 459.00, 'B0009-01');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (1, 16, 76, '2023-11-25', 185.40, 'B0016-01');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (1, 23, 89, '2023-12-08', 98.80, 'B0023-01');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (1, 30, 102, '2023-12-20', 367.50, 'B0030-01');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (1, 1, 115, '2023-01-15', 90.10, 'B0001-01');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (1, 8, 128, '2023-02-20', 192.60, 'B0008-01');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (1, 15, 141, '2023-03-10', 334.80, 'B0015-01');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (1, 22, 154, '2023-04-05', 228.90, 'B0022-01');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (1, 29, 167, '2023-05-18', 378.00, 'B0029-01');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (1, 36, 180, '2023-06-22', 345.80, 'B0036-01');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (1, 7, 193, '2023-07-14', 202.40, 'B0007-01');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (1, 14, 66, '2023-08-30', 390.60, 'B0014-01');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (1, 21, 79, '2023-09-11', 611.00, 'B0021-01');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (1, 28, 92, '2023-10-15', 228.00, 'B0028-01');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (2, 7, 11, '2023-10-15', 211.20, 'B0007-02');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (2, 14, 18, '2023-11-03', 407.40, 'B0014-02');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (2, 21, 25, '2023-11-25', 637.00, 'B0021-02');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (2, 28, 32, '2023-12-08', 237.60, 'B0028-02');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (2, 35, 39, '2023-12-20', 70.00, 'B0035-02');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (2, 6, 46, '2023-01-15', 282.80, 'B0006-02');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (2, 13, 53, '2023-02-20', 693.60, 'B0013-02');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (2, 20, 60, '2023-03-10', 298.70, 'B0020-02');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (2, 27, 67, '2023-04-05', 197.60, 'B0027-02');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (2, 34, 74, '2023-05-18', 94.50, 'B0034-02');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (2, 5, 81, '2023-06-22', 63.60, 'B0005-02');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (2, 12, 8, '2023-07-14', 556.40, 'B0012-02');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (2, 19, 15, '2023-08-30', 410.40, 'B0019-02');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (2, 26, 22, '2023-09-11', 305.20, 'B0026-02');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (2, 33, 29, '2023-10-15', 234.00, 'B0033-02');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (3, 10, 14, '2023-10-15', 345.80, 'B0010-03');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (3, 17, 21, '2023-11-03', 450.80, 'B0017-03');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (3, 24, 28, '2023-11-25', 139.50, 'B0024-03');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (3, 31, 35, '2023-12-08', 70.50, 'B0031-03');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (3, 2, 42, '2023-12-20', 142.50, 'B0002-03');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (3, 9, 49, '2023-01-15', 432.00, 'B0009-03');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (3, 16, 56, '2023-02-20', 174.60, 'B0016-03');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (3, 23, 63, '2023-03-10', 93.10, 'B0023-03');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (3, 30, 70, '2023-04-05', 346.50, 'B0030-03');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (3, 1, 77, '2023-05-18', 85.00, 'B0001-03');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (3, 8, 84, '2023-06-22', 181.80, 'B0008-03');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (3, 15, 11, '2023-07-14', 316.20, 'B0015-03');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (3, 22, 18, '2023-08-30', 216.30, 'B0022-03');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (3, 29, 25, '2023-09-11', 436.80, 'B0029-03');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (3, 36, 32, '2023-10-15', 399.00, 'B0036-03');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (4, 13, 17, '2023-10-15', 720.80, 'B0013-04');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (4, 20, 24, '2023-11-03', 310.30, 'B0020-04');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (4, 27, 31, '2023-11-25', 205.20, 'B0027-04');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (4, 34, 38, '2023-12-08', 98.10, 'B0034-04');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (4, 5, 45, '2023-12-20', 54.00, 'B0005-04');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (4, 12, 52, '2023-01-15', 473.20, 'B0012-04');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (4, 19, 59, '2023-02-20', 349.60, 'B0019-04');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (4, 26, 66, '2023-03-10', 260.40, 'B0026-04');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (4, 33, 73, '2023-04-05', 244.40, 'B0033-04');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (4, 4, 80, '2023-05-18', 304.00, 'B0004-04');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (4, 11, 7, '2023-06-22', 240.00, 'B0011-04');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (4, 18, 14, '2023-07-14', 116.40, 'B0018-04');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (4, 25, 21, '2023-08-30', 78.40, 'B0025-04');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (4, 32, 28, '2023-09-11', 277.20, 'B0032-04');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (4, 3, 35, '2023-10-15', 95.00, 'B0003-04');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (5, 16, 20, '2023-10-15', 181.80, 'B0016-05');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (5, 23, 27, '2023-11-03', 96.90, 'B0023-05');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (5, 30, 34, '2023-11-25', 360.50, 'B0030-05');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (5, 1, 41, '2023-12-08', 88.40, 'B0001-05');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (5, 8, 48, '2023-12-20', 189.00, 'B0008-05');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (5, 15, 55, '2023-01-15', 328.60, 'B0015-05');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (5, 22, 62, '2023-02-20', 224.70, 'B0022-05');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (5, 29, 69, '2023-03-10', 453.60, 'B0029-05');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (5, 36, 76, '2023-04-05', 414.20, 'B0036-05');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (5, 7, 83, '2023-05-18', 198.00, 'B0007-05');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (5, 14, 10, '2023-06-22', 382.20, 'B0014-05');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (5, 21, 17, '2023-07-14', 598.00, 'B0021-05');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (5, 28, 24, '2023-08-30', 223.20, 'B0028-05');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (5, 35, 31, '2023-09-11', 65.80, 'B0035-05');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (5, 6, 38, '2023-10-15', 266.00, 'B0006-05');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (6, 19, 23, '2023-10-15', 364.80, 'B0019-06');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (6, 26, 30, '2023-11-03', 271.60, 'B0026-06');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (6, 33, 37, '2023-11-25', 254.80, 'B0033-06');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (6, 4, 44, '2023-12-08', 316.80, 'B0004-06');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (6, 11, 51, '2023-12-20', 250.00, 'B0011-06');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (6, 18, 58, '2023-01-15', 121.20, 'B0018-06');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (6, 25, 65, '2023-02-20', 81.60, 'B0025-06');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (6, 32, 72, '2023-03-10', 288.40, 'B0032-06');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (6, 3, 79, '2023-04-05', 98.80, 'B0003-06');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (6, 10, 6, '2023-05-18', 399.00, 'B0010-06');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (6, 17, 13, '2023-06-22', 519.40, 'B0017-06');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (6, 24, 20, '2023-07-14', 160.50, 'B0024-06');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (6, 31, 27, '2023-08-30', 81.00, 'B0031-06');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (6, 2, 34, '2023-09-11', 163.50, 'B0002-06');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (6, 9, 41, '2023-10-15', 405.00, 'B0009-06');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (7, 22, 26, '2023-10-15', 191.10, 'B0022-07');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (7, 29, 33, '2023-11-03', 386.40, 'B0029-07');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (7, 36, 40, '2023-11-25', 353.40, 'B0036-07');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (7, 7, 47, '2023-12-08', 206.80, 'B0007-07');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (7, 14, 54, '2023-12-20', 399.00, 'B0014-07');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (7, 21, 61, '2023-01-15', 624.00, 'B0021-07');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (7, 28, 68, '2023-02-20', 232.80, 'B0028-07');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (7, 35, 75, '2023-03-10', 68.60, 'B0035-07');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (7, 6, 82, '2023-04-05', 277.20, 'B0006-07');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (7, 13, 9, '2023-05-18', 680.00, 'B0013-07');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (7, 20, 16, '2023-06-22', 292.90, 'B0020-07');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (7, 27, 23, '2023-07-14', 193.80, 'B0027-07');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (7, 34, 30, '2023-08-30', 92.70, 'B0034-07');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (7, 5, 37, '2023-09-11', 62.40, 'B0005-07');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (7, 12, 44, '2023-10-15', 546.00, 'B0012-07');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (8, 25, 29, '2023-10-15', 84.80, 'B0025-08');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (8, 32, 36, '2023-11-03', 299.60, 'B0032-08');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (8, 3, 43, '2023-11-25', 102.60, 'B0003-08');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (8, 10, 50, '2023-12-08', 414.20, 'B0010-08');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (8, 17, 57, '2023-12-20', 441.00, 'B0017-08');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (8, 24, 64, '2023-01-15', 136.50, 'B0024-08');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (8, 31, 71, '2023-02-20', 69.00, 'B0031-08');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (8, 2, 78, '2023-03-10', 139.50, 'B0002-08');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (8, 9, 5, '2023-04-05', 423.00, 'B0009-08');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (8, 16, 12, '2023-05-18', 171.00, 'B0016-08');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (8, 23, 19, '2023-06-22', 91.20, 'B0023-08');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (8, 30, 26, '2023-07-14', 339.50, 'B0030-08');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (8, 1, 33, '2023-08-30', 83.30, 'B0001-08');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (8, 8, 40, '2023-09-11', 178.20, 'B0008-08');
INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES (8, 15, 47, '2023-10-15', 310.00, 'B0015-08');

-- ==========================================================================
-- Проверка количества записей
-- ==========================================================================
SELECT 'manufacturers' AS table_name, COUNT(*) AS cnt FROM manufacturer
UNION ALL SELECT 'categories', COUNT(*) FROM category
UNION ALL SELECT 'medicines', COUNT(*) FROM medicine
UNION ALL SELECT 'pharmacies', COUNT(*) FROM pharmacy
UNION ALL SELECT 'stock', COUNT(*) FROM stock;

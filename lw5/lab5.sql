-- ==========================================================================
-- Лабораторная работа №5
-- Предметная область: Аптеки, лекарства, заказы
-- СУБД: PostgreSQL
-- ==========================================================================

-- Указать схему
SET search_path TO public;

-- ==========================================================================
-- 1. Добавить внешние ключи.
-- ==========================================================================

-- Дилер принадлежит компании
ALTER TABLE dealer 
    ADD CONSTRAINT fk_dealer_company 
    FOREIGN KEY (id_company) REFERENCES company(id_company);

-- Производство принадлежит компании
ALTER TABLE production 
    ADD CONSTRAINT fk_production_company 
    FOREIGN KEY (id_company) REFERENCES company(id_company);

-- Производство выпускает конкретное лекарство
ALTER TABLE production 
    ADD CONSTRAINT fk_production_medicine 
    FOREIGN KEY (id_medicine) REFERENCES medicine(id_medicine);

-- Заказ ссылается на производство, дилера и аптеку
ALTER TABLE "order" 
    ADD CONSTRAINT fk_order_production 
    FOREIGN KEY (id_production) REFERENCES production(id_production);

ALTER TABLE "order" 
    ADD CONSTRAINT fk_order_dealer 
    FOREIGN KEY (id_dealer) REFERENCES dealer(id_dealer);

ALTER TABLE "order" 
    ADD CONSTRAINT fk_order_pharmacy 
    FOREIGN KEY (id_pharmacy) REFERENCES pharmacy(id_pharmacy);


-- ==========================================================================
-- 2. Выдать информацию по всем заказам лекарствам "Кордерон" компании 
--    "Аргус" с указанием названий аптек, дат, объема заказов.
-- ==========================================================================

SELECT 
    ph.name AS pharmacy_name,
    o.date,
    o.quantity
FROM "order" o
JOIN production pr ON o.id_production = pr.id_production
JOIN medicine m    ON pr.id_medicine = m.id_medicine
JOIN company c     ON pr.id_company = c.id_company
JOIN pharmacy ph   ON o.id_pharmacy = ph.id_pharmacy
WHERE m.name = 'Кордерон' 
  AND c.name = 'Аргус';


-- ==========================================================================
-- 3. Дать список лекарств компании "Фарма", на которые не были сделаны 
--    заказы до 25 января.
-- ==========================================================================

SELECT DISTINCT m.name AS medicine_name
FROM medicine m
JOIN production pr ON m.id_medicine = pr.id_medicine
JOIN company c     ON pr.id_company = c.id_company
WHERE c.name = 'Фарма'
  AND m.id_medicine NOT IN (
      SELECT pr2.id_medicine
      FROM "order" o
      JOIN production pr2 ON o.id_production = pr2.id_production
      WHERE o.date < '2019-01-25'
  );


-- ==========================================================================
-- 4. Дать минимальный и максимальный баллы лекарств каждой фирмы, которая 
--    оформила не менее 120 заказов.
-- ==========================================================================

SELECT 
    c.name AS company_name,
    MIN(pr.rating) AS min_rating,
    MAX(pr.rating) AS max_rating
FROM company c
JOIN production pr ON c.id_company = pr.id_company
JOIN "order" o     ON pr.id_production = o.id_production
GROUP BY c.id_company, c.name
HAVING COUNT(o.id_order) >= 120;


-- ==========================================================================
-- 5. Дать списки сделавших заказы аптек по всем дилерам компании 
--    "AstraZeneca". Если у дилера нет заказов, в названии аптеки 
--    проставить NULL.
-- ==========================================================================

SELECT DISTINCT
    d.name AS dealer_name,
    ph.name AS pharmacy_name
FROM dealer d
LEFT JOIN "order" o  ON d.id_dealer = o.id_dealer
LEFT JOIN pharmacy ph ON o.id_pharmacy = ph.id_pharmacy
WHERE d.id_company = (
    SELECT id_company FROM company WHERE name = 'AstraZeneca'
)
ORDER BY d.name, ph.name;


-- ==========================================================================
-- 6. Уменьшить на 20% стоимость всех лекарств, если она превышает 3000, 
--    а длительность лечения не более 7 дней.
-- ==========================================================================

UPDATE production pr
SET price = pr.price * 0.8
FROM medicine m
WHERE pr.id_medicine = m.id_medicine
  AND pr.price > '3000'::money
  AND m.cure_duration <= 7;


-- ==========================================================================
-- 7. Добавить необходимые индексы.
-- ==========================================================================

-- Индексы для внешних ключей
CREATE INDEX idx_dealer_id_company      ON dealer(id_company);
CREATE INDEX idx_production_id_company  ON production(id_company);
CREATE INDEX idx_production_id_medicine ON production(id_medicine);
CREATE INDEX idx_order_id_production    ON "order"(id_production);
CREATE INDEX idx_order_id_dealer        ON "order"(id_dealer);
CREATE INDEX idx_order_id_pharmacy      ON "order"(id_pharmacy);

-- Индексы для полей, часто используемых в WHERE и JOIN
CREATE INDEX idx_company_name    ON company(name);
CREATE INDEX idx_medicine_name   ON medicine(name);
CREATE INDEX idx_pharmacy_name   ON pharmacy(name);
CREATE INDEX idx_order_date      ON "order"(date);

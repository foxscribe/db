--- Аптеки, лекрства, наличие лекрств в аптеках

CREATE TABLE manufacturer (
    id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    country VARCHAR(50),
    phone VARCHAR(20),
    license_number VARCHAR(50)
);

CREATE TABLE category (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    tax_rate DECIMAL(5, 2),
    is_active BOOLEAN DEFAULT TRUE
);

CREATE TABLE medicine (
    id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    release_form VARCHAR(50),
    requires_prescription BOOLEAN DEFAULT FALSE,
    base_price DECIMAL(10, 2),
    manufacturer_id INT REFERENCES manufacturer(id),
    category_id INT REFERENCES category(id)
);

CREATE TABLE pharmacy (
    id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    address TEXT,
    phone VARCHAR(20),
    working_hours VARCHAR(50)
);

CREATE TABLE stock (
    id SERIAL PRIMARY KEY,
    pharmacy_id INT REFERENCES pharmacy(id),
    medicine_id INT REFERENCES medicine(id),
    quantity INT NOT NULL,
    arrival_date DATE,
    local_price DECIMAL(10, 2),
    batch_number VARCHAR(50),
    UNIQUE(pharmacy_id, medicine_id)
);

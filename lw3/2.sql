--- Компьютеры, железо, комплектация

CREATE TABLE brand (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(50),
    website VARCHAR(150),
    founded_year INT
);

CREATE TABLE component_type (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    icon_url VARCHAR(255),
    is_active BOOLEAN DEFAULT TRUE
);

CREATE TABLE hardware (
    id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    specs TEXT,
    price DECIMAL(10, 2),
    warranty_months INT,
    brand_id INT REFERENCES brand(id),
    type_id INT REFERENCES component_type(id)
);

CREATE TABLE computer (
    id SERIAL PRIMARY KEY,
    model_name VARCHAR(150) NOT NULL,
    release_year INT,
    price DECIMAL(10, 2),
    description TEXT
);

CREATE TABLE configuration (
    id SERIAL PRIMARY KEY,
    computer_id INT REFERENCES computer(id),
    hardware_id INT REFERENCES hardware(id),
    quantity INT NOT NULL DEFAULT 1,
    install_date DATE,
    notes TEXT,
    discount DECIMAL(5, 2),
    UNIQUE(computer_id, hardware_id)
);

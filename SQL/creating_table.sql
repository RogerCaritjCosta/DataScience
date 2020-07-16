CREATE DATABASE IF NOT EXISTS sales;
USE sales;

CREATE TABLE IF NOT EXISTS customers (
    customer_id INT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255),
    number_of_complaints INT DEFAULT 0,
    PRIMARY KEY (customer_id)
);
-- Create and remove unique keys
ALTER TABLE customers
ADD UNIQUE KEY(email_address);
ALTER TABLE customers
DROP INDEX email_address;
-- Add columns to an specific position
ALTER TABLE customers
ADD COLUMN gender ENUM('M', 'F') AFTER last_name;

CREATE TABLE IF NOT EXISTS sales (
    purchase_number INT NOT NULL AUTO_INCREMENT,
    date_of_purchase DATE NOT NULL,
    customer_id INT,
    item_code VARCHAR(10) NOT NULL,
    PRIMARY KEY (purchase_number)
);
-- Link tables using foreign keys
ALTER TABLE sales 
ADD FOREIGN KEY(customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE;

CREATE TABLE IF NOT EXISTS items (
    item_id VARCHAR(255),
    item VARCHAR(255),
    unit_price NUMERIC(10 , 2 ),
    company­_id VARCHAR(255),
    PRIMARY KEY (item_id)
);

CREATE TABLE IF NOT EXISTS companies (
    company_id VARCHAR(255),
    company_name VARCHAR(255) DEFAULT 'X',
    headquarters_phone_number INT(12),
    PRIMARY KEY (company_id)
);
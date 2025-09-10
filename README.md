**MY SQL QUERY :**
-- Drop and recreate the database
DROP DATABASE IF EXISTS capstone;
CREATE DATABASE capstone;
USE capstone;

-- =========================
-- 1. Customers Table
-- =========================
CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- Sample Data
INSERT INTO customers (username, email, password) VALUES
('JohnDoe', 'johndoe@example.com', 'password123'),
('JaneSmith', 'janesmith@example.com', 'securePass456');

-- =========================
-- 2. Admins Table
-- =========================
CREATE TABLE admins (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- Sample Data
INSERT INTO admins (username, email, password) VALUES
('AdminOne', 'adminone@example.com', 'adminPass123'),
('AdminTwo', 'admintwo@example.com', 'secureAdmin456');

-- =========================
-- 3. Menu Items Table
-- =========================
CREATE TABLE menu_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    category VARCHAR(255) NOT NULL,
    price INT NOT NULL,
    quantity INT NOT NULL DEFAULT 0
);

-- Sample Data
INSERT INTO menu_items (name, category, price, quantity) VALUES
('Margherita', 'Pizza', 199, 10),
('Pepperoni', 'Pizza', 205, 15),
('Cheese Sticks', 'Sides', 189, 20),
('Garlic Bread', 'Sides', 170, 25),
('Coca-Cola', 'Beverages', 100, 50),
('Pepsi', 'Beverages', 100, 50),
('Veggie Supreme', 'Pizza', 149, 12),
('BBQ Chicken', 'Pizza', 499, 8),
('Mozzarella Sticks', 'Sides', 249, 18),
('Lemonade', 'Beverages', 110, 30);

-- =========================
-- 4. Cart Table
-- =========================
CREATE TABLE cart (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    menu_item_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE,
    FOREIGN KEY (menu_item_id) REFERENCES menu_items(id) ON DELETE CASCADE
);

-- =========================
-- 5. Orders Table
-- =========================
CREATE TABLE orders (
    order_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    order_status VARCHAR(50) DEFAULT 'Pending',
    payment_status VARCHAR(50) DEFAULT 'Unpaid',
    FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE
);

-- =========================
-- 6. Payments Table
-- =========================
CREATE TABLE payments (
    payment_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    order_id BIGINT NOT NULL,
    amount DOUBLE NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    payment_status VARCHAR(20) DEFAULT 'Pending',
    transaction_id VARCHAR(100),
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE
);

ALTER TABLE orders
ADD COLUMN mode_of_delivery VARCHAR(50);



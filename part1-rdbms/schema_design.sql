-- Customers Table
CREATE TABLE customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50)
);

-- Orders Table
CREATE TABLE orders (
    order_id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10),
    order_date DATE,
    status VARCHAR(20),
    total_amount INT,
    num_items INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Sample Data (based on dataset)
INSERT INTO customers VALUES
('CUST028', 'Customer 28', 'Mumbai'),
('CUST032', 'Customer 32', 'Delhi'),
('CUST037', 'Customer 37', 'Bangalore'),
('CUST003', 'Customer 3', 'Mumbai'),
('CUST012', 'Customer 12', 'Pune');

INSERT INTO orders VALUES
('ORD2001', 'CUST028', '2023-05-20', 'delivered', 2397, 1),
('ORD2002', 'CUST032', '2023-08-22', 'delivered', 6197, 3),
('ORD2003', 'CUST037', '2023-12-12', 'delivered', 9897, 1),
('ORD2004', 'CUST003', '2023-01-07', 'shipped', 5596, 2),
('ORD2005', 'CUST012', '2023-01-19', 'processing', 15792, 4);

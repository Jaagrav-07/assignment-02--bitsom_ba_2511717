-- Dimension: Date
CREATE TABLE dim_date (
    date_id DATE PRIMARY KEY,
    year INT,
    month INT,
    day INT
);

-- Dimension: Store
CREATE TABLE dim_store (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100),
    city VARCHAR(50)
);

-- Dimension: Product
CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50)
);

-- Fact Table
CREATE TABLE fact_sales (
    sale_id INT PRIMARY KEY,
    date_id DATE,
    store_id INT,
    product_id INT,
    quantity INT,
    revenue INT,
    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);

-- Sample Clean Data Inserts

INSERT INTO dim_date VALUES
('2023-01-01', 2023, 1, 1),
('2023-02-01', 2023, 2, 1),
('2023-03-01', 2023, 3, 1);

INSERT INTO dim_store VALUES
(1, 'Store A', 'Mumbai'),
(2, 'Store B', 'Delhi'),
(3, 'Store C', 'Bangalore');

INSERT INTO dim_product VALUES
(101, 'Laptop', 'Electronics'),
(102, 'Shirt', 'Clothing'),
(103, 'Milk', 'Groceries');

INSERT INTO fact_sales VALUES
(1, '2023-01-01', 1, 101, 2, 100000),
(2, '2023-01-01', 2, 102, 5, 5000),
(3, '2023-02-01', 1, 103, 10, 600),
(4, '2023-02-01', 3, 101, 1, 50000),
(5, '2023-03-01', 2, 103, 20, 1200),
(6, '2023-03-01', 3, 102, 3, 3000),
(7, '2023-01-01', 1, 102, 4, 4000),
(8, '2023-02-01', 2, 101, 2, 100000),
(9, '2023-03-01', 3, 103, 15, 900),
(10, '2023-01-01', 2, 103, 8, 480);

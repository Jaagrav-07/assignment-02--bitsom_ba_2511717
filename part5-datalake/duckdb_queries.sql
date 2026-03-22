-- Q1: List all customers along with total number of orders
SELECT 
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM read_csv_auto('datasets/customers.csv') c
LEFT JOIN read_json_auto('datasets/orders.json') o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;

--------------------------------------------------

-- Q2: Top 3 customers by total order value
SELECT 
    o.customer_id,
    SUM(o.total_amount) AS total_value
FROM read_json_auto('datasets/orders.json') o
GROUP BY o.customer_id
ORDER BY total_value DESC
LIMIT 3;

--------------------------------------------------

-- Q3: Products purchased by customers from Bangalore
SELECT DISTINCT p.product_name
FROM read_csv_auto('datasets/customers.csv') c
JOIN read_json_auto('datasets/orders.json') o
ON c.customer_id = o.customer_id
JOIN read_parquet('datasets/products.parquet') p
ON TRUE  -- assumed relation (dataset limitation)
WHERE c.city = 'Bangalore';

--------------------------------------------------

-- Q4: Join all files
SELECT 
    c.customer_name,
    o.order_date,
    p.product_name,
    o.num_items
FROM read_csv_auto('datasets/customers.csv') c
JOIN read_json_auto('datasets/orders.json') o
ON c.customer_id = o.customer_id
JOIN read_parquet('datasets/products.parquet') p
ON TRUE;

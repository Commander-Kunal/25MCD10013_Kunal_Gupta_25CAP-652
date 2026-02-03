CREATE TABLE customer_orders (
    order_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(50),
    product VARCHAR(50),
    quantity INT,
    price NUMERIC(10,2),
    order_date DATE
);

INSERT INTO customer_orders 
(customer_name, product, quantity, price, order_date)
VALUES
('Amit', 'Laptop', 1, 55000, '2024-01-10'),
('Riya', 'Laptop', 2, 54000, '2024-01-12'),
('Karan', 'Mobile', 3, 20000, '2024-01-15'),
('Sneha', 'Mobile', 1, 22000, '2024-01-16'),
('Rahul', 'Tablet', 2, 30000, '2024-01-18'),
('Pooja', 'Laptop', 1, 58000, '2024-01-20'),
('Ankit', 'Tablet', 3, 28000, '2024-01-22');

select * from customer_orders;
-- Step 2: 
SELECT *
FROM customer_orders
WHERE price > 30000;

-- Step 3: 
SELECT customer_name, product, price
FROM customer_orders
WHERE price > 20000
ORDER BY price ASC;

SELECT customer_name, product, price
FROM customer_orders
WHERE price > 20000
ORDER BY price DESC;

-- step 4: 
SELECT product,
       SUM(quantity * price) AS total_sales
FROM customer_orders
GROUP BY product;
-- Step 5:
SELECT product,
       SUM(quantity * price) AS total_sales
FROM customer_orders
GROUP BY product
HAVING SUM(quantity * price) > 100000;
-- Step 6: 
select product, sum(quantity*price) as total_revenue
from customer_orders
where order_date >= '2024-01-15'
group by product
having sum(quantity*price) > 50000;

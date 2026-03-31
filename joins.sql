-- Table 1: Customers
CREATE TABLE customers (
    customer_id INTEGER,
    name TEXT,
    city TEXT
);

INSERT INTO customers VALUES
(1, 'Ali', 'Lahore'),
(2, 'Ahmed', 'Karachi'),
(3, 'Sara', 'Islamabad'),
(4, 'Zain', 'Lahore'),
(5, 'Hina', 'Karachi');


-- Table 2: Orders
CREATE TABLE orders (
    order_id INTEGER,
    customer_id INTEGER,
    product TEXT,
    amount INTEGER
);


INSERT INTO orders VALUES
(101, 1, 'Laptop', 800),
(102, 2, 'Phone', 500),
(103, 1, 'Headphones', 50),
(104, 3, 'Shoes', 100);

-- INNER JOIN (combine customers + orders)

SELECT customers.name, orders.product, orders.amount
FROM customers
INNER JOIN orders 
ON customers.customer_id = orders.customer_id;

-- LEFT JOIN (shows all customers even without orders)

SELECT customers.name, orders.product
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id;

-- Total spending per customer
SELECT customers.name, SUM(orders.amount) AS total_spent
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id
GROUP BY customers.name;

-- Top customer
SELECT customers.name, SUM(orders.amount) AS total_spent
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id
GROUP BY customers.name
ORDER BY total_spent DESC
LIMIT 1;

-- Customer with no order
SELECT customers.name
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id
WHERE orders.order_id IS NULL;

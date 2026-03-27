-- Insert Sample Data
INSERT INTO users VALUES (1, 'Neetu', 'neetu@email.com', 'Noida');
INSERT INTO users VALUES (2, 'Ravi', 'ravi@email.com', 'Delhi');

INSERT INTO products VALUES (1, 'Laptop', 50000, 10);
INSERT INTO products VALUES (2, 'Mobile', 20000, 20);

INSERT INTO orders VALUES (1, 1, '2025-01-01');
INSERT INTO orders VALUES (2, 2, '2025-01-02');

INSERT INTO order_details VALUES (1, 1, 1);
INSERT INTO order_details VALUES (2, 2, 2);

-- Query 1: Total orders per user
SELECT users.name, COUNT(orders.order_id) AS total_orders
FROM users
JOIN orders ON users.user_id = orders.user_id
GROUP BY users.name;

-- Query 2: Most sold product
SELECT product_id, SUM(quantity) AS total_sold
FROM order_details
GROUP BY product_id
ORDER BY total_sold DESC;

-- Query 3: Total revenue
SELECT SUM(products.price * order_details.quantity) AS total_revenue
FROM order_details
JOIN products ON order_details.product_id = products.product_id;

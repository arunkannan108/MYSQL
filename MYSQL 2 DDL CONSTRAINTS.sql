-- Create database
CREATE DATABASE Sales;

-- Use the Sales database
USE Sales;

-- Create Orders table with constraints
CREATE TABLE Orders (
    Order_Id INT PRIMARY KEY,
    Customer_name VARCHAR(50) NOT NULL,
    Product_Category VARCHAR(30) NOT NULL,
    Ordered_item VARCHAR(50) UNIQUE NOT NULL,
    Contact_No VARCHAR(15) NOT NULL
);

-- 1. Add order_quantity column
ALTER TABLE Orders
ADD COLUMN order_quantity INT NOT NULL DEFAULT 1;

-- 2. Rename table to sales_orders
RENAME TABLE Orders TO sales_orders;

-- 3. Insert 10 rows
INSERT INTO sales_orders VALUES
(1, 'John Smith', 'Electronics', 'Laptop', '555-0101', 2),
(2, 'Emma Davis', 'Books', 'Python Programming Guide', '555-0102', 1),
(3, 'Michael Brown', 'Electronics', 'Smartphone', '555-0103', 3),
(4, 'Sarah Wilson', 'Clothing', 'Winter Jacket', '555-0104', 1),
(5, 'James Johnson', 'Sports', 'Tennis Racket', '555-0105', 2),
(6, 'Lisa Anderson', 'Electronics', 'Headphones', '555-0106', 1),
(7, 'Robert Miller', 'Books', 'Data Science Handbook', '555-0107', 4),
(8, 'Emily White', 'Clothing', 'Running Shoes', '555-0108', 1),
(9, 'David Taylor', 'Sports', 'Basketball', '555-0109', 2),
(10, 'Jennifer Lee', 'Electronics', 'Smart Watch', '555-0110', 1);

-- 4. Retrieve customer_name and Ordered_Item
SELECT Customer_name, Ordered_item 
FROM sales_orders;

-- 5. Update product name for a specific row
UPDATE sales_orders 
SET Ordered_item = 'Gaming Laptop'
WHERE Order_Id = 1;

-- Verify the update
SELECT * FROM sales_orders 
WHERE Order_Id = 1;

-- 6. Delete the table
DROP TABLE sales_orders;

-- Query 1: Customer Information with Total Number of Orders
SELECT 
    Customers.*, -- Replace with specific columns if needed
    COUNT(Orders.order_id) AS total_orders
FROM 
    Customers
JOIN 
    Orders ON Customers.customer_id = Orders.customer_id
GROUP BY 
    Customers.customer_id
ORDER BY 
    total_orders DESC;

-- Query 2: Product Name, Quantity, and Total Amount for Each Order Item
SELECT 
    Products.product_name, 
    OrderItems.quantity, 
    (OrderItems.quantity * OrderItems.unit_price) AS total_amount
FROM 
    OrderItems
JOIN 
    Products ON OrderItems.product_id = Products.product_id
ORDER BY 
    OrderItems.order_id ASC;

-- Query 3: Total Revenue by Product Category
SELECT 
    Categories.category_name, 
    SUM(OrderItems.quantity * OrderItems.unit_price) AS total_revenue
FROM 
    Categories
JOIN 
    Products ON Categories.category_id = Products.category_id
JOIN 
    OrderItems ON Products.product_id = OrderItems.product_id
GROUP BY 
    Categories.category_name
ORDER BY 
    total_revenue DESC;

-- Query 4: Top 5 Customers by Total Purchase Amount
SELECT 
    Customers.customer_name, 
    SUM(OrderItems.quantity * OrderItems.unit_price) AS total_purchase
FROM 
    Customers
JOIN 
    Orders ON Customers.customer_id = Orders.customer_id
JOIN 
    OrderItems ON Orders.order_id = OrderItems.order_id
GROUP BY 
    Customers.customer_id
ORDER BY 
    total_purchase DESC
LIMIT 5;

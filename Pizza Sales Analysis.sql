SELECT 
    *
FROM
    pizza_sales;

# Total Revenue
SELECT 
    SUM(total_price) AS Total_Revenue
FROM
    pizza_sales;

# Average Order Value
SELECT 
    (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value
FROM
    pizza_sales;

# Total Pizzas Sold
SELECT 
    SUM(quantity) AS Total_pizza_sold
FROM
    pizza_sales;

# Total Orders
SELECT 
    COUNT(DISTINCT order_id) AS Total_Orders
FROM
    pizza_sales;

# Average Pizzas Per Order
SELECT 
    CAST(CAST(SUM(quantity) AS DECIMAL (10 , 2 )) / CAST(COUNT(DISTINCT order_id) AS DECIMAL (10 , 2 ))
        AS DECIMAL (10 , 2 )) AS Avg_Pizzas_per_order
FROM
    pizza_sales;

# Daily Trend for Total Orders
SELECT 
    DATE_FORMAT(STR_TO_DATE(order_date, '%d-%m-%Y'),
            '%W') AS order_day,
    COUNT(DISTINCT order_id) AS total_orders
FROM
    pizza_sales
GROUP BY order_day;

# Monthly Trend for Orders
SELECT 
    DATE_FORMAT(STR_TO_DATE(order_date, '%d-%m-%Y'),
            '%M') AS Month_Name,
    COUNT(DISTINCT order_id) AS Total_Orders
FROM
    pizza_sales
GROUP BY Month_Name
ORDER BY Total_Orders DESC;

# % of Sales by Pizza Category
SELECT 
    pizza_category,
    CAST(SUM(total_price) AS DECIMAL (10 , 2 )) AS total_revenue,
    CAST(SUM(total_price) * 100 / (SELECT 
                SUM(total_price)
            FROM
                pizza_sales)
        AS DECIMAL (10 , 2 )) AS PCT
FROM
    pizza_sales
GROUP BY pizza_category;

# % of Sales by Pizza Size
SELECT 
    pizza_size,
    CAST(SUM(total_price) AS DECIMAL (10 , 2 )) AS total_revenue,
    CAST(SUM(total_price) * 100 / (SELECT 
                SUM(total_price)
            FROM
                pizza_sales)
        AS DECIMAL (10 , 2 )) AS PCT
FROM
    pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size;

# Total Pizzas Sold by Pizza Category
SELECT 
    pizza_category, SUM(quantity) AS Total_Quantity_Sold
FROM
    pizza_sales
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC;

# Top 5 Pizzas by Revenue
SELECT 
    pizza_name, SUM(total_price) AS Total_Revenue
FROM
    pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC
LIMIT 5;

# Bottom 5 Pizzas by Revenue
SELECT 
    pizza_name, SUM(total_price) AS Total_Revenue
FROM
    pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC
LIMIT 5;

# Top 5 Pizzas by Quantity
SELECT 
    pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM
    pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC
LIMIT 5;

# Bottom 5 Pizzas by Quantity
SELECT 
    pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM
    pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC
LIMIT 5;

# Top 5 Pizzas by Total Orders
SELECT 
    pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM
    pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC
LIMIT 5;

# Bottom 5 Pizzas by Total Orders
SELECT 
    pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM
    pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC
LIMIT 5;

# Top 5 Classic Pizzas by Total Orders
SELECT 
    pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM
    pizza_sales
WHERE
    pizza_category = 'Classic'
GROUP BY pizza_name
ORDER BY Total_Orders DESC
LIMIT 5;

# Bottom 5 Classic Pizzas by Total Orders
SELECT 
    pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM
    pizza_sales
WHERE
    pizza_category = 'Classic'
GROUP BY pizza_name
ORDER BY Total_Orders ASC
LIMIT 5;
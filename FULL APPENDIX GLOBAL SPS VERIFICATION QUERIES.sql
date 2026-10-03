USE SUPERSTORES

APPENDIX_VERIFICATION

CUSTOMER_ID_UNIQUENESS 

SELECT Customer_ID, COUNT(DISTINCT Customer_Name) AS name_variations
FROM customers
GROUP BY Customer_ID
HAVING COUNT(DISTINCT Customer_Name) > 1;

PRODUCT_ID_DETECTION

SELECT Product_ID, COUNT(*) AS row_count
FROM products
GROUP BY Product_ID
HAVING COUNT(*) > 1
ORDER by row_count desc;

 SELECT * FROM products
WHERE Product_ID IN (SELECT Product_ID FROM products
    GROUP BY Product_ID
    HAVING COUNT(*) > 1)
ORDER BY Product_ID;

SELECT COUNT(*) AS affected_rows
FROM orders
JOIN(SELECT Product_ID FROM products
GROUP BY Product_ID
 HAVING COUNT(*) > 1) d on orders.product_id= d.product_id;

ORDER_ID_DETECTION

SELECT Order_ID, COUNT(DISTINCT Customer_ID) AS customer_variations
FROM orders
GROUP BY Order_ID
HAVING COUNT(DISTINCT Customer_ID) > 1;

SELECT Order_ID, COUNT(DISTINCT Order_Date) AS date_variations
FROM orders
GROUP BY Order_ID
HAVING COUNT(DISTINCT Order_Date) > 1;

SELECT Order_ID,
COUNT(DISTINCT Customer_ID) AS customer_variations,
COUNT(DISTINCT Order_Date) AS date_variations
FROM orders
GROUP BY Order_ID
HAVING COUNT(DISTINCT Customer_ID) > 1
OR COUNT(DISTINCT Order_Date)> 1;

select *
FROM orders
JOIN (SELECT Order_ID
FROM orders
GROUP BY Order_ID
HAVING COUNT(DISTINCT Customer_ID) > 1
OR COUNT(DISTINCT Order_Date) > 1) flagged ON orders.Order_ID = flagged.Order_ID;

CUSTOMER_NAME_COLLISSION_CHECK

SELECT Customer_Name, COUNT(DISTINCT Customer_ID) AS id_count
FROM customers
GROUP BY Customer_Name
HAVING COUNT(DISTINCT Customer_ID) > 1
ORDER BY id_count DESC;

PRODUCT_CLEAN_CREATION_AND_VERIFICATION

CREATE TABLE product_clean AS
SELECT Product_ID, MIN(Product_Name) AS Product_Name,
MIN(Category) AS Category, MIN(Sub_Category) AS Sub_Category
FROM products
GROUP BY Product_ID;

SELECT Product_ID, COUNT(*) FROM product_clean
GROUP BY Product_ID HAVING COUNT(*) > 1;

APPENDIX_B_VALIDATION_QUERIES
SELECT
    (SUM(Discount * Profit) - SUM(Discount) * SUM(Profit) / COUNT(*))
    / (STDDEV(Discount) * STDDEV(Profit) * (COUNT(*) - 1)) AS discount_profit_correlation
FROM orders;

SELECT AVG(Discount) AS avg_discount,
MIN(Discount) AS min_discount,
MAX(Discount) AS max_discount
FROM orderS;

SELECT product_clean.Sub_Category,
AVG(orders.Discount) AS avg_discount
FROM orderS
JOIN product_clean ON orders.Product_ID = product_clean.Product_ID
GROUP BY product_clean.Sub_Category
ORDER BY avg_discount DESC;

select product_clean.Sub_Category,
SUM(orders.Sales)  AS total_sales,
SUM(orders.Profit) AS total_profit,
AVG(orders.Discount) AS avg_discount
FROM orders
JOIN product_clean ON orders.Product_ID = product_clean.Product_ID
GROUP BY product_clean.Sub_Category
ORDER BY total_profit ASC;

APPENDIX_C_LOGISTICS_VALIDATION_QUERIES

SELECT Year, COUNT(DISTINCT Order_ID) AS total_orders
FROM orders
GROUP BY Year
ORDER BY Year;

SELECT Ship_Mode,
COUNT(*) AS orders,
AVG(DATEDIFF(Ship_Date, Order_Date)) AS avg_delivery_days,
AVG(Shipping_Cost) AS avg_shipping_cost
FROM orders
GROUP BY Ship_Mode
ORDER BY orders DESC;

SELECT Order_Priority,
COUNT(*) AS orders,
AVG(DATEDIFF(Ship_Date, Order_Date)) AS avg_delivery_days
FROM order_table
GROUP BY Order_Priority;


SELECT Ship_Mode, COUNT(*) AS orders
FROM order_table
WHERE Order_Priority = 'Critical'
GROUP BY Ship_Mode
ORDER BY orders DESC;

APPENDIX_D_LOCATIONS_CLEAN_VALIDATION_QUERIES

SELECT customers.customer_id, customers.customer_name,
       locations.state, locations.region, SUM(sales) AS total_sales
FROM orders
JOIN customers ON customers.customer_id = orders.customer_id
JOIN locations ON locations.state = orders.state
GROUP BY customers.customer_id, customers.customer_name,
         locations.state, locations.region
ORDER BY total_sales DESC
LIMIT 50;

SELECT State, COUNT(DISTINCT City) AS city_count
FROM locations
GROUP BY State
ORDER BY city_count DESC;

CREATE TABLE locations_clean AS
SELECT State, MIN(Region) AS Region
FROM locations
GROUP BY State;

SELECT State, COUNT(*)
FROM locations_clean
GROUP BY State
HAVING COUNT(*) > 1;

SELECT COUNT(DISTINCT BINARY State) AS total_distinct_states
FROM orders;

SELECT customers.Customer_ID, customers.Customer_Name, locations_clean.State, locations_clean.Region, SUM(Sales) AS total_sales
FROM orders 
JOIN customers ON customers.customer_id = orders.customer_id
JOIN locations_clean ON locations_clean.State = orders.State
GROUP BY customers.Customer_ID, customers.Customer_Name, locations_clean.State, locations_clean.Region
ORDER BY total_sales DESC
LIMIT 50;







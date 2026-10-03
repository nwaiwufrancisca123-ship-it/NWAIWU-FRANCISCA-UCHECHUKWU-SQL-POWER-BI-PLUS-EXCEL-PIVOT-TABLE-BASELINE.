USE SUPERSTORES

--- Q1
select count(distinct customer_id) as total_unique_customers, sum(sales) as total_global_revenue
from orders;

--- Q2
select avg(sales) AS ORDER_VALUE, avg(profit) AS AVERAGE_PROFIT_PER_TRANSACTION
from orders
group by order_id;

--- Q3
select count(*) as transactions_above_average_saies
from orders
where sales>(select avg(sales) from orders);

--- Q4
SELECT 	Customers.Customer_Name, COUNT(DISTINCT Orders.Order_ID) AS Distinct_Orders
FROM Customers
JOIN Orders ON Customers.Customer_ID = Orders.Customer_ID
GROUP BY Customers.Customer_ID, Customers.Customer_Name
HAVING COUNT(DISTINCT Orders.Order_ID) > 5
ORDER BY Distinct_Orders DESC;

--- Q5
select customers.customer_id, customers.customer_name, sum(profit) as total_profit
from customers
join orders on customers.customer_id = orders.customer_id
group by customers.customer_id, customers.customer_name
order by total_profit desc
limit 10;

--- Q6
select customers. customer_id, customers. customer_name, locations_clean.state, locations_clean.region, sum(sales) as total_sales
from orders 
join customers on customers. customer_id= orders. customer_id 
join locations_clean on locations_clean.state = orders.state
group by customers. customer_id, customer_name, locations_clean.state, locations_clean.region
order by total_sales desc
limit 50;

--- Q7
select ship_mode, count(*) as total_uses, avg(datediff(ship_date, order_date)) as average_delivery_days
from orders
group by ship_mode
order by total_uses desc;

--- Q8
select discount, avg(profit), sum(sales) as total_sales
from orders
group by discount
order by discount;

--- Q9
select product_clean.sub_category, sum(orders.sales) as total_sales, sum(orders.profit) as total_profit
from product_clean
join orders on product_Clean.product_id = orders. product_id
group by product_clean.sub_category
having sum(orders.sales) > 100000 and sum(orders.profit) <0;

--- Q10
    SELECT 
    customers.Segment,
    product_clean.Category,
    'failed' as order_status_proxy,
    SUM(orders.Profit) AS total_profit
FROM orders
JOIN product_clean ON orders.Product_ID = product_clean.Product_ID
JOIN customers ON orders.Customer_ID = customers.Customer_ID
JOIN (SELECT Ship_Mode, AVG(DATEDIFF(Ship_Date, Order_Date)) AS avg_days
    FROM orders
    GROUP BY Ship_Mode)
 avg_by_mode ON orders.Ship_Mode = avg_by_mode.Ship_Mode
WHERE DATEDIFF(orders.Ship_Date, orders.Order_Date) > avg_by_mode.avg_days * 2
GROUP BY customers.Segment, product_clean.Category
ORDER BY total_profit ASC
LIMIT 10;









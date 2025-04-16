# use elevate_labs;


-- 1. Monthly Revenue & Order Volume
SELECT 
  YEAR(order_date) AS year,
  MONTH(order_date) AS month,
  SUM(amount) AS total_revenue,
  COUNT(DISTINCT order_id) AS total_orders
FROM online_sales_orders
GROUP BY year, month
ORDER BY year, month;

-- 2. Total Revenue by Year
SELECT 
  YEAR(order_date) AS year,
  SUM(amount) AS yearly_revenue
FROM online_sales_orders
GROUP BY year
ORDER BY year;

-- 3. Total Orders by Year
SELECT 
  YEAR(order_date) AS year,
  COUNT(DISTINCT order_id) AS yearly_orders
FROM online_sales_orders
GROUP BY year
ORDER BY year;

-- 4. Monthly Average Order Value (AOV)
SELECT 
  YEAR(order_date) AS year,
  MONTH(order_date) AS month,
  SUM(amount) / COUNT(DISTINCT order_id) AS avg_order_value
FROM online_sales_orders
GROUP BY year, month
ORDER BY year, month;

-- 5. Top 5 Revenue-Generating Months
SELECT 
  YEAR(order_date) AS year,
  MONTH(order_date) AS month,
  SUM(amount) AS total_revenue
FROM online_sales_orders
GROUP BY year, month
ORDER BY total_revenue DESC
LIMIT 5;

-- 6. Order Count per Product (Top 10)
SELECT 
  product_id,
  COUNT(DISTINCT order_id) AS order_count,
  SUM(amount) AS revenue_generated
FROM online_sales_orders
GROUP BY product_id
ORDER BY order_count DESC
LIMIT 10;

-- 7. Monthly Revenue for 2023
SELECT 
  MONTH(order_date) AS month,
  SUM(amount) AS revenue_2023,
  COUNT(DISTINCT order_id) AS order_count_2023
FROM online_sales_orders
WHERE YEAR(order_date) = 2023
GROUP BY month
ORDER BY month;


-- 8. Products Generating Most Revenue (Top 10)
SELECT 
  product_id,
  SUM(amount) AS total_revenue
FROM online_sales_orders
GROUP BY product_id
ORDER BY total_revenue DESC
LIMIT 10;

-- 9. Identify Low-Performing Months (Orders < 1000)
SELECT 
  YEAR(order_date) AS year,
  MONTH(order_date) AS month,
  COUNT(DISTINCT order_id) AS total_orders
FROM online_sales_orders
GROUP BY year, month
HAVING total_orders < 1000
ORDER BY year, month;

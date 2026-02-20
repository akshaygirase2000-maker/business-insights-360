
-- Total Revenue
SELECT SUM(revenue) AS total_revenue FROM fact_sales;

-- Revenue by Region
SELECT c.region, SUM(s.revenue) AS revenue
FROM fact_sales s
JOIN dim_customers c ON s.customer_id = c.customer_id
GROUP BY c.region;

-- Profit by Category
SELECT p.category, SUM(s.profit) AS total_profit
FROM fact_sales s
JOIN dim_products p ON s.product_id = p.product_id
GROUP BY p.category;

-- Monthly Revenue Trend
SELECT d.year, d.month, SUM(s.revenue) AS monthly_revenue
FROM fact_sales s
JOIN dim_date d ON s.date = d.date
GROUP BY d.year, d.month
ORDER BY d.year, d.month;


SELECT 
    YEAR(order_date) AS order_year,
    DATE_FORMAT(order_date, '%M') AS order_month,
    MONTH(order_date) AS month_number,
    COUNT(*) AS orders_per_month
FROM
    orders
GROUP BY YEAR(order_date) , MONTH(order_date) , DATE_FORMAT(order_date, '%M') , MONTH(order_date)
ORDER BY order_year , MONTH(order_date);
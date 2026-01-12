-- Order receive per day

SELECT 
    order_date, COUNT(*) AS orders_per_day
FROM
    orders
GROUP BY order_date
ORDER BY order_date;
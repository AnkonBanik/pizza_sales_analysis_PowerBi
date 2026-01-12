SELECT 
    DAYNAME(order_date) AS Weekday,
    CASE DAYNAME(order_date)
        WHEN 'Monday' THEN 1
        WHEN 'Tuesday' THEN 2
        WHEN 'Wednesday' THEN 3
        WHEN 'Thursday' THEN 4
        WHEN 'Friday' THEN 5
        WHEN 'Saturday' THEN 6
        WHEN 'Sunday' THEN 7
    END AS weekday_number,
    COUNT(DISTINCT order_id) AS Orders
FROM 
    orders
GROUP BY 
    DAYNAME(order_date),
    weekday_number
ORDER BY 
    weekday_number;
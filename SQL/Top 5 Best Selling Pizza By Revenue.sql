SELECT 
    pt.name AS pizza_name,
    ROUND(SUM(od.quantity * p.price), 2) AS total_revenue
FROM 
    orders o
    INNER JOIN order_details od ON o.order_id = od.order_id
    INNER JOIN pizzas p ON od.pizza_id = p.pizza_id
    INNER JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY 
    pt.name
ORDER BY 
    total_revenue DESC
LIMIT 5;

SELECT 
    round(avg(order_totals.total_earned),2) AS average_order_value
FROM (
    SELECT 
        order_details.order_id,
        SUM(order_details.quantity * pizzas.price) AS total_earned
    FROM 
        order_details
    JOIN 
        pizzas ON order_details.pizza_id = pizzas.pizza_id
    GROUP BY 
        order_details.order_id
) AS order_totals;

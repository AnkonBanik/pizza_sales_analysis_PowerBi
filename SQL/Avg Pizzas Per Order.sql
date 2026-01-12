USE pizzahut;

SELECT 
    ROUND(AVG(total_pizzas), 2) AS average_pizzas_per_order
FROM (
    SELECT 
        order_id,
        SUM(quantity) AS total_pizzas
    FROM 
        order_details
    GROUP BY 
        order_id
) AS pizza_counts;

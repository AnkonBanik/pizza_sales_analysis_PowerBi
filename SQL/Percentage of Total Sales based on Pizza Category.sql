WITH CategorySales AS (
    SELECT 
        pt.category AS pizza_category,
        SUM(od.quantity) AS total_pizzas_sold
    FROM 
        orders o
        INNER JOIN order_details od ON o.order_id = od.order_id
        INNER JOIN pizzas p ON od.pizza_id = p.pizza_id
        INNER JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
    GROUP BY 
        pt.category
),
TotalSales AS (
    SELECT SUM(total_pizzas_sold) AS total_all_sales
    FROM CategorySales
)
SELECT 
    cs.pizza_category,
    cs.total_pizzas_sold,
    ROUND((cs.total_pizzas_sold / ts.total_all_sales) * 100, 2) AS percentage_of_total_sales
FROM 
    CategorySales cs
    CROSS JOIN TotalSales ts
ORDER BY 
    cs.total_pizzas_sold DESC;
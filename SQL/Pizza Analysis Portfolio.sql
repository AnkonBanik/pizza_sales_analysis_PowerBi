-- Determine the top 3 most ordered pizza types based on revenue for each pizza category

USE pizzahut;
select name, revenue from 

(select Category, Name, Revenue, rank() over (partition by category order by revenue desc) as RN 
from

(select pizza_types.category, pizza_types.name,
Round(sum((order_details.quantity)*pizzas.price),2) as Revenue
from order_details join pizzas
on order_details.pizza_id=pizzas.pizza_id
join pizza_types
on pizza_types.pizza_type_id=pizzas.pizza_type_id 
group by pizza_types.category, pizza_types.name) as a) as b 
where RN<=3
;

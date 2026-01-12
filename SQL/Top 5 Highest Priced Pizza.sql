-- Identify the highest-priced pizza

Use pizzahut;
select pizza_types.name as Names, pizzas.price as Price
from pizza_types join pizzas
on pizza_types.pizza_type_id=pizzas.pizza_type_id
order by price desc
limit 5
;

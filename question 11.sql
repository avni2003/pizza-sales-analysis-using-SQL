#Calculate the percentage contribution of each pizza type to total revenue

select pizza_types.category, 
(sum(orders_details.quantity * pizzas.price) / (select 
sum(orders_details.quantity * pizzas.price) as total_sales
from orders_details join pizzas
on pizzas.pizza_id = orders_details.pizza_id) )*100 as revenue

from pizza_types join pizzas
on pizzas.pizza_type_id = pizza_types.pizza_type_id
join orders_details
on orders_details.pizza_id = pizzas.pizza_id
group by pizza_types.category order by revenue desc;
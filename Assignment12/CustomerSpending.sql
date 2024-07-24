SELECT 
    c.name AS customer_name, 
    c.phone_number, 
    SUM(od.quantity * p.price) AS total_spent
FROM 
    Customers c
JOIN 
    Orders o ON c.customer_id = o.customer_id
JOIN 
    OrderDetails od ON o.order_id = od.order_id
JOIN 
    Pizzas p ON od.pizza_id = p.pizza_id
GROUP BY 
    c.customer_id, c.name, c.phone_number
ORDER BY 
    total_spent DESC;

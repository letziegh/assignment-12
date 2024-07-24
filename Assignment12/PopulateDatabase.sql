insert into Customers (name, phone_number) values
('Trevor Page', '226-555-4982'),
('John Doe', '555-555-9498');

INSERT INTO Orders (customer_id, order_datetime) VALUES
((SELECT customer_id FROM Customers WHERE name = 'Trevor Page'), '2023-09-10 09:47:00'),
((SELECT customer_id FROM Customers WHERE name = 'John Doe'), '2023-09-10 13:20:00'),
((SELECT customer_id FROM Customers WHERE name = 'Trevor Page'), '2023-09-10 09:47:00'),
((SELECT customer_id FROM Customers WHERE name = 'John Doe'), '2023-10-10 10:37:00');

INSERT INTO Orders (customer_id, order_datetime) VALUES
((SELECT customer_id FROM Customers WHERE name = 'Trevor Page'), '2023-09-10 09:47:00');
SET @order_id_1 = LAST_INSERT_ID();

INSERT INTO Orders (customer_id, order_datetime) VALUES
((SELECT customer_id FROM Customers WHERE name = 'John Doe'), '2023-09-10 13:20:00');
SET @order_id_2 = LAST_INSERT_ID();

INSERT INTO Orders (customer_id, order_datetime) VALUES
((SELECT customer_id FROM Customers WHERE name = 'Trevor Page'), '2023-09-10 09:47:00');
SET @order_id_3 = LAST_INSERT_ID();

INSERT INTO Orders (customer_id, order_datetime) VALUES
((SELECT customer_id FROM Customers WHERE name = 'John Doe'), '2023-10-10 10:37:00');
SET @order_id_4 = LAST_INSERT_ID();

INSERT INTO OrderDetails (order_id, pizza_id, quantity) VALUES
(@order_id_1, (SELECT pizza_id FROM Pizzas WHERE pizza_name = 'Pepperoni & Cheese'), 1),
(@order_id_1, (SELECT pizza_id FROM Pizzas WHERE pizza_name = 'Meat Lovers'), 1),
(@order_id_2, (SELECT pizza_id FROM Pizzas WHERE pizza_name = 'Vegetarian'), 1),
(@order_id_2, (SELECT pizza_id FROM Pizzas WHERE pizza_name = 'Meat Lovers'), 2),
(@order_id_3, (SELECT pizza_id FROM Pizzas WHERE pizza_name = 'Meat Lovers'), 1),
(@order_id_3, (SELECT pizza_id FROM Pizzas WHERE pizza_name = 'Hawaiian'), 1),
(@order_id_4, (SELECT pizza_id FROM Pizzas WHERE pizza_name = 'Vegetarian'), 3),
(@order_id_4, (SELECT pizza_id FROM Pizzas WHERE pizza_name = 'Hawaiian'), 1);

select* from orders;

select * from orderdetails;
select * from pizzas;
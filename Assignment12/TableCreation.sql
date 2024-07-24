-- create database pizza_restaurant;

create table Customers(customer_id INT AUTO_INCREMENT PRIMARY KEY,
`name` VARCHAR(255) not null,
phone_number varchar(15) not null);

create table Orders(
order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_datetime DATETIME NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
create table Pizzas(
pizza_id INT AUTO_INCREMENT PRIMARY KEY,
pizza_name varchar(255) not null,
price decimal(5,2) not null
);

create table OrderDetails(
order_detail_id INT auto_increment primary key,
order_id int not null,
pizza_id int not null,
quantity int not null,
FOREIGN KEY (order_id) references Orders(order_id),
FOREIGN KEY (pizza_id) references Pizzas(pizza_id)
);
insert into Pizzas (pizza_name, price) values
('Pepperoni & Cheese', 7.99),
('Vegetarian', 9.99),
('Meat Lovers', 14.99),
('Hawaiian', 12.99);




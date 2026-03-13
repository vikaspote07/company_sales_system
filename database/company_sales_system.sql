
--CREATE DATABASE company_sale_system;
--use company_sale_system;

-- customers,employees,department ,products,orders_items are entitys and orders is a relationship between customers and products

CREATE TABLE customers(
		customer_id INT PRIMARY KEY IDENTITY(1,1),
		first_name VARCHAR(50) NOT NULL,
		last_name VARCHAR(50) NOT NULL,
		email VARCHAR(50) NOT NULL UNIQUE,
		phone VARCHAR(50) NOT NULL,
		created_at DATETIME NOT NULL DEFAULT GETDATE()
		)

		drop table customers

        select * from customers

CREATE TABLE department(
		department_id INT PRIMARY KEY IDENTITY(101,1) NOT NULL,
		department_name VARCHAR(50) NOT NULL
)

CREATE TABLE employees(
		employee_id INT PRIMARY KEY IDENTITY(1,1),
		first_name VARCHAR(50) NOT NULL,
		last_name VARCHAR(40) NOT NULL,
		email VARCHAR(40) NOT NULL UNIQUE,
		phone varchar(100) not null,
		department_id INT NOT NULL,

		CONSTRAINT fk_department FOREIGN KEY (department_id) REFERENCES department(department_id) on delete cascade on update cascade
)



CREATE TABLE  products(
		product_id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
		product_name VARCHAR(50) NOT NULL,
		price DECIMAL(10,2) NOT NULL,
		stock INT NOT NULL


)

CREATE TABLE orders(
		order_id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
		customer_id INT NOT NULL,
		order_date DATETIME NOT NULL DEFAULT GETDATE(),
		CONSTRAINT fk_customer_order FOREIGN KEY (customer_id) REFERENCES customers(customer_id) on delete cascade on update cascade
		)

CREATE TABLE order_items(
		order_id INT  NOT NULL,
		product_id INT NOT NULL,
		PRIMARY KEY (order_id,product_id),
		quantity INT NOT NULL,
		price DECIMAL(10,2) NOT NULL,

		FOREIGN KEY (order_id) REFERENCES orders(order_id)  on delete cascade on update cascade,
		FOREIGN KEY(product_id) REFERENCES products(product_id)  on delete cascade on update cascade

		)

        select * from order_items

drop database company_sale_system

CREATE DATABASE company_sale_system;
USE company_sale_system;

CREATE TABLE customers(
    customer_id INT PRIMARY KEY IDENTITY(1,1),
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20) NOT NULL,
    created_at DATETIME NOT NULL DEFAULT GETDATE()
);

CREATE TABLE department(
    department_id INT PRIMARY KEY IDENTITY(101,1),
    department_name VARCHAR(50) NOT NULL
);

CREATE TABLE employees(
    employee_id INT PRIMARY KEY IDENTITY(1,1),
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20) NOT NULL,
    department_id INT NOT NULL,

    CONSTRAINT fk_department 
    FOREIGN KEY (department_id) 
    REFERENCES department(department_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE products(
    product_id INT PRIMARY KEY IDENTITY(1,1),
    product_name VARCHAR(50) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL
);

CREATE TABLE orders(
    order_id INT PRIMARY KEY IDENTITY(1,1),
    customer_id INT NOT NULL,
    order_date DATETIME NOT NULL DEFAULT GETDATE(),

    CONSTRAINT fk_customer_order 
    FOREIGN KEY (customer_id) 
    REFERENCES customers(customer_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE order_items(
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,

    PRIMARY KEY (order_id, product_id),

    FOREIGN KEY (order_id) 
    REFERENCES orders(order_id)
    ON DELETE CASCADE,

    FOREIGN KEY(product_id) 
    REFERENCES products(product_id)
);


INSERT INTO customers(first_name,last_name,email,phone)
VALUES
('Amit','Sharma','amit.sharma@gmail.com','9876543210'),
('Rahul','Verma','rahul.verma@gmail.com','9876543211'),
('Sneha','Patil','sneha.patil@gmail.com','9876543212'),
('Priya','Kulkarni','priya.k@gmail.com','9876543213'),
('Rohit','Mehta','rohit.mehta@gmail.com','9876543214'),
('Anjali','Joshi','anjali.j@gmail.com','9876543215'),
('Vikas','Pote','vikas.pote@gmail.com','9876543216'),
('Neha','Shinde','neha.shinde@gmail.com','9876543217'),
('Karan','Desai','karan.desai@gmail.com','9876543218'),
('Pooja','Nair','pooja.nair@gmail.com','9876543219');


INSERT INTO department(department_name)
VALUES
('Sales'),
('Marketing'),
('Finance'),
('HR'),
('IT'),
('Support'),
('Logistics'),
('Operations'),
('Admin'),
('Management');

INSERT INTO employees(first_name,last_name,email,phone,department_id)
VALUES
('Raj','Patil','raj.patil@company.com','9000000001',101),
('Kunal','Shah','kunal.shah@company.com','9000000002',102),
('Meera','Kapoor','meera.kapoor@company.com','9000000003',103),
('Arjun','Reddy','arjun.reddy@company.com','9000000004',104),
('Sanjay','Gupta','sanjay.gupta@company.com','9000000005',105),
('Nisha','Iyer','nisha.iyer@company.com','9000000006',106),
('Varun','Malhotra','varun.m@company.com','9000000007',107),
('Deepak','Yadav','deepak.y@company.com','9000000008',108),
('Riya','Singh','riya.s@company.com','9000000009',109),
('Ajay','Kumar','ajay.k@company.com','9000000010',110);



INSERT INTO products(product_name,price,stock)
VALUES
('Laptop',75000,20),
('Smartphone',30000,50),
('Tablet',20000,30),
('Headphones',2000,100),
('Keyboard',1500,80),
('Mouse',800,120),
('Monitor',12000,40),
('Printer',9000,25),
('Webcam',2500,60),
('External Hard Drive',6000,35);


INSERT INTO orders(customer_id,order_date)
VALUES
(1,'2024-01-10'),
(2,'2024-01-12'),
(3,'2024-01-15'),
(4,'2024-02-01'),
(5,'2024-02-05'),
(6,'2024-02-10'),
(7,'2024-03-01'),
(8,'2024-03-05'),
(9,'2024-03-10'),
(10,'2024-03-15');



INSERT INTO order_items(order_id,product_id,quantity,price)
VALUES
(1,1,1,75000),
(1,4,2,2000),
(2,2,1,30000),
(3,3,1,20000),
(4,5,2,1500),
(5,6,3,800),
(6,7,1,12000),
(7,8,1,9000),
(8,9,2,2500),
(9,10,1,6000);



INSERT INTO customers(first_name,last_name,email,phone)
VALUES
('Arun','Patel','arun.patel@gmail.com','9876500001'),
('Simran','Kaur','simran.kaur@gmail.com','9876500002'),
('Nikhil','Agarwal','nikhil.a@gmail.com','9876500003'),
('Tanvi','Deshmukh','tanvi.d@gmail.com','9876500004'),
('Manish','Jain','manish.j@gmail.com','9876500005'),
('Divya','Bansal','divya.b@gmail.com','9876500006'),
('Harsh','Tiwari','harsh.t@gmail.com','9876500007'),
('Isha','Kapoor','isha.k@gmail.com','9876500008'),
('Rajat','Arora','rajat.a@gmail.com','9876500009'),
('Kriti','Malik','kriti.m@gmail.com','9876500010');





INSERT INTO products(product_name,price,stock)
VALUES
('Gaming Laptop',120000,15),
('Bluetooth Speaker',3500,80),
('Smartwatch',15000,45),
('Router',3000,25),
('Microphone',4500,20),
('Graphic Tablet',8000,10),
('VR Headset',50000,5),
('Drone Camera',70000,8),
('Projector',25000,12),
('Power Bank',1500,60);





INSERT INTO orders(customer_id,order_date)
VALUES
(1,'2024-03-20'),
(2,'2024-03-21'),
(3,'2024-03-22'),
(1,'2024-03-23'),
(4,'2024-03-24'),
(2,'2024-03-25'),
(5,'2024-03-26'),
(6,'2024-03-27'),
(3,'2024-03-28'),
(1,'2024-03-29');




INSERT INTO order_items(order_id,product_id,quantity,price)
VALUES
(10,2,2,30000),
(11,1,1,75000),
(11,7,1,12000),
(12,3,2,20000),
(13,4,5,2000),
(14,5,3,1500),
(15,6,4,800),
(16,2,1,30000),
(17,1,2,75000),
(18,8,1,9000);


--🟢 Stage 1 — Basic SELECT (10 Queries)

--Practice simple data retrieval.

--Show all customers.
 select * from customers

--Show first_name and email of all customers.
select first_name,email from customers

--Show all products with price greater than 500.
select * from products where price >500


--Show all employees from department 101.

select * from employees where department_id='101'

--Show products with stock less than 10.
select * from products where stock<10


--Show customers ordered by created_at (latest first).
select * from customers order by created_at desc


--Show unique department ids from employees table.
select distinct department_id  from employees

--Show top 5 most expensive products.
select top 5 * from products order by price desc

--Show orders placed today.
select * from orders where CAST(order_date as DATE)=CAST(GETDATE() AS DATE)

--Show product name and price sorted by price descending.
SELECT PRODUCT_NAME,PRICE FROM PRODUCTS ORDER BY PRICE DESC


--****************************************************************

--🟡 Stage 2 — Filtering & Conditions (10 Queries)

--Practice WHERE, LIKE, IN, BETWEEN.

--Find customers whose first name starts with A.
SELECT  * from customers where  first_name like 'A%'

--Find products priced between 500 and 2000.
select * from products where price between 500 AND 2000

--Find orders placed in the last 30 days.
select * from orders where order_date >=DATEADD(DAY,-30,GETDATE())

SELECT * FROM ORDERS

--Find employees whose last name contains "son".
select * from employees where last_name like 's%'

--Find products where stock is 0.
select * from products where stock<=0

--Find customers with gmail email addresses.

select * from customers where email like '%@gmail.com%'


--Find orders for specific customers (customer_id 1,2,3).


select * from customers where customer_id in(1,2,3)

--Find employees not in department 101.
select * from employees where department_id !=101

--Find products priced greater than the average price.
select * from products where price>(select avg(price) from products)


--Find orders placed after 2024-01-01.
select * from orders where order_date>'2024-01-01'

--🔵 Stage 3 — JOIN Queries (15 Queries)

--Now we combine tables.

--Show all orders with customer names.
select o.order_id,c.first_name,c.last_name,o.order_date 
from orders o join customers c 
on o.customer_id=c.customer_id


SELECT o.order_id,
       c.first_name + ' ' + c.last_name AS customer_name,
       o.order_date
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id;

select o.order_id ,c.first_name + ' ' + c.last_name as customer_name
from orders o
join customers c
on c.customer_id=o.customer_id

--Show order details with product names.


select oi.order_id,p.product_name,oi.quantity,oi.price
from order_items oi
join products p
on oi.product_id=p.product_id


select * from orders
select * from customers
select * from products
select * from order_items

--Show:

--customer name
--order id
--order date

--Show products purchased in each order.

--Show:

--order_id
--product_name
--quantity
--price

--Show customers who placed orders.

select distinct c.first_name +' ' +c.last_name as customer_name,o.order_id,o.order_date
from customers c 
join orders o
on c.customer_id=o.customer_id

--Show customers who never placed an order.
select first_name +' ' +last_name as customer_name
from customers
where customer_id not in (select customer_id from orders)

--Show total products purchased per order.
select order_id ,sum(quantity)as total_quantity
from order_items
group by order_id

--Show employees with their department names.
select e.first_name + ' ' + e.last_name as employee_name,d.department_name
from employees e
join department d
on e.department_id=d.department_id

--Show:

--customer name
--product name
--quantity

select c.first_name +' ' +c.last_name as customer_name,p.product_name,oi.quantity
from customers c
join orders o
on c.customer_id=o.customer_id
join order_items oi
on o.order_id=oi.order_id
join products p
on p.product_id=oi.product_id

--Show products that were never ordered.
select product_name from products where product_id not in(select product_id from order_items)

select * from products
select * from orders
select * from order_items


--Show orders with total quantity purchased.
select order_id ,sum(quantity) total_quantity from order_items 
group by order_id


--Show number of orders per customer.
select c.first_name + ' ' +c.last_name as customer_name ,count(order_id)as total_orders
from customers c
join orders o 
on c.customer_id=o.customer_id
group by c.first_name + ' ' +c.last_name

--Show the most ordered product.
select c.first_name + ' ' +c.last_name as customer_name ,count(order_id)as total_orders
from customers c
join orders o 
on c.customer_id=o.customer_id
group by c.first_name + ' ' +c.last_name
order by total_orders desc

SELECT TOP 1 p.product_name,
       SUM(oi.quantity) AS total_orders
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_orders DESC;

--Show number of orders per customer.
select c.first_name + ' ' +c.last_name as customer_name ,count(order_id)as total_orders
from customers c
join orders o 
on c.customer_id=o.customer_id
group by c.first_name + ' ' +c.last_name
order by total_orders desc

--Show department with number of employees.
select d.department_name ,count(employee_id)as total_employees
from department d
join employees e
on d.department_id=e.department_id
group by d.department_name

--🟣 Stage 4 — Aggregation & Analytics (10 Queries)

--Practice GROUP BY, HAVING, aggregates.

--Find total sales amount per order.
select o.order_id, sum(oi.quantity*oi.price) as total_sales
from order_items oi
join  orders o
on o.order_id=oi.order_id
group by o.order_id
order by total_sales desc


--Find total revenue generated by each product.

--Find customers who spent more than 5000.

--Find the average product price.

--Find the product with highest price.

--Find total number of orders per day.

--Find total products sold per product.

--Find departments with more than 3 employees.

--Find the total revenue per customer.

--Find the most valuable customer (highest spending).

--🔴 Stage 5 — Advanced SQL (Window Functions, Subqueries) (5 Queries)

--Rank products by price using RANK().
select product_name ,price,
RANK() OVER(ORDER BY price DESC) AS price_rank from  products

--Find the top 3 most expensive products using window functions.
select * from ( select product_name ,
price,RANK() OVER(ORDER BY PRICE DESC) AS price_rank from  products) as ranked_products
where price_rank <=3

--Find the running total of sales by order date.
--SELECT order_date,
--price,
--sum(price) OVER(ORDER BY order_date) AS running_total
--from orders

--Find customers whose spending is above average.
SELECT *
FROM (
SELECT 
c.customer_id,
SUM(p.price * oi.quantity) AS total_spent,
AVG(SUM(p.price * oi.quantity)) OVER() AS avg_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY c.customer_id
) t
WHERE total_spent > avg_spent;

--Find the second highest priced product.


ALTER TABLE employees
ADD salary INT,
manager_id INT;

UPDATE employees SET salary = 90000, manager_id = NULL WHERE employee_id = 1;
UPDATE employees SET salary = 70000, manager_id = 1 WHERE employee_id = 2;
UPDATE employees SET salary = 60000, manager_id = 1 WHERE employee_id = 3;
UPDATE employees SET salary = 55000, manager_id = 2 WHERE employee_id = 4;
UPDATE employees SET salary = 50000, manager_id = 2 WHERE employee_id = 5;
UPDATE employees SET salary = 45000, manager_id = 3 WHERE employee_id = 6;
UPDATE employees SET salary = 45000, manager_id = 3 WHERE employee_id = 7;
UPDATE employees SET salary = 40000, manager_id = 4 WHERE employee_id = 8;
UPDATE employees SET salary = 38000, manager_id = 4 WHERE employee_id = 9;
UPDATE employees SET salary = 35000, manager_id = 5 WHERE employee_id = 10;


INSERT INTO customers(first_name,last_name,email,phone)
VALUES
('Amit','Sharma','amitduplicate@gmail.com','9999990001'),
('Amit','Sharma','amitduplicate2@gmail.com','9999990002');

INSERT INTO orders(customer_id,order_date)
VALUES
(2,'2024-04-01'),
(3,'2024-04-02'),
(4,'2024-04-03'),
(5,'2024-04-04'),
(6,'2024-04-05');


INSERT INTO order_items(order_id,product_id,quantity,price)
VALUES
(19,1,1,75000),
(19,3,1,20000),
(20,2,2,30000),
(21,4,3,2000),
(22,5,2,1500),
(23,6,5,800);


INSERT INTO products(product_name,price,stock)
VALUES
('AI Camera',18000,20),
('Smart Glasses',25000,15);


INSERT INTO customers(first_name,last_name,email,phone)
VALUES
('NoOrder','Customer1','nocustomer1@gmail.com','888880001'),
('NoOrder','Customer2','nocustomer2@gmail.com','888880002');


DELETE FROM employees WHERE employee_id = 5;

INSERT INTO orders(customer_id,order_date)
VALUES
(1,'2024-04-10');



INSERT INTO order_items(order_id,product_id,quantity,price)
VALUES
(24,1,3,75000);


--next level🔹 Level 1 — Core SQL (Very Common)
1️⃣ Find the second highest salary.
2️⃣ Find the Nth highest salary.
3️⃣ Find duplicate rows in a table.

Example idea:

duplicate emails

duplicate customers

4️⃣ Delete duplicate rows but keep one record.
5️⃣ Find employees who have the same salary.
6️⃣ Find employees earning more than their manager.
🔹 Level 2 — Joins + Aggregation
7️⃣ Find the department with the highest average salary.
8️⃣ Find total salary per department.
9️⃣ Find employees who do not belong to any department.
🔟 Find departments with no employees.
1️⃣1️⃣ Find customers who never placed an order.
1️⃣2️⃣ Find products that were never sold.
🔹 Level 3 — Analytical Queries
1️⃣3️⃣ Find top 3 highest-paid employees.
1️⃣4️⃣ Rank employees by salary using window functions.
1️⃣5️⃣ Find the highest salary in each department.
1️⃣6️⃣ Find the second highest salary in each department.
1️⃣7️⃣ Find the running total of sales.
🔹 Level 4 — Real Business Problems
1️⃣8️⃣ Find the most valuable customer (highest spending).
1️⃣9️⃣ Find total revenue per product.
2️⃣0️⃣ Find the best selling product.
2️⃣1️⃣ Find the average order value.
2️⃣2️⃣ Find customers who placed more than 3 orders.
🔹 Level 5 — Advanced SQL
2️⃣3️⃣ Find gaps in employee IDs.

Example:

1
2
3
6
7

Missing → 4,5

2️⃣4️⃣ Find consecutive order dates.
2️⃣5️⃣ Find top 2 products per category/department.

(This is a classic window function interview problem.)

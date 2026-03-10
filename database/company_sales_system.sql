
CREATE DATABASE company_sale_system;
use company_sale_system;

-- customers,employees,department ,products,orders_items are entitys and orders is a relationship between customers and products

CREATE TABLE customers(
    		customer_id INT PRIMARY KEY IDENTITY(1,1),
            		first_name VARCHAR(50) NOT NULL,
                    		last_name VARCHAR(50) NOT NULL,
                            		email VARCHAR(50) NOT NULL UNIQUE,
                                    		phone VARCHAR(50) NOT NULL,
                                            		created_at DATETIME NOT NULL DEFAULT GETDATE()
                                                    		)
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

Show products with stock less than 10.

Show customers ordered by created_at (latest first).

Show unique department ids from employees table.

Show top 5 most expensive products.

Show orders placed today.

Show product name and price sorted by price descending.

🟡 Stage 2 — Filtering & Conditions (10 Queries)

Practice WHERE, LIKE, IN, BETWEEN.

Find customers whose first name starts with A.

Find products priced between 500 and 2000.

Find orders placed in the last 30 days.

Find employees whose last name contains "son".

Find products where stock is 0.

Find customers with gmail email addresses.

Find orders for specific customers (customer_id 1,2,3).

Find employees not in department 101.

Find products priced greater than the average price.

Find orders placed after 2024-01-01.

🔵 Stage 3 — JOIN Queries (15 Queries)

Now we combine tables.

Show all orders with customer names.

Show order details with product names.

Show:

customer name
order id
order date

Show products purchased in each order.

Show:

order_id
product_name
quantity
price

Show customers who placed orders.

Show customers who never placed an order.

Show total products purchased per order.

Show employees with their department names.

Show:

customer name
product name
quantity

Show products that were never ordered.

Show orders with total quantity purchased.

Show number of orders per customer.

Show the most ordered product.

Show department with number of employees.

🟣 Stage 4 — Aggregation & Analytics (10 Queries)

Practice GROUP BY, HAVING, aggregates.

Find total sales amount per order.

Find total revenue generated by each product.

Find customers who spent more than 5000.

Find the average product price.

Find the product with highest price.

Find total number of orders per day.

Find total products sold per product.

Find departments with more than 3 employees.

Find the total revenue per customer.

Find the most valuable customer (highest spending).

🔴 Stage 5 — Advanced SQL (Window Functions, Subqueries) (5 Queries)

Rank products by price using RANK().

Find the top 3 most expensive products using window functions.

Find the running total of sales by order date.

Find customers whose spending is above average.

Find the second highest priced product.

create table customers(cust_id int primary key, cust_name varchar(50), city varchar(50),
email varchar(100),join_date date);

create table products(prod_id int primary key, prod_name varchar(50),
category varchar(30), price decimal(10,2), stock int);

create table orders1(order_id int primary key, cust_id int,
order_date date, status varchar(20), foreign key(cust_id) references customers(cust_id));

create table order_items(order_item_id int primary key, order_id int,
prod_id int, quantity int, foreign key(order_id) references orders1(order_id),
foreign key(prod_id) references products(prod_id));

insert into customers values
(1, 'Amit Patel', 'Ahmedabad', 'amit@gmail.com', '2020-05-10'),
(2, 'Riya Patel', 'Surat', 'riya@gmail.com', '2021-03-15'),
(3, 'Karan Mehta', 'Vadodara', 'karan@gmail.com', '2019-11-20'),
(4, 'Neha Jain', 'Mumbai', 'neha@gmail.com', '2022-01-05'),
(5, 'Raj Verma', 'Delhi', 'raj@gmail.com', '2020-07-18'),
(6, 'Pooja Singh', 'Pune', 'pooja@gmail.com', '2021-09-25'),
(7, 'Arjun Nair', 'Bangalore', 'arjun@gmail.com', '2018-12-30'),
(8, 'Sneha Reddy', 'Hyderabad', 'sneha@gmail.com', '2023-02-10'),
(9, 'Vikram Joshi', 'Jaipur', 'vikram@gmail.com', '2019-06-22'),
(10, 'Anjali Gupta', 'Kolkata', 'anjali@gmail.com', '2022-08-14');

insert into products values
(101, 'Laptop', 'Electronics', 55000, 20),
(102, 'Smartphone', 'Electronics', 30000, 35),
(103, 'Headphones', 'Accessories', 2000, 50),
(104, 'Keyboard', 'Accessories', 1500, 40),
(105, 'Mouse', 'Accessories', 800, 60),
(106, 'Chair', 'Furniture', 5000, 15),
(107, 'Table', 'Furniture', 7000, 10),
(108, 'Monitor', 'Electronics', 12000, 25),
(109, 'Printer', 'Electronics', 9000, 12),
(110, 'Notebook', 'Stationery', 100, 100);

insert into orders1 values
(1001, 1, '2023-01-10', 'Delivered'),
(1002, 2, '2023-02-15', 'Pending'),
(1003, 3, '2023-03-05', 'Shipped'),
(1004, 4, '2023-03-20', 'Cancelled'),
(1005, 5, '2023-04-01', 'Delivered'),
(1006, 6, '2023-04-12', 'Delivered'),
(1007, 7, '2023-05-03', 'Pending'),
(1008, 8, '2023-05-18', 'Shipped'),
(1009, 9, '2023-06-07', 'Delivered'),
(1010, 10, '2023-06-25', 'Pending'),
(1011, 1, '2023-07-10', 'Delivered'),
(1012, 2, '2023-07-15', 'Shipped'),
(1013, 3, '2023-08-01', 'Cancelled'),
(1014, 4, '2023-08-10', 'Delivered'),
(1015, 5, '2023-09-05', 'Pending');

insert into order_items values
(1, 1001, 101, 1),
(2, 1001, 103, 2),
(3, 1002, 102, 1),
(4, 1002, 105, 3),
(5, 1003, 104, 2),
(6, 1003, 106, 1),
(7, 1004, 107, 1),
(8, 1005, 101, 1),
(9, 1005, 108, 2),
(10, 1006, 109, 1),
(11, 1006, 110, 5),
(12, 1007, 103, 2),
(13, 1008, 102, 1),
(14, 1008, 104, 1),
(15, 1009, 105, 4),
(16, 1009, 110, 10),
(17, 1010, 108, 1),
(18, 1011, 101, 1),
(19, 1011, 102, 1),
(20, 1012, 103, 3),
(21, 1013, 107, 1),
(22, 1014, 106, 2),
(23, 1014, 104, 1),
(24, 1015, 109, 1),
(25, 1015, 110, 6);

update customers set city='Mumbai' where cust_id=6
insert into customers values(11, 'Vidisha Mukharjee', 'Kolkata', 'vidisha@gmail.com', '2022-03-23');

---- Show all customers who live in Mumbai ---
select * from customers where city='Mumbai'

---- Display names of all products in the “Electronics” category
select * from products where category='electronics'

---- List all orders that were delivered
select * from orders1 where status='delivered'

---- Find customers who joined after January 2023
select * from customers where join_date>'2023-01-31'

---- Display products whose price is greater than ₹10,000
select * from products where price>10000

---- Show the total number of customers
select count(*) from customers

---- Display product names with their stock quantity
select prod_name,stock from products

---- List orders placed in August 2023
select * from orders1 where order_date between '2023-08-01' and '2023-08-31'

---- Show customers whose name starts with “S”
select * from customers where cust_name like's%'

---- Display the cheapest produc
select * from products order by price asc limit 1

---- Count how many orders each customer has placed
select cust_name,count(order_id) as 'order placed' from customers,orders1
where customers.cust_id=orders1.cust_id
group by cust_name

---- Find the total quantity of products ordered in each order
select order_id, sum(quantity) as 'total quantity' from order_items
group by order_id

---- Show each customer’s name and the total value of their delivered orders   ----????----
select cust_name, sum(price*quantity) as 'total value' from customers
join orders1 on customers.cust_id=orders1.cust_id
join 
where orders1.status='delivered'
group by cust_name

---- Display the most expensive product in each category    ----????----
select category from products order by price desc limit 1
group by category

---- Find customers who have never placed an order
select customers.cust_id, customers.cust_name from customers
left join orders1 on customers.cust_id=orders1.cust_id
where orders1.order_id is null

---- Show total sales (price × quantity) of each product
select prod_name,sum(price*quantity) from products,order_items
where order_items.prod_id=products.prod_id
group by prod_name

---- List all products that have been ordered more than 2 times
select prod_name,count(order_items.prod_id) from products,order_items
where products.prod_id=order_items.prod_id
group by prod_name having count(order_items.prod_id)>2

---- Find the total revenue generated in 2023    ----year??? ----
select sum(products.price * order_items.quantity) as 'total_revenue'
from orders1
join order_items on orders1.order_id=order_items.order_id
join products on order_items.prod_id=products.prod_id
where year(orders1.order_date)=2023;

---- Display all orders along with customer names and order status
select order_id,cust_name, status from orders1
join customers on orders1.cust_id=customers.cust_id

---- Show the number of “Delivered” vs “Cancelled” orders      ----shows only delivered----
select status, count(*) from orders1
where status='delivered' or 'cancelled'
group by status

---- Find the top 3 customers with the highest total spending
select customers.cust_id, cust_name, sum(products.price*order_items.quantity) as 'highest spending'
from customers
join orders1 on orders1.cust_id=customers.cust_id
join order_items on order_items.order_id=orders1.order_id
join products on order_items.prod_id=products.prod_id
group by cust_id, cust_name
order by 'highest spending' desc 
limit 3

---- Display the product categories ranked by total sales
select category, prod_name,
sum(products.price*order_items.quantity) as 'total sales'
from products
join order_items on order_items.prod_id=products.prod_id
group by category, prod_name

---- Find customers who have purchased both “Laptop” and “Headphones”    -----they did not purchase both ????----
select cust_name,customers.cust_id from customers
join orders1 on orders1.cust_id=customers.cust_id
join order_items on order_items.order_id=orders1.order_id
join products on products.prod_id=order_items.prod_id
where products.prod_name in ('laptop','headphones')
group by cust_name,customers.cust_id

---- Show products that were never ordered    ----is it because there were no orders that were never ordered???----
select prod_name, count(order_items.order_id)
from products
join order_items on order_items.prod_id=products.prod_id
join orders1 on orders1.order_id=order_items.order_id
where order_items.order_id is null
group by prod_name

---- Find orders with multiple products from different categories    ----is this right????----
select category, prod_name, count(order_items.prod_id)
from products
join order_items on order_items.prod_id=products.prod_id
join orders1 on orders1.order_id=order_items.order_id
group by category,prod_name having count(order_items.prod_id)>2

---- Calculate each month’s total revenue and show a running total            ------?????-------
select sum(products.price*order_items.quantity) as "each month's total_revenue"
from orders1
join order_items on orders1.order_id=order_items.order_id
join products on order_items.prod_id=products.prod_id
where month(orders1.order_date);

---- Display the average order value per customer      -----????---
select cust_name, avg(price,quantity) as 'order value' from customers
join orders1 on customers.cust_id=orders1.cust_id
where orders1.status='delivered'
group by cust_name

---- Show the most frequently ordered product
select products.prod_id, products.prod_name,
count(*) as 'order count'
from order_items
join products on order_items.prod_id=products.prod_id
group by products.prod_id, products.prod_name
order by 'order count' desc
limit 1

---- List customers who placed orders in at least 3 different months

---- Find products that are out of stock or nearly out of stock (less than 25 units).
select prod_id,prod_name,stock
from products
where stock<25

-- Task 1: Create a database named-- product_analytics_system
create database product_analytics_system;

use product_analytics_system;

-- Task 2: Create Categories Table
create table Categories(Category_ID int primary key,
Category_Name varchar(100),
Description varchar(255));

-- Task 3: Create Suppliers Table
create table Suppliers(Supplier_ID int primary key,
Supplier_Name varchar(100),
City varchar(100),
Contact_Number varchar(20));

-- Task-4: Create Customers Table
create table Customers(Customer_ID int primary key,
Customer_Name varchar(100),
City varchar(100),
Email varchar(100),
Phone_No varchar(20));

-- Task-5: Create Products Table
create table Products(Product_ID int primary key,
Product_Name varchar(100),
Category_ID int,
Price decimal(10,2),
Stock_Quantity int,
Supplier_ID int,
Foreign key(Category_ID) references Categories(Category_ID),
Foreign key(Supplier_ID) references Suppliers(Supplier_ID));

-- Task-6: Create Orders Table
create table Orders(Order_ID int primary key,
Customer_ID int,
Order_Date date,
Total_Amount decimal(10,2),
Foreign key(Customer_ID) references Customers(Customer_ID));

-- Task-7: Create Order_Details Table
create table Order_Details(Order_detail_ID int primary key,
Order_ID int,
Product_ID int,
Quantity int,
Price decimal(10,2),
Foreign key(Order_ID) references Orders(Order_ID),
Foreign key(Product_ID) references Products(Product_ID));

-- Task 8: Insert Data into the tables
insert into Categories values
(1, 'Electronics', 'Electronic gadgets and devices'),
(2, 'Furniture', 'Home and office furniture'),
(3, 'Clothing', 'Men and women apparel'),
(4, 'Groceries', 'Daily household grocery items'),
(5, 'Books', 'Educational and entertainment books');

insert into Suppliers values
(1, 'TechWorld', 'Mumbai', '9876543210'),
(2, 'FurniCraft', 'Delhi', '9876543211'),
(3, 'StyleHub', 'Ahmedabad', '9876543212'),
(4, 'FreshMart', 'Surat', '9876543213'),
(5, 'BookBazaar', 'Pune', '9876543214');

insert into Customers values
(1, 'Aarav Patel', 'Ahmedabad', 'aarav@example.com', '9000000001'),
(2, 'Neha Shah', 'Ahmedabad', 'neha@example.com', '9000000002'),
(3, 'Rohan Mehta', 'Mumbai', 'rohan@example.com', '9000000003'),
(4, 'Priya Desai', 'Surat', 'priya@example.com', '9000000004'),
(5, 'Karan Verma', 'Delhi', 'karan@example.com', '9000000005'),
(6, 'Isha Jain', 'Pune', 'isha@example.com', '9000000006'),
(7, 'Vikram Rao', 'Bangalore', 'vikram@example.com', '9000000007'),
(8, 'Mansi Trivedi', 'Rajkot', 'mansi@example.com', '9000000008'),
(9, 'Tanya Kapoor', 'Jaipur', 'tanya@example.com', '9000000009'),
(10, 'Harsh Soni', 'Ahmedabad', 'harsh@example.com', '9000000010');

insert into Products values
(1, 'Laptop', 1, 65000, 10, 1),
(2, 'Smartphone', 1, 25000, 25, 1),
(3, 'Tablet', 1, 18000, 15, 1),
(4, 'Office Chair', 2, 8500, 20, 2),
(5, 'Dining Table', 2, 22000, 5, 2),
(6, 'Sofa Set', 2, 45000, 3, 2),
(7, 'T-Shirt', 3, 1200, 50, 3),
(8, 'Jeans', 3, 2400, 40, 3),
(9, 'Jacket', 3, 5500, 18, 3),
(10, 'Rice Bag', 4, 900, 100, 4),
(11, 'Cooking Oil', 4, 1500, 60, 4),
(12, 'Sugar Pack', 4, 800, 80, 4),
(13, 'Novel', 5, 700, 30, 5),
(14, 'Textbook', 5, 1200, 35, 5),
(15, 'Notebook Set', 5, 600, 45, 5);

insert into Orders values
(1, 1, '2026-01-05', 90000),
(2, 2, '2026-01-10', 26000),
(3, 3, '2026-01-12', 10200),
(4, 4, '2026-01-15', 4500),
(5, 5, '2026-01-18', 23000),
(6, 6, '2026-01-20', 7800),
(7, 7, '2026-01-22', 25000),
(8, 8, '2026-01-25', 12500),
(9, 9, '2026-01-28', 6700),
(10, 10, '2026-02-01', 15000),
(11, 1, '2026-02-03', 5000),
(12, 2, '2026-02-05', 32000),
(13, 3, '2026-02-07', 11000),
(14, 4, '2026-02-10', 8600),
(15, 5, '2026-02-12', 4700),
(16, 6, '2026-02-14', 21000),
(17, 7, '2026-02-16', 14000),
(18, 8, '2026-02-18', 6900),
(19, 9, '2026-02-20', 9800),
(20, 10, '2026-02-22', 17500);

insert into Order_Details values
(1, 1, 1, 1, 65000),
(2, 1, 4, 1, 8500),
(3, 2, 2, 1, 25000),
(4, 2, 7, 1, 1200),
(5, 3, 3, 1, 18000),
(6, 3, 15, 2, 600),
(7, 4, 10, 5, 900),
(8, 5, 5, 1, 22000),
(9, 5, 9, 1, 5500),
(10, 6, 8, 2, 2400),
(11, 7, 6, 1, 45000),
(12, 8, 14, 3, 1200),
(13, 9, 13, 4, 700),
(14, 10, 11, 2, 1500),
(15, 11, 12, 5, 800),
(16, 12, 1, 1, 65000),
(17, 13, 2, 1, 25000),
(18, 14, 4, 1, 8500),
(19, 15, 7, 2, 1200),
(20, 16, 3, 1, 18000);

-- Task-9: Display all products
select * from Products;

-- Task-10: Display products with price greater than 5000
select * from products where Price>5000;

-- Task-11: Display customers from Ahmedabad
select * from customers where City='Ahmedabad';

-- Task-12: Display products sorted by price in descending order
select * from products
order by price desc;

-- Task-13: Display total number of products
select count(*) from products;

-- Task-14: Find maximum product price
select max(price) from products;

-- Find minimum product price
select min(price) from products;

-- Find average product price
select avg(price) from products;

-- max, min and avg in one statement
select
max(price) as max_price,
min(price) as min_price,
avg(price) as avg_price
from products;

-- Task-15: Find total sales amount
select sum(total_amount) as total_sales
from orders;

-- every customer ordered 2 products so changing some customer_id
update orders set customer_id=3 where order_id=15;
update orders set customer_id=5 where order_id=18;

-- Task-16: Find total orders placed by each customer
select customer_id, count(*) as total_orders_placed
from orders
group by customer_id;

-- Task-17: Display category-wise total products
select category_name, count(Product_ID) as products_in_category
from categories c
join products p on c.Category_ID=p.Category_ID
group by category_name;

-- Task-18: Display category-wise average product price
select category_name, avg(p.price) as avg_product_price
from categories c
join products p on c.Category_ID=p.Category_ID
group by category_name;

-- Task-19: Display- Product Name, Category Name using join
select Product_name, category_name
from products p
left join categories c on p.Category_ID=c.Category_ID;

-- Task-20: Display- Customer Name, Order ID, Order Date using JOIN.
select customer_name, order_id, order_date
from orders o
join customers c on o.Customer_ID=c.Customer_ID
order by order_id asc;

-- Task-21: Display- Product Name, Supplier Name using JOIN
select product_name, supplier_name
from products p
join suppliers s on p.Supplier_ID=s.Supplier_ID;

-- Task-22: Display complete order report including: Customer Name, Product Name, Quantity, Price, Total Amount
select customer_name, product_name, quantity, p.price, (p.price*od.quantity) as total_amount
from orders o
join customers c on o.Customer_ID=c.Customer_ID
join order_details od on o.Order_ID=od.Order_ID
join products p on od.Product_ID=p.Product_ID;

-- Task-23: Display products having price greater than average price
select product_name, price
from products
where price>(select avg(price) from products);

-- Task-24: Display customer who placed highest order amount
select * from customers
where Customer_ID=
(select Customer_ID from orders order by total_amount desc 
limit 1);

-- Task-25: Display most expensive product
select * from products
where price=(select max(price) from products);

-- Task-26: Display products never ordered
select Product_ID, Product_Name from products
where product_id not in
(select product_id
from order_details);
        
-- Task-27: Display customers who placed more orders than average orders
select o1.Customer_ID, c.Customer_Name, count(order_id) as total_orders from orders o1
join customers c on c.customer_id=o1.customer_id
group by o1.customer_id, c.customer_name
having count(order_id)>
(select avg(total_orders) from 
		(select count(*) as total_orders 
		from orders
        group by Customer_ID) as avg_orders);

-- Task-28: Create CTE to display high-price products.
with highprice as
(select * from products where price>10000)
select * from highprice;

-- Task-29: Create CTE for customer total purchases
with total_purchase as
(select c.customer_id, c.customer_name, count(o.order_id) as total_orders,
sum(o.total_amount) as total_spent
from customers c
join orders o on c.Customer_ID=o.Customer_ID
group by c.Customer_ID, c.Customer_Name)
select * from total_purchase;

-- Task-30: Create CTE to display top-selling products
with top_sellers as
(select p.product_id, p.product_name,
sum(od.quantity) as total_sold
from products p
join order_details od on od.product_id=p.product_id
group by p.product_id, p.product_name
order by total_sold desc)
select * from top_sellers
order by total_sold desc;

-- Task-31: Create multiple CTEs for--Product sales, Customer purchases and combine results
with product_sales as
(select p.product_id, p.product_name,
sum(od.quantity) as total_sales
from products p
join order_details od on od.product_id=p.product_id
group by p.product_id, p.product_name),
customer_purchases as
(select c.customer_id, c.customer_name, count(o.order_id) as total_orders,
sum(o.total_amount) as total_spent
from customers c
join orders o on c.Customer_ID=o.Customer_ID
group by c.Customer_ID, c.Customer_Name)
select * from product_sales
cross join customer_purchases;

-- Task-32: Rank products based on price
select rank() over (order by price) as product_rank, product_name, price from products;

-- Task-33: Display dense ranking of customers based on total purchase.
select c.customer_id, c.customer_name, SUM(o.total_amount) AS total_purchase,
dense_rank() over (order by SUM(o.total_amount) desc) as customer_rank
from customers c
join orders o on c.customer_id=o.customer_id
group by c.customer_id, c.customer_name;

-- Task-34: Generate row numbers for products.
select row_number() over (order by Product_ID) as row_no, product_name
from products;

-- Task-35: Display running total of sales amount
select order_id, order_date, Total_Amount, 
sum(total_amount) over (order by order_date) as running_total
from orders;

-- Task-38: Rank products category-wise.
select rank() over (partition by category_id order by price desc) as category_rank,
product_id, product_name, category_id, price
from products;

-- Task-39: Display Top 5 selling products
select p.product_id, p.product_name, sum(quantity) as total_sale
from products p
join order_details od on p.Product_ID=od.Product_ID
group by Product_ID, Product_Name
order by total_sale desc
limit 5;

-- Task-40: Display highest revenue generating category
select c.category_name, sum(od.quantity*od.price) as category_revenue
from order_details od
join products p on od.Product_ID=p.Product_ID
join categories c on p.Category_ID=c.Category_ID
group by c.Category_Name
order by category_revenue desc
limit 1;

-- Task-41: Display customer with maximum purchases
select c.customer_id, customer_name, sum(total_amount) as max_purchases
from customers c
join orders o on o.Customer_ID=c.Customer_ID
group by Customer_ID, Customer_Name
order by max_purchases desc
limit 1;

-- Task-42: Display least selling products
select p.product_id, p.product_name, sum(quantity) as minimum_sale
from products p
join order_details od on p.Product_ID=od.Product_ID
group by Product_ID, Product_Name
order by minimum_sale asc;

-- Task-43: Display monthly sales report
select month (order_date) as month,
monthname(order_date) as month_name,
sum(total_amount) as monthly_sales
from orders
group by month, month_name
order by month;

-- Task-44: Display supplier-wise product count
select s.supplier_id, s.supplier_name, count(p.product_id)
from suppliers s
join products p on s.Supplier_ID=p.Supplier_ID
group by s.Supplier_ID, s.Supplier_Name;

-- Task-45: Display category-wise revenue
select c.category_name, sum(od.quantity*od.price) as category_revenue
from order_details od
join products p on od.Product_ID=p.Product_ID
join categories c on p.Category_ID=c.Category_ID
group by c.Category_Name
order by category_revenue;

-- Task-46: Display top 3 customers based on purchase amount
select c.customer_id, customer_name, sum(total_amount) as max_purchases
from customers c
join orders o on o.Customer_ID=c.Customer_ID
group by Customer_ID, Customer_Name
order by max_purchases desc
limit 3;

-- Task-47: Display products whose sales are below average sales
select p.product_id, p.product_name, sum(od.quantity) as total_sales
from products p
join order_details od on od.Product_ID=p.Product_ID
group by p.Product_ID, p.Product_Name
having total_sales<(select avg(Quantity) from order_details);

-- Task-48: Display percentage contribution of each category in total sales
select c.category_name, SUM(od.quantity * od.price) AS category_sales,
round(sum(od.quantity*od.price)*100.0 /sum(sum(od.quantity*od.price)) over (),2) as percentage_contribution
from categories c
join products p on c.category_id=p.category_id
join order_details od on p.product_id=od.product_id
group by c.category_name
order by percentage_contribution desc;

-- Task-49: Find duplicate product prices
select price, count(*) as count from products 
group by price
having count>1;

-- Task-50: Find second highest product price
select max(price) as second_highest_price
from products
where price<(select max(price) from products);

-- Task-51: Display products with no stock available
select * from products
where Stock_Quantity=0;

-- Task-52: Generate customer purchase summary report
select c.customer_id, c.customer_name,
count(o.order_id) AS total_orders,
sum(o.total_amount) AS total_purchase,
avg(o.total_amount) AS avg_order_value
from customers c
join orders o on c.customer_id = o.customer_id
group by c.customer_id, c.customer_name;

use csm
create table customer1(Custm_ID int primary key, Cust_Name varchar(50), Address varchar(100));
create table product1(Product_ID int primary key, Product_Name varchar(50),
Description varchar(50), Price int);
create table order_details1(Order_ID int primary key, C_ID int,
foreign key(C_ID) references customer1(Custm_ID),
P_ID int, foreign key(P_ID) references product1(Product_ID), Quantity int, Order_date date);
insert into customer1 values(101, 'Srushti', 'Ahmedabad, Gujarat'),
(102, 'Jheel', 'Ahmedabad, Gujarat'),
(103, 'Urmi', 'Rajkot, Gujaart'),
(104, 'Siddhi', 'Hyderabad, Telangana'),
(105, 'Shilp', 'Mumbai, Maharastra'),
(106, 'Raj', 'Surat, Gujarat'),
(107, 'Zarni', 'Lachung, Sikkim'),
(108, 'Siddharth', 'Pune, Maharastra'),
(109, 'Varun', 'Udaipur, Rajasthan'),
(110, 'Priyanshi', 'Jamnagar, Gujarat'),
(111, 'Aarav', 'Ahmedabad, Gujarat');

insert into product1 values(1001, 'laptop', 'electronics', 76500),
(1002, 'sofa', 'homedecor', 37000),
(1003, 'tablet', 'electronics', 30000),
(1004, 'TV', 'appliances', 45000),
(1005, 'mobile', 'electronics', 59500);

insert into order_details1 values(1, 101, 1001, 1, '2026-04-01'),
(2, 102, 1002, 2, '2026-04-02'),
(3, 103, 1003, 1, '2026-04-03'),
(4, 104, 1003, 1, '2026-04-04'),
(5, 105, 1005, 3, '2026-04-05'),
(6, 106, 1001, 1, '2026-04-06'),
(7, 107, 1002, 2, '2026-04-07'),
(8, 108, 1003, 1, '2026-04-08'),
(9, 109, 1004, 2, '2026-04-09'),
(10, 110, 1005, 1, '2026-04-10'),
(11, 101, 1002, 1, '2026-04-11'),
(12, 102, 1003, 2, '2026-04-12'),
(13, 103, 1004, 1, '2026-04-13'),
(14, 104, 1005, 2, '2026-04-14'),
(15, 104, 1001, 1, '2026-04-15'),
(16, 106, 1002, 3, '2026-04-16'),
(17, 107, 1003, 1, '2026-04-17'),
(18, 107, 1004, 2, '2026-04-18'),
(19, 105, 1005, 1, '2026-04-19'),
(20, 110, 1001, 1, '2026-04-20');
update order_details1 set P_ID=1003 where Order_ID=1

select * from order_details1

select count(*), Product_Name from product1,order_details1
where product1.Product_ID=order_details1.P_ID group by Product_Name   ---- total no. of orders by each product name

select sum(Quantity),Cust_Name from customer1,order_details1
where customer1.Custm_ID=order_details1.C_ID group by Cust_Name;      ---- gives sum of quantity of all products ordered by each customer

select max(Quantity),Cust_Name from customer1,order_details1
where customer1.Custm_ID=order_details1.C_ID group by Cust_Name;      ---- max no. of quantity for a product ordered by each customer

select count(Quantity),Cust_Name from customer1,order_details1
where customer1.Custm_ID=order_details1.C_ID group by Cust_Name;      ---- no. of time a customer ordered

select avg(Quantity), Product_Name from product1,order_details1
where product1.Product_ID=order_details1.P_ID group by Product_Name;   ---- average of products ordered

----- fetch no of mobiles ordered
select count(*) from order_details1 left join product1 ON order_details1.P_ID=product1.Product_ID
where Product_Name = 'mobile';

----- fetch max quantity ordered
select max(Quantity) from order_details1;

------ fetch order quantity by each customer   ?????
select sum(Quantity),Cust_Name from order_details1 right join customer1 on order_details1.C_ID=customer1.Custm_ID
group by Cust_Name;

]----- fetch no of orders by each product
select count(order_details1.P_ID),Product_Name from product1 left join order_details1 on product1.Product_ID=order_details1.P_ID
group by Product_Name;

----- fetch avg of orders by each product
select avg(Quantity),Product_Name from product1 left join order_details1 on product1.Product_ID = order_details1.P_ID
group by Product_Name;

------find no of ordered product is more than 5
select count(order_details1.P_ID),Product_Name from product1 left join order_details1 on product1.Product_ID=order_details1.P_ID
group by Product_Name having count(order_details1.P_ID)>3;



------- find no of ordered customer who has give more than 2 time ordered
select count(order_details1.C_ID),Cust_Name from customer1,order_details1 where customer1.Custm_ID=order_details1.C_ID
group by Cust_Name having count(order_details1.C_ID)>2;

------- 
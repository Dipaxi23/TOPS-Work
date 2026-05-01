use csm
create table customer(Custm_ID int primary key, Cust_Name varchar(50), Address varchar(100));
create table product(Product_ID int primary key, Product_Name varchar(50),
Description varchar(50), Price int);
create table order_details(Order_ID int primary key, C_ID int,
foreign key(C_ID) references customer(Custm_ID),
P_ID int, foreign key(P_ID) references product(Product_ID), Quantity int, Order_date date);
insert into customer values(101, 'Srushti', 'Ahmedabad, Gujarat'),
(102, 'Jheel', 'Ahmedabad, Gujarat'),
(103, 'Urmi', 'Rajkot, Gujaart'),
(104, 'Siddhi', 'Hyderabad, Telangana'),
(105, 'Shilp', 'Mumbai, Maharastra'),
(106, 'Raj', 'Surat, Gujarat'),
(107, 'Zarni', 'Lachung, Sikkim'),
(108, 'Siddharth', 'Pune, Maharastra'),
(109, 'Varun', 'Udaipur, Rajasthan'),
(110, 'Priyanshi', 'Jamnagar, Gujarat'),
(111, 'Aarav', 'Ahmedabad, Gujarat'),
(112, 'Vivaan', 'Surat, Gujarat'),
(113, 'Aditi', 'Vadodara, Gujarat'),
(114, 'Vibha', 'Rajkot, Gujarat'),
(115, 'Arjun', 'Mumbai, Maharashtra'),
(116, 'Sai', 'Pune, Maharashtra'),
(117, 'Krishna', 'Jaipur, Rajasthan'),
(118, 'Ishaani', 'Udaipur, Rajasthan'),
(119, 'Kabir', 'Delhi'),
(120, 'Reyansh', 'Chandigarh');
insert into product values(1001, 'electronics', 'laptop', 76500),
(1002, 'homedecor', 'sofa', 37000),
(1003, 'electronics', 'tablet', 30000),
(1004, 'appliances', 'TV', 45000),
(1005, 'electronics', 'smart phone', 59800);
insert into order_details values(1, 101, 1001, 1, '2026-04-01'),
(2, 102, 1002, 2, '2026-04-02'),
(3, 103, 1003, 1, '2026-04-03'),
(4, 104, 1004, 1, '2026-04-04'),
(5, 105, 1005, 3, '2026-04-05'),
(6, 106, 1001, 1, '2026-04-06'),
(7, 107, 1002, 2, '2026-04-07'),
(8, 108, 1003, 1, '2026-04-08'),
(9, 109, 1004, 2, '2026-04-09'),
(10, 110, 1005, 1, '2026-04-10'),
(11, 111, 1002, 1, '2026-04-11'),
(12, 112, 1003, 2, '2026-04-12'),
(13, 113, 1004, 1, '2026-04-13'),
(14, 114, 1005, 2, '2026-04-14'),
(15, 115, 1001, 1, '2026-04-15'),
(16, 116, 1002, 3, '2026-04-16'),
(17, 117, 1003, 1, '2026-04-17'),
(18, 118, 1004, 2, '2026-04-18'),
(19, 119, 1005, 1, '2026-04-19'),
(20, 120, 1001, 1, '2026-04-20');
select * from customer
select * from product
select * from order_details
--- fetch order details with product name and customer name
select Order_ID,Cust_Name,Product_Name,Order_date from customer,product,order_details
where customer.Custm_ID=order_details.C_ID and product.Product_ID=order_details.P_ID
-- customer--orderdetails
-- product---orderdetails
insert into product values(1006, 'outdated', 'pager', 2000)

select Order_ID,Description,Quantity from product                                  ---- uses first table for left join -----
left join order_details
on product.Product_ID=order_details.P_ID

select Order_ID,Description,Quantity from order_details
right join product
on product.Product_ID=order_details.P_ID

select count(*), Cust_Name from customer,order_details
where customer.Custm_ID=order_details.C_ID group by Cust_Name                    ----gives no of orders

select sum(quantity), Cust_Name from customer,order_details
where customer.Custm_ID=order_details.C_ID group by Cust_Name                    -----gives total quantity







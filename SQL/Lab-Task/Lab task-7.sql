create table Numbers(id int primary key auto_increment, value decimal(5,2));

insert into Numbers(value) values (2.3), (4.7), (5.5), (9.9);

select value, ceil(value) from Numbers;

select value, floor(value) from Numbers;

select value, power(value, 2) from Numbers;


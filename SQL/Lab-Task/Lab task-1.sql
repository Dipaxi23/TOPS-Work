create table students(student_id int primary key, stu_name varchar(50), age int, grade varchar(5),
city varchar(50), marks int);

insert into students values(1,'sid',19,'A','ahmedabad',83),(2,'khushi',23,'B','gandhinagar',79),
(3,'jheel',20,'A','ahmedabad',87),(4,'srushti',20,'A','rajkot',90),
(5,'urmi',22,'B','ahmedabad',75),(6,'zarni',21,'C','surat',70);

---- Retrieve all records from the Students table ----
select * from students;

---- Display only the names and ages of students ----
select stu_name,age from students;

---- Show details of students who live in Ahmedabad ----
select * from students where city in('ahmedabad');

---- List all students with grade 'A' ----
select * from students where grade='A';

---- Find students who scored more than 80 marks ----
select * from students where marks>80;

---- Display students aged between 18 and 21 ----
select * from students where age between 18 and 21;

---- 
update students set city='mumbai' where student_id=4;

update students set city='mumbai' where student_id=6;

---- List students who are from Mumbai and have marks above 70 ----
select * from students where city='mumbai' and marks>70;

---- Find students whose names start with the letter 's' ----
select * from students where stu_name like 's%'

---- Display all students sorted by marks in descending order ----
select * from students order by marks desc;

---- List students sorted by age in ascending order ----
select * from students order by age asc;

---- Show students sorted by city and then by marks (highest first) ----
select * from students order by marks desc, city asc
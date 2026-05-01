create table Course(Course_ID int primary key, Course_Name varchar(50), Fees int);

create table Students1(Student_ID int primary key auto_increment, Student_Name varchar(50), City varchar(50),
Contact_No bigint);

create table Enrollment_Details(Enroll_ID int primary key, C_ID int, foreign key(C_ID) references Course(Course_ID),
S_ID int, foreign key(S_ID) references Students1(Student_ID), Enrollment_Date date);

insert Course values(201, 'Data Science', 50000),
(202, 'Web Development', 40000),
(203, 'Machine Learning', 60000),
(204, 'Cyber Security', 45000),
(205, 'Cloud Computing', 55000),
(206, 'Artificial Intelligence', 65000);

insert into Students1(Student_Name, City, Contact_No) values('Amita', 'Surat', 9876543210),
('Neha', 'Ahmedabad', 9123456780),
('Ravi', 'Rajkot', 9988776655),
('Priyanka', 'Vadodara', 9871234560),
('Karan', 'Mumbai', 9765432109),
('Snehal', 'Pune', 9654321098);

insert into Enrollment_Details values(1, 201, 1, '2026-04-01'),
(2, 202, 2, '2026-04-02'),
(3, 203, 3, '2026-04-03'),
(4, 204, 4, '2026-04-04'),
(5, 205, 5, '2026-04-05'),
(6, 206, 6, '2026-04-06');

update Enrollment_Details set C_ID=204 where Enroll_ID=3;
update Enrollment_Details set C_ID=201 where Enroll_ID=2;


----- no of students enrolled in each course
select count(S_ID),Course_Name from Enrollment_Details left join Course on Enrollment_Details.C_ID=Course.Course_ID
group by Course_Name;

------ total fees collected per course
select sum(Fees),Course_Name from Enrollment_Details left join Course on Enrollment_Details.C_ID = Course.Course_ID
group by Course_Name;

------ total fees collected
select sum(Fees) from Enrollment_Details join Course on Enrollment_Details.C_ID=Course.Course_ID

------ total number of enrollments
select count(*) from Enrollment_Details;

------ Count students in each city
select City,count(*) from Students1 group by City;

------- max course fees
select max(fees) from Course;

------- min course fees
select min(fees) from Course;

-------- average course fees
select avg(fees) from Course;

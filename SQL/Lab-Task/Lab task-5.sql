create table Dept(Dept_ID int primary key, D_Name varchar(50));

create table Emp(E_ID int primary key, D_ID int, foreign key(D_ID) references Dept(Dept_ID),
E_Name varchar(50), Email varchar(50), Salary int, Join_Date date);

insert into Dept values(1, 'HR'),
(2, 'Finance'),
(3, 'IT'),
(4, 'Marketing'),
(5, 'Sales');

insert into Emp values(101, 1, 'Amit Shah', 'amit.shah@gmail.com', 45000, '2022-01-15'),
(102, 2, 'Neha Patel', 'neha.patel@gmail.com', 50000, '2021-03-20'),
(103, 3, 'Raj Mehta', 'raj.mehta@gmail.com', 60000, '2020-07-10'),
(104, 4, 'Priya Desai', 'priya.desai@gmail.com', 55000, '2022-11-05'),
(105, 5, 'Karan Joshi', 'karan.joshi@gmail.com', 48000, '2023-02-18'),
(106, 1, 'Sneha Iyer', 'sneha.iyer@gmail.com', 62000, '2019-06-25'),
(107, 1, 'Vikas Singh', 'vikas.singh@gmail.com', 53000, '2021-09-14'),
(108, 2, 'Riya Kapoor', 'riya.kapoor@gmail.com', 47000, '2022-04-30'),
(109, 3, 'Arjun Nair', 'arjun.nair@gmail.com', 70000, '2018-12-12'),
(110, 4, 'Pooja Verma', 'pooja.verma@gmail.com', 52000, '2020-08-19'),
(111, 4, 'Manish Gupta', 'manish.gupta@gmail.com', 58000, '2021-01-01'),
(112, 3, 'Anjali Roy', 'anjali.roy@gmail.com', 49000, '2023-03-11'),
(113, 5, 'Rohit Sharma', 'rohit.sharma@gmail.com', 65000, '2019-10-07'),
(114, 4, 'Kavita Reddy', 'kavita.reddy@gmail.com', 54000, '2022-06-22'),
(115, 5, 'Deepak Yadav', 'deepak.yadav@gmail.com', 51000, '2023-07-09');

-------- fetch employee details 
select *  from emp;

------ fetch emp details with dept E_Name
select E_ID,D_Name,e_name,email,salary,join_date from emp,dept
where emp.d_id=dept.Dept_ID;

------ count no of employees in each dept
select count(E_ID) as 'No of EMp', D_Name from Emp,Dept
where Emp.D_ID=Dept.Dept_ID
group by D_Name;

------- fetch dept name whose has more than 4 employees
select count(*) as 'No of EMp', D_Name from Emp,Dept
where Emp.D_ID=Dept.Dept_ID
group by D_Name having count(*)>=4;

------- avg salary of employees in each dept
select avg(Salary) as 'Avg of EMp', D_Name from Emp,Dept
where Emp.D_ID=Dept.Dept_ID
group by D_Name;

------ get employees in IT department
select E_Name,email,salary,join_date from emp join dept on emp.D_ID=Dept.dept_ID
where D_Name='IT';

------- total salary of each employee
select sum(salary) from Emp

------ avg salary of employees
select avg(salary) from emp

------highest salary from the employees
select max(salary) from emp

-------lowest salary from the employees
select min(salary) from emp

-----highest salary from each department
select max(salary),D_Name from emp join dept on emp.D_ID=dept.Dept_ID
group by D_Name;

------ lowest salary fromm each department
select min(salary),D_Name from emp join dept on emp.D_ID=dept.Dept_ID
group by D_Name;

-----show employees who joined between 2019-2021
select D_Name,E_Name,Join_Date from emp join dept on emp.D_ID=Dept.Dept_ID
where Join_Date between '2019-01-01' and '2021-12-31'
order by D_Name

------ show employees whose salary is between 25000 to 50000
select D_Name,E_Name,Salary from emp join dept on emp.D_ID=Dept.Dept_ID
where Salary between 40000 and 53000
order by D_Name;

----- show department with avg salary more than 55000
select avg(salary),D_Name from emp,dept
where emp.D_ID=Dept.Dept_ID
group by D_Name having avg(salary)>55000;

----- show department with total salary more than  2 lakhs
select sum(salary),D_Name from emp,dept
where emp.D_ID=Dept.Dept_ID
group by D_Name having sum(salary)>200000;

--------- fetch top 3 highest pay employees
select E_ID,E_Name,Salary from emp order by salary desc limit 3


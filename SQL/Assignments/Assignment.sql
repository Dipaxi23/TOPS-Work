create database MarketCo
use MarketCo

create table Company(CompanyID int primary key, CompanyName varchar(45),
Street varchar(45), City varchar(45), State varchar(20), Zip varchar(10));


---- 1)  Statement to create the Contact table ----
create table Contact(ContactID int primary key,
CompanyID int, foreign key(CompanyID) references Company(CompanyID), FirstName varchar(45),
LastName varchar(45), Street varchar(45), City varchar(45), State varchar(2), Zip varchar(45),
IsMain boolean, Email varchar(45), Phone varchar(12));


---- 2) Statement to create the Employee table ----
create table Employee(EmployeeID int primary key, FirstName varchar(45),
LastName varchar(45), Salary decimal(10,2), HireDate date,
JobTitle varchar(25), Email varchar(45), Phone varchar(12));


---- 3) Statement to create the ContactEmployee table ----
create table ContactEmployee(ContactEmployeeID int primary key, ContactID int,
foreign key(ContactID) references Contact(ContactID), EmployeeID int,
foreign key(EmployeeID) references Employee(EmployeeID), 
ContactDate date, Description varchar(100));

insert into Company values
(1,'MarketCo','123 Market St','San Francisco','CA','94105'),
(2,'Toll Brothers','250 Gibraltar Rd','Horsham','PA','19044'),
(3,'Urban Outfitters, Inc.','5000 S Broad St','Philadelphia','PA','19112'),
(4,'BlueTech Solutions','800 Tech Ave','San Jose','CA','95110'),
(5,'GreenFields Agriculture','92 Farm Lane','Des Moines','IA','50309');

insert into Contact values
(1,2,'Dianne','Connor','250 Gibraltar Rd','Horsham','PA','19044',TRUE,'dconnor@tollbrothers.com','2155551111'),
(2,2,'Michael','Reed','250 Gibraltar Rd','Horsham','PA','19044',FALSE,'mreed@tollbrothers.com','2155552222'),
(3,3,'Sarah','Young','5000 S Broad St','Philadelphia','PA','19112',TRUE,'syoung@urban.com','2155553333'),
(4,4,'Kevin','Nguyen','800 Tech Ave','San Jose','CA','95110',TRUE,'knguyen@bluetech.com','4085551111'),
(5,5,'Laura','Martinez','92 Farm Lane','Des Moines','IA','50309',TRUE,'lmartinez@greenfields.com','5155552222');

insert into Employee values
(1,'Lesley','Bland',72000,'2022-06-15','Sales Rep','lesley.bland@marketco.com','2155550000'),
(2,'Jack','Lee',68000,'2023-02-20','Account Manager','jack.lee@marketco.com','2155554444'),
(3,'Nina','Patel',80000,'2021-09-01','Regional Manager','nina.patel@marketco.com','4155555555'),
(4,'Carlos','Gomez',64000,'2023-01-10','Sales Rep','carlos.gomez@marketco.com','3055551111'),
(5,'Emily','Chen',90000,'2020-11-25','Director of Sales','emily.chen@marketco.com','6505552222');

insert into ContactEmployee values
(1,1,2,'2024-01-10','Initial consultation'),
(2,2,1,'2024-02-15','Follow-up call'),
(3,1,1,'2024-03-05','Sales discussion'),
(4,2,4,'2024-03-18','Product introduction'),
(5,3,3,'2024-03-20','Partnership meeting'),
(6,4,5,'2024-03-25','Technical demo'),
(7,5,2,'2024-04-01','Agriculture deal discussion');


---- 4) In the Employee table, the statement that changes Lesley Bland’s phone number 
to 215-555-8800 ----
Query:
update employee set Phone=2155558800 where EmployeeID=1;


---- 5) In the Company table, the statement that changes the name of “Urban 
Outfitters, Inc.” to “Urban Outfitters” ----
Query:
update company set CompanyName='Urban Outfitters' where CompanyID=3;


---- 6)  In ContactEmployee table, the statement that removes Dianne Connor’s contact 
event with Jack Lee (one statement) ----
Query:
delete from ContactEmployee where ContactEmployeeID=1;


---- 7)  Write the SQL SELECT query that displays the names of the employees that 
have contacted Toll Brothers (one statement). Run the SQL SELECT query in 
MySQL Workbench. Copy the results below as well ----
Query:
select Employee.EmployeeID, concat(Employee.FirstName, ' ', Employee.LastName) as 'FUll Name'
from Employee
join ContactEmployee on Employee.EmployeeID=ContactEmployee.EmployeeID
join Contact on ContactEmployee.ContactID=Contact.ContactID
join Company on Company.CompanyID=Contact.CompanyID
where CompanyName='Toll Brothers';
Result:
# EmployeeID, FUll Name
'1', 'Lesley Bland'
'1', 'Lesley Bland'
'4', 'Carlos Gomez'


---- 8) What is the significance of “%” and “_” operators in the LIKE statement? ----
------> The sign '%' is used for zero, one or more characters when trying to find a particular letter
or a set of letters from a name or anything strings that has characters inside it.
------> It is used with 'like' operator. This operator is used to find matches or patterns in a string.

------>For example, 
-------if we have to find a first name that starts with letter C,
select * from employee where FirstName like 'C%';

-------if we have to find a last name that ends with letter l,
select * from employee where LastName like '%l';

-------if we have to find a first name that has letter a in the name,
select * from employee where FirstName like '%a%';

------>The sign '_' is used to find exactly one character from a string.
------>When you know length or a character position (like 1st or 3rd from the start) from the string 
but can not remember the whole string then underscore is used.
------>This too is used with like operator.

------>for example,
-------if we have to find a name that has 5 letters
select * from employee where FirstName like '_____';

-------if we have to find a person whose name has 'i' in it at 2nd position
and that the name has 4 letters 
select * from employee where FirstName like '_i__';


---- 9) Explain normalization in the context of databases. 
------> Normalization is used to ceate a database that is free from duplicate
data that exists in different tables in a database. 
------> Normalization helps in efficiency and reduces update, insert, delete problems.
------> It also makes database free of any data inconsistency. If by chance we add
different values to same data it can be a problem while trying to fetch the data. 
Therefore using normalization, there is no problem of different values in same field.


---- 10) What does a join in MySQL mean?
-------> A join lets you merge the same data across tables that has same columns between them.
-------> It uses condition like 'on' to merge the data from different tables with same columns. 


---- 11) What do you understand about DDL, DCL, and DML in MySQL? 
-------> DDL= Data Definition Language (DDL) is used to define and modify the structure of the database.
         It uses commands like,
         create= to create a table or database, syntax=== create table <table-name>
                                                          create database <database-name>
         alter= to modify the table, syntax=== alter table <table-name> add <column-name> <data-type>
                                               alter table <table-name> modify <column-name> <new data-type>
                                               alter table <table-name> drop <column-name>
		 drop= to delete a table or database, syntax=== drop database <database-name>
                                                        drop table <table-name>
-------> DML= Data Manipulation Language (DML) is used to manipulate or change the values in your table.
         DDL is used to change the tables whereas DML is used to change the values in the tables.
         It uses commands like,
         insert= to add new rows of data in table, syntax=== insert into <table-name> values <value1, value2>
                                                             insert into <table-name> (column1, column2) values (value1, value2)
         update= to change already existing data in the table, syntax=== update <table-name> set <column-name2>=<value3> where condition
         delete= to delete a row of data from the table, syntax=== delete from <table-name> where condition
                                                                   delete from <table-name> [deletes all data from the table]
------->  DCL-


---- 12) What is the role of the MySQL JOIN clause in a query, and what are some 
common types of joins? 
-------> Join is used to combine data across the tables with same columns in them with 'on' condition.
-------> Join helps in normalization of the data.
-------> Join helps to removes the need to store duplicate data.
-------> syntax=== select <columns> from table1 join table2 on table1.common_column=table2.common_column

-------> There are 4 types of join. 
--------1)Inner join=This join shows the only rows that has same values in them.
          syntax=== select * from table1 inner join table2 on table1.column1=table2.column1
--------2)Left join=This join shows all rows from the left table and only return matching rows from the right table.
          syntax=== select * from table1 left join table2 on table1.column1=table2.column1
--------3)Right join=This join shows all rows from the right table and only return matching rows from the left table.
          syntax=== select * from table1 right join table2 on table1.column1=table2.column1
--------4)Full join=This join shows all possible matches from the mentioned table.
          syntax=== select * from table1 full join table2.
          






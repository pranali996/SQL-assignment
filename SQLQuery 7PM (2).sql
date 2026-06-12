create database SQL_7PM;
create database Skillected;

use master;
go
drop database Mangesh;

use SQL_7PM;

create table Employee1(Emp_id int,
Emp_full_name varchar(100),
Emp_no varchar(15),
Emp_email_id varchar(150));

select * from Employee1;

/*
int ==> 2345544554
bigint ==> 892327938742948
varchar(15) ==> +91 8787878776
*/
use SQL_7PM;
select * from Employee;


insert into Employee1 values (101,'Mangesh Sambare',8989898989,'sambamangesh889@gmail.com');

insert into Employee1 values (102,'Mayank',73497234,'samayahesh889@gmail.com'),
(103,'Raja sir',839749829,'adfad@gmail.com');


select * from Employee1;

create database Mangesh;

create table Customer12 (cust_id int,
cust_name varchar(20),
cust_email varchar(50),
cust_mob_no varchar(15),
DOB date);

insert into Customer12 values (101,'Mayank','Mayank@gmail.com',7878787878,'2002-12-20');
select * from customer12;

use SQL_7PM;
drop table Customer;

create table customer(
cust_id int primary key, -- do not allow duplicates and null values
full_name varchar(50),
Acc_no bigint unique, -- large number
Balance decimal(10,2), -- 50000.00
phone_no varchar(15),
Email_id varchar(20),
DOB date,
Account_open_time datetime, -- Show me date  + time
Addres varchar(max),
KYC bit -- boolean
);

insert into customer values
(2,'Rahul Sharma',782738392738,45000.50,7878787878,'rahulShar@gmail.com',
'1995-02-20',getdate(),'Nagpur Maharashtra',1);

insert into customer values
(12,'ABC',78736783763225,45000.50,262626262,'rahulShar@gmail.com',
'1995-02-20',getdate(),'Nagpur Maharashtra',1);
use SQL_7PM
select * from customer;


INSERT INTO Customer VALUES
(3, 'Rahul Sharma', 123456789012, 250000.50, '9876543210', 'rahul@gmail.com', '1998-06-15', GETDATE(), 'Nagpur, Maharashtra', 1),
(4, 'Priya Verma', 223456789013, 15000.75, '9123456780', 'priya@gmail.com', '1995-02-20', GETDATE(), 'Pune, Maharashtra', 1),
(5, 'Amit Patil', 323456789014, 5000.00, '9988776655', 'amit@gmail.com', '2000-09-10', GETDATE(), 'Mumbai, Maharashtra', 0),
(6, 'Sneha Joshi', 423456789015, 75000.25, '8877665544', 'sneha@gmail.com', '1997-12-05', GETDATE(), 'Nagpur, Maharashtra', 1),
(7, 'Rohit Kumar', 523456789016, 120000.00, '7766554433', 'rohit@gmail.com', '1993-03-18', GETDATE(), 'Delhi', 1),
(8, 'Pooja Singh', 623456789017, 30000.80, '6655443322', 'pooja@gmail.com', '1999-07-25', GETDATE(), 'Bhopal', 0),
(9, 'Vikas Gupta', 723456789018, 98000.60, '5544332211', 'vikas@gmail.com', '1996-11-11', GETDATE(), 'Jaipur', 1),
(10, 'Neha Jain', 823456789019, 450000.00, '4433221100', 'neha@gmail.com', '1994-08-30', GETDATE(), 'Indore', 1);


select * from customer;

-- SQL COMMANDS

/*
DDL = Data Defination Language
DQL = Data Query Language
DML = Data Manipulation Language
TCL = Transaction control Language
DCL = Data Control Language
*/

-- DDL == Data Defination Language
/*
1) create
2) alter
3) drop
4) truncate
5) comment
6)rename
*/


select * from Employee1;  -- All data show 

-- alter
alter table employee1
add Addres varchar(max);

select * from Employee1;

alter table employee1
drop column Addres;

select * from Employee1;
select * from customer;

-- rename
exec sp_rename 'Employee1','Employee_data';

select * from Employee1;

select * from Employee_data;

exec sp_rename 'Employee_data.Emp_full_name','Emp_name','column';

select * from Employee_data;

use SQL_7PM;


select * from Employee_data;

truncate table employee_data;

select * from Employee_data;

insert into Employee_data values 
(101,'Mangesh Sambare',8989898989,'sambamangesh889@gmail.com'),
(102,'Mayank',73497234,'samayahesh889@gmail.com'),
(103,'Raja sir',839749829,'adfad@gmail.com');

select * from Employee_data;

drop table Employee_data;

select * from Employee_data;

-- DQL = Data Query Language
/*
select 
from
where
group by
having
order by
distinct
top 5 row() (=limit)
*/
use SQL_7PM;

select * from customer;

select full_name from customer;

select  full_name,Balance,kyc from customer;

select * from customer
where full_name = 'abc';

select * from customer;

select * from customer
where KYC = 1;

select * from customer
where KYC = 0;

select * from customer;

select * from customer
where Balance > 200000;

select full_name,Balance,DOB,KYC from customer
where Balance > 200000;

select * from customer
where Balance > 29000;

/*
    and                        or
True and True == True     TRue or TRue == TRue
True and False == FAlse   True or False == True
False and True == False   False or TRue == True
False and FAlse == False  False or False == False
*/

select * from customer
where Balance > 29000 and kyc = 0;


select * from customer
where Balance > 29000 or kyc = 0;

select * from customer
where Balance between 30000 and 150000;

select * from customer
where Balance >30000 or Balance < 150000;

select * from customer
where Balance >30000 and Balance < 150000;

select * from customer
order by Balance desc;

select * from customer
order by Balance asc;

select top(1) * from customer
order by Balance desc;

select top(2) * from customer
order by Balance desc;

select * from customer
order by Balance desc
offset (2) rows;

select * from customer
order by Balance desc
offset (2) rows;


create database SQL_7PM;

use SQL_7PM;

create table Employee(Emp_id int,
Emp_full_name varchar(100),
Emp_no varchar(15),
Emp_email_id varchar(150));

select * from Employee;

/*
int ==> 2345
bigint ==> 892327938742948
varchar(15) ==> +91 8787878776
*/

select * from Employee;


insert into Employee values (101,'Mangesh Sambare',8989898989,'sambamangesh889@gmail.com');

insert into Employee values (102,'Mayank',73497234,'samayahesh889@gmail.com'),
(103,'Raja sir',839749829,'adfad@gmail.com');


select * from Employee;

create database Mangesh;

create table Customer (cust_id int,
cust_name varchar(20),
cust_email varchar(50),
cust_mob_no varchar(15),
DOB date);

insert into Customer values (101,'Mayank','Mayank@gmail.com',7878787878,'2/02/2002');

use SQL_7PM;
drop table Customer;

create table customer(
cust_id int primary key, -- do not allow duplicates and null values
full_name varchar(50),
Acc_no bigint unique, -- large number
Balance decimal(10,2),
phone_no varchar(15),
Email_id varchar(20),
DOB date,
Account_open_time datetime,
Addres varchar(max),
KYC bit -- boolean
);


insert into customer values
(2,'Rahul Sharma',782738392738,45000.50,7878787878,'rahulShar@gmail.com',
'1995-02-20',getdate(),'Nagpur Maharashtra',1);

select * from customer;








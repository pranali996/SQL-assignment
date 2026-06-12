create database employeeDB;
use employeeDB;

# create employee table

create table employee (
emp_id int primary key,
emp_name varchar(100),
department varchar(100),
salary decimal(10,2),
join_date date
);

# insert data
  
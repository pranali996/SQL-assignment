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

insert into employee values
(101, 'pranali', 'HR', 30000, '2024-01-15'),
(102, 'monali', 'IT', 45000, '2023-06-20'),
(103, 'sonali','finance',40000, '2022-11-10'),
(104, 'amit', 'HR', 50000, '2021-12-2'),
(105, 'rahul', 'IT', 55000, '2020-03-3'),
(106, 'priya', 'finance', 60000, '2019-04-4');

# display all employees
select * from employee;

# employee from IT department
select * from employee
where department = 'IT';

# Highest salary
select max(salary) as highest_salary
from employee;

# Average salary
select avg(salary) as average_salary
from employee;

# sort by salary
select * from employee
order by salary desc;

# Update salary
update employee
set salary = 65000
where emp_id = 104;

# Delete employee
delete from employee
where emp_id =105;








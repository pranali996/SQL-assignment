create database BankingDB;
use BankingDB;

CUSTOMER TABLE
create table customer (
customer_ID int primary key,
customer_name varchar(100),
Address varchar(100),
Phone_No varchar(50),
Account_Type varchar(50)
);

ACCOUNT TABLE
create table account (
 Account_ID int primary key,
 Customer_ID int,
 Balance Decimal(10,2),
 Open_Date Date,
 foreign key (customer_ID)
 references customer(customer_ID)
 );

 TRANSACTION TABLE
 create table Transactions (
 Transaction_ID int primary key,
 AccountID int,
 Transaction_Type varchar(50),
 Amount Decimal(10,2),
 Transaction_Date Date,
 foreign key (AccountID)
 references Account(Account_ID)
 );

 LOAN TABLE
 create table loan (
 Loan_ID int primary key,
 Customer_ID int,
 Loan_Amount Decimal(10,2),
 Loan_Type varchar(50),
 foreign key (Customer_ID)
 references Customer(customer_ID)
 );

 insert into customer 
 values (1,'Rahul sharma','pune','9876543210','saving'),
        (2,'Sneha patil', 'mumbai','9988765432','current'),
        (3,'Aman verma','Nagpur','897654328','saving'),
        (4,'priya singh','delhi','789067890','current'),
        (5,'karan mehta','Hydrabad','678956903','saving'),
        (6,'Neha joshi','Pune','786908978','current'),
        (7,'Rohit kumar','Bangalore','678567880','saving'),
        (8,'pooja sharma','Chennai','786890789','saving'),
        (9,'vivek shah','Ahemdabad','678990567','current'),
        (10,'Anjali verma','jaipur','678856780','saving');

 insert into Account 
 values (1001,1,'55000','2025-01-10'),
        (1002,2,'120000','2024-11-20'),
        (1003,3,'35000','2025-03-15'),
        (1004,4,'98000','2025-02-01'),
        (1005,5,'75000','2025-01-25'),
        (1006,6,'150000','2024-12-18'),
        (1007,7,'42000','2025-04-10'),
        (1008,8,'88000','2025-05-05'),
        (1009,9,'200000','2024-09-30'),
        (1010,10,'67000','2025-03-22');

insert into transactions
values (1,1001,'Deposit',10000,'2026-06-01'),
       (2,1001,'Withdraw',5000,'2026-06-02'),
       (3,1002,'Deposit',25000,'2026-06-02'),
       (4,1003,'Withdraw',3000,'2026-06-03'),
       (5,1004,'Deposit',15000,'2026-06-04'),
       (6,1005,'Deposit',12000,'2026-06-05'),
       (7,1006,'Withdraw',7000,'2026-06-05'),
       (8,1007,'Deposit',9000,'2026-06-06'),
       (9,1008,'Withdraw',4500,'2026-06-06'),
       (10,1009,'Deposit',30000,'2026-06-07'),
       (11,1010,'Withdraw',2000,'2026-06-07'),
       (12,1002,'Withdraw',10000,'2026-06-08'),
       (13,1003,'Deposite',5000,'2026-06-08'),
       (14,1005,'Withdraw',3500,'2026-06-09'),
       (15,1007,'Deposit',15000,'2026-06-09');

insert into Loan
values (1,1,500000,'Home loan'),
       (2,2,200000,'Car loan'),
       (3,4,100000,'Education loan'),
       (4,5,300000,'Business loan'),
       (5,6,150000,'Persnol loan'),
       (6,8,150000,'Home loan'),
       (7,9,400000,'Business loan'),
       (8,10,180000,'Car loan');

show data

select * from customer;
select * from account;
select * from Transactions;
select * from Loan;

1.Display customer names,account number,and account balance using INNER JOIN

select c.customer_name, a.Account_ID,
a.Balance
from customer c
inner join account a
on c.customer_ID = a.customer_ID;

2.Find the top 3 customers with the highest account balance

select top 3 c.customer_name, a.Account_ID,
a.Balance
from customer c
inner join account a
on c.customer_ID = a.customer_ID
order by a.Balance desc

3.show all customers who have taken loan along with loan amount and loan type.

select c.customer_name, l.loan_Amount, l.loan_Type
from customer c
inner join loan l
on c.customer_ID = l.customer_ID;

4.Find the total deposited amount and total withdrawn amount separately

select sum(case
           when transaction_type = 
     'Deposit'
           then Amount 
           else 0
         end) as totaldepositeamount,
         sum(case
              when transaction_type = 
     'withdrawal'
               then amount
               else 0
               end) as totalwithdrawalamount
               from transactions;

5. Display customer-wise total transaction amount using GROUP BY

select c.customer_name,
sum(T.Amount) as
totaltransactionamount
from customer c
inner join account a
 on C.customer_ID = A.customer_ID
 inner join transactions T
 ON A.account_ID = T.accountID
 group by c.customer_name;

6.Find customer whose balance are greater than the average bank balance.

select c.customer_name, a.account_ID,
a.Balance
from customer c
inner join account a
on c.customer_ID = a.customer_ID
WHERE A.Balance >
(select avg(balance) from account);

7.show the highest transaction amount performed by each customer

select c.customer_name, max(T.Amount) as
highesttransactionamount
from customer c
inner join account a
on c.customer_ID = A.customer_ID
inner join transactions T
on a.account_id = t.accountID
group by c.customer_name;

8.Display all customer who have not taken any loan using LEFT JOIN

select c.customer_name, L.loan_ID, L.loan_amount
from customer c
left join loan l
on c.customer_ID = L.customer_ID
WHERE L.loan_ID IS NULL;

9.Find the total number of transaction performed by each customer

select c.customer_name, count(t.Transaction_ID) AS
totaltransactions
from customer c
inner join account a
on C.customer_ID = A.customer_ID
inner join transactions t
on a.account_ID= t.accountID
group by c.customer_name;

10.Rank customer based on their account balances using rank() window function

select c.customer_id, c.customer_name, a.account_id, a.balance,
rank() OVER (order by a.balance desc)
AS balance_rank
from customer c
join account a
on c.customer_ID = a.customer_ID;

11.Display dense ranking of customers according to balance using DENSE_RANK()

select c.customer_ID, C.customer_name, a.account_ID, a.balance,
dense_rank() over (order by a.balance desc) AS dense_balance_rank
from customer c
join account a
on c.customer_ID = a.customer_ID;

12.Show previous transaction amount using LAG () function

SELECT
t.Transaction_ID,
t.AccountID,
t.Transaction_Type,
t.Amount, 
t.Transaction_Date,
LAG(T.Amount) over (
partition by t.AccountID
order by t.Transaction_Date
) as previous_transaction_amount 
from [transactions] t;

select * from transactions;

select column_name
from information_schema.columns
where table_name = 'transactions';

13.Show next transaction amount using LEAD() function

select
t.Transaction_ID,
t.AccountID,
t.Transaction_type,
t.Amount,
t.Transaction_Date,
lead(t.Amount, 1) over (
partition by t.AccountID
order by Transaction_Date
) as next_Transaction_Amount
from [transactions] t;

14.calculate running total of transactions amount using sum() over()

select
t.Transaction_ID,
t.AccountID,
t.Transaction_type,
t.Amount,
t.Transaction_Date,
sum(t.Amount) over (
partition by t.AccountID
order by Transaction_Date
rows between unbounded preceding and current row
) as runnning_Total
from [transactions] t;

15.Find the second highest account balance using subquery or window function
# subquery

select max(Balance) as
second_Highest_Balance
from Account
where Balance < (
 select max(Balance)
 from Account
 );

 # window function

 select Account_ID, Customer_ID, Balance
 from (
 select
  Account_ID,
  Customer_ID,
  Balance,
  dense_rank() over (order by balance desc) as rnk
  from Account
  ) t
  where rnk =2;

  16. Find customers who performed more than 2 transactions.

  select 
  c.Customer_ID,
  c.customer_name,
  COUNT(t.Transaction_ID) AS
  total_Transactions
  from Customer c
  JOIN Account a
  on c.Customer_ID = a.Customer_ID
  join transactions t
  on a.account_ID = t.accountID
  GROUP BY c.Customer_ID,
           c.customer_name
  HAVING
  COUNT(t.Transaction_ID) > 2;

  17.Display customer wise minimum and maximum transaction amount

  select C.customer_ID, C.customer_name,
  min(t.Amount) as
  min_Transaction_amount,
  max(t.Amount) as
  max_Transaction_amount
  from customer c
  join account a
  on c.customer_ID = a.customer_ID
  join transactions t
  on a.account_ID = t.accountID
  GROUP BY
  c.customer_ID,
  c.customer_name;




         













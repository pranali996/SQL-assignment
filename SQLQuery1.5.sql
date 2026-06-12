create database BankingDB;
use BankingDB;

CUSTOMERS TABLE
create table customer (
   customer_ID int primary key,
   customer_Name varchar(100),
   Address varchar(200),
   Phone_No varchar(20),
   Account_Type varchar(50)
   );

ACCOUNT TABLE
create table account (
Account_ID int primary key,
Customer_ID int,
Balance Decimal(10,2),
Open_Date Date,
Foreign key(customerID)
References customer(customerID)
);

TRANSACTION TABLE
create table transactions (
transactions_ID int primary key,
AccountID int,
Transaction_Type varchar(50),
Amount Decimal(10,2),
Transaction_Date Date,
Foreign key  (AccountID)
References Account(AccountID)
);

LOAN TABLE
create table loan (
loan_ID int primary key,
CustomerID int,
loan_amount decimal(10,2),
loan_type varchar(50),
Foreign key (customerID)
References customer(customerID)
);

insert into customer
values(1,'Rahul sharma','pune','9876543210'



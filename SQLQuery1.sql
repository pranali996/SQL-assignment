# create database

create database HospitalDB;

USE HospitalDB;

# create patients table

create table patients (
     patient_ID int primary key,
     patient_name varchar(100),
     Gender varchar(50),
     Age int,
     phone varchar(20),
     Address varchar(200)
);
drop table patients;
select * from patients;
drop table if exists appointments;
drop table if exists bills;
drop table if exists patients;

# create doctors table

create table doctor_master (
     Doctor_ID int primary key,
     Doctor_Name varchar(100),
     Specialization varchar(50)
);
select * from doctor_master;
# create Appointments table

create table appointments (
      Appointment_id int primary key,
      Patient_ID int,
      Doctor_ID int,
      Appointment_Date Date,
      Foreign key (Patient_ID) references
    Patients(Patient_ID),
    foreign key (Doctor_ID) references
    Doctors(Doctor_ID)
);
select * from appointments;
# create bill table

create table bill (
    bill_ID int primary key,
    patient_ID int,
    amount decimal(10,2),
    payment_status varchar(50),
    foreign key (patient_ID) references
    patients(patient_ID)
);
show tables;

# Insert sample data

Insert into patients values
(1,'pranali','female',24,'987654320'),
(2,'monali','female',25,'987065780'),
(3,'sonali','female',23,'976545679'),
(4,'amit','male',34,'890765480');

 Insert into Doctors values
 (101,'Dr.sharma','cardiology'),
 (102,'Dr.gupta','neurology'),
 (103,'Dr.khan','orthopedic'),
 (104,'Dr.rahate','cardiology');

 Insert into appointments values
 (1001,1,101,'2025-04-02'),
 (1002,2,102,'2024-03-01'),
 (1003,3,103,'2023-02-03'),
 (1004,4,104,'2022-03-08');

 Insert into Bill values
 (501,1,5000,'paid'),
 (502,2,3000,'pending'),
 (503,3,4000,'paid'),
 (504,4,6000,'pending');

# show patient with Doctor details

select p.patient_name,
       d.doctor_name,
       d.specialization,
       a.appointment_date
from patients p
inner join appointments a
on p.patient_ID = a.patient_ID
inner join Doctors d
on a.Doctor_ID = d.Doctor_ID;

select * from information_schema.tables;










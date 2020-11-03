--creates new database
create database address_book_service;
--gives the names of all the databases
SELECT name FROM sys.databases;
--selects the payroll_service database for use
use address_book_service;

--creates table named address_book in address_book_service database
create table address_book
(
FirstName varchar(50) not null,
LastName varchar(50) not null,
Address varchar(150),
City varchar(50),
State varchar(50),
Zipcode varchar(6),
PhoneNumber varchar(15) not null,
Email varchar(30) not null
);
--gives the info about the table named address_book
select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'address_book';
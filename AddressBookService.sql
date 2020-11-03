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

--Insert datas in table address_book
insert into address_book values
('Rakesh','Mehta','Lane 4','Mumbai','Maharashtra','489856','9999999999','rk123@gmail.com'),
('Rahul','Kumar','K90/78 Allahabad','Allahabad','Uttar Pradesh','451207','8888888888','rahul777@gmail.com'),
('Rekhi','Sharma','Street 56','Ajmer','Rajasthan','123456','8558585851','rekha@gmail.com');
--retrives all datas in address_book
select* from address_book;
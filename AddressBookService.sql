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
--creates FirstName and LastName as Composite Primary key 
ALTER TABLE address_book
   ADD CONSTRAINT PK_Name PRIMARY KEY CLUSTERED (FirstName,LastName);
--gives the info about the table named address_book
select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'address_book';

--Insert datas in table address_book
insert into address_book values
('Rakesh','Mehta','Lane 4','Mumbai','Maharashtra','489856','9999999999','rk123@gmail.com'),
('Rahul','Kumar','K90/78 Allahabad','Allahabad','Uttar Pradesh','451207','8888888888','rahul777@gmail.com'),
('Rekhi','Sharma','Street 56','Ajmer','Rajasthan','123456','8558585851','rekha@gmail.com');
--retrives all datas in address_book
select* from address_book;

--edits address of Rahul
update address_book
set Address = 'J90/54 Allahabad' where FirstName = 'Rahul';
--retrives all datas in address_book
select* from address_book;

--deletes contact of person named Rekhi
delete address_book
where FirstName = 'Rekhi';
--retrives all datas in address_book
select* from address_book;

--retrives person belonging to city 'Allahabad' or state 'Uttar Pradesh'
select * from address_book
where City = 'Allahabad' or State = 'Uttar Pradesh';

--retrives count by city and by state
select State, city, count(State) as 'Count by State', count(City) as 'Count by City' from address_book
group by State, City;

--retrives contacts of person in city 'Allahabad' in ascending order by FirstName
select * from address_book
where City = 'Allahabad'
order by FirstName,LastName asc;

create table contact_type
(
FirstName varchar(50) not null,
LastName varchar(50) not null,
Type varchar(15) not null
);

insert into contact_type values
('Rakesh','Mehta','Friends'),
('Rahul','Kumar','Family'),
('Terrisa','John','Family'),
('Krishna','Gotthi','Profession'),
('Rakhi','Sharma','Friends');
--retrives all datas in contact_type
select * from contact_type
--joins address_book and contact_type
select ad.FirstName,ad.LastName,Address,City,State,Zipcode,PhoneNumber,Email,Type from address_book ad inner join contact_type type
on ((ad.FirstName = type.FirstName) and (ad.LastName = type.LastName));

--retieves count by type
select type.Type,COUNT(type.Type) as 'Count of Type' from address_book ad inner join Contact_Type type
on ((ad.FirstName = type.FirstName) and (ad.LastName = type.LastName))
group by Type;

--inserts rahul kumar as friend as well. initialy it was inserted as family
insert into contact_type values
('Rahul','Kumar','Friend');
select ad.FirstName,ad.LastName,Address,City,State,Zipcode,PhoneNumber,Email,Type from address_book ad inner join contact_type type
on ((ad.FirstName = type.FirstName) and (ad.LastName = type.LastName));

--creates people contact with conpisite primary key
create table people_contact
(
FirstName varchar(50) not null,
LastName varchar(50) not null,
Address varchar(150),
City varchar(50),
State varchar(50),
Zipcode varchar(6),
PhoneNumber varchar(15) not null,
Email varchar(30) not null,
CONSTRAINT PK_FirstLastName PRIMARY KEY CLUSTERED (FirstName,LastName)
);
--created table type for contact type. Has a foreign key
create table type
(
FirstName varchar(50) not null ,
LastName varchar(50) not null,
Type varchar(15) not null,
constraint FK_Name foreign key (FirstName,LastName) references people_contact(FirstName,LastName)
)
--describes the tables
select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'people_contact';
select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'type';
--inserts values in people_contact table 
insert into people_contact values
('Rakesh','Mehta','Lane 4','Mumbai','Maharashtra','489856','9999999999','rk123@gmail.com'),
('Rahul','Kumar','K90/78 Allahabad','Allahabad','Uttar Pradesh','451207','8888888888','rahul777@gmail.com'),
('Rekhi','Sharma','Street 56','Ajmer','Rajasthan','123456','8558585851','rekha@gmail.com');
--insert values in type table
insert into type values
('Rakesh','Mehta','Friends'),
('Rahul','Kumar','Family'),
('Rekhi','Sharma','Friends');
--retrives all values
select * from people_contact;
select * from type;

--retrives person belonging to a city or state
select pc.FirstName,pc.LastName,Address,City,State,Zipcode,PhoneNumber,Email,type
from people_contact pc 
inner join type t on t.FirstName = pc.FirstName and t.LastName=pc.LastName
where City = 'Allahabad' or State = 'Uttar Pradesh';

--retrives count by city and by state
select State, city, count(State) as 'Count by State', count(City) as 'Count by City' from people_contact
group by State, City;

--retrives contacts of person in city 'Allahabad' in ascending order by FirstName
select pc.FirstName,pc.LastName,Address,City,State,Zipcode,PhoneNumber,Email,type
from people_contact pc
inner join type t on t.FirstName = pc.FirstName and t.LastName=pc.LastName
where City = 'Allahabad'
order by pc.FirstName,pc.LastName asc;

--retieves count by type
select Type,COUNT(Type) as 'Count of Type' from people_contact pc inner join type t
on ((pc.FirstName = t.FirstName) and (pc.LastName = t.LastName))
group by Type;
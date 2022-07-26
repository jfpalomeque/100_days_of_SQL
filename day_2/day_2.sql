--Create our first table
create table employees (
	id serial,
	first_name varchar(50),
	last_name varchar(50),
	GBP_per_hour numeric,
	car_plate varchar(15)
);

--Add some constraints
alter table employees add constraint uniqueID unique (id);
alter table employees add constraint primary_key primary key (id);
alter table employees alter column id set not null;
alter table employees alter column first_name set not null;
alter table employees alter column last_name set not null;
alter table employees alter column GBP_per_hour set not null;
alter table employees add constraint check_salary check (GBP_per_hour > 11);

--Delete the table
drop table employees;

--Create the table again, but with constraints
create table employees (
	id serial primary key not null,
	first_name varchar(50) not null,
	last_name varchar(50) not null,
	GBP_per_hour numeric check (GBP_per_hour > 11),
	car_plate varchar(15)
);

--Adding some rows

insert into employees (first_name, last_name, GBP_per_hour, car_plate)
values
('Sarah', 'Black', 12, 'AAS 12D'),
('John', 'Smith', 12,'NFS 12D'),
('Richard', 'Reid', 15, 'ADE 23DD');

insert into employees (first_name, last_name, GBP_per_hour)
values
('John', 'Brown', 12);

--See the rows in the table

select * from employees;



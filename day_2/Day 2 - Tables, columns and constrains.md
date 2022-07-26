# 100 days of SQL — Day 2: Tables, columns and constrains 
## Tables, rows and columns
Relational databases stores the data on tables, that can look something similar to a typical spreadsheet table. Each bit of information for each item or element, or field, is stored in a different table, and the specific information for each item is stored in a row.

In the picture, we can see an example of a table from a fictional DVD rental shop, where each item is each specific (and fake) DVD, and for each one the title, release year, length in minutes and replacement cost is recorded, each field in a different column.


![](https://github.com/jfpalomeque/100_days_of_SQL/blob/main/day_2/Pasted%20image%2020220726192606.png)
On future days we will explain the different data types each column can be, but for now we will name three data types we will use to create our first table: serial, varchar and numeric.

* Serial: Is a numeric column that automatically increments by one each time a row is added to the table. We will use that to create automatically unique ID numbers for each row, that we will use later to join tables (we will talk about joins and relationships in future days).
* Varchar: In this kind of column, we can store text, technically called character strings. We will define the maximum length of the text stored. Of course, we can store numbers, but they are going to be treated as text.
* Numeric: Is a numeric column, with a variable length up to 131072 digits before the decimal point and up to 16383 digits after the decimal point.

With this basic data types, we are ready to create our first table.

## Our first table

We can go to DBeaver again, SQL editor menu, and click New SQL script, as we are going to write our SQL code as script on .sql files (that can be checked on my GitHub: https://github.com/jfpalomeque/100_days_of_SQL)

We are going to create a simple table, to store information about employees of a company, using the following script:

``` sql
create table employees (
	id serial,
	first_name varchar(50),
	last_name varchar(50),
	GBP_per_hour numeric,
	car_plate varchar(15)
);
```


## Constraints
There are some basic rules we can create on PostgreSQL, that allows us to automatically check that the added data to the column is correct. We will see more constraints in the future, but we will talk about 4 constraints today: Not null, unique, primary key, and check.

* Not null: checks that the field is not empty for each row. In our example, all employees should have a first name, and a last name, but maybe not all of them have a car.
* Unique: checks that each value is unique on the column. In our example, it is important that each ID value is unique, but the values on the other columns can be repeated.
* Primary Key: Is the column we will use to identify each row in the table. That will become more important when we will talk about joins.
* Check: That allows us to check if the data added to a column satisfy certain conditions. In our example, we will say that the minimum our company we will pay is 11 GBP per hour.

We can add constraints to our table now:
 ```sql
alter table employees add constraint uniqueID unique (id);
alter table employees add constraint primary_key primary key (id);
alter table employees alter column id set not null;
alter table employees alter column first_name set not null;
alter table employees alter column last_name set not null;
alter table employees alter column GBP_per_hour set not null;
alter table employees add constraint check_salary check (GBP_per_hour > 11);

```

If we would like to delete a table (and all the stored data in it) we can use the following command:

```sql
drop table employees;
```
DBeaver will ask for confirmation, because there is a risk of deleting information.

In general, it is much easier way to add constraints when creating the table:

``` sql
create table employees (
	id serial primary key not null,
	first_name varchar(50) not null,
	last_name varchar(50) not null,
	GBP_per_hour numeric check (GBP_per_hour > 11),
	car_plate varchar(15)
);
```

## Adding some rows
And now, we can add some rows to our table:

``` sql
insert into employees (first_name, last_name, GBP_per_hour)
values
('John', 'Brown', 8);
```

When using that code, we will have the following error:  new row for relation "employees" violates check constraint "employees_gbp_per_hour_check", because the number for the salary is lower than 11.

We need to use the following code:
```sql
insert into employees (first_name, last_name, GBP_per_hour, car_plate)
values
('Sarah', 'Black', 12, 'AAS 12D'),
('John', 'Smith', 12,'NFS 12D'),
('Richard', 'Reid', 15, 'ADE 23DD');

insert into employees (first_name, last_name, GBP_per_hour)
values
('John', 'Brown', 12);
```

And we have 4 rows in our table, that we can see using the following code:
``` sql
select * from employees;
```
![](https://github.com/jfpalomeque/100_days_of_SQL/blob/main/day_2/Pasted%20image%2020220726212334.png)

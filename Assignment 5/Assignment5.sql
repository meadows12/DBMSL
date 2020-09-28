create table Customer( Cust_id int PRIMARY KEY,Name varchar(20),DateofPayment date,NameOfSchema varchar(20),Status varchar(10));

insert into customer values(1,"Mrunal","2020-08-1","Savings","N");
insert into customer values(2,"Shyla","2020-08-29","Savings","N");
insert into customer values(3,"Ron","2020-08-25","Deposit","N");
insert into customer values(4,"Bob","2020-08-1","Deposit","N");

create table fine(Cust_id int PRIMARY KEY,Date date,Amt int);

delimiter @@
create procedure getFine(IN id int,IN NameOfSchema varchar(20))
begin

declare payment int;
declare mystatus varchar(10);
declare mydate date;
declare diff int;

declare exit handler for 1062
select "Error: Duplicate value" as "message";

select DateofPayment into mydate from customer where Cust_id = id;
select Status into mystatus from customer where Cust_id = id;
select DATEDIFF(CURDATE(),mydate) into diff;

IF diff>15 and diff<=30 then
set payment = 5*diff;
end if;
IF diff>30 then
set payment = 75 + (diff-30)*50;
end if;

insert into fine values(id,mydate,payment);
update Customer set Status = "P" where Cust_id = id;
end;
@@


call getFine(1,"Savings");@@

call getFine(1,"Savings");
@@
+------------------------+
| message                |
+------------------------+
| Error: Duplicate value |
+------------------------+


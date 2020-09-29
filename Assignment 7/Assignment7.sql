create table customer(Cust_id int PRIMARY KEY,name varchar(20),total_purchase int);

insert into customer values(1,"Mrunal",15000)
insert into customer values(2,"Pranjal",12000);
insert into customer values(3,"Rohit",6000);
insert into customer values(4,"Aditya",3500);

create table category(Cust_id int PRIMARY KEY,name varchar(20),class varchar(10));

mysql> #Stored procedure
mysql> create procedure proc_grade()
    -> begin
    ->
    -> declare id int;
    -> declare name1 varchar(20);
    -> declare total int;
    -> declare last_row int default 0;
    -> declare c1 cursor for select * from customer;
    -> declare continue handler for not found set last_row=1;
    ->
    -> open c1;
    -> get_loop:loop
    -> fetch c1 into id,name1,total;
    -> if last_row = 1 then leave get_loop;
    -> end if;
    -> if total<=20000 and total>=10000 then
    -> insert into category values(id,name1,"Platinum");
    -> end if;
    -> if total<=9999 and total>=5000 then
    -> insert into category values(id,name1,"Gold");
    -> end if;
    -> if total<=4999 and total>=2000 then
    -> insert into category values(id,name1,"Silver");
    -> end if;
    -> end loop get_loop;
    -> close c1;
    -> end;
    -> @@

mysql> call proc_grade();
    -> @@
Query OK, 0 rows affected (0.10 sec)

mysql> delimiter ;
mysql> select * from category;
+---------+---------+----------+
| Cust_id | name    | class    |
+---------+---------+----------+
|       1 | Mrunal  | Platinum |
|       2 | Pranjal | Platinum |
|       3 | Rohit   | Gold     |
|       4 | Aditya  | Silver   |
+---------+---------+----------+
4 rows in set (0.00 sec)

mysql>#Stored procedure using IN and OUT parameter

mysql> truncate table category;
Query OK, 0 rows affected (0.33 sec)

mysql> create procedure cal_class(IN id1 int,OUT cla varchar(10))
    -> begin
    ->
    -> declare total int;
    -> select total_purchase into total from Customer where Cust_id = id1;
    -> if total<=20000 AND total>=10000 then
    -> set cla="Platinum";
    -> elseif total<=9999 AND total>=5000 then
    -> set cla="Gold";
    -> elseif total<=4999 AND total>=2000 then
    -> set cla="Silver";
    -> end if;
    -> end;
    -> @@
Query OK, 0 rows affected (0.03 sec)

mysql> create procedure proc_grade2()
    -> begin
    ->
    -> declare id int;
    -> declare name1 varchar(20);
    -> declare total int;
    -> declare last_row int default 0;
    -> declare c1 cursor for select * from customer;
    -> declare continue handler for not found set last_row=1;
    ->
    -> open c1;
    -> get_loop:loop
    -> fetch c1 into id,name1,total;
    -> if last_row = 1 then leave get_loop;
    -> end if;
    -> call cal_class(id,@cla);
    -> insert into category values(id,name1,@cla);
    -> end loop get_loop;
    -> close c1;
    -> end;
    -> @@
Query OK, 0 rows affected (0.03 sec)

mysql> call proc_grade2();
    -> @@
Query OK, 0 rows affected (0.06 sec)

mysql> select * from category;
    -> @@
+---------+---------+----------+
| Cust_id | name    | class    |
+---------+---------+----------+
|       1 | Mrunal  | Platinum |
|       2 | Pranjal | Platinum |
|       3 | Rohit   | Gold     |
|       4 | Aditya  | Silver   |
+---------+---------+----------+
4 rows in set (0.00 sec)

mysql> truncate table category;
    -> @@
Query OK, 0 rows affected (0.07 sec)

mysql> # Stored Funtion

mysql> create function class_func(amt int)
    -> returns varchar(10)
    -> deterministic
    ->
    -> begin
    -> declare cla varchar(20);
    -> if amt<=20000 and amt>=10000 then
    -> set cla="Platinum";
    -> elseif amt<=9999 and amt>=5000 then
    -> set cla="Gold";
    -> elseif amt<=4999 and amt>=2000 then
    -> set cla="Silver";
    -> end if;
    -> return (cla);
    -> end;
    -> @@
Query OK, 0 rows affected (0.03 sec)

mysql> create procedure proc_grade3()
    -> begin
    ->
    -> declare id int;
    -> declare name1 varchar(20);
    -> declare total int;
    -> declare clas varchar(10);
    -> declare last_row int default 0;
    -> declare c1 cursor for select * from customer;
    -> declare continue handler for not found set last_row=1;
    ->
    -> open c1;
    -> get_loop:loop
    -> fetch c1 into id,name1,total;
    -> if last_row = 1 then leave get_loop;
    -> end if;
    -> set clas = class_func(total);
    -> insert into category values(id,name1,clas);
    -> end loop get_loop;
    -> close c1;
    -> end;
    -> @@
Query OK, 0 rows affected (0.03 sec)

mysql> call proc_grade3();
    -> @@
Query OK, 0 rows affected (0.08 sec)

mysql> select * from category;
    -> @@
+---------+---------+----------+
| Cust_id | name    | class    |
+---------+---------+----------+
|       1 | Mrunal  | Platinum |
|       2 | Pranjal | Platinum |
|       3 | Rohit   | Gold     |
|       4 | Aditya  | Silver   |
+---------+---------+----------+
4 rows in set (0.00 sec)

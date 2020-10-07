mysql> use assign5;
Database changed
mysql> show tables;
+-------------------+
| Tables_in_assign5 |
+-------------------+
| customer          |
| fine              |
+-------------------+
2 rows in set (0.00 sec)

mysql> create table student(rollno int,name varchar(20),Dateofadmission date,branch varchar(10),percent int,status varchar(10));
Query OK, 0 rows affected (0.47 sec)

mysql> create table alumni(name varchar(20),Dateofadmission date,branch varchar(10),percent int,status varchar(10));
Query OK, 0 rows affected (0.10 sec)

mysql> insert into student values(1,"Mrunal",'2020-10-03',"Comp",98,"pass");
Query OK, 1 row affected (0.02 sec)

mysql> insert into student values(2,"Rohan",'2020-09-03',"Comp",89,"pass");
Query OK, 1 row affected (0.01 sec)

mysql> insert into student values(3,"Aditys",'2020-09-27',"IT",35,"fail");
Query OK, 1 row affected (0.01 sec)

mysql> delimiter @@
mysql> create trigger t1
    -> BEFORE DELETE on student
    -> for each row
    -> insert into alumni values(old.name,old.Dateofadmission,old.branch,old.percent,old.status);
    -> @@
Query OK, 0 rows affected (0.04 sec)

mysql> DELETE FROM student WHERE rollno=3;
    -> @@
Query OK, 1 row affected (0.44 sec)

mysql> select * from alumni;
    -> @@
+--------+-----------------+--------+---------+--------+
| name   | Dateofadmission | branch | percent | status |
+--------+-----------------+--------+---------+--------+
| Aditys | 2020-09-27      | IT     |      35 | fail   |
+--------+-----------------+--------+---------+--------+
1 row in set (0.00 sec)

mysql> create trigger t2
    -> AFTER UPDATE on student
    -> for each row
    -> insert into alumni values(old.name,old.Dateofadmission,old.branch,old.percent,old.status);
    -> @@
Query OK, 0 rows affected (0.02 sec)

mysql> update student set percent=96 where rollno=1;
    -> @@
Query OK, 1 row affected (0.04 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from student;
    -> @@
+--------+--------+-----------------+--------+---------+--------+
| rollno | name   | Dateofadmission | branch | percent | status |
+--------+--------+-----------------+--------+---------+--------+
|      1 | Mrunal | 2020-10-03      | Comp   |      96 | pass   |
|      2 | Rohan  | 2020-09-03      | Comp   |      89 | pass   |
+--------+--------+-----------------+--------+---------+--------+
2 rows in set (0.00 sec)

mysql> delimiter ;
mysql> select * from alumni;
+--------+-----------------+--------+---------+--------+
| name   | Dateofadmission | branch | percent | status |
+--------+-----------------+--------+---------+--------+
| Aditys | 2020-09-27      | IT     |      35 | fail   |
| Mrunal | 2020-10-03      | Comp   |      98 | pass   |
+--------+-----------------+--------+---------+--------+
2 rows in set (0.00 sec)

mysql> delimiter @@
mysql> create trigger fine_update
    -> after insert on fine
    -> for each row
    -> begin
    -> if new.Amt IS NULL then
    -> insert into invalid_fine values(new.Cust_id,new.Date,"No fine");
    -> end if;
    -> end;
    -> @@
Query OK, 0 rows affected (0.20 sec)

mysql> create table invalid_fine(id int PRIMARY KEY,Date date,Amount varchar(10));
    -> @@
Query OK, 0 rows affected (0.57 sec)

mysql> delimiter ;
mysql> insert into customer values(5,"abc","2020-10-04","Deposit","N");
Query OK, 1 row affected (0.01 sec)

mysql>  call getFine(5,"Deposit");
Query OK, 1 row affected (0.38 sec)

mysql> select * from fine;
+---------+------------+------+
| Cust_id | Date       | Amt  |
+---------+------------+------+
|       1 | 2020-08-01 |  825 |
|       3 | 2020-08-25 |  125 |
|       5 | 2020-10-04 | NULL |
+---------+------------+------+
3 rows in set (0.00 sec)

mysql> select * from invalid_fine;
+----+------------+---------+
| id | Date       | Amount  |
+----+------------+---------+
|  5 | 2020-10-04 | No fine |
+----+------------+---------+
1 row in set (0.00 sec)

mysql>

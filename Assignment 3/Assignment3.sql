create table Customer(cust_no int PRIMARY KEY,cust_fname varchar(20),cust_lname varchar(20),cust_company varchar(20),cust_addr varchar(30),city varchar(10),cust_phone bigint(15));

create table Author(author_no int PRIMARY KEY,author_name varchar(20),country varchar(20));

create table Publisher(publisher_no int PRIMARY KEY,publisher_name varchar(20),publisher_addr varchar(30),year int);

create table Book(ISBN bigint PRIMARY KEY,title varchar(20),unit_price int,author_no int,publisher_no int,pub_year int,FOREIGN KEY(author_no) REFERENCES Author(author_no),FOREIGN KEY(publisher_no) REFERENCES Publisher(publisher_no));

create table orderT(order_no int PRIMARY KEY,cust_no int,ISBN bigint,qty int,odate date,FOREIGN KEY(cust_no) REFERENCES Customer(cust_no),FOREIGN KEY(ISBN) REFERENCES Book(ISBN));

insert into Customer values(101,'Saili','Sharma','abc','Dhankawdi','Pune',9209182735);
insert into Customer values(102,'Praveen','Thorat','abc','Kothrude','Pune',9378471029);
insert into Customer values(103,'Rohit','Sharma','bcd','Dadar','Mumbai',9201777281);
insert into Customer values(104,'Virat','Kohli','afk','Shivajinagar','Mumbai',9834728902);
insert into Customer values(105,'Rahul','Raj','bcd','Avadi','Chennai',5362789102);
insert into Customer values(106,'Purva','Kulkarni','afk','Dadar','Mumbai',9022188739);
insert into Customer values(107,'Shailesh','Thorat','hks','Balewadi','Pune',95536777281);
insert into Customer values(108,'Harish','Rahane','kja','Mira road','Delhi',9355672892);
insert into Customer values(109,'Harsh','Pandey','jsj','Kalyan','Mumbai',9553672892);
insert into Customer values(110,'Raj','Mohan','jsj','Tiruvanantapuram','Kerala',9663778273);

insert into Author values(201,'Chetan','India');
insert into Author values(202,'Dan Brown','United States');
insert into Author values(203,'Willian Shakespeare','United Kingdom');
insert into Author values(204,'Sarah Williams','United Kingdom');

insert into Publisher values(301,'Penguin','United States of America',2016);
insert into Publisher values(302,'Continental','Pune',2015);
insert into Publisher values(303,'Goosebumps','United States of America',2016);
insert into Publisher values(304,'Mcmilan','England',2014);

insert into Book values(401,'Harry potter',350,201,301,2000);
insert into Book values(402,'Radhe',300,202,302,2004);
insert into Book values(403,'Maze Runner',200,204,304,2015);
insert into Book values(404, 'Hercules', 375, 201, 301, 2000);
insert into Book values(405, 'Shiva', 400, 203, 303, 2006);
insert into Book values(406, 'Chava', 500, 204, 304, 2015);

insert into ordert values(501,101,401,2,'2020-11-05');
insert into ordert values(502,102,403,3,'2020-11-06');
insert into ordert values(503,103,405,1,'2020-10-07');
insert into ordert values(504,104,406,5,'2020-08-05');


#2.Display all customer details with city pune and mumbai and customer first name starting with 'p' or 'h'. 

select *from Customer WHERE(city = 'Pune' or city = 'Mumbai') and (cust_fname LIKE 'P%' or cust_fname LIKE 'H%');
+---------+------------+------------+--------------+-----------+--------+------------+
| cust_no | cust_fname | cust_lname | cust_company | cust_addr | city   | cust_phone |
+---------+------------+------------+--------------+-----------+--------+------------+
|     102 | Praveen    | Thorat     | abc          | Kothrude  | Pune   | 9378471029 |
|     106 | Purva      | Kulkarni   | afk          | Dadar     | Mumbai | 9022188739 |
|     109 | Harsh      | Pandey     | jsj          | Kalyan    | Mumbai | 9553672892 |
+---------+------------+------------+--------------+-----------+--------+------------+

# 3.lists the number of different customer cities

select count(distinct city) as DistinctCity from Customer;
+--------------+
| DistinctCity |
+--------------+
|            5 |
+--------------+

# 4.Give 5% increase in price of the books with publishing year 2015.
Update Book set unit_price = 1.05*unit_price where pub_year = 2015;

select *from Book;
+------+--------------+------------+-----------+--------------+----------+
| ISBN | title        | unit_price | author_no | publisher_no | pub_year |
+------+--------------+------------+-----------+--------------+----------+
|  401 | Harry potter |        350 |       201 |          301 |     2000 |
|  402 | Radhe        |        300 |       202 |          302 |     2004 |
|  403 | Maze Runner  |        210 |       204 |          304 |     2015 |
|  404 | Hercules     |        375 |       201 |          301 |     2000 |
|  405 | Shiva        |        400 |       203 |          303 |     2006 |
|  406 | Chava        |        525 |       204 |          304 |     2015 |
+------+--------------+------------+-----------+--------------+----------+

# 6.Find the names of authors living in India or Australia .
select author_name,country from Author where country = 'India' UNION select author_name,country from Author where country = 'Australia';
+-------------+---------+
| author_name | country |
+-------------+---------+
| Chetan      | India   |
+-------------+---------+

# 7.Find the publishers who are established in year 2015 as well as in 2016  

select *from Publisher where year = 2015 or year = 2016;
+--------------+----------------+--------------------------+------+
| publisher_no | publisher_name | publisher_addr           | year |
+--------------+----------------+--------------------------+------+
|          301 | Penguin        | United States of America | 2016 |
|          302 | Continental    | Pune                     | 2015 |
|          303 | Goosebumps     | United States of America | 2016 |
+--------------+----------------+--------------------------+------+

# 8.Find the book having maximum price and find titles of book having price between 300 and 400.
select title, unit_price from Book where unit_price = (select max(unit_price) from Book);
+-------+------------+
| title | unit_price |
+-------+------------+
| Chava |        525 |
+-------+------------+
1 row in set (0.00 sec)

select title, unit_price from Book where unit_price BETWEEN 300 and 400;
+--------------+------------+
| title        | unit_price |
+--------------+------------+
| Harry potter |        350 |
| Radhe        |        300 |
| Hercules     |        375 |
| Shiva        |        400 |
+--------------+------------+

#9.Display all titles of books with price and published year in decreasing order of publishing year. 
select title,unit_price,pub_year from Book order by pub_year DESC;
+--------------+------------+----------+
| title        | unit_price | pub_year |
+--------------+------------+----------+
| Maze Runner  |        210 |     2015 |
| Chava        |        525 |     2015 |
| Shiva        |        400 |     2006 |
| Radhe        |        300 |     2004 |
| Harry potter |        350 |     2000 |
| Hercules     |        375 |     2000 |
+--------------+------------+----------+

#10.Display title,author_no and publisher_no of all books published in 2000,2004,2006. 

select title,author_no,publisher_no from Book where pub_year in (2000,2004,2006);
+--------------+-----------+--------------+
| title        | author_no | publisher_no |
+--------------+-----------+--------------+
| Harry potter |       201 |          301 |
| Radhe        |       202 |          302 |
| Hercules     |       201 |          301 |
| Shiva        |       203 |          303 |
+--------------+-----------+--------------+

#5.Delete customer details living in pune. 

create table orderT_new(order_no int PRIMARY KEY,cust_no int,ISBN bigint,qty int,odate date,FOREIGN KEY(cust_no) REFERENCES Customer(cust_no) ON DELETE CASCADE,FOREIGN KEY(ISBN) REFERENCES Book(ISBN) ON DELETE CASCADE);
insert into ordert_new values(501,101,401,2,'2020-11-05');
insert into ordert_new values(502,102,403,3,'2020-11-06');
insert into ordert_new values(503,103,405,1,'2020-10-07');
insert into ordert_new values(504,104,406,5,'2020-08-05');

Drop table ordert;

delete from Customer where city = 'Pune';

select *from Customer;
+---------+------------+------------+--------------+------------------+---------+------------+
| cust_no | cust_fname | cust_lname | cust_company | cust_addr        | city    | cust_phone |
+---------+------------+------------+--------------+------------------+---------+------------+
|     103 | Rohit      | Sharma     | bcd          | Dadar            | Mumbai  | 9201777281 |
|     104 | Virat      | Kohli      | afk          | Shivajinagar     | Mumbai  | 9834728902 |
|     105 | Rahul      | Raj        | bcd          | Avadi            | Chennai | 5362789102 |
|     106 | Purva      | Kulkarni   | afk          | Dadar            | Mumbai  | 9022188739 |
|     108 | Harish     | Rahane     | kja          | Mira road        | Delhi   | 9355672892 |
|     109 | Harsh      | Pandey     | jsj          | Kalyan           | Mumbai  | 9553672892 |
|     110 | Raj        | Mohan      | jsj          | Tiruvanantapuram | Kerala  | 9663778273 |
+---------+------------+------------+--------------+------------------+---------+------------+

select *from ordert_new;
+----------+---------+------+------+------------+
| order_no | cust_no | ISBN | qty  | odate      |
+----------+---------+------+------+------------+
|      503 |     103 |  405 |    1 | 2020-10-07 |
|      504 |     104 |  406 |    5 | 2020-08-05 |
+----------+---------+------+------+------------+





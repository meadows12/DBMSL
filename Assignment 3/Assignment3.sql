create table Customer(cust_no int PRIMARY KEY,cust_fname varchar(20),cust_lname varchar(20),cust_company varchar(20),cust_addr varchar(30),city varchar(10),cust_phone bigint(15));

create table Author(author_no int PRIMARY KEY,author_name varchar(20),country varchar(20));

create table Publisher(publisher_no int PRIMARY KEY,publisher_name varchar(20),publisher_addr varchar(30),year int);

create table Book(ISBN bigint PRIMARY KEY,title varchar(20),unit_price int,author_no int,publisher_no int,pub_year int,FOREIGN KEY(author_no) REFERENCES Author(author_no),FOREIGN KEY(publisher_no) REFERENCES Publisher(publisher_no));

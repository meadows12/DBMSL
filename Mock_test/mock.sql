create table emp(emp_id int PRIMARY KEY,city varchar(20),emp_name varchar(20));

insert into emp values(1,"Pune","Jones");
insert into emp values(2,"Mumbai","Joey");
insert into emp values(3,"Mumbai","Smith");
insert into emp values(4,"Pune","Ford");
insert into emp values(5,"Banglore","Sam");
insert into emp values(10,"Pune","Samson");

create table emp_detail(emp_id int PRIMARY KEY,emp_name varchar(20),deptname varchar(20),sal bigint(10),hiredate date,dept_no int);

insert into emp_detail values(1,"Jones","IT",70000,"2018-04-01",3);
insert into emp_detail values(2,"Joey","Sales",90000,"2018-02-01",1);
insert into emp_detail values(3,"Smith","Manager",80000,"2020-03-01",2);
insert into emp_detail values(4,"Ford","HR",95000,"2020-01-01",4);
insert into emp_detail values(10,"Samson","Sales",85000,"2019-01-01",5);
insert into emp_detail values(5,"Sam","Manager",80000,"2019-01-01",2);
insert into emp_detail values(6,"Chandler","Sales",100000,"2019-02-01",1);

create table emp_sal(dept_no int PRIMARY KEY,deptname varchar(20),emp_name varchar(20),sal bigint(10));

insert into emp_sal values(1,"Sales","Joey",90000);
insert into emp_sal values(2,"Manager","Smith",80000);
insert into emp_sal values(3,"IT","Jones",70000);
insert into emp_sal values(4,"HR","Ford",95000);
insert into emp_sal values(5,"Sales","Samson",85000);

select e.emp_name,s.sal,e.city,s.deptname from emp e LEFT OUTER JOIN emp_sal s on e.emp_name = s.emp_name;

create view EMP_SALARY1 as select emp_name,deptname from emp_sal;

select * from emp_detail where deptname = (select deptname from emp_sal where emp_name="Smith");

select * from emp_detail where sal > (select sal from emp_detail where emp_name="Ford");

select * from emp_detail where hiredate < (select hiredate from emp_detail where emp_name="Jones");

create view Emp_view as select * from emp;
update Emp_view set city="Banglore" where emp_id=10;
select * from Emp_view;






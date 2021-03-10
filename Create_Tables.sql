show databases;
create database exadb;
use exadb;
create table students(std_id integer, name char(20), course char(20), age integer);
show tables;
desc students;
insert into students values(101,'Steven','data analytics',22); 
select * from students;
insert into students values(102,'John', 'Data Analyst', 25);
select * from students;

use exadb;
show tables;
create table patients(pid integer, name varchar(15), dob date, toa datetime);
desc patients;
insert into patients values(501,'Rama Sahu', '1991-09-08', '2021-02-23 11.00.00'); 
select * from patients;
select "Hello" as message;
select 5+4 as result;
## NOw Function ##
select now();
insert into patients values(502,'Kevin peter','1994-05-20', now() );
select * from patients;
select current_time;
select hour('15:05:21');
select last_day('2021-02-23');
select curdate();
select date('2021-02-01 10:30:00');
select datediff('2021-02-23', '2021-02-01');
SELECT CONVERT_TZ('2004-01-01 12:00:00','GMT','MET');
SELECT CONVERT_TZ('2021-02-23 06:00:17','IST','GMT');
SELECT CONVERT_TZ('2021-02-23 06:00:17','GMT','IST');
create table tt(id integer, name varchar(10));
insert into tt values(401, 'Sandy');
insert into tt values(402,'Mady');
select * from tt;
show tables;
drop table tt;
show tables;
select * from tt;
select * from students; 
alter table students add column marks integer;
select * from students;
select 5 + null as result;
select 3=3 as result;
select 3=2 as result;
select 3= null as result;
select 3 is null as result;
select 3 is not null as result;
select * from students;
alter table students drop column age;
select * from students;
desc students;
alter table students modify column name varchar(20);
desc students;
select * from students;
alter table students rename to myclass;
show tables;
select * from myclass;
rename table myclass to students;
select * from students;
insert into students values(103, 'Marry', 'data science', 78); 
select * from students;
insert into students (std_id, name, marks) values(104, 'Sasa', 92);
select * from students;
insert into students values(105, 'Gera','Data science',65), (106, 'Mojas', 'Data science', 75), (107, 'kery', 'Data Science',81); 
select * from students;
set sql_safe_updates = 0;
delete from students where name = 'Gera';
select * from students;
update students set marks = 98 where marks = null;
select * from students;
update students set marks = 98 where marks is null;
select * from students;
update students set course = 'Data Science', marks= 100 where std_id = 102; 
select * from students;
delete from students;
select * from students;
insert into students values(101, 'Rajesh','Data Engineer',91), (102,'Tejasvi','Data Analytics',97), (103, 'Vrushali','Data Analysis',99), (104,'Nishi', 'Python Developer', 89);
select * from students;
truncate students;
select * from students;

use exadb;
select * from authors;
select * from books;
select * from myemp;
select * from myemp limit 10;
select * from myemp limit 3;
select first_name,last_name, salary from myemp limit 5;
select dep_id from myemp;
select distinct dep_id from myemp;
select distinct dep_id from myemp order by dep_id asc;
select * from person;
select distinct fname from person;
select distinct lname from person;
select distinct fname, lname from person;
select * from myemp where dep_id=30;
select * from myemp where salary>15000;
select * from myemp where dep_id <>50;
select * from myemp where dep_id is null;
select * from myemp where salary between 10000 and 25000;
select * from myemp where first_name = 'william';
select * from myemp where first_name like 'william';
select * from myemp where first_name like 'a%';
select * from myemp where first_name like '%a%';
select * from myemp where first_name like 'a____';
select * from myemp where first_name like '_____';
select * from myemp where first_name like '____';
select * from myemp where first_name like '__';
select * from myemp where first_name like '___';
select * from myemp where first_name like '% %';
select * from myemp where dep_id=80 and salary>10000; 
select * from myemp where dep_id=10 or dep_id=20 or dep_id=30 or dep_id=40;
select * from myemp where dep_id in (10,20,30,40);
select * from myemp where dep_id in (10,20,30,40) order by dep_id , emp_id,mgr_id asc;
select * from myemp where dep_id not in (10,20,30,40);
select * from myemp order by FIRST_NAME;
select * from myemp order by FIRST_NAME asc;
select * from myemp order by FIRST_NAME desc;
select upper(first_name) from myemp limit 10;
select lower(first_name) from myemp limit 10;

---------- Functions -------- 
select concat(first_name,' ', last_name) from myemp limit 10;
select min(salary) from myemp;
select max(salary) from myemp;
select count(salary) from myemp;
select sum(salary) from myemp;
select avg(salary)  from myemp;
select count(*) from myemp;
select dep_id, avg(salary) from myemp group by dep_id order by dep_id asc;
select stddev(salary) from myemp;
select dep_id, max(salary) from myemp group by dep_id  having dep_id = 50;
select dep_id, max(salary) max_sal from myemp group by dep_id order by max_sal asc;

---------- Joints -------------
select * from movies;
select * from members;
select title, first_name,last_name from members inner join movies on members.movieid = movies.id; 
select title, first_name,last_name from movies left join members on movies.id  = members.movieid; 
select title, first_name,last_name from members left join movies on movies.id  = members.movieid; 
select title, first_name,last_name from members right join movies  on movies.id  = members.movieid; 
select mv.title, mm.first_name,mm.last_name from members mm right join movies mv on mv.id  = mm.movieid;

select * from meals;
select * from drinks;
select m.mealname, d.drinkname from meals m cross join drinks d;
select m.mealname, d.drinkname, m.rate, d.rate from meals m cross join drinks d;
select m.mealname, d.drinkname, m.rate + d.rate Total from meals m cross join drinks d;
drop table students;
create table students(std_id integer not null unique, name varchar(20) not null, age integer check(age>18), marks integer);
desc students;
insert into students values(1,'Tom', 20,67);
insert into students values(2,'Mark', 20,67);
select * from students;
insert into students(std_id,age,marks) values(3,21,77);
insert into students values(3,'Joe',16,55);
insert into students values(3,'Joe',26,55);
select * from students;
select * from person;
desc person;
alter table person modify column lname varchar(20) default 'kumar';
desc person;
insert into person(id,fname) values(8,'Tom');
insert into person(id,fname) values(6,'Tom'), (7,'Tom');
select * from person order by id asc;
alter table students modify column name varchar(20) not null default 'Kumar'; 
insert into students(std_id, age,marks) values(5,21,77);
select * from students;
desc students;

create table brand(bid integer primary key, bname varchar(20)); 
desc brand;
alter table brand modify column bname varchar(20) unique;
desc brand;
show tables;
select * from authors;
select * from books;
create table favauthors(authorid integer  primary key,name varchar(30));
desc favauthors;
create table favbooks(bookid integer primary key, 
                      title varchar(80), 
					  authorid integer, 
                      foreign key(authorid) references favauthors(authorid) 
                      on delete cascade on update cascade);
desc favbooks;
show create table favauthors;
show create table favbooks;
insert into favauthors values(1,'J K Rowling');
insert into favauthors values(2,'Thomas Hardy');
insert into favauthors values(3,'Oscar Wilde');
insert into favauthors values(4,'Sidney Sheldon');
insert into favauthors values(5,'Alistair MacLean');
insert into favauthors values(6,'Jane Austen');
insert into favauthors values(7,'Chetan Bhagat');
insert into favauthors values(8,'Oscar Wilde');
select * from favauthors;

insert into favbooks values(1,'Harry Potter and the Philosopher\'s Stone',1);
insert into favbooks values(2,'Harry Potter and the Chamber of Secrets',1);
insert into favbooks values(3,'Harry Potter and the Half-Blood Prince',1);
insert into favbooks values(4,'Harry Potter and the Goblet of Fire',1);
insert into favbooks values(5,'Night Without End',5);
insert into favbooks values(6,'Fear is the Key',5);
insert into favbooks values(7,'Where Eagles Dare',5);
insert into favbooks values(8,'Sense and Sensibility',6);
insert into favbooks values(9,'Pride and Prejudice',6);
insert into favbooks values(10,'Emma',6);
insert into favbooks values(11,'Five Point Someone',7);
insert into favbooks values(12,'Two States',7);
insert into favbooks values(13,'Salome',8);
insert into favbooks values(14,'The Happy Prince',8);
select * from favbooks;
delete from favauthors where authorid=1;
select * from favauthors;
select * from favbooks;
update favauthors set authorid = 55 where authorid =5;
select * from favauthors;
select * from favbooks;

create table tt(id integer primary key auto_increment, name varchar(20));
insert into tt(name) values('sam');
insert into tt(name) values('sameer');
select * from tt;
alter table tt auto_increment = 100;
insert into tt(name) values('Hari');
select * from tt;
insert into tt(name) values('Hariram');
select * from tt;
----- Truncate table tt ------
truncate tt;
select * from tt;
insert into tt(name) values('Hari');
insert into tt(name) values('Hariram');
select * from tt;
drop table tt;

------------ Transition ACID properties ----------
create table tt(id char(1));
insert into tt values('a');
select * from tt;
rollback;
set autocommit=0;
insert into tt values('b');
rollback;
select * from tt;
set autocommit=1;
insert into tt values('d');
select * from tt;
rollback;
insert into tt values('e');
insert into tt values('f');
select * from tt;
commit;
rollback;
select * from tt;
drop table tt;
create table tt(id char(1));
start transaction;
insert into tt values('a');
insert into tt values('b');
savepoint sb; 
insert into tt values('c');
insert into tt values('d');
savepoint sd; 
insert into tt values('e');
insert into tt values('f');
select * from tt;
rollback to sd;
select * from tt;
rollback to sb;
select * from tt;

----------- Indexes -----------
use employees;
select * from employees;
select * from employees limit 15;
select * from employees where hire_date > '2000-01-01';
create index hidx on employees(hire_date);
select * from employees where hire_date > '2000-01-01';
create table test(id integer, name varchar(20) unique);
desc test;
create unique index idx1 on test(id);
desc test;
alter table test drop index idx1;
desc test;
alter table test add column marks integer;
insert into test values(101,'Maya',40), 
					   (102, 'Siri', 78),
                       (103,'Meera', 82),
                       (104,'Janki',97),
                       (105,'Kesav',54),
                       (106,'kaya',69);
select * from test;
create index btree on test(marks);
select * from test;
desc test;
show indexes from test;
select * from employees;
show indexes from employees;
desc employees;
alter table employees engine = memory;
create index bidx on employees(birth_date) using hash;
alter table test engine = memory;
create index binx on test(id) using hash;
show indexes from test;

---------- Views ------------
use exadb;
select * from myemp;
create view emp_view as select first_name,Last_name,hire_date,salary from myemp;
select * from emp_view;
select * from emp_view limit 5;
create view mydept as select * from myemp where dep_id = 50;
select * from mydept;
select * from authors;
create view aview as select * from authors where authorid < 6;
select * from aview;
create view aview2 as select * from authors where authorid < 6 with check option;
insert into aview2 values(11,'Blah');
insert into aview values(11,'Blah');
select * from authors;
select * from movies;
select * from members;
select title, first_name,last_name from movies inner join members on members.movieid=movies.id;
create view moview as select title, first_name,last_name from movies inner join members on members.movieid=movies.id;
select * from moview;
select distinct dep_id from myemp order by dep_id asc;

---------- Creating Stored procedures ------------
call myproc();
call myproc(1);
call authr(1);
call authr(13);
call auth1(1);
call auth1(13);
call auth1(null);
--------- Sessions --------------
set @sessvar1 = 55;
select @sessvar1;
call test_proc();
set @svar2 = 1111;
select @svar2;
call test_proc();
call test2();

-------- Loops -----------
### Continue hello loop #######
call simple_loop(9);  
call proc_loop1(5); 
call sloop_1(4);
call repeat_loop(5);
call proc_while(3);
-------- Error & Exception Handling ----------
select * from gtfhd;
create table payments(client_id integer, amount integer not null);
insert into payments values(10,570);
select * from payments;
insert into payments values(10,null);
call make_payment(12,1000);
select * from payments;
call make_payment(12,null);
create table fraud(id integer primary key auto_increment, client_id integer, message varchar(50), tot datetime);
select * from payments;
select * from fraud;
call make_payment_1(13,500);
select * from fraud;
select * from payments;
call make_payment_1(20,null);
select * from fraud;
insert into payments values(11,null);
call make_payment_2(77,null);
select * from fraud;
call make_payment_3(77,null);
select * from fraud;
call make_payment_4(77,null);
select * from fraud;
call make_payment_5(77,null);

---------- Cursor Handling --------------
use exadb;
select * from products;
desc products;
create table orders(order_id integer primary key auto_increment, product_code varchar(15),vender varchar(50), status varchar(20) );
alter table orders rename column vender to vendor;
select * from orders;
use exadb;
call proc_cursor();
select * from orders;
select * from authors;

------------- Functions ----------------
select * from myemp;
select current_date();
alter table myemp engine = MyISAM;
repair table myemp;

------- Triggers -------------
select * from books;
alter table books add column sales integer default 10;
select * from books;
update books set sales = sales + 5 where bookid = 12;
select * from books;
create table book_sales (sales_id integer primary key auto_increment, bookid integer, title varchar(100), qty_sold integer, tos datetime); 
select * from books;
update books set sales = sales+12 where bookid = 14;
select * from books;
select * from book_sales;
update books set sales = sales + 6 where bookid = 10;
select * from books;
select * from book_sales;
update books set sales = sales + 12 where bookid = 9;
select * from books;
select * from book_sales;













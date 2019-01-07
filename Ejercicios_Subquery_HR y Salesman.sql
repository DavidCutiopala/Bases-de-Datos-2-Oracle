--1.	Display the first name and salary for all employees who earn more 
--than employee number 103 (Employees table).
SELECT last_name , salary 
FROM employees 
WHERE salary > (SELECT salary 
                FROM employees 
                WHERE employee_id = 103);
--2.	Display the department number and department name for all departments 
--whose location number is equal to the location number of department number 90 (Departments table).
select department_id, department_name from departments
where location_id =( select location_id from departments 
where  department_id = 90);

select* from departments;

--3.Display the last name and hire date for all employees who was hired after
--employee number 101 (Employees table).
select first_name, hire_date from employees 
where hire_date >(select hire_date from employees
                   where employee_id = 101);
--4.	Display the first name, last name, and department number for all 
--employees who work in Sales department (Employees and Departments table).

select* from departments;
select first_name,last_name , department_id from employees 
where department_id =(select department_id from departments
                       where department_name = 'Sales');
--5.	Display the department number and department name for all departments
--located in Toronto (Departments table).

select Department_id,department_name from departments 
where location_id in (select location_id from locations 
                     where city = 'Toronto');

select* from departments;
select* from locations;

--6.	Display the first name, salary and department number for all 
--employees who work in the department as employee number 124 (Employees table).

select first_name,salary,department_id 
from employees 
where department_id = (select department_id  from employees 
where employee_id=124);

--7.	Display the first name, salary, and department number for all 
--employees who earn more than the average salary (Employees table).

select first_name, salary,department_id from employees 
where salary > (select avg(salary) from employees);

--8.Display the first name, salary, and department number for all
--employees whose salary equals one of the salaries in department number 20
--(Employees table).

select first_name, salary,department_id from employees 
where salary in (select salary from employees 
where department_id = 20);

--9.	Display the first name, salary, and department number for all
--employees who earn more than maximum salary in department number 50 (Employees table).

select first_name, salary,department_id from employees 
where salary in (select max(salary) from employees 
where department_id = 50);
--10.	Display the first name, salary, and department number for all
--employees who earn more than the minimum salary in department number 60 (Employees table).
select first_name, salary,department_id from employees 
where salary > (select min(salary) from employees 
where department_id = 60);

--11.	Display the first name, salary, and department number for all
--employees who earn less than the minimum salary of department number 90 (Employees table).
select first_name, salary,department_id from employees 
where salary < (select min(salary) from employees 
where department_id = 90);

select * from employees 
where department_id=90;

--12.	Display the first name, salary and department number for all
--employees whose department is located Seattle(Employees, Departments and Locations table).

select first_name,salary,department_id from employees
where department_id in (select department_id from departments 
                        where location_id =(select location_id from locations
                                             where city ='Seattle'));
select * from locations;
select * from departments;
--13.	Display the first name, salary, and department number for all
--employees who earn less than the average salary,
--and also work at the same department as employee whose first name is Kevin

select first_name,salary,department_id from employees 
where salary <(select avg(salary) from employees)
               and department_id in (select department_id from employees 
                         where  first_name = 'Kevin'); 

select department_id from employees
where first_name = 'Kevin';
--_________________AUMENTO DE 3 TABLAS COSTUMERS- SALESMEN- ORDERS  ___________________
--_________________ALA BASE DE DATOS HR 
--___CREACION DE TABLAS 
create table salesman (
salesman_id int,
name varchar(30),
city varchar(30),
commission float ,
primary key (salesman_id)
)
create table costumer (
costumer_id int,
cust_name varchar(30),
city varchar(30),
grade int,
salesman_id int,
primary key (costumer_id),
constraint fk_c foreign key (salesman_id) references salesman(salesman_id));

create table orders (
ord_no int,
purch_amt float,
ord_date  date,
costumer_id int,
salesman_id int,
 primary key (ord_no),
 constraint fk_ci foreign key (costumer_id) references costumer(costumer_id),
 constraint fk_sa foreign key (salesman_id) references salesman(salesman_id)
);
--________________Insercion de Datos_____________________________________
-- TABLA SALESMAN
insert into salesman values (5001,'James Hoog','New York',0.15);
insert into salesman values(5002,'Nail Knite','Paris',0.13);
insert into salesman values(5005,'Pit Alex','London',0.11);
insert into salesman values(5006,'Mc Lyon ' ,'Paris',0.14);
insert into salesman values(5003,'Lauso' ,null, 0.12);
insert into salesman values(5007,'Paul Adam' ,'Rome ',0.13);
--TABLA COSTUMER

insert into costumer values (3002         ,'Nick Rimando'  ,'New York',    100       ,  5001);
insert into costumer values (3005         ,'Graham Zusi'   ,'California',  200      ,   5002);
insert into costumer values (3001         ,'Brad Guzan'    ,'London',      NULL        ,    5005);
insert into costumer values (3004         ,'Fabian Johns'  ,'Paris'  ,     300    ,     5006);
insert into costumer values (3007         ,'Brad Davis'    ,'New York',    200   ,      5001);
insert into costumer values (3009         ,'Geoff Camero'  ,'Berlin',      100  ,       5003);
insert into costumer values (3008         ,'Julian Green' , 'London',      300 ,        5002);
insert into costumer values (3003         ,'Jozy Altidor',  'Moscow',     200,         5007);

select * from COSTUMER;
--TABLA ORDERDS 
insert into  orders values (70001,150.5,'05-Oct-12' , 3005 ,5002); 
select sysdate from dual;
--INSTRUCCION PARA CAMBIAR EL FORMATO DE LA FECHA (SOLO ESTA SECION)
ALTER SESSION SET NLS_DATE_FORMAT='YYYY-MM-DD';
insert into  orders  values(70009,      270.65 ,     '2012-09-10'  ,3001    ,     5005); 
insert into orders values(70002,       65.26  ,     '2012-10-05'  ,3002   ,      5001);
insert into  orders values(70004,       110.5 ,      '2012-08-17' , 3009   ,      5003); 
insert into  orders values(70007,       948.5,       '2012-09-10' , 3005   ,      5002); 
insert into  orders values(70005,       2400.6,      '2012-07-27' , 3007   ,      5001); 
insert into  orders values(70008,       5760,        '2012-09-10' , 3002   ,      5001); 
insert into  orders values(70010,       1983.43,     '2012-10-10' , 3004   ,      5006); 
insert into  orders values(70003,       2480.4,      '2012-10-10' , 3009   ,      5003); 
insert into  orders values (70012,       250.45,      '2012-06-27' , 3008    ,     5002); 
insert into  orders values(70011,       75.29 ,      '2012-08-17' , 3003    ,     5007); 
insert into  orders values (70013,       3045.6,      '2012-04-25' , 3002    ,     5001); 
select * from orders ;
--14.Write a query to find those customers with their name and those
--salesmen with their name and city who lives in the same city. 
select cust_name,c.city,s.city from costumer c , salesman s
where c.city=s.city;

--15.	Write a SQL statement to find the names of all customers along
--with the salesmen who works for them.
select cust_name,name from costumer,salesman
where costumer.salesman_id=salesman.salesman_id;
--16.	Write a SQL statement to display all those orders by the customers
--not located in the same cities where their salesmen live
select * from orders;

select ord_no , cust_name,c.city,s.city from orders o, costumer c, salesman s
where c.city <> s.city
and  o.costumer_id=c.costumer_id
and  o.salesman_id=s.salesman_id;

--17.	Write a SQL statement that finds out each order number followed 
--by the name of the customers who made the order.
select ord_no , cust_name from orders o, costumer c, salesman s
where o.costumer_id=c.costumer_id
and  o.salesman_id=s.salesman_id;
--18.	Write a SQL statement that sorts out the customer and their grade 
--who made an order. Each of the customers must have a grade and served 
--by at least a salesman, who belongs to a city.
select * from orders;

select s.name Costumer ,c.grade,s.city,o.ord_no
from costumer c ,orders o ,salesman s 
where o.costumer_id=c.costumer_id
and  o.salesman_id=s.salesman_id
and c.grade is not null
and s.city is not null;

--19.	Write a query that produces all customers with their name, city, 
--salesman and commission, who served by a salesman and the salesman works
--at a rate of the commission within 12% to 14%.
select c.cust_name,c.city,s.name,s.commission from costumer c  ,salesman s
where  c.salesman_id=s.salesman_id 
and s.commission BETWEEN 0.12 and 0.14;

--20.	Write a SQL statement that produces all orders with the order number, customer name,
--commission rate and earned commission amount for those customers who carry their
--grade is 200 or more and served by an existing salesman.	
select o.ord_no,c.cust_name,s.commission,c.grade, purch_amt*commission AS "Commission"from  costumer c , salesman s, orders o
where o.salesman_id= s.salesman_id
and   o.costumer_id= c.costumer_id
and   grade >=200;
select * from salesman;
--21.	Write a SQL statement to prepare a list with salesman name, customer name and 
--their cities for the salesmen and customer who belongs to the same city.
select s.name,c.cust_name,s.city,c.city from costumer c,salesman s
where s.salesman_id= c.salesman_id
and s.city=c.city;

--22.	Write a SQL statement to make a list with order no, purchase amount, customer name 
--and their cities for those orders which order amount between 500 and 2000.
select o.ord_no,c.cust_name,s.city,o.purch_amt from  costumer c , salesman s, orders o
where o.salesman_id= s.salesman_id
and   o.costumer_id= c.costumer_id
and   purch_amt between 500 and 2000;
select * from salesman;
--23.	Write a SQL statement to know which salesman are working for which customer

select c.cust_name,s.name from  costumer c , salesman s
where c.salesman_id= s.salesman_id;
--24.	Write a SQL statement to find the list of customers who appointed a salesman
--for their jobs who gets a commission from the company is more than 12%.
select c.cust_name,s.name,s.commission from  costumer c , salesman s
where c.salesman_id= s.salesman_id
and  commission > 0.12;

--25.Write a SQL statement to find the list of customers who appointed a salesman 
--for their jobs who does not live in the same city where their customer lives, 
--and gets a commission is above 12% 
select c.cust_name,s.name,s.commission,c.city,s.city from  costumer c , salesman s
where c.salesman_id = s.salesman_id
and  commission > 0.12
and  c.city<>s.city;
--26.	Write a SQL statement to find the details of a order i.e. order number, 
--order date, amount of order, which customer gives the order and which salesman 
--works for that customer and how much commission he gets for an order.
select o.ord_no,o.ord_date,o.purch_amt, c.cust_name,s.name,s.commission from  costumer c , salesman s, orders o
where o.salesman_id= s.salesman_id
and   o.costumer_id= c.costumer_id;
--27.	Write a SQL statement to make a join on the tables salesman,
--customer and orders in such a form that the same column of each table will appear 
--once and only the relational rows will come.
SELECT * 
FROM orders 
NATURAL JOIN costumer  
NATURAL JOIN salesman;
--28.Write a SQL statement to make a list in ascending order for the customer who 
--works either through a salesman or by own.

select * from costumer ;
select * from salesman;
select c.cust_name cliente ,s.name vendedor from costumer c 
left join  salesman s on c.salesman_id=s.salesman_id;
insert into costumer values (3014         ,'David Cutiopala'  ,'New York',    100       , null);
--29.Write a SQL statement to make a list in ascending order for the customer who
--holds a grade less than 300 and works either through a salesman or by own.

select c.cust_name , c.costumer_id, NVL(s.name,'Independiente' ) from costumer c 
left join  salesman s on c.salesman_id=s.salesman_id
where grade<300
order by c.costumer_id;

--30.Write a SQL statement to make a report with customer name, city,
--order number, order date, and order amount in ascending order according
--to the order date to find that either any of the existing customers have 
--placed no order or placed one or more orders.

select c.cust_name , c.city,o.ord_no,o.purch_amt,o.ord_date from costumer c 
full  join  orders o on c.costumer_id= o.costumer_id
order by o.ord_date;

insert into orders values (70078,545.09,'25-APR-13',null,5001);
select * from orders;
select * from  salesman;
--31.Write a SQL statement to make a report with customer name, city, order number, order date, 
--order amount salesman name and commission to find that either any of the existing customers 
--have placed no order or placed one or more orders by their salesman or by own.

select c.cust_name , c.city,o.ord_no,o.purch_amt,o.ord_date, s.name,s.commission from costumer c 
left  join  orders o on c.costumer_id= o.costumer_id
left join   salesman s on s.salesman_id =c.salesman_id
order by o.ord_date;
--32.Write a SQL statement to make a list in ascending order for the salesmen who works
--either for one or more customer or not yet join under any of the customers.
select s.salesman_id, NVL(c.cust_name,'no tiene cliente')Cliente ,  s.name  Vendedores from costumer c 
right  join   salesman s on s.salesman_id =c.salesman_id
order by s.salesman_id;

insert into salesman values (5010,'Alex',null,0.34);

select * from salesman;


--33.Write a SQL statement to make a list for the salesmen who works either for 
one or more customer or not yet join under any of the customers who placed either 
one or more orders or no order to their supplier. 
Escriba una declaración SQL para hacer una lista para los vendedores que trabajan
para uno o más clientes o que aún no se unen bajo ninguno de los clientes que hicieron 
uno o más pedidos o ningún pedido a su proveedor.

select  s.name , c.cust_name ,ord_no from costumer c 
right join  orders o on c.costumer_id= o.costumer_id
right join   salesman s on s.salesman_id =c.salesman_id;
--34.Write a SQL statement to make a list for the salesmen who either work for one or more
customers or yet to join any of the customer. The customer may have placed, either 
one or more orders on or above order amount 2000 and must have a grade, or he may 
not have placed any order to the associated supplier.


select  s.name , c.cust_name, c.grade ,ord_no from costumer c 
left join  orders o on c.costumer_id= o.costumer_id
right join   salesman s on s.salesman_id =c.salesman_id
where purch_amt>2000
and c.grade is not null;

--35.Write a SQL statement to make a report with customer name, city, order no. order date, 
purchase amount for those customers from the existing list who placed one or more orders or
which order(s) have been placed by the customer who is not on the list

--36.Write a SQL statement to make a report with customer name, city, order no. order date, purchase amount for only those customers on the list who must have a grade and placed one or more orders or which order(s) have been placed by the customer who is neither in the list not have a grade.

--37.Write a SQL statement to make a cartesian product between salesman and customer i.e. each salesman will appear for all customer and viceversa

--38.Write a SQL statement to make a cartesian product between salesman and customer i.e. each salesman will appear for all customer and vice versa for that customer who belongs to a city

--39.Write a SQL statement to make a cartesian product between salesman and customer i.e. each salesman will appear for all customer and vice versa for those salesmen who belongs to a city and the customers who must have a grade.

--40.Write a SQL statement to make a cartesian product between salesman and customer i.e. each salesman will appear for all customer and vice versa for those salesmen who must belong a city which is not the same as his customer and the customers should have an own grade.
--41.Write a SQL query to display all the data from the item_mast, including all the data for each item's producer company.
--customer name, commission rate and earned commission amount for those customers who carry their grade is 200 or more and served by an existing salesman.

SELECT MONTH BETWEEN 

SELECT TO_CHAR(
     ADD_MONTHS(hire_date,1),
     'DD-MON-YYYY') "Next month"
     FROM employees 
     WHERE last_name = 'King';
     
     
     select * from employees
    
select  last_name, VSIZE (last_name)"BYTES" 
from EMPLOYEES
WHERE department_id = 10 order by employee_id;

--Para cambiar el estado de NULL de algun campo 
select NVL (commission_pct,9)from employees
--
select first_name ,last_name , salary,commission_pct NVL(commission_pct,1)*100/salary
from eployees
--NULLIF (EXPRES 1 EXPRES 2)
--CONSULTAR EL VALOR ANUAL QUE PERCIBE CADA EMPLEADO DE UNA EMPRESA 

--1 ok!
select first_name , salary*12 from employees
  select * from employees
--2 ok!

SELECT last_name, salary, NVL2(commission_pct, 
   salary + (salary * commission_pct), salary) 
   FROM employees 
   
--3 mal
SELECT last_name, VSIZE (last_name) "BYTES",first_name, VSIZE (first_name) "BYTES"
from employees;

SELECT last_name, null if  VSIZE (last_name) "BYTES",first_name, VSIZE (first_name) "BYTES"
from employees;

--4 mal
SELECT last_name, salary, NVL2(commission_pct, salary ,'otra exprecion') 
   FROM employees;

--Coalesce ok.!
select last_name , coalesce (commission_pct,manager_id,-1) from employees

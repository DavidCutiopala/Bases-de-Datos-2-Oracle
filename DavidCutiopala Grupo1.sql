--ejercicio1
select employee_id,first_name , last_name from  employees
where department_id in (select department_id from employees
                                           where job_id in (select  job_id from jobs
                                                                          where job_title like '%Clerk%'));

select * from employees;
select * from jobs;

--Ejercicio 2 

select e.first_name,e.salary,d.department_id from employees e
full join departments d on e.department_id= d.department_id;


select department_id, avg(salary) from employees 
group by department_id;

SELECT E.FIRST_NAME NOMBRE,E.LAST_NAME APELLIDO,E.SALARY  SALARIO,D.DEPARTMENT_ID, M.prom
FROM  (select department_id, avg(salary) as prom from employees 
group by department_id) M ,EMPLOYEES E
inner join departments d on e.department_id=d.department_id
WHERE e.salary>m.prom
group  BY E.FIRST_NAME,E.LAST_NAME,E.SALARY,D.DEPARTMENT_ID, M.prom ;

SELECT FIRST_NAME AS NOMBRE,LAST_NAME AS APELLIDO,SALARY AS SALARIO,M.DEPARTMENT_ID, M.MINIMO_SALARIO 
FROM EMPLOYEES E, (SELECT DEPARTMENT_ID,MIN(SALARY) AS MINIMO_SALARIO FROM EMPLOYEES GROUP BY DEPARTMENT_ID) M
WHERE E.DEPARTMENT_ID=M.DEPARTMENT_ID 
ORDER BY E.DEPARTMENT_ID;

                           
--Ejercicio 3 
select first_name,last_name, salary,min(salary) from employees 
inner join departments on employees.department_id= departments.department_id
group by first_name,last_name,salary;


--Ejercicio 4 
select  department_id 
 from employees
 group by department_id
 having max(salary)>10000;
 
 100,30,90,20,110,80 max
 90,110  avg
 

 





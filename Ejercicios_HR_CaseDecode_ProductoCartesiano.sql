select * from employees;
--__________________ CASE Y DECODE ________________________________
SELECT last_name,
   CASE job_id WHEN  'IT_PROG' THEN salary+(salary*0.10)
               WHEN  'ST_CLERK' THEN salary+(salary*0.15)
               WHEN  'SA_REP' THEN salary+(salary*0.20)
               else   -1
               end  Aumento_Salario from employees;
               
SELECT last_name,
       DECODE (job_id,' IT_PROG',salary+(salary*0.10) ,
                             'ST_CLERK', salary+(salary*0.15), 
                             'SA_REP', salary+(salary*0.20),'1')
                             Aumento_salario
                             FROM employees;
--________________ CONSULTAS VARIAS TABLAS _______________________

select  department_name,First_name from Departments D ,Employees E
where  D.department_id= E.department_id;


--Apellido, nombre,ciudad,salario, departamento ala que pertenece 

select * from employees;

Select first_name,salary,department_name from employees E ,departments D , countries C
where d.department_id= e.department_id;--FALTA

--listar los  nombres empleados y codigos de departamento
Select e.first_name,d.department_name from employees E ,departments D 
where d.department_id (+)= e.department_id;--OK
--SELF JOIN CUANDO 
Select e.first_name,d.department_name from employees E ,departments D 
where d.department_id (+)= e.department_id;
-- LISTAR EL NOMBRE DEL EMPLEADO Y EL NOMBRE DEL JEFE RECURSIVA
select 'El empleado' , A.last_name ,'tiene como jefe', B.last_name from employees A , employees B
where A.manager_id=B.manager_id;--OK
--________________SUBQUERYS___________________________________________________
--listar todos los epleados que perte

Select last_name,department_id from employees
where department_id=(select department_id from employees 
where last_name='Abel');

--listar el nombre apellido salario de los empleados que reciben un salario mayor
--al empleado cuyo codigo es 104

Select last_name,last_name,salary from employees
where salary>(select employee_id from employees 
where employee_id='104');



Select last_name,last_name,salary from employees
where salary >any (select department_id from employees
where department_id=10);


--listar los empleados que tienen un salario menor al empleado cuyo codigo es 
--104 y pertenece al departamento 10
select first_name,last_name,salary
from employees
where salary <(select salary
                from employees
                where Department_id=104)or
                salary<all(select salary 
                        from employees
                        where department_id=10);
















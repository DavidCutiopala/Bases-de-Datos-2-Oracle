--EXAMEN FORMA 2 
-- Crear un reporte para listar el numero de empleados  que ingresaron ala empresa en los años 1995 a 1998
select extract (year from start_date ) anio  ,count(*) numero_de_empleados from job_history
group by extract (year from start_date )
having extract (year from start_date )<= 1998 and  extract (year from start_date ) >=1995;
--Listar el apellido y codigo código del empleado incluir el apellido y código de su jefe

select e.employee_id , e.last_name ,e.first_name , m.last_name , m.employee_id 
from employees e,(select employee_id,last_name from employees) m
where e.manager_id=m.employee_id order by e.employee_id

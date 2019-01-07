--_______________TALLER 3  PL\SQL SENTENCIAS DML _____________________
--1.        Crear un bloque PL/SQL que imprima información sobre el máximo salario pagado a los empleados 
--            guarde esta información en una variable y muéstrela en pantalla 
SET SERVEROUTPUT  ON
DECLARE
v_maxSalary  employees.salary%type;
BEGIN 
select  max(salary)  into v_maxSalary from employees;
 DBMS_OUTPUT.PUT_LINE(to_char(v_maxSalary));
END;

SET SERVEROUTPUT  ON
DECLARE
v_Salary  employees.salary%type;
v_Fname  employees.first_name%type;
v_Sname  employees.last_name%type;
BEGIN 
select  first_name , last_name,salary  into v_Fname,v_Sname,v_Salary  from employees
where employee_id=101;
 DBMS_OUTPUT.PUT_LINE(v_fname||'  segundo nombre ' || v_Sname||' Salario '||to_char(v_Salary));
END;

select * from employees;
SET SERVEROUTPUT  ON
DECLARE
v_sumSalary  employees.salary%type;
BEGIN 
select sum(salary)  into v_sumSalary from employees
where employees.department_id=10;
 DBMS_OUTPUT.PUT_LINE(to_char(v_sumSalary));
END;


--2.	Crear un bloque PL/SQL para insertar un nuevo departamento en la tabla DEPARTMENTS.  
--     a.	Utilice el comando DEFINE para ingresar el código, nombre, del nuevo departamento llamado “EDUCACION”  
--     b.	Registre el código location y manager como null por esta vez 
--    c.	Muestre en pantalla el nuevo departamento creado 


SET SERVEROUTPUT ON 
DEFINE codigo=943; 
DEFINE nombre=Educacion1; 
DECLARE 
codigo departments.department_id%type; 
nombre departments.department_name%type;
v_codigo departments.department_id%type := &codigo;
v_nombre departments.department_name%type := '&nombre';
v_manager departments.manager_id%type := NULL; 
v_locacion departments.location_id%type := NULL; 
BEGIN 
insert into departments  values (v_codigo, v_nombre, v_manager, v_locacion); 
commit;
DBMS_OUTPUT.PUT_LINE('Codigo: '||v_codigo||' Nombre: '||v_nombre||' Manager: '||v_manager||' Locacion: '||v_locacion); 
END; 


--3.	Crear un bloque PL/SQL para ingresar un nuevo empleado en el departamento creado



select sysdate from dual;
DECLARE 
v_codigo employees.employee_id%type := 300;
v_apellido employees.last_name%type := 'Cutiopala';
v_email employees.email%type := 'Dawctes';
v_fechadesp employees.hire_date%type := '19-NOV-18'
; v_codtrab employees.job_id%type := 'AD_ASST';
v_coddep employees.department_id%type := 9; 
BEGIN 
insert into employees values (v_codigo, NULL, v_apellido, v_email, NULL,  v_fechadesp, v_codtrab, NULL, NULL, NULL, v_coddep); 
END; 


select * from  employees;




--4. Crear un bloque PL/SQL para borrar el empleado ingresado en el proceso anterior. 
--     a.	Utilice el comando DEFINE para ingresar el código del empleado a eliminar 

DEFINE codigo=300;
DECLARE 
v_codigo employees.employee_id%type := &codigo; 
BEGIN 
delete from employees where employee_id=v_codigo; 
END; 
select * from  employees;

--5. Crear un bloque PL/SQL para borrar el departamento ingresado en el proceso anterior. 
--     a. Utilice el comando DEFINE para ingresar el código del departamento a eliminar 


DEFINE codigo=999;
DECLARE 
v_codigo departments.department_id%type := &codigo; 
BEGIN 
delete from departments where department_id=v_codigo; 
END; 

select * from  departments;


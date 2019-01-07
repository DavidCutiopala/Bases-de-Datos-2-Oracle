
--Procedimiento para actualizar el salario de un empleado 

SET SERVEROUTPUT ON 
CREATE OR REPLACE PROCEDURE upd_Salary
  (emp_id IN employees.employee_id%TYPE,
   emp_salary IN employees.salary%TYPE)
   is
BEGIN
  UPDATE employees
  SET salary =emp_salary
  WHERE employee_id =emp_id ;
END upd_Salary;

EXECUTE upd_Salary(100,2000);

select * from employees;
--PROCEDIMIENTO PARA AUDITAR QUIEN ELIMINA USUARIOS
create table  log_table(
user_id number(3),
log_date date
);
create or replace procedure leave_emp2
(p_id IN employees.employee_id%TYPE)
IS
 PROCEDURE log_exec
 IS
 begin
 INSERT INTO log_table (user_id,log_date)
 VALUES (USER, SYSDATE);
 END log_exec;
 BEGIN 
 DELETE FROM employees
 WHERE employee_id = p_id;
 log_exec;
 END leave_emp2;
 
 EXECUTE leave_emp2(100);
 insert into employees values (45,'david','asda','dasdasd','1232423','17-jun-03','AD_VP',300,null,null,null);
 select * from employees;
 
 --________FUNCIONES___________________
 
 --Crear un funcion para mostrar los salarios por departamento 
 
CREATE OR REPLACE FUNCTION q_sal
  (d_id IN departments.department_id%TYPE)
RETURN number
IS
  v_total  number(11);
BEGIN
  SELECT sum(salary) INTO  v_total  
  FROM employees  e  WHERE e.department_id=d_id;
  RETURN v_total;
END q_sal;
 
SET SERVEROUTPUT ON 
declare 
v_total  number(11);
begin 
v_total:=q_sal(50);
DBMS_OUTPUT.PUT_LINE(v_total ); 
end;
 
 select * from employees;
 
 
 
 
 
 
 
 
 
 
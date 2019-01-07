-- Crear un bloque PL/SQL para calcular un bono de acuerdo a lo siguiente: 
--	Utilice el comando DEFINE para indicar el código del empleado 
--Si el empleado tiene un salario menor a $5000, otorgue en el bono un valor del 10% del salario del empleado 
--	Si el empleado tiene un salario entre a $5001 y $10.000, otorgue en el bono un valor del 15% del salario del empleado 
--Si el empleado tiene un salario mayor a $10.001, otorgue en el bono un valor del 20% del salario del empleado 
 
SET SERVEROUTPUT ON 
define v_id =198 
declare 
 v_id  employees.employee_id%type:=&v_id; 
 v_bono      number(7,2):=0.00; 
 v_salario   employees.salary%type;
begin    
select salary  into v_salario   from employees   where employee_id=v_id;       
  if v_salario < 5000 then           
      v_bono:=v_salario*0.10; 
 elsif v_salario between 5000 and 10000 
 then 
            v_bono:=v_salario*0.15;    
               else v_bono:=v_salario*0.20;   
               end if; 
     DBMS_OUTPUT.PUT_LINE('#Empleado:'||v_id ||'   Salario:   '||v_salario||'  Bono:  '|| v_bono); end; 

 
--2.	Crear una tabla llamada EMP, con similar estructura que la tabla EMPLOYEES, 
--adicione a esta tabla una columna llamada STARS tipo VARCHAR2 de longitud 50. 
 
CREATE TABLE EMP AS  
   SELECT employee_id, first_name, last_name, email, phone_number, hire_date, job_id,     salary, commission_pct, manager_id, department_id 
   FROM employees 
COMMIT; 
 
ALTER TABLE emp ADD stars Varchar2(50); 


3.	Crear un bloque PL/SQL que permita guardar asteriscos en la columna STARS de la tabla EMP creada de acuerdo a lo siguiente: 
a.	Utilice el comando DEFINE para pasar el valor del ID del empleado 
b.	Inicialice la variable v_asterisk con NULL 
c.	Añada en la columna STARS del empleado un asterisco por cada $1000 del salario recibido, ejemplo: 

 
SET SERVEROUTPUT ON 
DEFINE e_codigo = 100
DECLARE 
e_codigo number(9,2) := &e_codigo; 
v_sal emp.salary%TYPE; 
v_asterisk varchar2(50):= NULL; 
BEGIN 
SELECT salary INTO v_sal  FROM emp WHERE employee_id = e_codigo; 
FOR i IN 1..ROUND(v_sal/1000)LOOP 
  v_asterisk := v_asterisk || '*'; 
END LOOP; 
UPDATE EMP 
SET stars = v_asterisk 
WHERE employee_id = e_codigo; 
END; 


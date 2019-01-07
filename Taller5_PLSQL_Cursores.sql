--1.	Crear  una  nueva  table  para  almacenar  información  de  nombres  y  salarios  de  los  empleados  
    
create  table  cursores  as  select  first_name,  last_name,  salary  from  employees;

-- 2.	Crear  un  pl/sql  que  determine  el  top  n  del  salario  de  los  empleados    
--      a.	Solicitar  por  teclado  el  valor  n  que  represente  el  top  de  los  salarios  
--      b.	Mediante  el  uso  de  cursores  en  la  tabla  employees  busque  el  top  n  de  salarios  
--      c.	Guarde  los  nombres  y  los  salarios  top  en  la  nueva  tabla  creada  
  
    
SET  SERVEROUTPUT  ON  
ACCEPT  v_top  PROMPT  'Ingrese  el  Top  de  salarios: '  
DECLARE  
v_top  Number(2,0):=  &v_top;
v_index  Number(2,0);
CURSOR  emp_cursor  IS  SELECT  last_name,  first_name,  salary  FROM  employees
ORDER  BY  salary  DESC;
emp_record  emp_cursor%rowtype;
BEGIN  
v_index:=0;  
OPEN  emp_cursor; 
LOOP          
FETCH  emp_cursor  into  emp_record.last_name,  emp_record.first_name,  emp_record.salary;
EXIT  WHEN  v_index>=v_top;  
INSERT  INTO  cursores  VALUES(emp_record.last_name,  emp_record.first_name,  emp_record.salary);
DBMS_OUTPUT.PUT_LINE('Apellido:  '||  emp_record.last_name  ||'    Nombre:  '||  emp_record.last_name  ||'  Salario:  '  ||  emp_record.salary); 
v_index:=v_index+1;
END  LOOP;    
 CLOSE  emp_cursor;  
          
END;           
  
--      3.  Crear  un  pl/sql  que  realice  lo  siguiente:    
--      a.	Utilizando  cursores  verifique  el  salario  de  todos  los  empleados    
--      b.	Si  el  salario  del  empleado  es  menor  a  $2000  enviar  el  mensaje  siguiente  por  ejemplo  “El  empleado  SCOTT  necesita  aumento  de  sueldo”    
--      c.	Si  el  salario  del  empleado  esta  entre  $2001  y  $3000  enviar  el  mensaje  siguiente  por  ejemplo  “El  empleado  SCOTT  tiene  un  sueldo  aceptable”    
--      d.	Si  el  salario  del  empleado  es  mayor  a  $3001  enviar  el  mensaje  siguiente  por  ejemplo    
--      “El  empleado  SCOTT  no  necesita  aumento  de  sueldo”    
    
  
SET  SERVEROUTPUT  ON  
DECLARE    
CURSOR  emp_cursor  IS   SELECT  last_name,  first_name,  salary  FROM  employees? 
emp_record  emp_cursor%rowtype; 
BEGIN  
  OPEN  emp_cursor;  
  LOOP    
        FETCH  emp_cursor  INTO  emp_record.last_name,  emp_record.first_name,  emp_record.salary;?  
        EXIT  WHEN  emp_cursor%NOTFOUND;?  
        if  emp_record.salary  <  2000  then  
                    DBMS_OUTPUT.PUT_LINE('EL  EMPLEADO  '  ||  emp_record.first_name  ||  '  '  ||  
emp_record.last_name  ||  '  NECESITA  AUNMENTO  DE  SUELDO');?  
                elsif  emp_record.salary  between  2001  and  3000  then  
                  DBMS_OUTPUT.PUT_LINE('EL  EMPLEADO  '  ||  emp_record.first_name  ||  '  '  ||  emp_record.last_name  ||  '  TIENE  UN  SUELDO  ACEPTABLE');?  
        else  
                  DBMS_OUTPUT.PUT_LINE('EL  EMPLEADO  '    ||  emp_record.first_name  ||  '  '  ||  emp_record.last_name  ||  '  NO  NECESITA  AUNMENTO  DE  SUELDO');?  
        end  if;?  
        END  LOOP  ;?  
        CLOSE  emp_cursor;?  
END;?  

create table Credito
(
 employee_id number(6),
 fecha_credito date,
 monto_otorgado number (9,2),
 tipo_credito varchar2(15),
 
 constraint fk_em foreign key (employee_id)  references  employees (employee_id)
)

ALTER SESSION SET NLS_DATE_FORMAT='DD-MM-YYYY'
select sysdate from dual ;
insert into Credito values (100,'12-05-2018',2000,'consumo');
insert into Credito values (101,'15-05-2018',50000,'hipotecario');
insert into Credito values (100,'08-07-2018',1000,'consumo');
insert into Credito values (106,'13-05-2018',2000,'consumo');
insert into Credito values (109,'15-05-2018',10000,'hipotecario');
insert into Credito values (108,'08-07-2018',1000,'consumo');
insert into Credito values (102,'13-05-2018',2000,'consumo');
insert into Credito values (100,'12-05-2018',2000,'consumo');


CREATE OR REPLACE FUNCTION func_otorga
  (v_id in employees.employee_id%type,
   v_tipo in credito.tipo_credito%type)
RETURN BOOLEAN
IS
 v_temp  credito.employee_id%type;
BEGIN

select  c.employee_id  into  v_temp  from   Credito  c
where c.employee_id = v_id  and  c.tipo_credito=v_tipo;
return  false;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN true;
 END  func_otorga;
       
SET SERVEROUTPUT ON  
declare 
v_var boolean ;
begin 
if func_otorga(300,'consumo') then 
DBMS_OUTPUT.PUT_LINE('true'); 
end if ;
end;

--Ejercicio 2 

select salary from employees





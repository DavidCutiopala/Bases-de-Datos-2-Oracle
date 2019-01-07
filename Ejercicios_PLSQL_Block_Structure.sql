--_______________VARIABLES____________________________
Declare 
v_hireDate date;                        --     Sintaxis la v de variable  [] en los libros significa Opcional 
c_com int := 23;                          --     := Para asignar un valor a la variable 
v_total_sal number (9,2):=0;  --     Quiere decir que 2 es para decimal y 7 para entero
v_orderdate   Date := sysdate + 7;
c_tax_rate  constant NUMBER(3,2);  --Constante 

describe employees;
--__________Herencia de Atributos_______________________
declare 
v_salario   employees.salary%type;   -- hereda el tipo de dato de salario  se escribe dentro del bloque declare
v_balance  number (7,2);
v_min_balance  v_balance%type :=10;   -- v_min_balance hereda de  number (tambien puede heredar de variables)
begin
__________________________________________________
SET SERVEROUTPUT  ON-- Se necesita para imprimir 
--___________EJEMPLOS_____________________________
--____________Ejemplo 1__________________________________
SET SERVEROUTPUT  ON
Declare
  v_var1 varchar2(10) := 'Hola';
  v_var2 varchar2(15) := 'Bases ORACLE';
  v_var3 number (5,2) := 14.34;
Begin
DBMS_OUTPUT.PUT_LINE(v_var1);
DBMS_OUTPUT.PUT_LINE(v_var2);
DBMS_OUTPUT.PUT_LINE(to_char(v_var3));
END;
--____________Ejemplo 2_______________________________________ 
SET SERVEROUTPUT ON
define p_annual_sal = 60000
declare 
v_sal number(9,2) := &p_annual_sal;
begin 
v_sal := v_sal/12;
DBMS_OUTPUT.PUT_LINE('the monthly salary is '|| to_char(v_sal));
end;



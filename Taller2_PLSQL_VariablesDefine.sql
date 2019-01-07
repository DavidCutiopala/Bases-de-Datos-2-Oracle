--_________________TALLER NUMERO 2 ______________________
SET SERVEROUTPUT  on 
declare 
v_weight number (3) := 600;
v_message varchar(255) := 'product 10012' ;
v_new_locn     varchar(50):='';
begin 
                declare 
                v_weight  number(3) :=1;
                v_message varchar(255):='product 11001';
                v_new_locn     varchar(50):='Europe';
                 begin 
                 v_weight := v_weight + 1 ;
                 v_new_locn := 'western ' || v_new_locn;
                 DBMS_OUTPUT.PUT_LINE(to_char(v_weight));
                 DBMS_OUTPUT.PUT_LINE(v_message);
                 end;
v_weight := v_weight+1;
v_message :=v_message || ' is in stock';
v_new_locn := 'Western' || v_new_locn ;
DBMS_OUTPUT.PUT_LINE(to_char(v_weight));
DBMS_OUTPUT.PUT_LINE(v_message);
end ;
-- 3.	Crear y ejecutar un bloque PL/SQL que acepte dos números, use el comando DEFINE. Pase los valores al bloque PLSQL y guarde en variables.
--El primer número divida por el segundo número y adicione el resultado en una variable y muestre en pantalla. 
SET SERVEROUTPUT  ON
define num1 = 400;
define num2 = 200;
Declare 
numero1 number (3) :=&num1 ;
numero2 number (3) :=&num2;
respuesta number (3);
begin 
respuesta:=numero1/numero2;
DBMS_OUTPUT.PUT_LINE('El resultado de la divicion es '||to_char(respuesta));
end;
--4.	Construir un bloque PLSQL para calcular el total de compensación de un año.
--El salario anual y la comisión o bono ganado (porcentaje del salario), 
--se enviara como valor desde el comando DEFINE p.e.  DEFINE p_salary = 50000 DEFINE p_bomus = 10 
SET SERVEROUTPUT  ON
define p_salary = 50000;
define p_bonus=10;
declare
salary number (5):=&p_salary;
bonus number (5):=&p_bonus;
total_compensacion number (6);

begin 
total_compensacion:=salary+salary *(bonus/100);
DBMS_OUTPUT.PUT_LINE(to_char(total_compensacion));
end;

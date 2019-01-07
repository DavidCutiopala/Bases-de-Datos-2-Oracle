--__________EJERCICIOS TALLER REPASO GENERAL____________

--6.	Escriba un bloque PL / SQL para calcular el salario final del empleado cuya ID es 110,
--     dado como parámetro el porcentaje de incentivo a incrementar 

CREATE OR REPLACE PROCEDURE upd_Salary
  (aumento IN  number )
   is
BEGIN
  UPDATE employees
  SET salary =(((aumento*salary)/100)+salary )
  WHERE employee_id =110;
END upd_Salary;

EXECUTE upd_Salary(20);
   
--7.	Escriba un bloque PL/SQL para calcular el área de un circulo (los valores necesarios para calcular la fórmula del área deben ser solicitados por pantalla)

SET SERVEROUTPUT ON 
ACCEPT v_rad PROMPT 'Ingrese radio'
DECLARE
v_area number ;
v_phi number := 3.14;
v_rad  number :=&v_rad;
BEGIN
v_area:=v_phi*power(v_rad,2);
DBMS_OUTPUT.PUT_LINE('Area del circulo : '||v_area);
END ;

--8.	Seleccione el tipo de bucle (FOR, WHILE, simple LOOP ) apropiado para cumplir con cada uno de los siguientes requisitos:
--     a	Muestra el nombre y la dirección de cada empleado devuelto por un cursor.
--     b  Escanee la lista de empleados en la tabla de PL / SQL, contando todos los salarios superiores a $ 50,000. 
--          Sin embargo, ni siquiera inicie la exploración si la tabla está vacía o si hoy es sábado o si el primer empleado de la tabla PL / SQL es el presidente de la empresa.
--__a__
SET SERVEROUTPUT ON 
declare 
cursor emp_cursor is select e.first_name,d.department_name,l.street_address from employees e 
                                                          inner join  departments d on e.department_id=d.department_id
                                                          inner join  locations l on d.location_id=l.location_id;
begin 
for cursor_e in emp_cursor 
loop
DBMS_OUTPUT.PUT_LINE('Nombre: ' || cursor_e.first_name || '  departamento '|| cursor_e.department_name|| ' Direccion '||cursor_e.street_address );
end loop ;
end;

--__b__

SET SERVEROUTPUT ON 
CREATE OR REPLACE PROCEDURE  emp_proc
IS
  e_invalid EXCEPTION;
  cursor cursor_emp  is select * from employees 
   where salary>=5000;
BEGIN
  IF SQL%NOTFOUND THEN
    RAISE e_invalid;
  END IF;
  for cursor_e in cursor_emp loop
  DBMS_OUTPUT.PUT_LINE('Nombre '||cursor_e.first_name||' Salario '||cursor_e.salary);
  end loop;
EXCEPTION
  WHEN e_invalid THEN
    DBMS_OUTPUT.PUT_LINE('ERROR:  No existe la tabla ');
END  emp_proc;
EXECUTE emp_proc();



FOR i IN 1 .. 76 LOOP
       calc_totals (i);
END LOOP;


OPEN emp_cur;
FETCH emp_cur INTO emp_rec;
             WHILE emp_cur%FOUND
            LOOP
               calc_totals (emp_rec.salary);
         FETCH emp_cur INTO emp_rec;
         EXIT WHEN emp_rec.salary > 100000;
END LOOP;
CLOSE emp_cur;

FOR a_counter IN lo_val .. hi_val
LOOP
   IF a_counter > lo_val * 2
   THEN
      hi_val := lo_val;
   END IF;
END LOOP;


DECLARE
   CURSOR emp_cur IS SELECT salary FROM emp;
   emp_rec emp_cur%ROWTYPE;
BEGIN
for emp_rec in  emp_cur
   LOOP
    calc_totals (emp_rec.salary);
   END LOOP;
END;

WHILE no_more_data
LOOP
   read_next_line (text);
   no_more_data := text IS NULL;
END LOOP;


   UPDATE monthly_sales 
      SET pct_of_sales = 100
    WHERE company_id = 10006
      AND month_number =  between (1 and 12);
      
      
DECLARE
   CURSOR emp_cur IS SELECT ... ;
BEGIN
   FOR emp_rec IN emp_cur
   LOOP
      calc_totals (emp_rec.salary);
   END LOOP;  
           THEN
              DBMS_OUTPUT.PUT_LINE ('Give ''em a raise!');
           END IF;
END;


INSERT INTO occupancy_history (pet_id, name, checkout_date)
   SELECT pet_id, name, checkout_date 
     FROM occupancy
    WHERE checkout_date IS NOT NULL
    
    DECLARE
   end_of_analysis BOOLEAN := FALSE;
   CURSOR analysis_cursor IS SELECT ...;
   analysis_rec analysis_cursor%ROWTYPE;
   next_analysis_step NUMBER;
   PROCEDURE get_next_record (step_out OUT NUMBER) IS
   BEGIN
      FETCH analysis_cursor INTO analysis_rec;
      IF analysis_rec.status = 'FINAL'
      THEN
         step_out := 1;
      ELSE
         step_out := 0;
      END IF;
   END;
BEGIN
   OPEN analysis_cursor;
   WHILE NOT end_of_analysis
   LOOP
      get_next_record (next_analysis_step);
      IF analysis_cursor%NOTFOUND AND
         next_analysis_step IS NULL
      THEN
         end_of_analysis := TRUE;
      ELSE
         perform_analysis;
      END IF;
   END LOOP;
END;


give_bonus (president_id, 2000000);
give_bonus (ceo_id, 5000000);



DECLARE
   CURSOR emp_cur IS 
      SELECT ename, deptno, empno 
        FROM emp
       WHERE sal < 2500;
BEGIN
   FOR emp_rec IN emp_cur
   LOOP
      give_raise (emp_rec.empno, 10000);
   END LOOP;
END;



PROCEDURE display_dname (emp_in IN INTEGER) IS
   department# dept.deptno%TYPE := NULL;
BEGIN
   SELECT deptno INTO department#
     FROM emp
    WHERE empno = emp_in;
   IF department# IS NULL
   THEN
      DBMS_OUTPUT.PUT_LINE ('Dept is not found!');
   ELSE
      DBMS_OUTPUT.PUT_LINE ('Dept is ' || TO_CHAR (department#));
   END IF;
EXCEPTION
   WHEN NO_DATA_FOUND
   THEN
      DBMS_OUTPUT.PUT_LINE ('No data found');
END;


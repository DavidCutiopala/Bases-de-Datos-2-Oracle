--________________________EJERCICIOS CURSORES_______________________________________________________

24. Write a program in PL/SQL to create a cursor displays the name and salary of each employee in the EMPLOYEES table whose salary is less than that specified
by a passed-in parameter value

SET SERVEROUTPUT ON 
accept v_sal prompt 'Ingrese el salario '
declare
v_sal employees.salary%type :=&v_sal;
cursor emp_cursor  (v_sal1 number )  is select first_name , salary from employees 
where salary <= v_sal1;
begin
for cursor_e in emp_cursor(v_sal)
loop
DBMS_OUTPUT.PUT_LINE( cursor_e.first_name||cursor_e.salary); 
end loop;
end;


SET SERVEROUTPUT ON 
DECLARE
    var_record       employees%ROWTYPE;
    CURSOR cur_test (max_sal NUMBER) IS
        SELECT * FROM employees WHERE salary < max_sal;
BEGIN
    OPEN cur_test(5800);
    LOOP
        FETCH cur_test INTO var_record;
        EXIT WHEN cur_test%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Name: ' || var_record.first_name || chr(9)||' salary: '
            || var_record.salary);
    END LOOP;
    CLOSE cur_test;
END;

25. Write a program in PL/SQL to show the uses of fetch one record at a time using fetch statement
inside the loop.



26. Write a program in PL/SQL to fetch the first three rows of a result set into three records using Same explicit cursor into different variables.



27. Write a PL/SQL block to show the uses of a variable in explicit cursor query, and no result set is affected despite that value of the variable is incremented after every fetch.



--28. Write a PL/SQL block to display department name, head of the department,city, and employee with highest salary.

--Escriba un bloque PL / SQL para mostrar el nombre del departamento, el jefe del departamento, 
--la ciudad y el empleado con el salario más alto.

DECLARE
    CURSOR dpt_cur IS  SELECT d.department_id      id, d.department_name      dptname,l. city,Nvl(first_name, '...') manager FROM   departments d
    left outer join employees eON ( d.manager_id = e.employee_id )
    join locations l USING(l.location_id)
    ORDER  BY 2;
    emp_name       employees.first_name%TYPE;
    emp_max_salary employees.salary%TYPE;
BEGIN
    FOR dept_all IN dpt_cur LOOP
        SELECT Max(salary) INTO   emp_max_salary
        FROM   employees
        WHERE  department_id = dept_all.id;

        IF emp_max_salary IS NULL THEN
          emp_name := '...';
        ELSE
          SELECT first_name  INTO   emp_name FROM   employees
        WHERE  department_id = dept_all.id
        AND salary = emp_max_salary;
        END IF;

        dbms_output.Put_line(Rpad(dept_all.dptname, 20)
                             || Rpad(dept_all.manager, 15)
                             || Rpad(dept_all.city, 20)
                             || Rpad(emp_name, 20));
    END LOOP;
END;

--29. Write a PL/SQL block to display the department name, name of the manager,
--number of employees in each department, and number of employees listed in job_history.

--Escriba un bloque PL / SQL para mostrar el nombre del departamento, el nombre del gerente,
--la cantidad de empleados en cada departamento y la cantidad de empleados listados en job_history.

SET SERVEROUTPUT ON
declare 
cursor emp_cursor is select d.department_id,d.department_name,e.first_name  from  employees e
inner join departments d on e.department_id=d.department_id
and e.employee_id=d.manager_id;
v_cantEmp number;
v_cantJobH number;
begin 
for cursor_e in emp_cursor 
loop
     select count (*) into v_cantEmp from employees e 
     where e.department_id= cursor_e.department_id;

     select count (*)INTO   v_cantJobH FROM   job_history
        WHERE  department_id =cursor_e.department_id;
     /*select e.first_name from employees e 
     inner join job_history  j d on e.employee_id= j.employee_id--cursor_e.department_id
     group by e.department_id;------------------------ESTO NO SE HACEE------------------------------------------*/
      dbms_output.Put_line(Rpad(cursor_e.department_id, 5)
                             || Rpad(cursor_e.department_name, 25)
                             || Rpad(cursor_e.first_name, 20)
                             || Rpad(v_cantEmp, 20)
                             || Rpad(v_cantJobH , 20));
end loop;
end;

--30. Write a block in PL/SQL to displays employee name and number of jobs he or she done at past. 
--Displays employee name and job count by job

--Escriba un bloque en PL / SQL para mostrar el nombre del empleado y la cantidad de trabajos realizados en el pasado.
--Muestra el nombre del empleado y el recuento de trabajos por trabajo
SET SERVEROUTPUT ON 
DECLARE
    CURSOR emp_job_cur IS  SELECT job_id, job_title   FROM   jobs
                                                          WHERE  job_id IN (SELECT job_id FROM   employees)
                                                          ORDER  BY 2;
      
    CURSOR employees_cur (emp_jobid VARCHAR) IS SELECT first_name,Count(start_date) no_of_jobs FROM   employees e
                                                                                                            left outer join job_history jh USING (employee_id)
                                                                                                              WHERE  e.job_id = emp_jobid
                                                                                                              GROUP  BY first_name
                                                                                                              ORDER  BY 1;
BEGIN
    FOR emp_job_rec  IN emp_job_cur LOOP
		dbms_output.Put_line('---------------------------------------');	
        dbms_output.Put_line('Job Title: '||emp_job_rec.job_title);
		dbms_output.Put_line('---------------------------------------');

        FOR employee_list IN employees_cur( emp_job_rec.job_id) LOOP
            dbms_output.Put_line('    '
                                 || Rpad(employee_list.first_name, 20)
                                 || employee_list.no_of_jobs);
        END LOOP;
    END LOOP;
END; 

select * from job_history

--31. Write a block in PL/SQL to display the name of department and their head.
 --    Escriba un bloque en PL / SQL para mostrar el nombre del departamento y su jefe.

DECLARE
    CURSOR emp_dep_cur  IS
      SELECT department_name,
             manager_id
      FROM   departments;
    emp_manager employees.first_name%TYPE;
	
BEGIN
dbms_output.Put_line(Rpad('Department', 30)||Rpad('Department Head', 30));
dbms_output.Put_line('----------------------------------------------');
    FOR emp_dep_rec  IN emp_dep_cur LOOP
        IF emp_dep_rec.manager_id IS NULL THEN
          emp_manager := 'yet to join';
        ELSE
          SELECT first_name
          INTO   emp_manager
          FROM   employees
          WHERE  employee_id = emp_dep_rec.manager_id;
        END IF;

        dbms_output.Put_line(Rpad(emp_dep_rec.department_name, 30)
                             || emp_manager);
    END LOOP;
END;

32. Write a PL/SQL program to display the name of the employee and increment
       percentage of salary according to their working experiences.
--    Escriba un programa PL / SQL para mostrar el nombre del empleado y el incremento
--    Porcentaje de salario según su experiencia laboral.
DROP TABLE emp_temp;
CREATE TABLE emp_temp AS
  SELECT *
  FROM employees;
 
 
DECLARE
  CURSOR employees_cur IS
    SELECT employee_id,
           first_name,
           Trunc(Months_between(SYSDATE,hire_date) / 12) expr
    FROM   emp_temp;

incre_per NUMBER(2);
BEGIN
  dbms_output.put_line(rpad('Employee ID',15)||rpad('Name',25) || 'Increment %');
  dbms_output.Put_line('-----------------------------------------------------------');
  FOR store_emp_rec IN employees_cur 
  LOOP
    incre_per :=
    CASE
    WHEN store_emp_rec.expr > 10 THEN
      15
    WHEN store_emp_rec.expr > 5 THEN
      10
    ELSE
      8
    END;
    UPDATE emp_temp
    SET    salary = salary + (salary * incre_per / 100)
    WHERE  employee_id = store_emp_rec.employee_id;
dbms_output.put_line(rpad(store_emp_rec.employee_id,15) ||rpad(store_emp_rec.first_name,25)||  incre_per );	
  END LOOP;
END;

33. Write a PL/SQL block to show the uses of a variable in explicit cursor query, 
and the result set is affected with the value of the variable is incremented after every fetch.

34. Write a PL/SQL block to show the uses of a virtual column in an explicit cursor query.

35. Write a PL/SQL block to display the employee ID, first name, job title and the start date of present job.
--Escriba un bloque PL / SQL para mostrar la identificación del empleado, el nombre,
--el título del trabajo y la fecha de inicio del trabajo actual.
SET SERVEROUTPUT ON 
DECLARE
    CURSOR employees_cur IS
      SELECT employee_id,
             first_name,
             job_title,
             hire_date
      FROM   employees
             NATURAL join jobs;
    emp_first_date DATE;
BEGIN
    dbms_output.Put_line(Rpad('Employee ID', 15)
                         ||Rpad('First Name', 25)
                         ||Rpad('Job Title', 35)
                         ||'First Date');

dbms_output.Put_line('-----------------------------------------------------------------------------------------');

FOR emp_sal_rec IN employees_cur LOOP
    -- find out most recent end_date in job_history
    SELECT Max(end_date) + 1
    INTO   emp_first_date
    FROM   job_history
    WHERE  employee_id = emp_sal_rec.employee_id;

    IF emp_first_date IS NULL THEN
      emp_first_date := emp_sal_rec.hire_date;
    END IF;

    dbms_output.Put_line(Rpad(emp_sal_rec.employee_id, 15)
                         ||Rpad(emp_sal_rec.first_name, 25)
                         || Rpad(emp_sal_rec.job_title, 35)
                         || To_char(emp_first_date, 'dd-mon-yyyy'));
END LOOP;
END; 

36. Write a PL/SQL block to display the name of department the their costliest employee.
--Escriba un bloque PL / SQL para mostrar el nombre del departamento a su empleado más costoso.

DECLARE
    CURSOR department_cur IS
      SELECT department_id,
             department_name,
             Max(salary) maxsalary
      FROM   employees
             join departments USING (department_id)
      GROUP  BY department_id,
                department_name;
    emp_first_name employees.first_name%TYPE;
BEGIN
dbms_output.Put_line('------------------------------------------------------------');

dbms_output.Put_line(Rpad('Name of the Department', 35)
                     ||Rpad('First Name', 25));

dbms_output.Put_line('------------------------------------------------------------');

FOR emp_dept_cur IN department_cur LOOP
    BEGIN
        SELECT first_name
        INTO   emp_first_name
        FROM   employees
        WHERE  department_id = emp_dept_cur.department_id
               AND salary = emp_dept_cur.maxsalary;

        dbms_output.Put_line(Rpad(emp_dept_cur.department_name, 35)
                             || Rpad(emp_first_name, 25));
    EXCEPTION
        WHEN too_many_rows THEN
          dbms_output.Put_line(Rpad(emp_dept_cur.department_name, 35)
                               || ' - More than one employee');
    END;
END LOOP;
END; 
37. Write a PL/SQL block to display the last name, first name and overpaid amount by using parameters.



--38. Write a PL/SQL block to display the number of employees by month. Print number of employees by month

--Escriba un bloque PL / SQL para mostrar el número de empleados por mes. Imprimir número de empleados por mes

SET SERVEROUTPUT ON
DECLARE
    st_month NUMBER(2) := 1;
    no_o_emp NUMBER(3);
BEGIN
    dbms_output.Put_line(Rpad('Month No', 20)
                         ||Rpad('Month Name', 20)
                         || 'Number of Employees');
dbms_output.Put_line('-------------------------------------------------------------');

FOR month IN 1 .. 12 LOOP
    SELECT Count(*)
    INTO   no_o_emp
    FROM   employees
    WHERE  To_char(hire_date, 'mm') = month;

    dbms_output.Put_line(Rpad(To_char(month, '00'), 20)
                         ||Rpad(To_char(To_date(month, 'MM'), 'MONTH'), 20)
                         || To_char(no_o_emp, '999'));
END LOOP;
END; 

39. Write a PL/SQL block to display the last name of manager, and their departments for a particular city, using parameters with a default value in explicit cursor.


40. Write a PL/SQL block to find out the start date for current job of a specific employee.
--Escriba un bloque PL / SQL para averiguar la fecha de inicio para el trabajo actual de un empleado específico
DECLARE
    emp_st_date DATE;
    wr_emp_id   employees.employee_id%TYPE := &enter_employee_id;
BEGIN
    SELECT Max(end_date) + 1
    INTO   emp_st_date
    FROM   job_history
    WHERE  employee_id = wr_emp_id;

    IF emp_st_date IS NULL THEN
      SELECT hire_date
      INTO   emp_st_date
      FROM   employees
      WHERE  employee_id = wr_emp_id;
    END IF;

dbms_output.Put_line('----------------------------------------------------------------------');

dbms_output.Put_line('The starting date of current job for the employee  '
                     ||wr_emp_id
                     ||' is: '
                     ||emp_st_date);
END;

41. Write a PL/SQL block to display the last name, first name and overpaid amount by adding formal parameters and specify a default values for the added parameters.
DECLARE
  CURSOR emp_cur (emp_job_nm VARCHAR2, job_max_sal NUMBER, dt_of_hire DATE DEFAULT '31-DEC-99' ) IS
    SELECT last_name, first_name, (salary - job_max_sal) overpayment
    FROM employees
    WHERE job_id = emp_job_nm
    AND salary > job_max_sal
    AND hire_date > dt_of_hire	
    ORDER BY salary;

  PROCEDURE emp_excesspaid  IS
    last_name_   employees.last_name%TYPE;
    first_name_  employees.first_name%TYPE;
    paid_excess  employees.salary%TYPE;
	
  BEGIN
    LOOP
      FETCH emp_cur INTO last_name_, first_name_, paid_excess;
      EXIT WHEN emp_cur%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE(last_name_ || ', ' || first_name_ ||
        ' (by ' || paid_excess || ')');
    END LOOP;
  END emp_excesspaid;
 
BEGIN
  DBMS_OUTPUT.PUT_LINE('---------------------------------');
  DBMS_OUTPUT.PUT_LINE('Extra Salary paid to Programmers:');
  DBMS_OUTPUT.PUT_LINE('---------------------------------');
  OPEN emp_cur('IT_PROG', 6000);
  emp_excesspaid; 
  CLOSE emp_cur;
 
  DBMS_OUTPUT.PUT_LINE('-----------------------------------');
  DBMS_OUTPUT.PUT_LINE('Extra Salary paid to Stock Manager hired after 2005:');
  DBMS_OUTPUT.PUT_LINE('----------------------------------------------------');
  OPEN emp_cur('ST_MAN', 5000,'31-DEC-05');
  emp_excesspaid; 
  CLOSE emp_cur;
END;


--42. Write a block in PL/SQL to display the first name, job title and start date of employees.

declare
  cursor employees_cur is
   select employee_id, first_name, last_name, job_title , hire_date
   from employees natural join jobs;
   
   emp_st_date  date;
begin
dbms_output.put_line( rpad('Employee Name',30) || rpad('Job Title',35)|| 'Starting Date');
dbms_output.put_line('-----------------------------------------------------------------------------------------');
   for employee_rec in employees_cur
   loop
       -- find out most recent end_date in job_history
       select max(end_date) + 1 into emp_st_date
       from job_history
       where employee_id = employee_rec.employee_id;
       if emp_st_date is null then
             emp_st_date :=  employee_rec.hire_date;      
       end if;
       dbms_output.put_line(rpad((employee_rec.first_name||' '||employee_rec.first_name),30) || rpad(employee_rec.job_title,35)
           || to_char(emp_st_date,'dd-mon-yyyy'));
   end loop;
end; 


43. Write a block in PL/SQL to print the department name, head of the department, city and number of employees are wroking in that department.
--Escriba un bloque en PL / SQL para imprimir el nombre del departamento, el jefe del departamento, la ciudad y 
--el número de empleados que están trabajando en ese departamento.

DECLARE
    CURSOR cur_for_dep IS  SELECT *FROM   departments
    WHERE  manager_id IS NOT NULL;
    
    FUNCTION Count_for_emp (p_deptid NUMBER)
    RETURN NUMBER
    IS
    count_of_emp NUMBER(3);
    BEGIN
        SELECT Count(*)
        INTO   count_of_emp
        FROM   employees
        WHERE  department_id = p_deptid;

        RETURN count_of_emp;
    END;
    FUNCTION Name_of_hod (p_deptid NUMBER)
    RETURN VARCHAR2
    IS
      emp_as_hod employees.first_name%TYPE;
    BEGIN
        SELECT first_name
        INTO   emp_as_hod
        FROM   employees
        WHERE  employee_id = (SELECT manager_id
                              FROM   departments
                              WHERE  department_id = p_deptid);

        RETURN emp_as_hod;
    END;
    FUNCTION City_of_dep (p_deptid NUMBER)
    RETURN VARCHAR2
    IS
      city_head_off locations.city%TYPE;
    BEGIN
        SELECT city
        INTO   city_head_off
        FROM   locations
        WHERE  location_id = (SELECT location_id
                              FROM   departments
                              WHERE  department_id = p_deptid);

        RETURN city_head_off;
    END;
BEGIN
    dbms_output.Put_line(Rpad('Department Name', 30)
                         ||Rpad('Department Head', 20)
                         ||Rpad('Head Office', 20)
                         ||'Number of Employees');

dbms_output.Put_line('----------------------------------------------------------------------------------------');

FOR rows_of_dep IN cur_for_dep LOOP
    dbms_output.Put_line(Rpad(rows_of_dep.department_name, 30)
                         || Rpad(Name_of_hod(rows_of_dep.department_id), 20)
                         || Rpad(City_of_dep(rows_of_dep.department_id), 20)
                         || Count_for_emp(rows_of_dep.department_id));
END LOOP;
END; 

44. Write a block in PL/SQL to print the specifc number of rows from a table.

45. Write a block in PL/SQL to print a dotted line in every 6th line.

--46. Write a block in PL/SQL to display the first department with more than five employees.
DECLARE
  emp_depid departments.department_id%TYPE := 10;emp_max_depid departments.department_id%TYPE;no_emps NUMBER(3);emp_depname departments.department_name%TYPE;dep_mgname employees.first_name%TYPE;dep_mglname employees.last_name%TYPE;dep_mgid departments.manager_id%TYPE;emp_found_nfound BOOLEAN := FALSE;BEGIN
  SELECT Max(department_id)
  INTO   emp_max_depid
  FROM   departments;
  
  dbms_output.Put_line(Rpad('Department ID',20)
  || Rpad('Department',20)
  || Rpad('Manager',20)
  ||'No. of Employees');
  dbms_output.Put_line( '---------------------------------------------------------------------------------');
  WHILE emp_depid <= emp_max_depid
  LOOP
    SELECT manager_id
    INTO   dep_mgid
    FROM   departments
    WHERE  department_id = emp_depid;
    
    IF dep_mgid IS NOT NULL THEN
      SELECT Count(*)
      INTO   no_emps
      FROM   employees
      WHERE  department_id = emp_depid;
      
      IF no_emps > 5 THEN
        SELECT department_name,
               first_name,
               last_name
        INTO   emp_depname,
               dep_mgname,
               dep_mglname
        FROM   employees e
        join   departments d
        ON     (
                      d.manager_id = e.employee_id)
        WHERE  d.department_id = emp_depid;
        
        dbms_output.Put_line(Rpad(emp_depid,20)
        || Rpad(emp_depname,20)
        ||Rpad((dep_mgname
        ||' '
        ||dep_mglname),20)
        ||no_emps);
        emp_found_nfound := TRUE;
        EXIT;
      END IF;
    END IF;
    emp_depid := emp_depid + 10;
  END LOOP;
  IF NOT emp_found_nfound THEN
    dbms_output.Put_line('No department found with more than 5 employees');
  END IF;
END;




47. Write a block in PL/SQL to print a report which shows that, the employee id, name, hire date, and the incentive amount
they achieved according to their working experiences, who joined in the month of current date.
--Escriba un bloque en PL / SQL para imprimir un informe que muestre que, la identificación del empleado, el nombre, la fecha de
--contratación y el monto del incentivo que lograron de acuerdo con sus experiencias laborales, que se unieron en el mes de la fecha actual.
DECLARE
    emp_id        employees.employee_id%TYPE;
    emp_hiredate  employees.hire_date%TYPE;
    emp_firstname employees.first_name%TYPE;
    emp_lastname  employees.last_name%TYPE;
    no_of_emp     NUMBER;
    inctv_amount  NUMBER;
    work_exp      NUMBER;
    CURSOR emp_cur (
      thismonth NUMBER)IS
      SELECT employee_id,
             first_name,
             last_name,
             hire_date
      FROM   employees
      WHERE  Extract(month FROM hire_date) = thismonth;
BEGIN
    OPEN emp_cur(Extract(month FROM SYSDATE));
    dbms_output.Put_line('Date: '
                         || To_char(SYSDATE, 'DL'));
    dbms_output.Put_line('Employees with yearly incentive amounts:');
    dbms_output.Put_line('------------------------------------------');
    dbms_output.Put_line(Rpad('Employee ID', 15)
                         || Rpad('Name of the Employee', 30)
                         || Rpad('Hire Date', 15)
                         || 'Incentive Amount');
dbms_output.Put_line('------------------------------------------------------------------------------');
LOOP
    FETCH emp_cur INTO emp_id, emp_firstname, emp_lastname, emp_hiredate;
    EXIT WHEN emp_cur%NOTFOUND;
    work_exp := Round(( Months_between(SYSDATE, emp_hiredate) / 12 ));
    IF work_exp > 13 THEN
      inctv_amount := 8000;
    ELSIF work_exp > 11 THEN
      inctv_amount := 5000;
    ELSIF work_exp > 9 THEN
      inctv_amount := 3000;
    ELSIF work_exp > 7 THEN
      inctv_amount := 2000;
    ELSIF work_exp > 4 THEN
      inctv_amount := 1000;
    ELSIF work_exp > 0 THEN
      inctv_amount := 400;
    END IF;
    dbms_output.Put_line(Rpad(emp_id, 15)
                         ||Rpad(( emp_firstname
                                  ||' '
                                  ||emp_lastname ), 30)
                         ||Rpad(emp_hiredate, 15)
                         || To_char(inctv_amount, '9,999'));
END LOOP;

no_of_emp := emp_cur%rowcount;

dbms_output.Put_line('The number of rows fetched is '
                     || no_of_emp);
CLOSE emp_cur;
END;

48. Write a block in PL/SQL to shows how are records are declared and initialized.
49. Write a block in PL/SQL to show the uses of subquery in FROM clause of parent query in an explicit cursor.
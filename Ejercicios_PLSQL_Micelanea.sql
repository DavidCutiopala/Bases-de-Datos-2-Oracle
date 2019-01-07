--________________ESJERCICIOS PLSQL _________________________
--EJERCICIO 1

--Write a program to interchange the salaries of employee 120 and 122.
declare 
v_sal_emp120  employees.salary%type;
v_sal_emp122 employees.salary%type;
begin 
select salary  into v_sal_emp120 from employees  e
where e.employee_id = 120;
select salary  into v_sal_emp122 from employees  e
where e.employee_id = 122;

update employees
set salary = v_sal_emp120
where employee_id=122;

update employees
set salary = v_sal_emp122
where employee_id=120;
commit;
end;
select * from employees;
--EJERCICIO 2
--Increase the salary of employee 115 based on the following conditions:
--If experience is more than 10 years, increase salary by 20% If experience is greater than 5 years, increase salary by 10% Otherwise 5% Case by Expression:

--hire date ---> Fecha de contratacion
--v_exp number (9,2);
--Con el round salen 16 años

SET SERVEROUTPUT ON 
declare 
v_exp number (9,2);
v_hike number(5,2);
begin 
select  floor((sysdate-hire_date)/365 ) into v_exp
    from employees
    where employee_id = 115;
case 
      when  v_exp > 20 then
            v_hike :=640 ;
      when  v_exp > 5  then
            v_hike := 320;
        ELSE  v_hike :=160;
    end case;
    update employees 
    set  salary=salary+v_hike
    where employee_id=115;
 DBMS_OUTPUT.PUT_LINE(to_char(v_exp));
  DBMS_OUTPUT.PUT_LINE(to_char(v_hike));
end;
--EJERCICIO 3 
--Change commission percentage as follows for employee with ID = 150. If salary is more than 10000 then commission is 0.4%,
--if Salary is less than 10000 but experience is more than 10 years then 0.35%, if salary is less than 3000 then commission is 0.25%. In the remaining cases commission is 0.15%.

declare
    v_salary  employees.salary%type;
    v_exp     number(2);
    v_cp      number(5,2);
begin
    select  v_salary,  floor ( (sysdate-hire_date)/365) into v_salary, v_exp
    from  employees
    where employee_id = 150;
    
    if v_salary > 10000 then
           v_cp := 0.4;
    elsif  v_exp > 10 then
           v_cp := 0.35;
    elsif  v_salary < 3000 then
           v_cp := 0.25;
    else
           v_cp := 0.15;
           
    end if;
    
    update employees set commission_pct = v_cp
    where employee_id = 150;
end;
--EJERCICIO 4
--Find out the name of the employee and name of the department for the employee who is managing for employee 103.


SET SERVEROUTPUT ON 
declare
    v_name     employees.first_name%type;
    v_deptname departments.department_name%type;
begin
    select  first_name , department_name into v_name, v_deptname
    from  employees join departments using (department_id)
    where employee_id = ( select manager_id from employees    where employee_id = 103);
    
    dbms_output.put_line(v_name);
    dbms_output.put_line(v_deptname);
end;

select * from employees;

--Display missing employee IDs.
--EJERCICIO 5

declare
     v_min  number(3);
     v_max  number(3);
     v_c    number(1);
begin
     select min(employee_id), max(employee_id) into v_min, v_max
     from employees;


     for i in  v_min + 1 .. v_max - 1
     loop
           select count(*) into v_c
           from employees 
           where employee_id = i;
           
           if  v_c = 0 then
                dbms_output.put_line(i);
           end if;
    end loop;
     
end;
--EJERCICIO 6 
--Display the year in which maximum number of employees joined along with how many joined in each month in that year.
--Muestre el año en el que se unió el  máximo numero de empleados junto con cuántos se unieron en cada mes en ese año.

-- 2008 7   
--1 ---2
--2 ---3
-- 2009 4
declare

      v_year  number(4);
      v_c     number(2);
begin
      select  to_char(hire_date,'yyyy') into v_year
      from  employees
      group by to_char(hire_date,'yyyy')
      having count(*) = 
             ( select  max( count(*))
               from  employees
               group by to_char(hire_date,'yyyy'));
               
      dbms_output.put_line('Year : ' || v_year);

      for month in 1 .. 12
      loop
          select  count(*) into v_c
          from employees
          where  to_char(hire_date,'mm') = month and to_char(hire_date,'yyyy') = v_year;
          
          dbms_output.put_line('Month : ' || to_char(month) || ' Employees : ' || to_char(v_c));
     end loop;          
end;

--EJERCICIO 7
--Change salary of employee 130 to the salary of the employee with first name ‘Joe’. If Joe is not found then take average salary of all employees. 
--If more than one employee with first name ‘Joe’ is found then take the least salary of the employees with first name Joe.

--Cambie el salario del empleado 130 al salario del empleado con el nombre de pila "Joe". Si no se encuentra a Joe, tome el salario promedio de todos los empleados.
--Si se encuentra más de un empleado con el nombre "Joe", tome el salario mínimo de los empleados con el nombre Joe.
declare
    v_salary  employees.salary%type;
begin
     select salary into v_salary
     from employees where first_name = 'Joe';
     
     update employees set salary = v_salary
     where employee_id = 130;
	 
exception
     when no_data_found then --Se produce una excepcion si no se encuentra el empleado 
       update employees 
       set salary = (select avg(salary) from employees)
     where employee_id = 130;
end;

--EJERCICIO 8
--Display Job Title and Name of the Employee who joined the job first day.
--Muestra el  Job Title  y el nombre del empleado que se unió al trabajo el primer día.

SET SERVEROUTPUT ON 
declare 
CURSOR  emp_cursor1 is select  e.employee_id,j.job_title,e.first_name,e.hire_date from employees e 
inner join jobs j on e.job_id=j.job_id
where e.hire_date in (select start_date from job_history);
BEGIN  
for cursor_e in  emp_cursor1
LOOP          
DBMS_OUTPUT.PUT_LINE('ID :  '||  cursor_e.employee_id  ||'  Titulo:  '||  cursor_e.job_title  ||'  Nombre:  '  ||  cursor_e.first_name || ' Fecha:  '  ||   cursor_e.hire_date|| to_char(cursor_e)); 
END  LOOP;    
END;


--__________OTRA MANERA________________________________
declare
       cursor  jobscur is select  job_id, job_title from jobs;
	   v_name  employees.first_name%type;
begin
       for jobrec in jobscur
	   loop
	         select first_name into v_name
             from employees
             where hire_date = ( select min(hire_date) from employees where job_id = jobrec.job_id)
			 and  job_id = jobrec.job_id;
             			 
             dbms_output.put_line( jobrec.job_title || '-' || v_name); 						  
	   end loop;
end;
--EJERCICIO  9 
--Display 5th and 10th employees in Employees table.
SET SERVEROUTPUT ON 
declare 
cursor emp_cursor2 is select  first_name from employees
order by employee_id asc;
v_index  number :=1;
begin
for cursor_e1 in  emp_cursor2
LOOP    
if  v_index = 5 or v_index=10 then
DBMS_OUTPUT.PUT_LINE(cursor_e1.first_name); 
end if;
v_index:=v_index+1;
END  LOOP;  
end;

select * from employees ;
--________OTHRE FORM_______________________
declare
     cursor empcur is
        select employee_id, first_name 
        from employees; 
begin
     for emprec  in empcur
     loop
         if empcur%rowcount > 4 then
              dbms_output.put_line( emprec.first_name);
              exit  when   empcur%rowcount > 10;
         end if;
     end loop;
end;
--    FUNCIONES 
--Create a function that takes department ID and returns the name of the manager of the department.
create or replace function get_dept_manager_name(deptid number)
return varchar is

   v_name  employees.first_name%type;
begin
   select first_name into v_name
   from employees
   where  employee_id = ( select manager_id from departments where department_id = deptid);

   return v_name;
end;
--Create a function that takes employee ID and return the number of jobs done by the employee in the past.
--Cree una función que tome la identificación del empleado y devuelva la cantidad de trabajos realizados por el empleado en el pasado.

create or replace function get_no_of_jobs_done(empid number)
return number is
   v_count  number(2);
begin
   select count(*) into v_count
   from job_history
   where  employee_id = empid;

   return v_count;
end;

--Create a procedure that takes department ID and changes the manager ID for the department to the employee in the department with highest salary.
--(Use Exceptions).

create or replace procedure change_dept_manager
(deptid number)
is
   v_empid  employees.employee_id%type;
begin
   select employee_id
   from employees
   where  salary = ( select max(salary) from employees where department_id = 80)
     and department_id = 80;

   update departments set manager_id = v_empid
   where  department_id = deptid;
end;

--Create a function that takes a manager ID and return the names of employees who report to this manager. 
--The names must be returned as a string with comma separating names.

create or replace function get_employees_for_manager(manager number)
return varchar2
is
   v_employees varchar2(1000) := '';
   cursor empcur is
      select  first_name from employees 
      where   manager_id = manager;
begin

     for emprec in empcur
     loop
         v_employees :=  v_employees ||  ',' || emprec.first_name;
     end loop;
     -- remove extra  , at the beginning
     return  ltrim(v_employees,',');
end;

--Ensure no changes can be made to EMPLOYEES table before 6am and after 10pm in a day.
create or replace trigger  trg_employees_time_check
before update or insert or delete
on employees
for each row
begin
   if  to_char(sysdate,'hh24') < 6 or to_char(sysdate,'hh24') > 10 then
         raise_application_error(-20111,'Sorry! No change can be made before 6 AM and after 10 PM');
   end if;
end;





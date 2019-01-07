--1.	Crear un procedimiento llamado ADD_JOB para insertar un nuevo puesto de trabajo en la tabla JOBS, 
--ingrese el id y el puesto de trabajo mediante parámetros. 
--a.	Ejecute el procedimiento ADD_JOB con el valor  para jod_id igual a “IT_DBA” y el job_title igual a “Database Administrator”
create PROCEDURE ADD_JOB
  (j_id IN jobs.job_id%TYPE,
  j_title IN jobs.job_title%TYPE)

is
BEGIN
  insert into jobs values(j_id,j_title,null,null);
END ADD_JOB;

--para ejecutar el procedimiento
execute ADD_JOB('IT_DBA','Database Administrador');
select * from jobs;
--2.	Crear un procedimiento llamado DEL_JOB para eliminar un puestro de trabajo de la tabla JOBS,
--      crear la excepción necesaria cuando un puesto de trabajo no pueda ser borrado o no exista en la base 
--a.	Llame al procedimiento anterior para eliminar el puesto de trabajo con el codigo IT_DBA 

SET SERVEROUTPUT ON 
CREATE OR REPLACE PROCEDURE del_job
  (job_id2 IN jobs.job_id%TYPE)
IS
  e_invalid EXCEPTION;
BEGIN
  DELETE FROM jobs
  WHERE job_id = job_id2;

  IF SQL%NOTFOUND THEN
    RAISE e_invalid;
  END IF;
  DBMS_OUTPUT.PUT_LINE('Borrado.');
EXCEPTION
  WHEN e_invalid THEN
    DBMS_OUTPUT.PUT_LINE('ERROR: ' || job_id2 || ' Id Job Invalido.');
END del_job;

EXECUTE del_job('IT_DBA');
EXECUTE del_job('IT_WEB');

select * from jobs;

--3.	Crear un procedimiento llamado QUERY_EMP que recupere el salario y job_id de la tabla employees cuando envié como parámetro el código del empleado 

--4.	Crear un procedimiento llamado QUERY_DEP que envíe como parámetro el código de un departamento y me devuelva información del número de empleados que existen y cual es el valor total de salarios pagados 


--5.	Crear un procedimiento llamado QUERY_CIUDAD que envíe como parámetro el código de un departamento y me devuelva información del
--     nombre de la ciudad y los empleados que trabajan en ese departamento 

select e.first_name,d.department_name,l.city from employees e 
                                                          inner join  departments d on e.department_id=d.department_id
                                                          inner join  locations l on d.location_id=l.location_id
                                                          where d.department_id=90;

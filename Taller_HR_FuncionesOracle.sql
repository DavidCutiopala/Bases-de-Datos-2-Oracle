--_________________TALLER 01 FUNCIONES ______________
-- 1. ESCRIBA UN QUERY QUE DESPLIEGUE LA FECHA ACTUAL DEL SISTEMA
        select sysdate Fecha_Actual from dual ;
-- 2. PARA CADA EMPLEADO LISTE EL CODIGO,APELLIDO,SALARIO 
--    Y PROYECTO EN UNA COLUMNA LLAMADA "INCREMENTO" EN UN 15%
        select *from employees;
        select employee_id,last_name,salary, salary+(salary*0.15) Incremento from employees;
-- 3. MODIFIQUE EL LISTADO ANTERIOR  PARA INCREMENTAR UNA COLUMNA QUE INFORME EL VALOR 
--    ENTRE EL VIEJO SALARIO Y EL INCREMENTO PROYECTADO
        select employee_id,last_name,salary, salary+(salary*0.15) IncrementO_Proyectado from employees;
-- 4. LISTE EL NOMBRE DE LOS EMPLEADOS, SU PRIMERA INICIAL DEL APELLIDO,LONGITUD DEL NOMBRE 
--    PERO SOLO DE AQUELLOS  QUE INICIAN SU APELLIDO CON LAS LETRAS "A","J" OR "M"
        select *from employees;
        select first_name,substr(last_name,0,1) Inicial ,length(first_name) Longitud from employees
        where (last_name like 'A%')or (last_name like 'J%')or (last_name like 'M%') ;
-- 5. PARA CADA EMPLEADO LISTE SUS APELLIDOS Y EL NUMERO DE AÑOS QUE HAN TRANSCURRIDO
--    DESDE QUE INGRESO EL EMPLEADO ALA EMPRESA HASTA LA FECHA ACTUAL 
        select first_name,last_name,hire_date Fecha_Contratacion,sysdate Fecha_Actual,
        round( months_between(sysdate,hire_date)) Años_Trabajando from employees;
-- 6. CONSTRUYA UN REPORTE QUE REALICE EL SIGUIENTE REPORTE :
--    *"EL EMPLEADO" <APELLIDO><NOMBRE> TIENE UN SULEDO MENSUAL DE XXX Y RECIBIRA ANUALMENTE YYYY
        select 'El empleado',first_name,last_name,' Tiene un sueldo mensual de ',salary ,'y recibira Anualmente',
        salary*12 Salario_anual from employees;
--7.  CONSTRUYA  UN REPORTE QUE INCLUYA EL APELLIDO,NOMBRE Y EL SALARIO DE TODOS LOS EMPLEADOS ADEMAS  UN 
--    MENSAJE "NO RECIBE COMISION" EN CASO DE NO TENER NINGUN VALOR EN ESA COLUMNA 
        select last_name,first_name,salary,nvl(to_char(commission_pct),'No recibe comision')from employees;
        select *from employees;
select * from employees;
--____________________________COMANDOS PARA CADENAS_____________________________________________
--PARA VER LA FECHA ACTUAL 
select sysdate from dual ;
--PARA VER EL USUARIO QUE HACE LA CONSULTA
select user from dual;
--PARA CONCATENAR DOS CADENAS   CONCAT
select concat(concat(first_name , ' '),last_name) as "Concatenacion" from employees;
--MOSTRAR FECHA Y UTILIZAR      SUBSTR
select sysdate "Fecha del Sistema ", substr (sysdate,4,8) "Fecha" from dual ;
--VER POCICION DE UNA PALABRA   INSTR
select sysdate , instr(sysdate,'8') from dual;
--VER DESDE QUE POSICION VA A SUCAR INSTR
select instr('8#9#0#00000#','#',8) from dual;
--VER LONGITUD DE UNA CADENA  LEGTH
select length(sysdate)from dual ;
select length (first_name || last_name)"Tamaño dos variables"from employees; 
--USO DE LA FUNCION LOWER 
select lower (first_name)"convercion minusculas" from employees;
--LPAD Y RPAD 
select lpad(first_name,10,'*')"aumenta * ala Izquierda" from employees;
-- TO CHAR 
select * from employees;
select job_id , salary , to_char (salary,'$99,999.99')"Primer Formato" ,
to_char (salary,'$99,000')"Segundo Formato" from employees;
--TO CHAR PARA FECHAS
select first_name , to_char(hire_date,'mon') "Solo el MES" from employees; 
select first_name , to_char(hire_date,'day') "Solo el DIA" from employees; 
select first_name , to_char(hire_date,'day','nls_date_language=Danish') "Formato Idioma" from employees; 
--TO DATE 
--INSTRUCCION PARA CAMBIAR EL FORMATO DE LA FECHA (SOLO ESTA SECION)
ALTER SESSION SET NLS_DATE_FORMAT='DD-MON-RR'
select to_date('12-JUN-18') from dual;
select to_date('12-JUN-2018','DD-MON-YYYY') from dual;
--_________________________FUNCIONES PARA FECHAS_________________________________________--

--ADD_MONTHS
select sysdate,add_months(sysdate,-1)anterior,add_months(sysdate,4)siguiente from dual;
--MONTHS_BETWEEN (MIRAR AÑOS TRASCURRIDOS HASTA LA FECHA ACTUAL)
select hire_date Fecha_Contratacion,sysdate Fecha_Actual,round( months_between(sysdate,hire_date))  from employees
--TRUNC
--NVL NVL2 COALSCE





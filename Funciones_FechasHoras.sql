- add_months(f,n):
--agrega a una fecha, un número de meses. Si el segundo argumento es positivo, se le suma a la fecha enviada tal cantidad de meses; si es negativo, se le resta a la fecha enviada tal cantidad de meses. Ejemplo:

 select add_months('10/06/2007',5) from dual; --retorna "10/11/07"
 select add_months('10/06/2007',-5) from dual; --retorna "10/01/07"
 select add_months('30/01/2007',1) from dual;-- retorna "25/02/07" ya que es el último día de ese mes.
- last_day(f): 
--retorna el ultimo día de mes de la fecha enviada como argumento. Ejemplo:

 select last_day('10/02/2007') from dual;-- "28/02/07"
 select last_day('10/08/2007') from dual;-- "31/08/07"
--months_between(f1,f2): retorna el numero de meses entre las fechas enviadas como argumento. Ejemplo:

 select months_between('19/05/2003','21/06/05') from dual;-- retorna
- next_day(fecha,dia):
retorna una fecha correspondiente al primer día especificado en "dia" luego de la fecha especificada. En el siguiente ejemplo se busca el lunes siguiente a la fecha especificada:

 select next_day('10/08/2007','LUNES') from dual;
- current_date: retorna la fecha actual. Ejemplo:

 select current_date from dual;
- current_timestamp: retorna la fecha actual

 select current_timestamp from dual;
Retorna: 10/08/07 09:59:44,109000000 AMERICA/BUENOS_AIRES

- sysdate: retorna la fecha y hora actuales en el servidor de Oracle.

-systimestamp: retorna fecha y hora actuales.

 select systimestamp from dual;
Retorna 10/08/07 10:33:48,984000000 -03:00

- to_date: convierte una cadena a tipo de dato "date". Ejemplo:

  select to_date ('05-SEP-2007 10:00 AM','DD-MON-YYYY HH:MI AM') from dual;
Retorna 05/09/07

- to_char: convierte una fecha a cadena de caracteres. Ejemplo:

 select to_char('10/10/2007')from dual;
- extract(parte,fecha): retorna la parte (especificada por el primer argumento) de una fecha. Puede extraer el año (year), mes (month), día (day), hora (hour), minuto (minute), segundo (second), etc. Ejemplo:

 select extract(month from sysdate) from dual;
retorna el número mes de la fecha actual.

En Oracle: Los operadores aritméticos "+" (más) y "-" (menos) pueden emplearse con fechas. Por ejemplos:

 select sysdate-3:
Retorna 3 días antes de la fecha actual.

 select to_date('15/12/2007')-5 from dual;
Retorna 10/12/07
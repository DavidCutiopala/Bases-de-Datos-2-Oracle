CREATE TABLE  Departamento ( codDepto     varchar (4)  PRIMARY KEY, nombreDpto   varchar (20) NOT NULL, ciudad      varchar (15), codDirector  varchar (12) ); 
 
 INSERT INTO Departamento (codDepto, nombreDpto, ciudad, coddirector) VALUES  ('1000', 'GERENCIA', 'CALI', '31.840.269');
 INSERT INTO Departamento values('1500', 'PRODUCCIÓN', 'CALI', '16.211.383');
 INSERT INTO Departamento values('2000', 'VENTAS', 'CALI', '31.178.144');
 INSERT INTO Departamento values('3000', 'INVESTIGACIÓN', 'CALI', '16.759.060');
 INSERT INTO Departamento values('3500', 'MERCADEO', 'CALI', '22.222.222');
 INSERT INTO Departamento values('2100', 'VENTAS', 'POPAYAN', '31.751.219');
 INSERT INTO Departamento values('2200', 'VENTAS', 'BUGA', '768.782');
 INSERT INTO Departamento values('2300', 'VENTAS', 'CARTAGO', '737.689');
 INSERT INTO Departamento values('4000', 'MANTENIMIENTO', 'CALI', '333.333.333');
 INSERT INTO Departamento values('4100', 'MANTENIMIENTO', 'POPAYAN', '888.888');
 INSERT INTO Departamento values('4200', 'MANTENIMIENTO', 'BUGA', '11.111.111');
 INSERT INTO Departamento values('4300', 'MANTENIMIENTO', 'CARTAGO', '444.444');
 
-- Creación de la tabla Empleado DROP TABLE IF EXISTS Empleado; 
 describe empleado;
CREATE TABLE  Empleado ( nDIEmp VARCHAR( 12 ) NOT NULL PRIMARY KEY, nomEmp VARCHAR( 30 ) NOT NULL , sexEmp CHAR( 1 ) NOT NULL CHECK (sexEmp  IN ('F', 'M') ), fecNac DATE NOT NULL , fecIncorporacion DATE NOT NULL, salEmp FLOAT NOT NULL, comisionE FLOAT NOT NULL, cargoE VARCHAR( 15 ) NOT NULL, jefeID VARCHAR( 12 ), codDepto VARCHAR( 4 ) NOT NULL,  CONSTRAINT FK_Empl FOREIGN KEY (jefeID) REFERENCES Empleado, CONSTRAINT FK_Dpto FOREIGN KEY (codDepto) REFERENCES Departamento );
ALTER SESSION SET NLS_DATE_FORMAT='yyyy-mm-dd';
select sysdate from dual;

ALTER TABLE empleado MODIFY HORA_SALIDA TIMESTAMP;
ALTER TABLE empleado MODIFY HORA_LLEGADA TIMESTAMP;

INSERT INTO Empleado VALUES ('31.840.269', 'María Rojas', 'F', TO_TIMESTAMP('1959-01-15', 'YYYY-MM-DD HH24:MI:SS.FF6'), TO_TIMESTAMP('1990-05-16', 'YYYY-MM-DD HH24:MI:SS.FF6'), 6250000, 1500000, 'Gerente', NULL, '1000');
INSERT INTO Empleado VALUES('16.211.383', 'Luis Pérez', 'M',  TO_TIMESTAMP('1956-02-25', 'YYYY-MM-DD HH24:MI:SS.FF6'), TO_TIMESTAMP('2000-01-01', 'YYYY-MM-DD HH24:MI:SS.FF6'), 5050000, 0, 'Director', '31.840.269', '1500');
INSERT INTO Empleado VALUES('31.178.144', 'Rosa Angulo', 'F',  TO_TIMESTAMP('1957-03-15', 'YYYY-MM-DD HH24:MI:SS.FF6'), TO_TIMESTAMP('1998-08-16', 'YYYY-MM-DD HH24:MI:SS.FF6'), 3250000, 3500000, 'Jefe Ventas', '31.840.269', '2000');
INSERT INTO Empleado VALUES('16.759.060', 'Darío Casas', 'M',  TO_TIMESTAMP('1960-04-05', 'YYYY-MM-DD HH24:MI:SS.FF6'), TO_TIMESTAMP('1992-11-01', 'YYYY-MM-DD HH24:MI:SS.FF6'), 4500000, 500000, 'Investigador', '31.840.269', '3000');
INSERT INTO Empleado VALUES('22.222.222', 'Carla López', 'F',  TO_TIMESTAMP('1975-05-11', 'YYYY-MM-DD HH24:MI:SS.FF6'), TO_TIMESTAMP('2005-07-16', 'YYYY-MM-DD HH24:MI:SS.FF6'), 4500000, 500000, 'Jefe Mercadeo', '31.840.269', '3500');
INSERT INTO Empleado VALUES('22.222.333', 'Carlos Rozo', 'M',  TO_TIMESTAMP('1975-05-11', 'YYYY-MM-DD HH24:MI:SS.FF6'), TO_TIMESTAMP('2001-09-16', 'YYYY-MM-DD HH24:MI:SS.FF6'), 750000, 500000, 'Vigilante', '31.840.269', '3500');
INSERT INTO Empleado VALUES('1.751.219', 'Melissa Roa', 'F',  TO_TIMESTAMP('1960-06-19', 'YYYY-MM-DD HH24:MI:SS.FF6'), TO_TIMESTAMP('1990-05-16', 'YYYY-MM-DD HH24:MI:SS.FF6'), 2250000, 2500000, 'Vendedor', '31.178.144', '2100');
INSERT INTO Empleado VALUES('768.782', 'Joaquín Rosas', 'M',  TO_TIMESTAMP('1947-07-07', 'YYYY-MM-DD HH24:MI:SS.FF6'), TO_TIMESTAMP('1990-05-16', 'YYYY-MM-DD HH24:MI:SS.FF6'), 2250000, 2500000, 'Vendedor', '31.178.144', '2200');
INSERT INTO Empleado VALUES('737.689', 'Mario Llano', 'M',  TO_TIMESTAMP('1945-08-30', 'YYYY-MM-DD HH24:MI:SS.FF6'), TO_TIMESTAMP('1990-05-16', 'YYYY-MM-DD HH24:MI:SS.FF6'), 2250000, 2500000, 'Vendedor', '31.178.144', '2300');
INSERT INTO Empleado VALUES('333.333.333', 'Elisa Rojas', 'F',  TO_TIMESTAMP('1979-09-28', 'YYYY-MM-DD HH24:MI:SS.FF6'), TO_TIMESTAMP('2004-06-01', 'YYYY-MM-DD HH24:MI:SS.FF6'), 3000000, 1000000, 'Jefe Mecánicos', '31.840.269', '4000');
INSERT INTO Empleado VALUES('888.888', 'Iván Duarte', 'M',  TO_TIMESTAMP('1995-08-12', 'YYYY-MM-DD HH24:MI:SS.FF6'), TO_TIMESTAMP('1998-05-16', 'YYYY-MM-DD HH24:MI:SS.FF6'), 1050000, 200000, 'Mecánico', '333.333.333', '4100');
INSERT INTO Empleado VALUES('11.111.111', 'Irene Díaz', 'F',  TO_TIMESTAMP('1979-09-28', 'YYYY-MM-DD HH24:MI:SS.FF6'), TO_TIMESTAMP('2004-06-01', 'YYYY-MM-DD HH24:MI:SS.FF6'), 1050000, 200000, 'Mecánico', '333.333.333', '4200');
INSERT INTO Empleado VALUES('444.444', 'Abel Gómez', 'M',  TO_TIMESTAMP('1939-12-24', 'YYYY-MM-DD HH24:MI:SS.FF6'), TO_TIMESTAMP('2000-10-01', 'YYYY-MM-DD HH24:MI:SS.FF6'), 1050000, 200000, 'Mecánico', '333.333.333', '4300');
INSERT INTO Empleado VALUES('1.130.222', 'José Giraldo', 'M',  TO_TIMESTAMP('1985-01-20', 'YYYY-MM-DD HH24:MI:SS.FF6'), TO_TIMESTAMP('200-11-01', 'YYYY-MM-DD HH24:MI:SS.FF6'), 1200000, 400000, 'Asesor', '22.222.222', '3500');
INSERT INTO Empleado VALUES('19.709.802', 'William Daza', 'M',  TO_TIMESTAMP('1982-10-09', 'YYYY-MM-DD HH24:MI:SS.FF6'), TO_TIMESTAMP('1999-12-16', 'YYYY-MM-DD HH24:MI:SS.FF6'), 2250000, 1000000,'Investigador', '16.759.060', '3000');
INSERT INTO Empleado VALUES('31.174.099', 'Diana Solarte', 'F',  TO_TIMESTAMP('1957-11-19', 'YYYY-MM-DD HH24:MI:SS.FF6'), TO_TIMESTAMP('1990-05-16', 'YYYY-MM-DD HH24:MI:SS.FF6'), 1250000, 500000, 'Secretaria', '31.840.269', '1000');
INSERT INTO Empleado VALUES('1.130.777', 'Marcos Cortez', 'M',  TO_TIMESTAMP('1986-06-23', 'YYYY-MM-DD HH24:MI:SS.FF6'), TO_TIMESTAMP('2000-04-16', 'YYYY-MM-DD HH24:MI:SS.FF6'), 2550000, 500000, 'Mecánico', '333.333.333', '4000');
INSERT INTO Empleado VALUES('1.130.782', 'Antonio Gil', 'M',  TO_TIMESTAMP('1980-01-23', 'YYYY-MM-DD HH24:MI:SS.FF6'), TO_TIMESTAMP('2010-04-16', 'YYYY-MM-DD HH24:MI:SS.FF6'), 850000, 1500000, 'Técnico', '16.211.383', '1500');
INSERT INTO Empleado VALUES('333.333.334', 'Marisol Pulido', 'F',  TO_TIMESTAMP('1979-10-01', 'YYYY-MM-DD HH24:MI:SS.FF6'), TO_TIMESTAMP('1990-05-16', 'YYYY-MM-DD HH24:MI:SS.FF6'), 3250000, 1000000, 'Investigador', '16.759.060', '3000');
INSERT INTO Empleado VALUES('333.333.335', 'Ana Moreno', 'F',  TO_TIMESTAMP('1992-01-05', 'YYYY-MM-DD HH24:MI:SS.FF6'), TO_TIMESTAMP('2004-06-01', 'YYYY-MM-DD HH24:MI:SS.FF6'), 1200000, 400000, 'Secretaria', '16.759.060', '3000');
INSERT INTO Empleado VALUES('1.130.333', 'Pedro Blanco', 'M',  TO_TIMESTAMP('1987-10-28', 'YYYY-MM-DD HH24:MI:SS.FF6'), TO_TIMESTAMP('2000-10-01', 'YYYY-MM-DD HH24:MI:SS.FF6'), 800000, 3000000, 'Vendedor', '31.178.144', '2000');
INSERT INTO Empleado VALUES('1.130.444', 'Jesús Alfonso', 'M',  TO_TIMESTAMP('1988-03-14', 'YYYY-MM-DD HH24:MI:SS.FF6'), TO_TIMESTAMP('2000-10-01', 'YYYY-MM-DD HH24:MI:SS.FF6'), 800000, 3500000, 'Vendedor', '31.178.144', '2000');
INSERT INTO Empleado VALUES('333.333.336', 'Carolina Ríos', 'F',  TO_TIMESTAMP('1959-01-15', 'YYYY-MM-DD HH24:MI:SS.FF6'), TO_TIMESTAMP('200-10-01', 'YYYY-MM-DD HH24:MI:SS.FF6'), 1250000, 500000, 'Secretaria', '16.211.383', '1500');
INSERT INTO Empleado VALUES('333.333.337', 'Edith Muñoz', 'F',  TO_TIMESTAMP('1992-03-31', 'YYYY-MM-DD HH24:MI:SS.FF6'), TO_TIMESTAMP('200-10-01', 'YYYY-MM-DD HH24:MI:SS.FF6'), 800000, 3600000, 'Vendedor', '31.178.144', '2100');
INSERT INTO Empleado VALUES('1.130.555', 'Julián Mora', 'M',  TO_TIMESTAMP('1989-03-31', 'YYYY-MM-DD HH24:MI:SS.FF6'), TO_TIMESTAMP('200-10-01', 'YYYY-MM-DD HH24:MI:SS.FF6'), 800000, 3100000, 'Vendedor', '31.178.144', '2200');
INSERT INTO Empleado VALUES('1.130.666', 'Manuel Millán', 'M',  TO_TIMESTAMP('1990-12-08', 'YYYY-MM-DD HH24:MI:SS.FF6'), TO_TIMESTAMP('2004-06-01', 'YYYY-MM-DD HH24:MI:SS.FF6'), 800000, 3700000, 'Vendedor', '31.178.144', '2300');

select * from empleado;
--NO FUNCIONA ESTE ALTER TABLE
ALTER TABLE  Departamento ADD CONSTRAINT FK_EmpDir FOREIGN KEY (codDirector) REFERENCES  Empleado;

--______________________Querys_____________________________
-- Entregar el salario más alto de la empresa.
select nomemp from empleado
where salemp in(select max(salemp) from empleado);

--Entregar el total a  pagar por comisiones, y el número de empleados que las reciben


select * from empleado;

select  sum (comisione),count(ndiemp)from empleado 
where comisione > 0;

--41  Entregar el nombre del último empleado de la lista por orden alfabético. 
select min(nomemp) from empleado;
--42  Hallar el salario más alto, el más bajo y la diferencia entre ellos
select max(salemp)  Maximo_salario , min (salemp) minimo_salario, (max(salemp) - min (salemp)) Diferencia
from empleado;
--43  Conocido el resultado anterior, entregar el nombre de los empleados que reciben el salario más alto y más bajo.
--Cuanto suman estos salarios? 
select nomemp , (max(salemp) - min (salemp)) Diferencia from empleado 
where salemp in (6250000,750000);
--44   Entregar el número de empleados de sexo femenino y de sexo masculino, por departamento
select coddepto,sexemp,count (nomemp) from empleado
group by coddepto,sexemp;
--45. Hallar el salario promedio por departamento. 
select coddepto,avg(salemp) from empleado
group by coddepto;

--46. Hallar el salario promedio por departamento, considerando aquellos empleados cuyo salario supera $900.000, 
--y aquellos con salarios inferiores a $575.000. Entregar el código y el nombre del departamento. 


--47. Entregar la lista de los empleados cuyo salario es mayor o igual que el promedio de la empresa. Ordenarlo por departamento. 
select coddepto,nomemp,salemp from empleado 
where salemp >= (select avg(salemp) from empleado)
order by coddepto ,nomemp,salemp;

SELECT E.codDepto, E.nomEmp, E.salEmp, N.proT FROM Empleado E, 
(SELECT AVG(salEmp) AS proT   FROM Empleado) N
WHERE E.salEmp >= N.proT ORDER BY E.codDepto; 

--48. Hallar los departamentos que tienen más de tres (3) empleados. Entregar el número de empleados de esos departamentos. 
--     SIN INNER JOIN
-- PASO 1 SIN INNER JOIN
select count(coddepto) from  empleado
group by coddepto;
--PASO 2 SIN INNER JOIN
select   d.codDepto,d.nombredpto,n.numr from departamento d ,
(select codDepto,count (codDepto) as numr from empleado
group by coddepto
having count(coddepto)>=3)N
where d.coddepto=n.coddepto;
-- CON INNER JOIN     

select d.codDepto,d.nombredpto,count (d.coddepto) from departamento d
inner join empleado e  on  d.coddepto= e.coddepto
where d.codDepto in (select codDepto as numE from  empleado
                                  group by coddepto
                                  having count (ndiemp)>=3)
 group by d.coddepto,d.nombredpto;


--49. Obtener la lista de empleados jefes, que tienen al menos un empleado a su cargo. Ordene el informe inversamente por el nombre.
select coddirector from departamento;
select e.nomemp,e.jefeid,d.coddirector from empleado e 
inner join departamento d on e.jefeid=d.coddirector;

SELECT J.nDIEmp, J.nomEmp FROM Empleado J, 
(SELECT S.jefeID     FROM Empleado E,  Empleado S    
WHERE E.nDIEmp = S.jefeID    
GROUP BY S.jefeID     HAVING COUNT (S.nDIEmp)>= 1) P ;
--NO SE PUEDE NO VALE LA FORING KEY 

--50. Hallar los departamentos que no tienen empleados

-- INSERCION DE DATOS  DEPARTAMENTOS Q NO TIENEN EMPLEADOS
INSERT INTO Departamento VALUES  ('6000', 'TRANSPORTE', 'CALI', NULL); 
INSERT INTO Departamento Values ('7000', 'COMPRAS', 'CALI', NULL);
    
--PASO 1  SIN INNER JOIN
SELECT D.nombreDpto, COUNT (N.nDIEmp) FROM Departamento D,
(SELECT * FROM Departamento D NATURAL FULL OUTER JOIN Empleado E    ) N
WHERE D.codDepto = N.codDepto 
GROUP BY D.nombreDpto 
ORDER BY D.nombreDpto DESC; 
--PASO 2  SIN INNER JOIN
SELECT D.nombreDpto FROM Departamento D,   
(SELECT *     FROM Departamento D   NATURAL FULL OUTER JOIN  Empleado E  ) N 
WHERE D.codDepto = N.codDepto 
GROUP BY D.nombreDpto 
HAVING COUNT (N.nDIEmp) = 0
ORDER BY D.nombreDpto DESC; 

--CON INNER JOIN (MAS OPTIMO)
select d.nombredpto from departamento d 
left join empleado e on d.coddepto=e.coddepto
where d.coddepto not in (select coddepto from empleado);

--51. Entregar un reporte con el numero de cargos en cada departamento y 
--cual es el promedio de salario de cada uno. Indique el nombre del departamento en el resultado

--Con inner join
select d.coddepto,d.nombredpto,count(e.cargoe) Numero_de_cargos,avg(salemp) from departamento d 
inner join empleado e on d.coddepto= e.coddepto
group by d.coddepto,d.nombredpto;
--Sin inner Join
SELECT D.nombreDpto, nCar, proS FROM(Departamento D  NATURAL LEFT OUTER JOIN  (SELECT codDepto,
COUNT (cargoE) AS  nCar, AVG (salEmp) AS proS    
FROM Empleado   GROUP BY codDepto  ) E )
ORDER BY nombreDpto;

--52. Entregar el nombre del departamento cuya suma de salarios sea la más alta, indicando el valor de la suma.  

select coddepto ,sum (salemp)from empleado
group by coddepto;


CREATE VIEW SumSalar AS   
(SELECT codDepto, SUM (salEmp) AS sumS  FROM Empleado  
GROUP BY codDepto);
-- Listar la suma de salarios por Departamento 
SELECT * FROM  SumSalar;  

-- Hallar la suma de salarios más alta
CREATE VIEW SumSalar2 AS      
(SELECT MAX (sumS) sSalD    FROM SumSalar); 
 



--53. Entregar un reporte con el código y nombre de cada jefe, junto al número de empleados que dirige. 
--Puede haber empleados que no tengan supervisores, para esto se indicará solamente el numero de ellos dejando los valores restantes en NULL. 
 
  






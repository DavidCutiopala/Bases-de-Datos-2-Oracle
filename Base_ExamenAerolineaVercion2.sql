/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     11/13/2018 7:47:10 AM                        */
/*==============================================================*/


/*==============================================================*/
/* Table: AVION                                                 */
/*==============================================================*/
create table AVION 
(
   CODAVION             INTEGER              not null,
   TIPO                 VARCHAR2(32),
   CODBASE              VARCHAR2(4)          not null,
   constraint PK_AVION primary key (CODAVION)
);

comment on table AVION is
'Tabla que alacena los datos de los aviones y la base en la que se les hace el mantenimiento';

/*==============================================================*/
/* Index: RELATIONSHIP_1_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_1_FK on AVION (
   CODBASE ASC
);

/*==============================================================*/
/* Table: BASE                                                  */
/*==============================================================*/
create table BASE 
(
   CODBASE              INTEGER              not null,
   NOMBREBASE           VARCHAR2(100)        not null,
   constraint PK_BASE primary key (CODBASE)
);

comment on table BASE is
'Tabla que almacena los codigos de las bases donde regresan pilotos y miembros de la tripulacion ademas donde se realizan las revisiones de mantenimiento a los aviones';

/*==============================================================*/
/* Table: MIEMBRO                                               */
/*==============================================================*/
create table MIEMBRO 
(
   CODMIEMBRO           INTEGER              not null,
   CARGO                VARCHAR2(32),
   NOMBRE               VARCHAR2(100),
   CODBASE              VARCHAR2(4)          not null,
   constraint PK_MIEMBRO primary key (CODMIEMBRO)
);

comment on table MIEMBRO is
'Esta tabla almacena los atos de los miembros de tripulacion y la base a la que regresan al final de la jornada';

/*==============================================================*/
/* Index: RELATIONSHIP_3_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_3_FK on MIEMBRO (
   CODBASE ASC
);

/*==============================================================*/
/* Table: PILOTO                                                */
/*==============================================================*/
create table PILOTO 
(
   CODPILOTO            INTEGER              not null,
   NOMBRE               VARCHAR2(100),
   CODBASE              VARCHAR2(4)          not null,
   EDAD                 INTEGER,
   constraint PK_PILOTO primary key (CODPILOTO)
);

comment on table PILOTO is
'Tabla que almacena los datos de los pilotos y la base a la que regresan al final de la jornada';

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_2_FK on PILOTO (
   CODBASE ASC
);

/*==============================================================*/
/* Table: TRIPULACION                                           */
/*==============================================================*/
create table TRIPULACION 
(
   NUMVUELO             INTEGER,
   FECHA                DATE,
   CODMIEMBRO           VARCHAR2(4)          not null
);

comment on table TRIPULACION is
'Tabla se especifica que miembros de tripulacion han ido en cada viaje';

/*==============================================================*/
/* Index: RELATIONSHIP_7_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_7_FK on TRIPULACION (
   FECHA ASC,
   NUMVUELO ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_8_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_8_FK on TRIPULACION (
   CODMIEMBRO ASC
);

/*==============================================================*/
/* Table: VIAJE                                                 */
/*==============================================================*/
create table VIAJE 
(
   NUMVUELO             INTEGER              not null,
   FECHA                DATE                 not null,
   CODAVION             VARCHAR2(4)          not null,
   CODPILOTO            VARCHAR2(4)          not null,
   constraint PK_VIAJE primary key (FECHA, NUMVUELO)
);

comment on table VIAJE is
'Tabla que almacena la informacion de cada viaje: vuelo que realiza,avion y piloto';

/*==============================================================*/
/* Index: RELATIONSHIP_4_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_4_FK on VIAJE (
   NUMVUELO ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_5_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_5_FK on VIAJE (
   CODAVION ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_6_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_6_FK on VIAJE (
   CODPILOTO ASC
);

/*==============================================================*/
/* Table: VUELO                                                 */
/*==============================================================*/
create table VUELO 
(
   NUMVUELO             INTEGER              not null,
   ORIGEN               VARCHAR2(32)         not null,
   DESTINO              VARCHAR2(32)         not null,
   HORA_SALIDA          DATE                 not null,
   HORA_LLEGADA         DATE                 not null,
   constraint PK_VUELO primary key (NUMVUELO)
);

comment on table VUELO is
'Tabla que almacena la informacion de los vuelos que se realizan diariamente';

alter table AVION
   add constraint FK_AVION_RELATIONS_BASE foreign key (CODBASE)
      references BASE (CODBASE);

alter table MIEMBRO
   add constraint FK_MIEMBRO_RELATIONS_BASE foreign key (CODBASE)
      references BASE (CODBASE);

alter table PILOTO
   add constraint FK_PILOTO_RELATIONS_BASE foreign key (CODBASE)
      references BASE (CODBASE);

alter table TRIPULACION
   add constraint FK_TRIPULAC_RELATIONS_VIAJE foreign key (FECHA, NUMVUELO)
      references VIAJE (FECHA, NUMVUELO);

alter table TRIPULACION
   add constraint FK_TRIPULAC_RELATIONS_MIEMBRO foreign key (CODMIEMBRO)
      references MIEMBRO (CODMIEMBRO);

alter table VIAJE
   add constraint FK_VIAJE_RELATIONS_VUELO foreign key (NUMVUELO)
      references VUELO (NUMVUELO);

alter table VIAJE
   add constraint FK_VIAJE_RELATIONS_AVION foreign key (CODAVION)
      references AVION (CODAVION);

alter table VIAJE
   add constraint FK_VIAJE_RELATIONS_PILOTO foreign key (CODPILOTO)
      references PILOTO (CODPILOTO);
--_______________________DATOS_______________________________
INSERT INTO AVION (CODAVION, TIPO, CODBASE) VALUES (2314, 'Comercial', 1234);
INSERT INTO AVION (CODAVION, TIPO, CODBASE) VALUES (3341, 'Comercial', 2345);
INSERT INTO AVION (CODAVION, TIPO, CODBASE) VALUES (3412, 'Comercial', 3456);
INSERT INTO AVION (CODAVION, TIPO, CODBASE) VALUES (4523, 'Comercial', 4567);
INSERT INTO AVION (CODAVION, TIPO, CODBASE) VALUES (4563, 'Comercial', 1234);
INSERT INTO AVION (CODAVION, TIPO, CODBASE) VALUES (2352, 'Comercial', 2345);
INSERT INTO AVION (CODAVION, TIPO, CODBASE) VALUES (2144, 'Comercial', 3456);
INSERT INTO AVION (CODAVION, TIPO, CODBASE) VALUES (4663, 'Comercial', 4567);
INSERT INTO AVION (CODAVION, TIPO, CODBASE) VALUES (5773, 'Comercial', 1234);
INSERT INTO AVION (CODAVION, TIPO, CODBASE) VALUES (6435, 'Comercial', 2345);
INSERT INTO AVION (CODAVION, TIPO, CODBASE) VALUES (3452, 'Comercial', 3456);

INSERT INTO BASE (CODBASE, NOMBREBASE) VALUES (3456, 'Cuenca');
INSERT INTO BASE (CODBASE, NOMBREBASE) VALUES (1234, 'Guayaquil');
INSERT INTO BASE (CODBASE, NOMBREBASE) VALUES (2345, 'Quito');
INSERT INTO BASE (CODBASE, NOMBREBASE) VALUES (4567, 'Manta');

INSERT INTO MIEMBRO (CODMIEMBRO, CARGO, NOMBRE, CODBASE) VALUES (3234, 'controlador', 'Galo Pichucho', 1234);
INSERT INTO MIEMBRO (CODMIEMBRO, CARGO, NOMBRE, CODBASE) VALUES (2341, 'controlador', 'Santiago Vivas', 1234);
INSERT INTO MIEMBRO (CODMIEMBRO, CARGO, NOMBRE, CODBASE) VALUES (4343, 'tecnico', 'Anthony Naranjo', 2345);
INSERT INTO MIEMBRO (CODMIEMBRO, CARGO, NOMBRE, CODBASE) VALUES (5452, 'tecnico', 'Mario Puente', 3456);

INSERT INTO PILOTO (CODPILOTO, NOMBRE, CODBASE, EDAD) VALUES (2412, 'Jose Caza', 1234, 34);
INSERT INTO PILOTO (CODPILOTO, NOMBRE, CODBASE, EDAD) VALUES (3432, 'Kevin Taday', 1234, 54);
INSERT INTO PILOTO (CODPILOTO, NOMBRE, CODBASE, EDAD) VALUES (4341, 'Oscar Zapata', 1234, 39);
INSERT INTO PILOTO (CODPILOTO, NOMBRE, CODBASE, EDAD) VALUES (5462, 'Bryan Andrade', 2345, 45);
INSERT INTO PILOTO (CODPILOTO, NOMBRE, CODBASE, EDAD) VALUES (6421, 'Leslie Vallejo', 3456, 36);
INSERT INTO PILOTO (CODPILOTO, NOMBRE, CODBASE, EDAD) VALUES (6141, 'Lizeth Oñate', 4567, 30);
ALTER SESSION SET NLS_DATE_FORMAT='YYYY-MM-DD HH24:MI:SS';

INSERT INTO TRIPULACION (FECHA, NUMVUELO, CODMIEMBRO) VALUES (TO_DATE('2018-09-29 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 104, 3234);
INSERT INTO TRIPULACION (FECHA, NUMVUELO, CODMIEMBRO) VALUES (TO_DATE('2018-02-19 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 102, 3234);
INSERT INTO TRIPULACION (FECHA, NUMVUELO, CODMIEMBRO) VALUES (TO_DATE('2018-02-09 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 101, 3234);
INSERT INTO TRIPULACION (FECHA, NUMVUELO, CODMIEMBRO) VALUES (TO_DATE('2018-02-14 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 106, 2341);
INSERT INTO TRIPULACION (FECHA, NUMVUELO, CODMIEMBRO) VALUES (TO_DATE('2018-09-13 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 107, 2341);
INSERT INTO TRIPULACION (FECHA, NUMVUELO, CODMIEMBRO) VALUES (TO_DATE('2018-02-13 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 103, 5452);
INSERT INTO TRIPULACION (FECHA, NUMVUELO, CODMIEMBRO) VALUES (TO_DATE('2018-11-09 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 105, 3234);

INSERT INTO VIAJE (NUMVUELO, FECHA, CODAVION, CODPILOTO) VALUES (102, TO_DATE('2018-02-19 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 3341, 5462);
INSERT INTO VIAJE (NUMVUELO, FECHA, CODAVION, CODPILOTO) VALUES (104, TO_DATE('2018-09-29 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 3412, 6421);
INSERT INTO VIAJE (NUMVUELO, FECHA, CODAVION, CODPILOTO) VALUES (105, TO_DATE('2018-11-09 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 4523, 6141);
INSERT INTO VIAJE (NUMVUELO, FECHA, CODAVION, CODPILOTO) VALUES (106, TO_DATE('2018-02-14 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 4563, 3432);
INSERT INTO VIAJE (NUMVUELO, FECHA, CODAVION, CODPILOTO) VALUES (103, TO_DATE('2018-02-13 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 3412, 6421);
INSERT INTO VIAJE (NUMVUELO, FECHA, CODAVION, CODPILOTO) VALUES (101, TO_DATE('2018-02-09 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 2314, 2412);
INSERT INTO VIAJE (NUMVUELO, FECHA, CODAVION, CODPILOTO) VALUES (107, TO_DATE('2018-09-13 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 2314, 2412);


INSERT INTO VUELO (NUMVUELO, ORIGEN, DESTINO, HORA_SALIDA, HORA_LLEGADA) VALUES (107, 'Guayaquil', 'Washintown', TO_DATE('10:00','HH24:MI'),TO_DATE('12:00','HH24:MI'));
INSERT INTO VUELO (NUMVUELO, ORIGEN, DESTINO, HORA_SALIDA, HORA_LLEGADA) VALUES (102, 'Quito', 'Nueva York', TO_TIMESTAMP('2018-02-19 10:02:00.000000', 'YYYY-MM-DD HH24:MI:SS.FF6'), TO_TIMESTAMP('2018-02-19 14:10:02.000000', 'YYYY-MM-DD HH24:MI:SS.FF6'));
INSERT INTO VUELO (NUMVUELO, ORIGEN, DESTINO, HORA_SALIDA, HORA_LLEGADA) VALUES (103, 'Cuenca', 'Quito', TO_TIMESTAMP('2018-02-13 09:30:10.000000', 'YYYY-MM-DD HH24:MI:SS.FF6'), TO_TIMESTAMP('2018-02-13 10:30:10.000000', 'YYYY-MM-DD HH24:MI:SS.FF6'));
INSERT INTO VUELO (NUMVUELO, ORIGEN, DESTINO, HORA_SALIDA, HORA_LLEGADA) VALUES (105, 'Manta', 'Cali', TO_TIMESTAMP('2018-11-09 09:03:00.000000', 'YYYY-MM-DD HH24:MI:SS.FF6'), TO_TIMESTAMP('2018-11-09 11:03:00.000000', 'YYYY-MM-DD HH24:MI:SS.FF6'));
INSERT INTO VUELO (NUMVUELO, ORIGEN, DESTINO, HORA_SALIDA, HORA_LLEGADA) VALUES (104, 'Cuenca', 'Quito', TO_TIMESTAMP('2018-09-29 11:05:00.000000', 'YYYY-MM-DD HH24:MI:SS.FF6'), TO_TIMESTAMP('2018-09-29 12:05:00.000000', 'YYYY-MM-DD HH24:MI:SS.FF6'));
INSERT INTO VUELO (NUMVUELO, ORIGEN, DESTINO, HORA_SALIDA, HORA_LLEGADA) VALUES (101, 'Guayaquil', 'Nueva York', TO_TIMESTAMP('2018-02-09 10:12:03.000000', 'YYYY-MM-DD HH24:MI:SS.FF6'), TO_TIMESTAMP('2018-02-09 14:10:03.000000', 'YYYY-MM-DD HH24:MI:SS.FF6'));
INSERT INTO VUELO (NUMVUELO, ORIGEN, DESTINO, HORA_SALIDA, HORA_LLEGADA) VALUES (106, 'Guayaquil', 'Nueva York', TO_TIMESTAMP('2018-02-14 19:10:10.000000', 'YYYY-MM-DD HH24:MI:SS.FF6'), TO_TIMESTAMP('2018-02-14 23:10:10.000000', 'YYYY-MM-DD HH24:MI:SS.FF6'));

select sysdate from dual;

select * from vuelo;


delete from vuelo;
describe vuelo;

create table VUELO 
(
   NUMVUELO             INTEGER              not null,
   ORIGEN               VARCHAR2(32)         not null,
   DESTINO              VARCHAR2(32)         not null,
   HORA_SALIDA          DATE                 not null,
   HORA_LLEGADA         DATE                 not null,
   constraint PK_VUELO primary key (NUMVUELO)
);

select sysdate from dual;
ALTER TABLE VUELO ADD   TOTAL_HORAS    as   (extract(HOUR from HORA_LLEGADA)-extract(HOUR from HORA_SALIDA)); 

select  extract(minute  from hora_llegada) from vuelo;

select extract(hour from cast(to_char(sysdate, 'DD-MON-YYYY HH24:MI:SS') 
2  as timestamp)) from dual;


ALTER TABLE countries  ADD  (duty_pct     NUMBER(2,2)  CHECK (duty_pct < 10.5),   visa_needed  VARCHAR2(3)); 
--_____________Consultas________________________________________

--1......Listar mediante SQL el nombre de los pilotos que tiene un numero de vuelos superior al promedio de los vuelos realizados 
-- en el mes de febrero 2018 hacia nueva york
SELECT V.CODPILOTO,P.NOMBRE,COUNT(V.CODPILOTO) "NUM VUELOS" FROM VUELO
INNER JOIN VIAJE V on VUELO.NUMVUELO = V.NUMVUELO 
INNER JOIN PILOTO P on V.CODPILOTO = P.CODPILOTO 
WHERE V.CODPILOTO IN (SELECT CODPILOTO FROM PILOTO) 
GROUP BY V.CODPILOTO,P.NOMBRE HAVING COUNT(V.CODPILOTO) >((SELECT COUNT(*) FROM VUELO 
                                                                                                                    INNER JOIN VIAJE V on VUELO.NUMVUELO = V.NUMVUELO
                                                                                                                     WHERE VUELO.DESTINO='Nueva York')/(SELECT COUNT(*) FROM VIAJE
                                                                                                                                                                                      WHERE FECHA   
                                                                                                                                                                                      BETWEEN TO_DATE('01-FEB-2018') AND TO_DATE('28-FEB-2018')));



--2.........Listar el detalle de vuelo de los aviones (tripulacion,avion,origen,destino,fecha,etc) que pertenecen ala base de Guayaquil 
-- por mes 

SELECT extract(MONTH from V.FECHA) "MES",VU.NUMVUELO,T.CODMIEMBRO,V.CODAVION,VU.ORIGEN,VU.DESTINO,VU.HORA_SALIDA,VU.HORA_LLEGADA
FROM VUELO VU 
INNER JOIN VIAJE V on VU.NUMVUELO = V.NUMVUELO 
INNER JOIN TRIPULACION T on V.NUMVUELO = T.NUMVUELO 
INNER JOIN AVION A2 on V.CODAVION = A2.CODAVION 
INNER JOIN BASE B on A2.CODBASE = B.CODBASE 
WHERE B.NOMBREBASE='Guayaquil' 
GROUP BY v.FECHA,VU.NUMVUELO,T.CODMIEMBRO,V.CODAVION,VU.ORIGEN,VU.DESTINO,VU.HORA_SALIDA,VU.HORA_LLEGADA;





select extract(month from sysdate) from dual;
--3....Listar los destinos  con mayor numero de vuelos realizados en lo que va del año 2018 por mes 

 SELECT VUELO.DESTINO,COUNT(VUELO.DESTINO) "NUM VUELOS",extract(MONTH from V.FECHA) "MES"
 FROM VUELO INNER JOIN VIAJE V on VUELO.NUMVUELO = V.NUMVUELO 
 GROUP BY VUELO.DESTINO,extract(MONTH from V.FECHA);






SELECT Sbc.anno, 
             AVG(Sbc.contador) AS mediaanual
FROM (SELECT COUNT (*) AS contador, 
                          EXTRACT(YEAR FROM fecha) AS anno,
                          EXTRACT(MONTH FROM fecha) AS mes
                          FROM ventas
                          GROUP BY EXTRACT(YEAR FROM fecha), 
                            EXTRACT(MONTH FROM fecha)) AS Sbc;

select  nombre from departamentos 
where codigo in (select departamento from empleados
                            group by departamento 
                            having  count (*));

                              
--4......se desea conocer mediate un reporte el nombre de los pilotos  mas experimentados para el caso considere   que el numero  de horas de vuelo 
--acomuladas sea mayor al promedio general 


SELECT V.CODPILOTO ,P.NOMBRE,SUM(TOTAL_HORAS) "HORAS DE VUELO" FROM VUELO 
INNER JOIN VIAJE V on VUELO.NUMVUELO = V.NUMVUELO 
INNER JOIN PILOTO P on V.CODPILOTO = P.CODPILOTO 
WHERE V.CODPILOTO IN (SELECT CODPILOTO FROM PILOTO)
                                           GROUP BY V.CODPILOTO,P.NOMBRE 
                                           HAVING SUM(TOTAL_HORAS)>(SELECT AVG(TOTAL_HORAS) FROM VUELO);





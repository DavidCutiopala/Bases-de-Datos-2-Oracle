/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     11/13/2018 7:47:10 AM                        */
/*==============================================================*/


alter table AVION
   drop constraint FK_AVION_RELATIONS_BASE;

alter table MIEMBRO
   drop constraint FK_MIEMBRO_RELATIONS_BASE;

alter table PILOTO
   drop constraint FK_PILOTO_RELATIONS_BASE;

alter table TRIPULACION
   drop constraint FK_TRIPULAC_RELATIONS_VIAJE;

alter table TRIPULACION
   drop constraint FK_TRIPULAC_RELATIONS_MIEMBRO;

alter table VIAJE
   drop constraint FK_VIAJE_RELATIONS_VUELO;

alter table VIAJE
   drop constraint FK_VIAJE_RELATIONS_AVION;

alter table VIAJE
   drop constraint FK_VIAJE_RELATIONS_PILOTO;

drop index RELATIONSHIP_1_FK;

drop table AVION cascade constraints;

drop table BASE cascade constraints;

drop index RELATIONSHIP_3_FK;

drop table MIEMBRO cascade constraints;

drop index RELATIONSHIP_2_FK;

drop table PILOTO cascade constraints;

drop index RELATIONSHIP_8_FK;

drop index RELATIONSHIP_7_FK;

drop table TRIPULACION cascade constraints;

drop index RELATIONSHIP_6_FK;

drop index RELATIONSHIP_5_FK;

drop index RELATIONSHIP_4_FK;

drop table VIAJE cascade constraints;

drop table VUELO cascade constraints;

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


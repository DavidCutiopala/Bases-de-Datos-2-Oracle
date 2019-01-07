/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     10/11/2018 10:48:35 AM                       */
/*==============================================================*/


alter table DETALLE
   drop constraint FK_DETALLE_DETALLE_FACTURA;

alter table DETALLE
   drop constraint FK_DETALLE_DETALLE2_PRODUCTO;

alter table FACTURA
   drop constraint FK_FACTURA_TIENE_CLIENTE;

drop table CLIENTE cascade constraints;

drop index DETALLE_FK;

drop index DETALLE2_FK;

drop table DETALLE cascade constraints;

drop index TIENE_FK;

drop table FACTURA cascade constraints;

drop table PRODUCTO cascade constraints;

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE 
(
   CEDULA               CHAR(10)             not null,
   NOMBRE               CHAR(30),
   APELLIDO             CHAR(30),
   DIRECCION            CHAR(30),
   constraint PK_CLIENTE primary key (CEDULA)
);

comment on table CLIENTE is
'El cliete realiza la compra de productos ';

/*==============================================================*/
/* Table: DETALLE                                               */
/*==============================================================*/
create table DETALLE 
(
   IDFACTURA            CHAR(5)              not null,
   IDPRODUCTO           CHAR(5)              not null,
   constraint PK_DETALLE primary key (IDFACTURA, IDPRODUCTO)
);

/*==============================================================*/
/* Index: DETALLE2_FK                                           */
/*==============================================================*/
create index DETALLE2_FK on DETALLE (
   IDPRODUCTO ASC
);

/*==============================================================*/
/* Index: DETALLE_FK                                            */
/*==============================================================*/
create index DETALLE_FK on DETALLE (
   IDFACTURA ASC
);

/*==============================================================*/
/* Table: FACTURA                                               */
/*==============================================================*/
create table FACTURA 
(
   FECHA                DATE,
   IDFACTURA            CHAR(5)              not null,
   CEDULA               CHAR(10),
   constraint PK_FACTURA primary key (IDFACTURA)
);

/*==============================================================*/
/* Index: TIENE_FK                                              */
/*==============================================================*/
create index TIENE_FK on FACTURA (
   CEDULA ASC
);

/*==============================================================*/
/* Table: PRODUCTO                                              */
/*==============================================================*/
create table PRODUCTO 
(
   IDPRODUCTO           CHAR(5)              not null,
   NOMBRE               CHAR(30),
   PRECIO               FLOAT,
   CANTIDAD             INTEGER,
   constraint PK_PRODUCTO primary key (IDPRODUCTO)
);

alter table DETALLE
   add constraint FK_DETALLE_DETALLE_FACTURA foreign key (IDFACTURA)
      references FACTURA (IDFACTURA);

alter table DETALLE
   add constraint FK_DETALLE_DETALLE2_PRODUCTO foreign key (IDPRODUCTO)
      references PRODUCTO (IDPRODUCTO);

alter table FACTURA
   add constraint FK_FACTURA_TIENE_CLIENTE foreign key (CEDULA)
      references CLIENTE (CEDULA);


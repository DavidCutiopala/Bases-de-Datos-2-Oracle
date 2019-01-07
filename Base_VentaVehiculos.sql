/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     11/11/2018 10:37:38                          */
/*==============================================================*/


/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE 
(
   COD_CLIENTE          INTEGER              not null,
   NOMBRE_CLIENTE       CHAR(32),
   CEDULA_CLIENTE       VARCHAR2(16),
   DIRECCION_CLIENTE    CHAR(32),
   TELEFONO_CLIENTE     VARCHAR2(16),
   GENERO_CLIENTE       CHAR(32)            
      constraint CKC_GENERO_CLIENTE_CLIENTE check (GENERO_CLIENTE is null or (GENERO_CLIENTE in ('<Val3>','<Val4>') and GENERO_CLIENTE = upper(GENERO_CLIENTE))),
   FECHA_NACIMIENTO_CLIENTE DATE,
   INGRESOS_C           INTEGER              default 100
      constraint CKC_INGRESOS_C_CLIENTE check (INGRESOS_C is null or (INGRESOS_C between 100 and 100000)),
   constraint PK_CLIENTE primary key (COD_CLIENTE)
);

/*==============================================================*/
/* Table: PATIO_VENTA_AUTOS                                     */
/*==============================================================*/
create table PATIO_VENTA_AUTOS 
(
   COD_PATIO            NUMBER(6)            not null,
   DIRECCION_PATIO      CHAR(32),
   TELEFONO_PATIO       CHAR(32),
   constraint PK_PATIO_VENTA_AUTOS primary key (COD_PATIO)
);

/*==============================================================*/
/* Table: TRANSACCIONVENTAVEHICULOS                             */
/*==============================================================*/
create table TRANSACCIONVENTAVEHICULOS 
(
   COD_PATIO            INTEGER              not null,
   COD_CLIENTE          INTEGER              not null,
   FECHA_VENTA          DATE,
   CANTIDAD_VEHICULO    INTEGER,
   constraint PK_TRANSACCIONVENTAVEHICULOS primary key (COD_PATIO, COD_CLIENTE)
);

/*==============================================================*/
/* Index: TRANSACCIONVENTAVEHICULOS2_FK                         */
/*==============================================================*/
create index TRANSACCIONVENTAVEHICULOS2_FK on TRANSACCIONVENTAVEHICULOS (
   COD_PATIO ASC
);

/*==============================================================*/
/* Index: TRANSACCIONVENTAVEHICULOS_FK                          */
/*==============================================================*/
create index TRANSACCIONVENTAVEHICULOS_FK on TRANSACCIONVENTAVEHICULOS (
   COD_CLIENTE ASC
);

/*==============================================================*/
/* Table: VEHICULO                                              */
/*==============================================================*/
create table VEHICULO 
(
   COD_VEHICULO         NUMBER(6)            not null,
   COD_CLIENTE          INTEGER              not null,
   COD_PATIO            INTEGER              not null,
   TIPO_VEHICULO        CHAR(32)            
      constraint CKC_TIPO_VEHICULO_VEHICULO check (TIPO_VEHICULO is null or (TIPO_VEHICULO in ('CAMIONES','AUTOS','MOTOS') and TIPO_VEHICULO = upper(TIPO_VEHICULO))),
   DESCRIPCION_VEHICULO CHAR(32),
   constraint PK_VEHICULO primary key (COD_VEHICULO)
);

/*==============================================================*/
/* Index: PREFERENCIAVEHICULO_FK                                */
/*==============================================================*/
create index PREFERENCIAVEHICULO_FK on VEHICULO (
   COD_CLIENTE ASC
);

/*==============================================================*/
/* Index: DISPONILIDADVEHICULO_FK                               */
/*==============================================================*/
create index DISPONILIDADVEHICULO_FK on VEHICULO (
   COD_PATIO ASC
);

/*==============================================================*/
/* Table: VENDEDOR                                              */
/*==============================================================*/
create table VENDEDOR 
(
   COD_VENDEDOR         NUMBER(6)            not null,
   COD_PATIO            INTEGER              not null,
   NOMBRE_VENDEDOR      CHAR(32),
   DIRECCION_VENDEDOR   CHAR(32),
   constraint PK_VENDEDOR primary key (COD_VENDEDOR)
);

/*==============================================================*/
/* Index: EQUIPOVENTAS_FK                                       */
/*==============================================================*/
create index EQUIPOVENTAS_FK on VENDEDOR (
   COD_PATIO ASC
);

/*==============================================================*/
/* Table: VENTAVENDEDORVEHICULO                                 */
/*==============================================================*/
create table VENTAVENDEDORVEHICULO 
(
   COD_CLIENTE          INTEGER              not null,
   COD_VENDEDOR         INTEGER              not null,
   VENTAACUMULADA_VENDEDOR FLOAT(32),
   INGRESOS_CLIENTE     FLOAT(32),
   constraint PK_VENTAVENDEDORVEHICULO primary key (COD_CLIENTE, COD_VENDEDOR)
);

/*==============================================================*/
/* Index: VENTAVEHICULO2_FK                                     */
/*==============================================================*/
create index VENTAVEHICULO2_FK on VENTAVENDEDORVEHICULO (
   COD_VENDEDOR ASC
);

/*==============================================================*/
/* Index: VENTAVEHICULO_FK                                      */
/*==============================================================*/
create index VENTAVEHICULO_FK on VENTAVENDEDORVEHICULO (
   COD_CLIENTE ASC
);

alter table TRANSACCIONVENTAVEHICULOS
   add constraint FK_TRANSACC_TRANSACCI_CLIENTE foreign key (COD_CLIENTE)
      references CLIENTE (COD_CLIENTE);

alter table TRANSACCIONVENTAVEHICULOS
   add constraint FK_TRANSACC_TRANSACCI_PATIO_VE foreign key (COD_PATIO)
      references PATIO_VENTA_AUTOS (COD_PATIO);

alter table VEHICULO
   add constraint FK_VEHICULO_DISPONILI_PATIO_VE foreign key (COD_PATIO)
      references PATIO_VENTA_AUTOS (COD_PATIO);

alter table VEHICULO
   add constraint FK_VEHICULO_PREFERENC_CLIENTE foreign key (COD_CLIENTE)
      references CLIENTE (COD_CLIENTE);

alter table VENDEDOR
   add constraint FK_VENDEDOR_EQUIPOVEN_PATIO_VE foreign key (COD_PATIO)
      references PATIO_VENTA_AUTOS (COD_PATIO);

alter table VENTAVENDEDORVEHICULO
   add constraint FK_VENTAVEN_VENTAVEHI_CLIENTE foreign key (COD_CLIENTE)
      references CLIENTE (COD_CLIENTE);

alter table VENTAVENDEDORVEHICULO
   add constraint FK_VENTAVEN_VENTAVEHI_VENDEDOR foreign key (COD_VENDEDOR)
      references VENDEDOR (COD_VENDEDOR);


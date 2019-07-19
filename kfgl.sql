/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     2019/5/31 10:18:08                           */
/*==============================================================*/


alter table book
   drop constraint FK_BOOK_BOOK_GUSET;

alter table book
   drop constraint FK_BOOK_BOOK2_ROOM;

alter table room
   drop constraint FK_ROOM_BELONG1_RSTATUS;

alter table room
   drop constraint FK_ROOM_BELONG2_RTYPE;

alter table room
   drop constraint FK_ROOM_CHARGE_PRINCIPA;

drop index book_FK;

drop index book2_FK;

drop table book cascade constraints;

drop table guset cascade constraints;

drop table principal cascade constraints;

drop index belong1_FK;

drop index belong2_FK;

drop index charge_FK;

drop table room cascade constraints;

drop table rstatus cascade constraints;

drop table rtype cascade constraints;

/*==============================================================*/
/* Table: book                                                */
/*==============================================================*/
create table book 
(
   BID                  NUMBER(20)           not null,
   GID                  NUMBER(10),
   RID                  NUMBER(5),
   btime              DATE,
   utime              DATE,
   constraint PK_BOOK primary key (BID)
);

/*==============================================================*/
/* Index: book2_FK                                            */
/*==============================================================*/
create index book2_FK on book (
   RID ASC
);

/*==============================================================*/
/* Index: book_FK                                             */
/*==============================================================*/
create index book_FK on book (
   GID ASC
);

/*==============================================================*/
/* Table: guset                                               */
/*==============================================================*/
create table guset 
(
   GID                  NUMBER(10)           not null,
   gname              VARCHAR2(20),
   gphone             NUMBER(20),
   constraint PK_GUSET primary key (GID)
);

/*==============================================================*/
/* Table: principal                                           */
/*==============================================================*/
create table principal 
(
   PID                  NUMBER(10)           not null,
   pname              VARCHAR2(20),
   constraint PK_PRINCIPAL primary key (PID)
);

/*==============================================================*/
/* Table: room                                                */
/*==============================================================*/
create table room 
(
   RID                  NUMBER(5)            not null,
   PID                  NUMBER(10)           not null,
   TID                  NUMBER(5)            not null,
   SID                  NUMBER(5)            not null,
   GID                  NUMBER(10),
   constraint PK_ROOM primary key (RID)
);

/*==============================================================*/
/* Index: charge_FK                                           */
/*==============================================================*/
create index charge_FK on room (
   PID ASC
);

/*==============================================================*/
/* Index: belong2_FK                                          */
/*==============================================================*/
create index belong2_FK on room (
   TID ASC
);

/*==============================================================*/
/* Index: belong1_FK                                          */
/*==============================================================*/
create index belong1_FK on room (
   SID ASC
);

/*==============================================================*/
/* Table: rstatus                                             */
/*==============================================================*/
create table rstatus 
(
   SID                  NUMBER(5)            not null,
   sname              VARCHAR2(20),
   constraint PK_RSTATUS primary key (SID)
);

/*==============================================================*/
/* Table: rtype                                               */
/*==============================================================*/
create table rtype 
(
   TID                  NUMBER(5)            not null,
   tname              VARCHAR2(20),
   bednum             NUMBER(5),
   price              NUMBER(20),
   constraint PK_RTYPE primary key (TID)
);

alter table book
   add constraint FK_BOOK_BOOK_GUSET foreign key (GID)
      references guset (GID);

alter table book
   add constraint FK_BOOK_BOOK2_ROOM foreign key (RID)
      references room (RID);

alter table room
   add constraint FK_ROOM_BELONG1_RSTATUS foreign key (SID)
      references rstatus (SID);

alter table room
   add constraint FK_ROOM_BELONG2_RTYPE foreign key (TID)
      references rtype (TID);

alter table room
   add constraint FK_ROOM_CHARGE_PRINCIPA foreign key (PID)
      references principal (PID);


/*==============================================================*/
/* Nom de SGBD :  Sybase SQL Anywhere 11                        */
/* Date de création :  8/27/2023 5:20:14 PM                     */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_APPRECIA_ASSOCIATI_USER') then
    alter table Appreciation
       delete foreign key FK_APPRECIA_ASSOCIATI_USER
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_APPRECIA_ASSOCIATI_POST') then
    alter table Appreciation
       delete foreign key FK_APPRECIA_ASSOCIATI_POST
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_COMMENT_ASSOCIATI_USER') then
    alter table "Comment"
       delete foreign key FK_COMMENT_ASSOCIATI_USER
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_COMMENT_ASSOCIATI_POST') then
    alter table "Comment"
       delete foreign key FK_COMMENT_ASSOCIATI_POST
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_POST_ASSOCIATI_USER') then
    alter table Post
       delete foreign key FK_POST_ASSOCIATI_USER
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_POST_ASSOCIATI_CATEGORY') then
    alter table Post
       delete foreign key FK_POST_ASSOCIATI_CATEGORY
end if;

if exists(
   select 1 from sys.sysindex i, sys.systable t
   where i.table_id=t.table_id 
     and i.index_name='ASSOCIATION6_FK'
     and t.table_name='Appreciation'
) then
   drop index Appreciation.ASSOCIATION6_FK
end if;

if exists(
   select 1 from sys.sysindex i, sys.systable t
   where i.table_id=t.table_id 
     and i.index_name='ASSOCIATION2_FK'
     and t.table_name='Appreciation'
) then
   drop index Appreciation.ASSOCIATION2_FK
end if;

if exists(
   select 1 from sys.sysindex i, sys.systable t
   where i.table_id=t.table_id 
     and i.index_name='APPRECIATION_PK'
     and t.table_name='Appreciation'
) then
   drop index Appreciation.APPRECIATION_PK
end if;

if exists(
   select 1 from sys.systable 
   where table_name='Appreciation'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table Appreciation
end if;

if exists(
   select 1 from sys.sysindex i, sys.systable t
   where i.table_id=t.table_id 
     and i.index_name='CATEGORY_PK'
     and t.table_name='Category'
) then
   drop index Category.CATEGORY_PK
end if;

if exists(
   select 1 from sys.systable 
   where table_name='Category'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table Category
end if;

if exists(
   select 1 from sys.sysindex i, sys.systable t
   where i.table_id=t.table_id 
     and i.index_name='ASSOCIATION4_FK'
     and t.table_name='Comment'
) then
   drop index "Comment".ASSOCIATION4_FK
end if;

if exists(
   select 1 from sys.sysindex i, sys.systable t
   where i.table_id=t.table_id 
     and i.index_name='ASSOCIATION3_FK'
     and t.table_name='Comment'
) then
   drop index "Comment".ASSOCIATION3_FK
end if;

if exists(
   select 1 from sys.sysindex i, sys.systable t
   where i.table_id=t.table_id 
     and i.index_name='COMMENT_PK'
     and t.table_name='Comment'
) then
   drop index "Comment".COMMENT_PK
end if;

if exists(
   select 1 from sys.systable 
   where table_name='Comment'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table "Comment"
end if;

if exists(
   select 1 from sys.sysindex i, sys.systable t
   where i.table_id=t.table_id 
     and i.index_name='ASSOCIATION5_FK'
     and t.table_name='Post'
) then
   drop index Post.ASSOCIATION5_FK
end if;

if exists(
   select 1 from sys.sysindex i, sys.systable t
   where i.table_id=t.table_id 
     and i.index_name='ASSOCIATION1_FK'
     and t.table_name='Post'
) then
   drop index Post.ASSOCIATION1_FK
end if;

if exists(
   select 1 from sys.sysindex i, sys.systable t
   where i.table_id=t.table_id 
     and i.index_name='POST_PK'
     and t.table_name='Post'
) then
   drop index Post.POST_PK
end if;

if exists(
   select 1 from sys.systable 
   where table_name='Post'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table Post
end if;

if exists(
   select 1 from sys.sysindex i, sys.systable t
   where i.table_id=t.table_id 
     and i.index_name='USER_PK'
     and t.table_name='User'
) then
   drop index "User".USER_PK
end if;

if exists(
   select 1 from sys.systable 
   where table_name='User'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table "User"
end if;

/*==============================================================*/
/* Table : Appreciation                                         */
/*==============================================================*/
create table Appreciation 
(
   id                   integer                        not null,
   Use_id               integer                        not null,
   Pos_id               integer                        not null,
   "like"               smallint                       null,
   dislike              smallint                       null,
   "date"               timestamp                      null,
   constraint PK_APPRECIATION primary key (id)
);

/*==============================================================*/
/* Index : APPRECIATION_PK                                      */
/*==============================================================*/
create unique index APPRECIATION_PK on Appreciation (
id ASC
);

/*==============================================================*/
/* Index : ASSOCIATION2_FK                                      */
/*==============================================================*/
create index ASSOCIATION2_FK on Appreciation (
Use_id ASC
);

/*==============================================================*/
/* Index : ASSOCIATION6_FK                                      */
/*==============================================================*/
create index ASSOCIATION6_FK on Appreciation (
Pos_id ASC
);

/*==============================================================*/
/* Table : Category                                             */
/*==============================================================*/
create table Category 
(
   id                   integer                        not null,
   name                 varchar(254)                   null,
   constraint PK_CATEGORY primary key (id)
);

/*==============================================================*/
/* Index : CATEGORY_PK                                          */
/*==============================================================*/
create unique index CATEGORY_PK on Category (
id ASC
);

/*==============================================================*/
/* Table : "Comment"                                            */
/*==============================================================*/
create table "Comment" 
(
   id                   integer                        not null,
   Pos_id               integer                        not null,
   Use_id               integer                        not null,
   content              varchar(254)                   null,
   "date"               timestamp                      null,
   constraint PK_COMMENT primary key (id)
);

/*==============================================================*/
/* Index : COMMENT_PK                                           */
/*==============================================================*/
create unique index COMMENT_PK on "Comment" (
id ASC
);

/*==============================================================*/
/* Index : ASSOCIATION3_FK                                      */
/*==============================================================*/
create index ASSOCIATION3_FK on "Comment" (
Use_id ASC
);

/*==============================================================*/
/* Index : ASSOCIATION4_FK                                      */
/*==============================================================*/
create index ASSOCIATION4_FK on "Comment" (
Pos_id ASC
);

/*==============================================================*/
/* Table : Post                                                 */
/*==============================================================*/
create table Post 
(
   id                   integer                        not null,
   Cat_id               integer                        not null,
   Use_id               integer                        not null,
   title                varchar(254)                   null,
   content              varchar(254)                   null,
   image                varchar(254)                   null,
   "date"               timestamp                      null,
   constraint PK_POST primary key (id)
);

/*==============================================================*/
/* Index : POST_PK                                              */
/*==============================================================*/
create unique index POST_PK on Post (
id ASC
);

/*==============================================================*/
/* Index : ASSOCIATION1_FK                                      */
/*==============================================================*/
create index ASSOCIATION1_FK on Post (
Use_id ASC
);

/*==============================================================*/
/* Index : ASSOCIATION5_FK                                      */
/*==============================================================*/
create index ASSOCIATION5_FK on Post (
Cat_id ASC
);

/*==============================================================*/
/* Table : "User"                                               */
/*==============================================================*/
create table "User" 
(
   id                   integer                        not null,
   firthName            varchar(254)                   null,
   lastName             varchar(254)                   null,
   password             varchar(254)                   null,
   image                varchar(254)                   null,
   username             varchar(254)                   null,
   constraint PK_USER primary key (id)
);

/*==============================================================*/
/* Index : USER_PK                                              */
/*==============================================================*/
create unique index USER_PK on "User" (
id ASC
);

alter table Appreciation
   add constraint FK_APPRECIA_ASSOCIATI_USER foreign key (Use_id)
      references "User" (id)
      on update restrict
      on delete restrict;

alter table Appreciation
   add constraint FK_APPRECIA_ASSOCIATI_POST foreign key (Pos_id)
      references Post (id)
      on update restrict
      on delete restrict;

alter table "Comment"
   add constraint FK_COMMENT_ASSOCIATI_USER foreign key (Use_id)
      references "User" (id)
      on update restrict
      on delete restrict;

alter table "Comment"
   add constraint FK_COMMENT_ASSOCIATI_POST foreign key (Pos_id)
      references Post (id)
      on update restrict
      on delete restrict;

alter table Post
   add constraint FK_POST_ASSOCIATI_USER foreign key (Use_id)
      references "User" (id)
      on update restrict
      on delete restrict;

alter table Post
   add constraint FK_POST_ASSOCIATI_CATEGORY foreign key (Cat_id)
      references Category (id)
      on update restrict
      on delete restrict;


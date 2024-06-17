prompt PL/SQL Developer Export Tables for user SYS@XE
prompt Created by tsuri on Monday, June 17, 2024
set feedback off
set define off

prompt Creating REPORTERS...
create table REPORTERS
(
  reporterid   INTEGER not null,
  reportername VARCHAR2(15) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table REPORTERS
  add primary key (REPORTERID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating BRANCHE...
create table BRANCHE
(
  brancheid       INTEGER not null,
  branchelocation VARCHAR2(20) default 'Modiin',
  reporterid      INTEGER not null,
  openeddate      DATE not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table BRANCHE
  add primary key (BRANCHEID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table BRANCHE
  add foreign key (REPORTERID)
  references REPORTERS (REPORTERID);

prompt Creating CUSTOMERS...
create table CUSTOMERS
(
  customerid   INTEGER not null,
  customername VARCHAR2(15) not null,
  accountid    INTEGER not null,
  joindate     DATE not null,
  brancheid    INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CUSTOMERS
  add primary key (CUSTOMERID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CUSTOMERS
  add foreign key (BRANCHEID)
  references BRANCHE (BRANCHEID);

prompt Creating LOANS...
create table LOANS
(
  loanid     INTEGER not null,
  loanamount INTEGER not null,
  customerid INTEGER not null,
  loandate   DATE not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table LOANS
  add primary key (LOANID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table LOANS
  add foreign key (CUSTOMERID)
  references CUSTOMERS (CUSTOMERID);

prompt Creating TEAMS...
create table TEAMS
(
  teamid  INTEGER not null,
  workday VARCHAR2(10) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TEAMS
  add primary key (TEAMID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating WORKERS...
create table WORKERS
(
  workerid   INTEGER not null,
  workername VARCHAR2(15) not null,
  workerrole VARCHAR2(15) not null,
  brancheid  INTEGER not null,
  teamid     INTEGER not null,
  workerage  INTEGER
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table WORKERS
  add primary key (WORKERID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table WORKERS
  add foreign key (BRANCHEID)
  references BRANCHE (BRANCHEID);
alter table WORKERS
  add foreign key (TEAMID)
  references TEAMS (TEAMID);
alter table WORKERS
  add check (workerAge>=18);
alter table WORKERS
  add check (workerAge>=18);
alter table WORKERS
  add check (workerAge>=18);
alter table WORKERS
  add check (workerAge>=18);

prompt Disabling triggers for REPORTERS...
alter table REPORTERS disable all triggers;
prompt Disabling triggers for BRANCHE...
alter table BRANCHE disable all triggers;
prompt Disabling triggers for CUSTOMERS...
alter table CUSTOMERS disable all triggers;
prompt Disabling triggers for LOANS...
alter table LOANS disable all triggers;
prompt Disabling triggers for TEAMS...
alter table TEAMS disable all triggers;
prompt Disabling triggers for WORKERS...
alter table WORKERS disable all triggers;
prompt Disabling foreign key constraints for BRANCHE...
alter table BRANCHE disable constraint SYS_C008920;
prompt Disabling foreign key constraints for CUSTOMERS...
alter table CUSTOMERS disable constraint SYS_C008927;
prompt Disabling foreign key constraints for LOANS...
alter table LOANS disable constraint SYS_C008933;
prompt Disabling foreign key constraints for WORKERS...
alter table WORKERS disable constraint SYS_C008941;
alter table WORKERS disable constraint SYS_C008942;
prompt Deleting WORKERS...
delete from WORKERS;
commit;
prompt Deleting TEAMS...
delete from TEAMS;
commit;
prompt Deleting LOANS...
delete from LOANS;
commit;
prompt Deleting CUSTOMERS...
delete from CUSTOMERS;
commit;
prompt Deleting BRANCHE...
delete from BRANCHE;
commit;
prompt Deleting REPORTERS...
delete from REPORTERS;
commit;
prompt Loading REPORTERS...
insert into REPORTERS (reporterid, reportername)
values (102000, 'Shawn');
insert into REPORTERS (reporterid, reportername)
values (102001, 'Michael');
insert into REPORTERS (reporterid, reportername)
values (102002, 'Karen');
insert into REPORTERS (reporterid, reportername)
values (102003, 'Andrea');
insert into REPORTERS (reporterid, reportername)
values (102004, 'Patricia');
insert into REPORTERS (reporterid, reportername)
values (102005, 'Ethan');
insert into REPORTERS (reporterid, reportername)
values (102006, 'Angelica');
insert into REPORTERS (reporterid, reportername)
values (102007, 'Jerry');
insert into REPORTERS (reporterid, reportername)
values (102008, 'Gerald');
insert into REPORTERS (reporterid, reportername)
values (102009, 'Linda');
insert into REPORTERS (reporterid, reportername)
values (102010, 'Edward');
insert into REPORTERS (reporterid, reportername)
values (102011, 'John');
insert into REPORTERS (reporterid, reportername)
values (102012, 'Rebekah');
insert into REPORTERS (reporterid, reportername)
values (102013, 'David');
insert into REPORTERS (reporterid, reportername)
values (102014, 'Cory');
insert into REPORTERS (reporterid, reportername)
values (102015, 'Cody');
insert into REPORTERS (reporterid, reportername)
values (102016, 'James');
insert into REPORTERS (reporterid, reportername)
values (102017, 'Thomas');
insert into REPORTERS (reporterid, reportername)
values (102018, 'April');
insert into REPORTERS (reporterid, reportername)
values (102019, 'James');
insert into REPORTERS (reporterid, reportername)
values (102020, 'Kyle');
insert into REPORTERS (reporterid, reportername)
values (102021, 'Victoria');
insert into REPORTERS (reporterid, reportername)
values (102022, 'Nancy');
insert into REPORTERS (reporterid, reportername)
values (102023, 'Eric');
insert into REPORTERS (reporterid, reportername)
values (102024, 'Lisa');
insert into REPORTERS (reporterid, reportername)
values (102025, 'Tiffany');
insert into REPORTERS (reporterid, reportername)
values (102026, 'Mike');
insert into REPORTERS (reporterid, reportername)
values (102027, 'Kevin');
insert into REPORTERS (reporterid, reportername)
values (102028, 'Joseph');
insert into REPORTERS (reporterid, reportername)
values (102029, 'Emily');
insert into REPORTERS (reporterid, reportername)
values (102030, 'Frank');
insert into REPORTERS (reporterid, reportername)
values (102031, 'Jeffery');
insert into REPORTERS (reporterid, reportername)
values (102032, 'Virginia');
insert into REPORTERS (reporterid, reportername)
values (102033, 'Lucas');
insert into REPORTERS (reporterid, reportername)
values (102034, 'Jessica');
insert into REPORTERS (reporterid, reportername)
values (102035, 'Chelsea');
insert into REPORTERS (reporterid, reportername)
values (102036, 'Alice');
insert into REPORTERS (reporterid, reportername)
values (102037, 'Christopher');
insert into REPORTERS (reporterid, reportername)
values (102038, 'John');
insert into REPORTERS (reporterid, reportername)
values (102039, 'Benjamin');
insert into REPORTERS (reporterid, reportername)
values (102040, 'Heather');
insert into REPORTERS (reporterid, reportername)
values (102041, 'John');
insert into REPORTERS (reporterid, reportername)
values (102042, 'Heather');
insert into REPORTERS (reporterid, reportername)
values (102043, 'Eric');
insert into REPORTERS (reporterid, reportername)
values (102044, 'Matthew');
insert into REPORTERS (reporterid, reportername)
values (102045, 'Sheryl');
insert into REPORTERS (reporterid, reportername)
values (102046, 'Patricia');
insert into REPORTERS (reporterid, reportername)
values (102047, 'Timothy');
insert into REPORTERS (reporterid, reportername)
values (102048, 'Maria');
insert into REPORTERS (reporterid, reportername)
values (102049, 'Taylor');
insert into REPORTERS (reporterid, reportername)
values (102050, 'Justin');
insert into REPORTERS (reporterid, reportername)
values (102051, 'Christopher');
insert into REPORTERS (reporterid, reportername)
values (102052, 'Connie');
insert into REPORTERS (reporterid, reportername)
values (102053, 'Peggy');
insert into REPORTERS (reporterid, reportername)
values (102054, 'Aaron');
insert into REPORTERS (reporterid, reportername)
values (102055, 'Kenneth');
insert into REPORTERS (reporterid, reportername)
values (102056, 'Scott');
insert into REPORTERS (reporterid, reportername)
values (102057, 'Jason');
insert into REPORTERS (reporterid, reportername)
values (102058, 'Jonathan');
insert into REPORTERS (reporterid, reportername)
values (102059, 'Megan');
insert into REPORTERS (reporterid, reportername)
values (102060, 'Karen');
insert into REPORTERS (reporterid, reportername)
values (102061, 'James');
insert into REPORTERS (reporterid, reportername)
values (102062, 'Rebecca');
insert into REPORTERS (reporterid, reportername)
values (102063, 'Mark');
insert into REPORTERS (reporterid, reportername)
values (102064, 'Connor');
insert into REPORTERS (reporterid, reportername)
values (102065, 'Kenneth');
insert into REPORTERS (reporterid, reportername)
values (102066, 'Theresa');
insert into REPORTERS (reporterid, reportername)
values (102067, 'Luke');
insert into REPORTERS (reporterid, reportername)
values (102068, 'Frank');
insert into REPORTERS (reporterid, reportername)
values (102069, 'Jennifer');
insert into REPORTERS (reporterid, reportername)
values (102070, 'Nicole');
insert into REPORTERS (reporterid, reportername)
values (102071, 'Dominique');
insert into REPORTERS (reporterid, reportername)
values (102072, 'Erica');
insert into REPORTERS (reporterid, reportername)
values (102073, 'Angela');
insert into REPORTERS (reporterid, reportername)
values (102074, 'Brent');
insert into REPORTERS (reporterid, reportername)
values (102075, 'Brandy');
insert into REPORTERS (reporterid, reportername)
values (102076, 'Timothy');
insert into REPORTERS (reporterid, reportername)
values (102077, 'Erika');
insert into REPORTERS (reporterid, reportername)
values (102078, 'Jill');
insert into REPORTERS (reporterid, reportername)
values (102079, 'Nicholas');
insert into REPORTERS (reporterid, reportername)
values (102080, 'Mark');
insert into REPORTERS (reporterid, reportername)
values (102081, 'Tony');
insert into REPORTERS (reporterid, reportername)
values (102082, 'Brenda');
insert into REPORTERS (reporterid, reportername)
values (102083, 'Roger');
insert into REPORTERS (reporterid, reportername)
values (102084, 'Jesse');
insert into REPORTERS (reporterid, reportername)
values (102085, 'Sharon');
insert into REPORTERS (reporterid, reportername)
values (102086, 'Brandon');
insert into REPORTERS (reporterid, reportername)
values (102087, 'Patricia');
insert into REPORTERS (reporterid, reportername)
values (102088, 'Matthew');
insert into REPORTERS (reporterid, reportername)
values (102089, 'Christopher');
insert into REPORTERS (reporterid, reportername)
values (102090, 'John');
insert into REPORTERS (reporterid, reportername)
values (102091, 'Joe');
insert into REPORTERS (reporterid, reportername)
values (102092, 'Paula');
insert into REPORTERS (reporterid, reportername)
values (102093, 'David');
insert into REPORTERS (reporterid, reportername)
values (102094, 'Michael');
insert into REPORTERS (reporterid, reportername)
values (102095, 'Harold');
insert into REPORTERS (reporterid, reportername)
values (102096, 'Gina');
insert into REPORTERS (reporterid, reportername)
values (102097, 'Alyssa');
insert into REPORTERS (reporterid, reportername)
values (102098, 'Bianca');
insert into REPORTERS (reporterid, reportername)
values (102099, 'Daniel');
commit;
prompt 100 records committed...
insert into REPORTERS (reporterid, reportername)
values (102100, 'Michael');
insert into REPORTERS (reporterid, reportername)
values (102101, 'Kyle');
insert into REPORTERS (reporterid, reportername)
values (102102, 'Timothy');
insert into REPORTERS (reporterid, reportername)
values (102103, 'Hannah');
insert into REPORTERS (reporterid, reportername)
values (102104, 'Diane');
insert into REPORTERS (reporterid, reportername)
values (102105, 'Amanda');
insert into REPORTERS (reporterid, reportername)
values (102106, 'Patricia');
insert into REPORTERS (reporterid, reportername)
values (102107, 'Michael');
insert into REPORTERS (reporterid, reportername)
values (102108, 'Seth');
insert into REPORTERS (reporterid, reportername)
values (102109, 'Kathleen');
insert into REPORTERS (reporterid, reportername)
values (102110, 'Roberto');
insert into REPORTERS (reporterid, reportername)
values (102111, 'John');
insert into REPORTERS (reporterid, reportername)
values (102112, 'Brooke');
insert into REPORTERS (reporterid, reportername)
values (102113, 'Alexander');
insert into REPORTERS (reporterid, reportername)
values (102114, 'Shawn');
insert into REPORTERS (reporterid, reportername)
values (102115, 'Meredith');
insert into REPORTERS (reporterid, reportername)
values (102116, 'Joan');
insert into REPORTERS (reporterid, reportername)
values (102117, 'Raymond');
insert into REPORTERS (reporterid, reportername)
values (102118, 'Mark');
insert into REPORTERS (reporterid, reportername)
values (102119, 'Christian');
insert into REPORTERS (reporterid, reportername)
values (102120, 'Dwayne');
insert into REPORTERS (reporterid, reportername)
values (102121, 'Vincent');
insert into REPORTERS (reporterid, reportername)
values (102122, 'Michael');
insert into REPORTERS (reporterid, reportername)
values (102123, 'Joshua');
insert into REPORTERS (reporterid, reportername)
values (102124, 'Matthew');
insert into REPORTERS (reporterid, reportername)
values (102125, 'Joshua');
insert into REPORTERS (reporterid, reportername)
values (102126, 'Benjamin');
insert into REPORTERS (reporterid, reportername)
values (102127, 'Jennifer');
insert into REPORTERS (reporterid, reportername)
values (102128, 'Meagan');
insert into REPORTERS (reporterid, reportername)
values (102129, 'Erin');
insert into REPORTERS (reporterid, reportername)
values (102130, 'Jennifer');
insert into REPORTERS (reporterid, reportername)
values (102131, 'Cheryl');
insert into REPORTERS (reporterid, reportername)
values (102132, 'Rebecca');
insert into REPORTERS (reporterid, reportername)
values (102133, 'Jon');
insert into REPORTERS (reporterid, reportername)
values (102134, 'Jerry');
insert into REPORTERS (reporterid, reportername)
values (102135, 'Heather');
insert into REPORTERS (reporterid, reportername)
values (102136, 'Joshua');
insert into REPORTERS (reporterid, reportername)
values (102137, 'Anthony');
insert into REPORTERS (reporterid, reportername)
values (102138, 'Jessica');
insert into REPORTERS (reporterid, reportername)
values (102139, 'Brian');
insert into REPORTERS (reporterid, reportername)
values (102140, 'April');
insert into REPORTERS (reporterid, reportername)
values (102141, 'Steven');
insert into REPORTERS (reporterid, reportername)
values (102142, 'Gabriel');
insert into REPORTERS (reporterid, reportername)
values (102143, 'Gabriela');
insert into REPORTERS (reporterid, reportername)
values (102144, 'Melissa');
insert into REPORTERS (reporterid, reportername)
values (102145, 'Kimberly');
insert into REPORTERS (reporterid, reportername)
values (102146, 'Dean');
insert into REPORTERS (reporterid, reportername)
values (102147, 'Alexandra');
insert into REPORTERS (reporterid, reportername)
values (102148, 'Jeffrey');
insert into REPORTERS (reporterid, reportername)
values (102149, 'Curtis');
insert into REPORTERS (reporterid, reportername)
values (102150, 'Suzanne');
insert into REPORTERS (reporterid, reportername)
values (102151, 'Ashley');
insert into REPORTERS (reporterid, reportername)
values (102152, 'Jennifer');
insert into REPORTERS (reporterid, reportername)
values (102153, 'Valerie');
insert into REPORTERS (reporterid, reportername)
values (102154, 'Brandy');
insert into REPORTERS (reporterid, reportername)
values (102155, 'Kevin');
insert into REPORTERS (reporterid, reportername)
values (102156, 'John');
insert into REPORTERS (reporterid, reportername)
values (102157, 'Kristin');
insert into REPORTERS (reporterid, reportername)
values (102158, 'Omar');
insert into REPORTERS (reporterid, reportername)
values (102159, 'Peggy');
insert into REPORTERS (reporterid, reportername)
values (102160, 'Gregory');
insert into REPORTERS (reporterid, reportername)
values (102161, 'Patricia');
insert into REPORTERS (reporterid, reportername)
values (102162, 'Edward');
insert into REPORTERS (reporterid, reportername)
values (102163, 'Roger');
insert into REPORTERS (reporterid, reportername)
values (102164, 'Nicole');
insert into REPORTERS (reporterid, reportername)
values (102165, 'Kelsey');
insert into REPORTERS (reporterid, reportername)
values (102166, 'Alexander');
insert into REPORTERS (reporterid, reportername)
values (102167, 'Dawn');
insert into REPORTERS (reporterid, reportername)
values (102168, 'Sarah');
insert into REPORTERS (reporterid, reportername)
values (102169, 'Breanna');
insert into REPORTERS (reporterid, reportername)
values (102170, 'Christopher');
insert into REPORTERS (reporterid, reportername)
values (102171, 'Anne');
insert into REPORTERS (reporterid, reportername)
values (102172, 'Kara');
insert into REPORTERS (reporterid, reportername)
values (102173, 'Nicole');
insert into REPORTERS (reporterid, reportername)
values (102174, 'Melissa');
insert into REPORTERS (reporterid, reportername)
values (102175, 'Heather');
insert into REPORTERS (reporterid, reportername)
values (102176, 'Audrey');
insert into REPORTERS (reporterid, reportername)
values (102177, 'Jason');
insert into REPORTERS (reporterid, reportername)
values (102178, 'Donna');
insert into REPORTERS (reporterid, reportername)
values (102179, 'Shawn');
insert into REPORTERS (reporterid, reportername)
values (102180, 'Robin');
insert into REPORTERS (reporterid, reportername)
values (102181, 'Lisa');
insert into REPORTERS (reporterid, reportername)
values (102182, 'Jordan');
insert into REPORTERS (reporterid, reportername)
values (102183, 'Don');
insert into REPORTERS (reporterid, reportername)
values (102184, 'Tina');
insert into REPORTERS (reporterid, reportername)
values (102185, 'Jeffrey');
insert into REPORTERS (reporterid, reportername)
values (102186, 'Donald');
insert into REPORTERS (reporterid, reportername)
values (102187, 'Joseph');
insert into REPORTERS (reporterid, reportername)
values (102188, 'Natalie');
insert into REPORTERS (reporterid, reportername)
values (102189, 'Stephanie');
insert into REPORTERS (reporterid, reportername)
values (102190, 'James');
insert into REPORTERS (reporterid, reportername)
values (102191, 'Christopher');
insert into REPORTERS (reporterid, reportername)
values (102192, 'Jeffrey');
insert into REPORTERS (reporterid, reportername)
values (102193, 'Gabriela');
insert into REPORTERS (reporterid, reportername)
values (102194, 'Ashley');
insert into REPORTERS (reporterid, reportername)
values (102195, 'David');
insert into REPORTERS (reporterid, reportername)
values (102196, 'Melissa');
insert into REPORTERS (reporterid, reportername)
values (102197, 'Kelsey');
insert into REPORTERS (reporterid, reportername)
values (102198, 'Nathan');
insert into REPORTERS (reporterid, reportername)
values (102199, 'Jennifer');
commit;
prompt 200 records committed...
insert into REPORTERS (reporterid, reportername)
values (102200, 'Antonio');
insert into REPORTERS (reporterid, reportername)
values (102201, 'Mindy');
insert into REPORTERS (reporterid, reportername)
values (102202, 'Joseph');
insert into REPORTERS (reporterid, reportername)
values (102203, 'Tony');
insert into REPORTERS (reporterid, reportername)
values (102204, 'Shannon');
insert into REPORTERS (reporterid, reportername)
values (102205, 'Ashley');
insert into REPORTERS (reporterid, reportername)
values (102206, 'Stacy');
insert into REPORTERS (reporterid, reportername)
values (102207, 'Sean');
insert into REPORTERS (reporterid, reportername)
values (102208, 'Maria');
insert into REPORTERS (reporterid, reportername)
values (102209, 'Daniel');
insert into REPORTERS (reporterid, reportername)
values (102210, 'Rachel');
insert into REPORTERS (reporterid, reportername)
values (102211, 'Tammy');
insert into REPORTERS (reporterid, reportername)
values (102212, 'Brandon');
insert into REPORTERS (reporterid, reportername)
values (102213, 'Jason');
insert into REPORTERS (reporterid, reportername)
values (102214, 'Jorge');
insert into REPORTERS (reporterid, reportername)
values (102215, 'Mary');
insert into REPORTERS (reporterid, reportername)
values (102216, 'Jennifer');
insert into REPORTERS (reporterid, reportername)
values (102217, 'Eric');
insert into REPORTERS (reporterid, reportername)
values (102218, 'Kenneth');
insert into REPORTERS (reporterid, reportername)
values (102219, 'Amanda');
insert into REPORTERS (reporterid, reportername)
values (102220, 'Elizabeth');
insert into REPORTERS (reporterid, reportername)
values (102221, 'Jennifer');
insert into REPORTERS (reporterid, reportername)
values (102222, 'Claire');
insert into REPORTERS (reporterid, reportername)
values (102223, 'Charles');
insert into REPORTERS (reporterid, reportername)
values (102224, 'Ryan');
insert into REPORTERS (reporterid, reportername)
values (102225, 'Brian');
insert into REPORTERS (reporterid, reportername)
values (102226, 'Shannon');
insert into REPORTERS (reporterid, reportername)
values (102227, 'Zachary');
insert into REPORTERS (reporterid, reportername)
values (102228, 'Tammy');
insert into REPORTERS (reporterid, reportername)
values (102229, 'Vicki');
insert into REPORTERS (reporterid, reportername)
values (102230, 'Karen');
insert into REPORTERS (reporterid, reportername)
values (102231, 'Joseph');
insert into REPORTERS (reporterid, reportername)
values (102232, 'Andrew');
insert into REPORTERS (reporterid, reportername)
values (102233, 'Jennifer');
insert into REPORTERS (reporterid, reportername)
values (102234, 'Dennis');
insert into REPORTERS (reporterid, reportername)
values (102235, 'Elizabeth');
insert into REPORTERS (reporterid, reportername)
values (102236, 'Charles');
insert into REPORTERS (reporterid, reportername)
values (102237, 'Raven');
insert into REPORTERS (reporterid, reportername)
values (102238, 'Eric');
insert into REPORTERS (reporterid, reportername)
values (102239, 'Kaitlyn');
insert into REPORTERS (reporterid, reportername)
values (102240, 'Sarah');
insert into REPORTERS (reporterid, reportername)
values (102241, 'Roy');
insert into REPORTERS (reporterid, reportername)
values (102242, 'John');
insert into REPORTERS (reporterid, reportername)
values (102243, 'Kayla');
insert into REPORTERS (reporterid, reportername)
values (102244, 'Mary');
insert into REPORTERS (reporterid, reportername)
values (102245, 'Jason');
insert into REPORTERS (reporterid, reportername)
values (102246, 'Dennis');
insert into REPORTERS (reporterid, reportername)
values (102247, 'Jennifer');
insert into REPORTERS (reporterid, reportername)
values (102248, 'Stacey');
insert into REPORTERS (reporterid, reportername)
values (102249, 'Joseph');
insert into REPORTERS (reporterid, reportername)
values (102250, 'Amber');
insert into REPORTERS (reporterid, reportername)
values (102251, 'Charles');
insert into REPORTERS (reporterid, reportername)
values (102252, 'Brandon');
insert into REPORTERS (reporterid, reportername)
values (102253, 'Brittany');
insert into REPORTERS (reporterid, reportername)
values (102254, 'Monique');
insert into REPORTERS (reporterid, reportername)
values (102255, 'Jeffrey');
insert into REPORTERS (reporterid, reportername)
values (102256, 'Matthew');
insert into REPORTERS (reporterid, reportername)
values (102257, 'Richard');
insert into REPORTERS (reporterid, reportername)
values (102258, 'Shawn');
insert into REPORTERS (reporterid, reportername)
values (102259, 'Christopher');
insert into REPORTERS (reporterid, reportername)
values (102260, 'Thomas');
insert into REPORTERS (reporterid, reportername)
values (102261, 'Chad');
insert into REPORTERS (reporterid, reportername)
values (102262, 'Lance');
insert into REPORTERS (reporterid, reportername)
values (102263, 'Ricky');
insert into REPORTERS (reporterid, reportername)
values (102264, 'Kenneth');
insert into REPORTERS (reporterid, reportername)
values (102265, 'Craig');
insert into REPORTERS (reporterid, reportername)
values (102266, 'Melanie');
insert into REPORTERS (reporterid, reportername)
values (102267, 'Nathan');
insert into REPORTERS (reporterid, reportername)
values (102268, 'Joseph');
insert into REPORTERS (reporterid, reportername)
values (102269, 'Kimberly');
insert into REPORTERS (reporterid, reportername)
values (102270, 'Richard');
insert into REPORTERS (reporterid, reportername)
values (102271, 'Katherine');
insert into REPORTERS (reporterid, reportername)
values (102272, 'Krista');
insert into REPORTERS (reporterid, reportername)
values (102273, 'Jacob');
insert into REPORTERS (reporterid, reportername)
values (102274, 'Stephen');
insert into REPORTERS (reporterid, reportername)
values (102275, 'Anna');
insert into REPORTERS (reporterid, reportername)
values (102276, 'Anthony');
insert into REPORTERS (reporterid, reportername)
values (102277, 'Zachary');
insert into REPORTERS (reporterid, reportername)
values (102278, 'Alejandro');
insert into REPORTERS (reporterid, reportername)
values (102279, 'Jane');
insert into REPORTERS (reporterid, reportername)
values (102280, 'Michael');
insert into REPORTERS (reporterid, reportername)
values (102281, 'David');
insert into REPORTERS (reporterid, reportername)
values (102282, 'Patrick');
insert into REPORTERS (reporterid, reportername)
values (102283, 'Brittany');
insert into REPORTERS (reporterid, reportername)
values (102284, 'Isabella');
insert into REPORTERS (reporterid, reportername)
values (102285, 'Sheri');
insert into REPORTERS (reporterid, reportername)
values (102286, 'Christopher');
insert into REPORTERS (reporterid, reportername)
values (102287, 'Thomas');
insert into REPORTERS (reporterid, reportername)
values (102288, 'Cassandra');
insert into REPORTERS (reporterid, reportername)
values (102289, 'Stephanie');
insert into REPORTERS (reporterid, reportername)
values (102290, 'Yolanda');
insert into REPORTERS (reporterid, reportername)
values (102291, 'Isaac');
insert into REPORTERS (reporterid, reportername)
values (102292, 'Barbara');
insert into REPORTERS (reporterid, reportername)
values (102293, 'Miguel');
insert into REPORTERS (reporterid, reportername)
values (102294, 'Mckenzie');
insert into REPORTERS (reporterid, reportername)
values (102295, 'Jennifer');
insert into REPORTERS (reporterid, reportername)
values (102296, 'Ray');
insert into REPORTERS (reporterid, reportername)
values (102297, 'Whitney');
insert into REPORTERS (reporterid, reportername)
values (102298, 'Samantha');
insert into REPORTERS (reporterid, reportername)
values (102299, 'Teresa');
commit;
prompt 300 records committed...
insert into REPORTERS (reporterid, reportername)
values (102300, 'Danielle');
insert into REPORTERS (reporterid, reportername)
values (102301, 'Kelly');
insert into REPORTERS (reporterid, reportername)
values (102302, 'Amber');
insert into REPORTERS (reporterid, reportername)
values (102303, 'Jeffrey');
insert into REPORTERS (reporterid, reportername)
values (102304, 'Gregory');
insert into REPORTERS (reporterid, reportername)
values (102305, 'Jason');
insert into REPORTERS (reporterid, reportername)
values (102306, 'Jeffrey');
insert into REPORTERS (reporterid, reportername)
values (102307, 'Courtney');
insert into REPORTERS (reporterid, reportername)
values (102308, 'Brittany');
insert into REPORTERS (reporterid, reportername)
values (102309, 'Kevin');
insert into REPORTERS (reporterid, reportername)
values (102310, 'Deborah');
insert into REPORTERS (reporterid, reportername)
values (102311, 'Brandon');
insert into REPORTERS (reporterid, reportername)
values (102312, 'Nathan');
insert into REPORTERS (reporterid, reportername)
values (102313, 'Miranda');
insert into REPORTERS (reporterid, reportername)
values (102314, 'Robert');
insert into REPORTERS (reporterid, reportername)
values (102315, 'Colton');
insert into REPORTERS (reporterid, reportername)
values (102316, 'Stephen');
insert into REPORTERS (reporterid, reportername)
values (102317, 'John');
insert into REPORTERS (reporterid, reportername)
values (102318, 'Erica');
insert into REPORTERS (reporterid, reportername)
values (102319, 'Fred');
insert into REPORTERS (reporterid, reportername)
values (102320, 'Holly');
insert into REPORTERS (reporterid, reportername)
values (102321, 'William');
insert into REPORTERS (reporterid, reportername)
values (102322, 'Christine');
insert into REPORTERS (reporterid, reportername)
values (102323, 'David');
insert into REPORTERS (reporterid, reportername)
values (102324, 'Colin');
insert into REPORTERS (reporterid, reportername)
values (102325, 'Janet');
insert into REPORTERS (reporterid, reportername)
values (102326, 'Joshua');
insert into REPORTERS (reporterid, reportername)
values (102327, 'Scott');
insert into REPORTERS (reporterid, reportername)
values (102328, 'Stephen');
insert into REPORTERS (reporterid, reportername)
values (102329, 'Matthew');
insert into REPORTERS (reporterid, reportername)
values (102330, 'Michael');
insert into REPORTERS (reporterid, reportername)
values (102331, 'Bernard');
insert into REPORTERS (reporterid, reportername)
values (102332, 'Diane');
insert into REPORTERS (reporterid, reportername)
values (102333, 'Daniel');
insert into REPORTERS (reporterid, reportername)
values (102334, 'Valerie');
insert into REPORTERS (reporterid, reportername)
values (102335, 'Tony');
insert into REPORTERS (reporterid, reportername)
values (102336, 'Michael');
insert into REPORTERS (reporterid, reportername)
values (102337, 'Emily');
insert into REPORTERS (reporterid, reportername)
values (102338, 'Gina');
insert into REPORTERS (reporterid, reportername)
values (102339, 'Cameron');
insert into REPORTERS (reporterid, reportername)
values (102340, 'Rodney');
insert into REPORTERS (reporterid, reportername)
values (102341, 'Ronald');
insert into REPORTERS (reporterid, reportername)
values (102342, 'Amanda');
insert into REPORTERS (reporterid, reportername)
values (102343, 'Laura');
insert into REPORTERS (reporterid, reportername)
values (102344, 'Susan');
insert into REPORTERS (reporterid, reportername)
values (102345, 'George');
insert into REPORTERS (reporterid, reportername)
values (102346, 'Jennifer');
insert into REPORTERS (reporterid, reportername)
values (102347, 'Jason');
insert into REPORTERS (reporterid, reportername)
values (102348, 'Dakota');
insert into REPORTERS (reporterid, reportername)
values (102349, 'Joy');
insert into REPORTERS (reporterid, reportername)
values (102350, 'Tammy');
insert into REPORTERS (reporterid, reportername)
values (102351, 'Brandy');
insert into REPORTERS (reporterid, reportername)
values (102352, 'Jesus');
insert into REPORTERS (reporterid, reportername)
values (102353, 'Sherry');
insert into REPORTERS (reporterid, reportername)
values (102354, 'Johnathan');
insert into REPORTERS (reporterid, reportername)
values (102355, 'Miranda');
insert into REPORTERS (reporterid, reportername)
values (102356, 'Courtney');
insert into REPORTERS (reporterid, reportername)
values (102357, 'Wendy');
insert into REPORTERS (reporterid, reportername)
values (102358, 'Heidi');
insert into REPORTERS (reporterid, reportername)
values (102359, 'Erica');
insert into REPORTERS (reporterid, reportername)
values (102360, 'Susan');
insert into REPORTERS (reporterid, reportername)
values (102361, 'Rebecca');
insert into REPORTERS (reporterid, reportername)
values (102362, 'Erika');
insert into REPORTERS (reporterid, reportername)
values (102363, 'Maria');
insert into REPORTERS (reporterid, reportername)
values (102364, 'Ashley');
insert into REPORTERS (reporterid, reportername)
values (102365, 'Debra');
insert into REPORTERS (reporterid, reportername)
values (102366, 'Matthew');
insert into REPORTERS (reporterid, reportername)
values (102367, 'Steven');
insert into REPORTERS (reporterid, reportername)
values (102368, 'Jonathan');
insert into REPORTERS (reporterid, reportername)
values (102369, 'Jamie');
insert into REPORTERS (reporterid, reportername)
values (102370, 'John');
insert into REPORTERS (reporterid, reportername)
values (102371, 'Laura');
insert into REPORTERS (reporterid, reportername)
values (102372, 'Joshua');
insert into REPORTERS (reporterid, reportername)
values (102373, 'Todd');
insert into REPORTERS (reporterid, reportername)
values (102374, 'Ronald');
insert into REPORTERS (reporterid, reportername)
values (102375, 'Stephanie');
insert into REPORTERS (reporterid, reportername)
values (102376, 'Erin');
insert into REPORTERS (reporterid, reportername)
values (102377, 'James');
insert into REPORTERS (reporterid, reportername)
values (102378, 'Kevin');
insert into REPORTERS (reporterid, reportername)
values (102379, 'Brandon');
insert into REPORTERS (reporterid, reportername)
values (102380, 'Nathaniel');
insert into REPORTERS (reporterid, reportername)
values (102381, 'Angela');
insert into REPORTERS (reporterid, reportername)
values (102382, 'Nicole');
insert into REPORTERS (reporterid, reportername)
values (102383, 'Daniel');
insert into REPORTERS (reporterid, reportername)
values (102384, 'Brandon');
insert into REPORTERS (reporterid, reportername)
values (102385, 'Steven');
insert into REPORTERS (reporterid, reportername)
values (102386, 'Todd');
insert into REPORTERS (reporterid, reportername)
values (102387, 'Kevin');
insert into REPORTERS (reporterid, reportername)
values (102388, 'John');
insert into REPORTERS (reporterid, reportername)
values (102389, 'Aaron');
insert into REPORTERS (reporterid, reportername)
values (102390, 'Mark');
insert into REPORTERS (reporterid, reportername)
values (102391, 'Brian');
insert into REPORTERS (reporterid, reportername)
values (102392, 'Mark');
insert into REPORTERS (reporterid, reportername)
values (102393, 'Joseph');
insert into REPORTERS (reporterid, reportername)
values (102394, 'Yolanda');
insert into REPORTERS (reporterid, reportername)
values (102395, 'Danielle');
insert into REPORTERS (reporterid, reportername)
values (102396, 'Connor');
insert into REPORTERS (reporterid, reportername)
values (102397, 'Cassandra');
insert into REPORTERS (reporterid, reportername)
values (102398, 'Julie');
insert into REPORTERS (reporterid, reportername)
values (102399, 'Kelly');
commit;
prompt 400 records committed...
insert into REPORTERS (reporterid, reportername)
values (102718, 'Michael');
commit;
prompt 401 records loaded
prompt Loading BRANCHE...
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103000, 'tel aviv', 102000, to_date('29-05-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103001, 'jerusalem', 102001, to_date('26-09-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103002, 'new york', 102002, to_date('13-04-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103003, 'chicago', 102003, to_date('14-08-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103004, 'berlin', 102004, to_date('07-10-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103005, 'paris', 102005, to_date('16-03-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103006, 'denver', 102006, to_date('10-12-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103007, 'madrid', 102007, to_date('16-06-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103008, 'tel aviv', 102008, to_date('15-09-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103009, 'jerusalem', 102009, to_date('30-01-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103010, 'new york', 102010, to_date('15-01-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103011, 'chicago', 102011, to_date('02-06-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103012, 'berlin', 102012, to_date('11-03-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103013, 'paris', 102013, to_date('05-03-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103014, 'denver', 102014, to_date('12-08-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103015, 'madrid', 102015, to_date('18-09-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103016, 'tel aviv', 102016, to_date('16-12-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103017, 'jerusalem', 102017, to_date('04-05-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103018, 'new york', 102018, to_date('11-10-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103019, 'chicago', 102019, to_date('21-03-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103020, 'berlin', 102020, to_date('23-07-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103021, 'paris', 102021, to_date('30-11-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103022, 'denver', 102022, to_date('16-10-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103023, 'madrid', 102023, to_date('09-10-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103024, 'tel aviv', 102024, to_date('05-05-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103025, 'jerusalem', 102025, to_date('25-02-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103026, 'new york', 102026, to_date('24-09-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103027, 'chicago', 102027, to_date('07-09-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103028, 'berlin', 102028, to_date('06-03-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103029, 'paris', 102029, to_date('21-10-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103030, 'denver', 102030, to_date('26-11-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103031, 'madrid', 102031, to_date('03-06-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103032, 'tel aviv', 102032, to_date('17-10-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103033, 'jerusalem', 102033, to_date('18-02-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103034, 'new york', 102034, to_date('14-03-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103035, 'chicago', 102035, to_date('23-09-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103036, 'berlin', 102036, to_date('31-12-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103037, 'paris', 102037, to_date('15-12-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103038, 'denver', 102038, to_date('30-01-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103039, 'madrid', 102039, to_date('17-11-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103040, 'tel aviv', 102040, to_date('05-07-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103041, 'jerusalem', 102041, to_date('03-06-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103042, 'new york', 102042, to_date('03-04-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103043, 'chicago', 102043, to_date('18-09-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103044, 'berlin', 102044, to_date('02-08-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103045, 'paris', 102045, to_date('16-06-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103046, 'denver', 102046, to_date('15-03-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103047, 'madrid', 102047, to_date('04-05-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103048, 'tel aviv', 102048, to_date('04-10-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103049, 'jerusalem', 102049, to_date('20-03-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103050, 'new york', 102050, to_date('18-02-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103051, 'chicago', 102051, to_date('10-11-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103052, 'berlin', 102052, to_date('15-02-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103053, 'paris', 102053, to_date('15-11-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103054, 'denver', 102054, to_date('30-01-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103055, 'madrid', 102055, to_date('25-08-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103056, 'tel aviv', 102056, to_date('16-05-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103057, 'jerusalem', 102057, to_date('04-10-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103058, 'new york', 102058, to_date('20-11-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103059, 'chicago', 102059, to_date('29-11-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103060, 'berlin', 102060, to_date('20-02-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103061, 'paris', 102061, to_date('13-02-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103062, 'denver', 102062, to_date('23-08-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103063, 'madrid', 102063, to_date('23-11-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103064, 'tel aviv', 102064, to_date('13-01-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103065, 'jerusalem', 102065, to_date('02-08-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103066, 'new york', 102066, to_date('16-06-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103067, 'chicago', 102067, to_date('25-10-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103068, 'berlin', 102068, to_date('13-12-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103069, 'paris', 102069, to_date('09-05-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103070, 'denver', 102070, to_date('09-04-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103071, 'madrid', 102071, to_date('31-08-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103072, 'tel aviv', 102072, to_date('06-06-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103073, 'jerusalem', 102073, to_date('05-07-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103074, 'new york', 102074, to_date('28-04-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103075, 'chicago', 102075, to_date('26-05-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103076, 'berlin', 102076, to_date('10-01-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103077, 'paris', 102077, to_date('31-08-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103078, 'denver', 102078, to_date('08-07-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103079, 'madrid', 102079, to_date('14-05-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103080, 'tel aviv', 102080, to_date('03-08-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103081, 'jerusalem', 102081, to_date('08-10-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103082, 'new york', 102082, to_date('25-10-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103083, 'chicago', 102083, to_date('26-10-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103084, 'berlin', 102084, to_date('20-09-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103085, 'paris', 102085, to_date('01-02-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103086, 'denver', 102086, to_date('14-11-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103087, 'madrid', 102087, to_date('14-08-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103088, 'tel aviv', 102088, to_date('08-07-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103089, 'jerusalem', 102089, to_date('15-03-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103090, 'new york', 102090, to_date('28-11-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103091, 'chicago', 102091, to_date('18-11-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103092, 'berlin', 102092, to_date('10-06-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103093, 'paris', 102093, to_date('20-09-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103094, 'denver', 102094, to_date('01-11-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103095, 'madrid', 102095, to_date('11-08-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103096, 'tel aviv', 102096, to_date('22-05-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103097, 'jerusalem', 102097, to_date('09-05-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103098, 'new york', 102098, to_date('20-11-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103099, 'chicago', 102099, to_date('17-11-1999', 'dd-mm-yyyy'));
commit;
prompt 100 records committed...
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103100, 'berlin', 102100, to_date('07-06-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103101, 'paris', 102101, to_date('13-08-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103102, 'denver', 102102, to_date('14-10-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103103, 'madrid', 102103, to_date('11-09-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103104, 'tel aviv', 102104, to_date('14-01-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103105, 'jerusalem', 102105, to_date('30-03-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103106, 'new york', 102106, to_date('24-10-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103107, 'chicago', 102107, to_date('24-03-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103108, 'berlin', 102108, to_date('06-03-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103109, 'paris', 102109, to_date('30-04-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103110, 'denver', 102110, to_date('16-11-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103111, 'madrid', 102111, to_date('06-02-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103112, 'tel aviv', 102112, to_date('07-10-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103113, 'jerusalem', 102113, to_date('02-05-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103114, 'new york', 102114, to_date('16-01-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103115, 'chicago', 102115, to_date('30-11-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103116, 'berlin', 102116, to_date('11-12-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103117, 'paris', 102117, to_date('01-09-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103118, 'denver', 102118, to_date('29-04-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103119, 'madrid', 102119, to_date('22-05-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103120, 'tel aviv', 102120, to_date('22-09-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103121, 'jerusalem', 102121, to_date('05-05-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103122, 'new york', 102122, to_date('13-01-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103123, 'chicago', 102123, to_date('28-05-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103124, 'berlin', 102124, to_date('04-06-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103125, 'paris', 102125, to_date('03-08-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103126, 'denver', 102126, to_date('27-11-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103127, 'madrid', 102127, to_date('17-09-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103128, 'tel aviv', 102128, to_date('15-04-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103129, 'jerusalem', 102129, to_date('04-01-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103130, 'new york', 102130, to_date('20-07-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103131, 'chicago', 102131, to_date('13-06-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103132, 'berlin', 102132, to_date('26-06-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103133, 'paris', 102133, to_date('25-03-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103134, 'denver', 102134, to_date('14-05-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103135, 'madrid', 102135, to_date('18-07-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103136, 'tel aviv', 102136, to_date('08-01-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103137, 'jerusalem', 102137, to_date('16-05-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103138, 'new york', 102138, to_date('30-01-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103139, 'chicago', 102139, to_date('13-06-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103140, 'berlin', 102140, to_date('11-12-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103141, 'paris', 102141, to_date('24-03-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103142, 'denver', 102142, to_date('05-09-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103143, 'madrid', 102143, to_date('13-09-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103144, 'tel aviv', 102144, to_date('12-05-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103145, 'jerusalem', 102145, to_date('01-10-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103146, 'new york', 102146, to_date('05-08-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103147, 'chicago', 102147, to_date('20-10-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103148, 'berlin', 102148, to_date('09-09-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103149, 'paris', 102149, to_date('02-11-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103150, 'denver', 102150, to_date('01-09-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103151, 'madrid', 102151, to_date('04-06-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103152, 'tel aviv', 102152, to_date('13-07-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103153, 'jerusalem', 102153, to_date('27-05-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103154, 'new york', 102154, to_date('24-06-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103155, 'chicago', 102155, to_date('07-09-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103156, 'berlin', 102156, to_date('09-11-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103157, 'paris', 102157, to_date('09-04-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103158, 'denver', 102158, to_date('10-11-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103159, 'madrid', 102159, to_date('08-02-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103160, 'tel aviv', 102160, to_date('08-10-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103161, 'jerusalem', 102161, to_date('21-05-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103162, 'new york', 102162, to_date('05-06-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103163, 'chicago', 102163, to_date('31-12-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103164, 'berlin', 102164, to_date('21-04-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103165, 'paris', 102165, to_date('09-08-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103166, 'denver', 102166, to_date('15-05-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103167, 'madrid', 102167, to_date('26-09-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103168, 'tel aviv', 102168, to_date('23-02-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103169, 'jerusalem', 102169, to_date('03-12-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103170, 'new york', 102170, to_date('27-05-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103171, 'chicago', 102171, to_date('14-08-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103172, 'berlin', 102172, to_date('11-09-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103173, 'paris', 102173, to_date('06-04-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103174, 'denver', 102174, to_date('27-08-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103175, 'madrid', 102175, to_date('20-02-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103176, 'tel aviv', 102176, to_date('28-10-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103177, 'jerusalem', 102177, to_date('26-05-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103178, 'new york', 102178, to_date('22-11-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103179, 'chicago', 102179, to_date('04-05-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103180, 'berlin', 102180, to_date('12-03-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103181, 'paris', 102181, to_date('05-05-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103182, 'denver', 102182, to_date('11-11-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103183, 'madrid', 102183, to_date('04-07-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103184, 'tel aviv', 102184, to_date('01-01-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103185, 'jerusalem', 102185, to_date('04-10-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103186, 'new york', 102186, to_date('09-06-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103187, 'chicago', 102187, to_date('02-08-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103188, 'berlin', 102188, to_date('18-05-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103189, 'paris', 102189, to_date('03-05-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103190, 'denver', 102190, to_date('13-04-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103191, 'madrid', 102191, to_date('20-06-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103192, 'tel aviv', 102192, to_date('22-08-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103193, 'jerusalem', 102193, to_date('27-05-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103194, 'new york', 102194, to_date('05-12-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103195, 'chicago', 102195, to_date('08-05-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103196, 'berlin', 102196, to_date('15-10-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103197, 'paris', 102197, to_date('12-09-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103198, 'denver', 102198, to_date('12-03-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103199, 'madrid', 102199, to_date('26-02-2001', 'dd-mm-yyyy'));
commit;
prompt 200 records committed...
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103200, 'tel aviv', 102200, to_date('25-08-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103201, 'jerusalem', 102201, to_date('14-12-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103202, 'new york', 102202, to_date('16-09-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103203, 'chicago', 102203, to_date('05-12-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103204, 'berlin', 102204, to_date('01-01-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103205, 'paris', 102205, to_date('20-03-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103206, 'denver', 102206, to_date('14-06-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103207, 'madrid', 102207, to_date('29-08-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103208, 'tel aviv', 102208, to_date('08-12-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103209, 'jerusalem', 102209, to_date('22-04-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103210, 'new york', 102210, to_date('27-04-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103211, 'chicago', 102211, to_date('17-10-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103212, 'berlin', 102212, to_date('18-03-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103213, 'paris', 102213, to_date('23-06-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103214, 'denver', 102214, to_date('21-06-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103215, 'madrid', 102215, to_date('15-03-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103216, 'tel aviv', 102216, to_date('25-07-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103217, 'jerusalem', 102217, to_date('24-11-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103218, 'new york', 102218, to_date('27-05-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103219, 'chicago', 102219, to_date('21-02-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103220, 'berlin', 102220, to_date('08-07-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103221, 'paris', 102221, to_date('06-08-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103222, 'denver', 102222, to_date('11-04-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103223, 'madrid', 102223, to_date('24-12-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103224, 'tel aviv', 102224, to_date('04-11-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103225, 'jerusalem', 102225, to_date('29-06-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103226, 'new york', 102226, to_date('10-10-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103227, 'chicago', 102227, to_date('18-04-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103228, 'berlin', 102228, to_date('03-07-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103229, 'paris', 102229, to_date('29-03-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103230, 'denver', 102230, to_date('14-08-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103231, 'madrid', 102231, to_date('01-05-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103232, 'tel aviv', 102232, to_date('13-12-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103233, 'jerusalem', 102233, to_date('04-08-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103234, 'new york', 102234, to_date('09-06-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103235, 'chicago', 102235, to_date('21-06-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103236, 'berlin', 102236, to_date('15-08-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103237, 'paris', 102237, to_date('16-03-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103238, 'denver', 102238, to_date('27-03-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103239, 'madrid', 102239, to_date('19-11-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103240, 'tel aviv', 102240, to_date('18-03-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103241, 'jerusalem', 102241, to_date('14-09-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103242, 'new york', 102242, to_date('17-12-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103243, 'chicago', 102243, to_date('05-06-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103244, 'berlin', 102244, to_date('19-11-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103245, 'paris', 102245, to_date('25-06-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103246, 'denver', 102246, to_date('12-04-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103247, 'madrid', 102247, to_date('27-10-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103248, 'tel aviv', 102248, to_date('16-01-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103249, 'jerusalem', 102249, to_date('06-11-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103250, 'new york', 102250, to_date('08-09-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103251, 'chicago', 102251, to_date('02-08-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103252, 'berlin', 102252, to_date('13-11-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103253, 'paris', 102253, to_date('27-02-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103254, 'denver', 102254, to_date('09-02-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103255, 'madrid', 102255, to_date('01-12-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103256, 'tel aviv', 102256, to_date('24-02-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103257, 'jerusalem', 102257, to_date('11-02-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103258, 'new york', 102258, to_date('08-09-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103259, 'chicago', 102259, to_date('07-06-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103260, 'berlin', 102260, to_date('24-09-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103261, 'paris', 102261, to_date('18-01-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103262, 'denver', 102262, to_date('02-10-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103263, 'madrid', 102263, to_date('26-11-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103264, 'tel aviv', 102264, to_date('12-08-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103265, 'jerusalem', 102265, to_date('13-07-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103266, 'new york', 102266, to_date('28-08-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103267, 'chicago', 102267, to_date('06-04-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103268, 'berlin', 102268, to_date('11-03-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103269, 'paris', 102269, to_date('21-09-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103270, 'denver', 102270, to_date('11-12-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103271, 'madrid', 102271, to_date('10-04-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103272, 'tel aviv', 102272, to_date('27-09-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103273, 'jerusalem', 102273, to_date('23-04-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103274, 'new york', 102274, to_date('23-06-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103275, 'chicago', 102275, to_date('25-06-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103276, 'berlin', 102276, to_date('17-01-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103277, 'paris', 102277, to_date('25-08-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103278, 'denver', 102278, to_date('16-05-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103279, 'madrid', 102279, to_date('26-10-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103280, 'tel aviv', 102280, to_date('05-07-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103281, 'jerusalem', 102281, to_date('03-12-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103282, 'new york', 102282, to_date('28-03-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103283, 'chicago', 102283, to_date('25-06-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103284, 'berlin', 102284, to_date('02-03-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103285, 'paris', 102285, to_date('09-08-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103286, 'denver', 102286, to_date('07-02-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103287, 'madrid', 102287, to_date('29-12-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103288, 'tel aviv', 102288, to_date('13-10-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103289, 'jerusalem', 102289, to_date('03-05-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103290, 'new york', 102290, to_date('13-09-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103291, 'chicago', 102291, to_date('27-03-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103292, 'berlin', 102292, to_date('16-08-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103293, 'paris', 102293, to_date('29-09-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103294, 'denver', 102294, to_date('24-01-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103295, 'madrid', 102295, to_date('04-07-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103296, 'tel aviv', 102296, to_date('24-09-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103297, 'jerusalem', 102297, to_date('22-04-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103298, 'new york', 102298, to_date('06-05-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103299, 'chicago', 102299, to_date('31-03-2004', 'dd-mm-yyyy'));
commit;
prompt 300 records committed...
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103300, 'berlin', 102300, to_date('05-08-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103301, 'paris', 102301, to_date('30-07-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103302, 'denver', 102302, to_date('19-01-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103303, 'madrid', 102303, to_date('01-12-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103304, 'tel aviv', 102304, to_date('28-08-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103305, 'jerusalem', 102305, to_date('02-01-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103306, 'new york', 102306, to_date('28-02-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103307, 'chicago', 102307, to_date('01-08-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103308, 'berlin', 102308, to_date('05-10-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103309, 'paris', 102309, to_date('22-09-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103310, 'denver', 102310, to_date('17-10-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103311, 'madrid', 102311, to_date('27-05-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103312, 'tel aviv', 102312, to_date('03-11-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103313, 'jerusalem', 102313, to_date('10-08-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103314, 'new york', 102314, to_date('19-09-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103315, 'chicago', 102315, to_date('15-12-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103316, 'berlin', 102316, to_date('28-06-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103317, 'paris', 102317, to_date('03-02-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103318, 'denver', 102318, to_date('26-04-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103319, 'madrid', 102319, to_date('23-07-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103320, 'tel aviv', 102320, to_date('24-09-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103321, 'jerusalem', 102321, to_date('01-09-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103322, 'new york', 102322, to_date('03-02-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103323, 'chicago', 102323, to_date('15-01-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103324, 'berlin', 102324, to_date('23-10-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103325, 'paris', 102325, to_date('17-10-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103326, 'denver', 102326, to_date('18-11-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103327, 'madrid', 102327, to_date('03-07-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103328, 'tel aviv', 102328, to_date('13-10-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103329, 'jerusalem', 102329, to_date('15-01-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103330, 'new york', 102330, to_date('11-06-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103331, 'chicago', 102331, to_date('19-03-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103332, 'berlin', 102332, to_date('08-02-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103333, 'paris', 102333, to_date('22-07-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103334, 'denver', 102334, to_date('21-11-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103335, 'madrid', 102335, to_date('09-07-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103336, 'tel aviv', 102336, to_date('06-11-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103337, 'jerusalem', 102337, to_date('06-06-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103338, 'new york', 102338, to_date('30-08-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103339, 'chicago', 102339, to_date('20-12-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103340, 'berlin', 102340, to_date('12-09-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103341, 'paris', 102341, to_date('23-06-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103342, 'denver', 102342, to_date('07-03-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103343, 'madrid', 102343, to_date('16-11-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103344, 'tel aviv', 102344, to_date('11-01-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103345, 'jerusalem', 102345, to_date('17-03-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103346, 'new york', 102346, to_date('03-10-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103347, 'chicago', 102347, to_date('30-07-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103348, 'berlin', 102348, to_date('27-11-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103349, 'paris', 102349, to_date('29-12-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103350, 'denver', 102350, to_date('14-03-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103351, 'madrid', 102351, to_date('26-11-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103352, 'tel aviv', 102352, to_date('29-12-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103353, 'jerusalem', 102353, to_date('30-03-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103354, 'new york', 102354, to_date('11-03-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103355, 'chicago', 102355, to_date('29-02-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103356, 'berlin', 102356, to_date('02-12-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103357, 'paris', 102357, to_date('20-04-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103358, 'denver', 102358, to_date('29-07-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103359, 'madrid', 102359, to_date('18-09-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103360, 'tel aviv', 102360, to_date('16-03-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103361, 'jerusalem', 102361, to_date('30-11-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103362, 'new york', 102362, to_date('27-07-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103363, 'chicago', 102363, to_date('06-06-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103364, 'berlin', 102364, to_date('23-04-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103365, 'paris', 102365, to_date('20-03-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103366, 'denver', 102366, to_date('17-12-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103367, 'madrid', 102367, to_date('11-03-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103368, 'tel aviv', 102368, to_date('21-07-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103369, 'jerusalem', 102369, to_date('06-10-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103370, 'new york', 102370, to_date('10-07-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103371, 'chicago', 102371, to_date('14-10-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103372, 'berlin', 102372, to_date('21-11-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103373, 'paris', 102373, to_date('27-12-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103374, 'denver', 102374, to_date('26-04-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103375, 'madrid', 102375, to_date('02-03-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103376, 'tel aviv', 102376, to_date('28-10-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103377, 'jerusalem', 102377, to_date('05-08-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103378, 'new york', 102378, to_date('14-10-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103379, 'chicago', 102379, to_date('06-08-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103380, 'berlin', 102380, to_date('27-04-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103381, 'paris', 102381, to_date('30-01-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103382, 'denver', 102382, to_date('27-08-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103383, 'madrid', 102383, to_date('30-09-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103384, 'tel aviv', 102384, to_date('22-03-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103385, 'jerusalem', 102385, to_date('25-06-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103386, 'new york', 102386, to_date('19-01-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103387, 'chicago', 102387, to_date('10-08-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103388, 'berlin', 102388, to_date('31-08-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103389, 'paris', 102389, to_date('13-02-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103390, 'denver', 102390, to_date('18-05-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103391, 'madrid', 102391, to_date('01-10-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103392, 'tel aviv', 102392, to_date('07-04-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103393, 'jerusalem', 102393, to_date('01-06-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103394, 'new york', 102394, to_date('17-02-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103395, 'chicago', 102395, to_date('19-09-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103396, 'berlin', 102396, to_date('30-04-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103397, 'paris', 102397, to_date('01-04-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103398, 'denver', 102398, to_date('16-05-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103399, 'madrid', 102399, to_date('21-09-2000', 'dd-mm-yyyy'));
commit;
prompt 400 records committed...
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103401, 'Jacksonville', 102718, to_date('24-07-2006', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103402, 'Modiin', 102718, to_date('24-07-2006', 'dd-mm-yyyy'));
commit;
prompt 402 records loaded
prompt Loading CUSTOMERS...
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100000, 'Kimberly', 108000, to_date('06-06-2005', 'dd-mm-yyyy'), 103000);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100001, 'Jamie', 108001, to_date('09-04-2008', 'dd-mm-yyyy'), 103001);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100002, 'David', 108002, to_date('31-05-2006', 'dd-mm-yyyy'), 103002);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100003, 'Matthew', 108003, to_date('03-01-2009', 'dd-mm-yyyy'), 103003);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100004, 'Allison', 108004, to_date('15-06-2006', 'dd-mm-yyyy'), 103004);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100005, 'Joanna', 108005, to_date('24-06-2007', 'dd-mm-yyyy'), 103005);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100006, 'Jaime', 108006, to_date('01-07-2006', 'dd-mm-yyyy'), 103006);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100007, 'Robin', 108007, to_date('30-09-2008', 'dd-mm-yyyy'), 103007);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100008, 'Steven', 108008, to_date('01-04-2007', 'dd-mm-yyyy'), 103008);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100009, 'Stephanie', 108009, to_date('24-01-2007', 'dd-mm-yyyy'), 103009);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100010, 'Brian', 108010, to_date('31-07-2007', 'dd-mm-yyyy'), 103010);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100011, 'Alyssa', 108011, to_date('11-07-2008', 'dd-mm-yyyy'), 103011);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100012, 'Michael', 108012, to_date('19-10-2006', 'dd-mm-yyyy'), 103012);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100013, 'Catherine', 108013, to_date('12-01-2007', 'dd-mm-yyyy'), 103013);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100014, 'Charlene', 108014, to_date('15-09-2006', 'dd-mm-yyyy'), 103014);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100015, 'Michele', 108015, to_date('01-01-2007', 'dd-mm-yyyy'), 103015);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100016, 'Nicole', 108016, to_date('18-01-2005', 'dd-mm-yyyy'), 103016);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100017, 'Mark', 108017, to_date('16-06-2008', 'dd-mm-yyyy'), 103017);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100018, 'Marissa', 108018, to_date('21-11-2008', 'dd-mm-yyyy'), 103018);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100019, 'Taylor', 108019, to_date('01-08-2007', 'dd-mm-yyyy'), 103019);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100020, 'Gina', 108020, to_date('12-11-2006', 'dd-mm-yyyy'), 103020);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100021, 'Shannon', 108021, to_date('09-11-2007', 'dd-mm-yyyy'), 103021);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100022, 'Monique', 108022, to_date('03-04-2008', 'dd-mm-yyyy'), 103022);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100023, 'Tamara', 108023, to_date('01-02-2006', 'dd-mm-yyyy'), 103023);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100024, 'Patricia', 108024, to_date('23-05-2005', 'dd-mm-yyyy'), 103024);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100025, 'Yvette', 108025, to_date('04-03-2006', 'dd-mm-yyyy'), 103025);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100026, 'Cynthia', 108026, to_date('27-10-2008', 'dd-mm-yyyy'), 103026);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100027, 'Jennifer', 108027, to_date('13-05-2007', 'dd-mm-yyyy'), 103027);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100028, 'Lisa', 108028, to_date('02-01-2005', 'dd-mm-yyyy'), 103028);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100029, 'Richard', 108029, to_date('10-02-2009', 'dd-mm-yyyy'), 103029);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100030, 'Dawn', 108030, to_date('23-11-2008', 'dd-mm-yyyy'), 103030);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100031, 'Kayla', 108031, to_date('16-03-2007', 'dd-mm-yyyy'), 103031);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100032, 'Laura', 108032, to_date('14-06-2006', 'dd-mm-yyyy'), 103032);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100033, 'James', 108033, to_date('09-11-2005', 'dd-mm-yyyy'), 103033);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100034, 'Emily', 108034, to_date('21-08-2009', 'dd-mm-yyyy'), 103034);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100035, 'Derek', 108035, to_date('04-10-2007', 'dd-mm-yyyy'), 103035);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100036, 'Rebecca', 108036, to_date('15-03-2009', 'dd-mm-yyyy'), 103036);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100037, 'Christie', 108037, to_date('29-10-2005', 'dd-mm-yyyy'), 103037);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100038, 'Jonathan', 108038, to_date('11-06-2005', 'dd-mm-yyyy'), 103038);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100039, 'William', 108039, to_date('27-12-2008', 'dd-mm-yyyy'), 103039);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100040, 'Kelly', 108040, to_date('19-12-2008', 'dd-mm-yyyy'), 103040);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100041, 'Tasha', 108041, to_date('15-03-2009', 'dd-mm-yyyy'), 103041);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100042, 'Joseph', 108042, to_date('03-04-2009', 'dd-mm-yyyy'), 103042);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100043, 'Adam', 108043, to_date('29-01-2008', 'dd-mm-yyyy'), 103043);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100044, 'Ricardo', 108044, to_date('27-06-2006', 'dd-mm-yyyy'), 103044);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100045, 'Cassidy', 108045, to_date('15-03-2009', 'dd-mm-yyyy'), 103045);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100046, 'Karen', 108046, to_date('28-06-2007', 'dd-mm-yyyy'), 103046);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100047, 'Christina', 108047, to_date('14-05-2007', 'dd-mm-yyyy'), 103047);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100048, 'Chloe', 108048, to_date('19-03-2008', 'dd-mm-yyyy'), 103048);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100049, 'Michael', 108049, to_date('26-09-2006', 'dd-mm-yyyy'), 103049);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100050, 'Robert', 108050, to_date('29-07-2005', 'dd-mm-yyyy'), 103050);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100051, 'Jamie', 108051, to_date('19-03-2005', 'dd-mm-yyyy'), 103051);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100052, 'Nicole', 108052, to_date('24-01-2009', 'dd-mm-yyyy'), 103052);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100053, 'Ashley', 108053, to_date('09-05-2009', 'dd-mm-yyyy'), 103053);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100054, 'Jonathan', 108054, to_date('30-12-2005', 'dd-mm-yyyy'), 103054);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100055, 'Edwin', 108055, to_date('12-10-2006', 'dd-mm-yyyy'), 103055);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100056, 'Jason', 108056, to_date('24-10-2007', 'dd-mm-yyyy'), 103056);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100057, 'Lisa', 108057, to_date('30-12-2007', 'dd-mm-yyyy'), 103057);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100058, 'Ronald', 108058, to_date('01-06-2005', 'dd-mm-yyyy'), 103058);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100059, 'Maureen', 108059, to_date('17-08-2008', 'dd-mm-yyyy'), 103059);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100060, 'Christine', 108060, to_date('02-02-2008', 'dd-mm-yyyy'), 103060);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100061, 'Dawn', 108061, to_date('06-01-2009', 'dd-mm-yyyy'), 103061);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100062, 'Kevin', 108062, to_date('27-01-2009', 'dd-mm-yyyy'), 103062);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100063, 'Paula', 108063, to_date('13-03-2005', 'dd-mm-yyyy'), 103063);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100064, 'Gabriel', 108064, to_date('27-11-2008', 'dd-mm-yyyy'), 103064);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100065, 'Karen', 108065, to_date('13-07-2009', 'dd-mm-yyyy'), 103065);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100066, 'James', 108066, to_date('12-07-2009', 'dd-mm-yyyy'), 103066);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100067, 'Jimmy', 108067, to_date('24-04-2006', 'dd-mm-yyyy'), 103067);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100068, 'Ronald', 108068, to_date('07-03-2006', 'dd-mm-yyyy'), 103068);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100069, 'Ashley', 108069, to_date('27-08-2007', 'dd-mm-yyyy'), 103069);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100070, 'Barbara', 108070, to_date('25-03-2007', 'dd-mm-yyyy'), 103070);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100071, 'Amanda', 108071, to_date('09-07-2005', 'dd-mm-yyyy'), 103071);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100072, 'Derek', 108072, to_date('19-03-2005', 'dd-mm-yyyy'), 103072);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100073, 'Natalie', 108073, to_date('05-08-2008', 'dd-mm-yyyy'), 103073);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100074, 'Bradley', 108074, to_date('15-06-2007', 'dd-mm-yyyy'), 103074);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100075, 'Robert', 108075, to_date('08-03-2008', 'dd-mm-yyyy'), 103075);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100076, 'Kathryn', 108076, to_date('29-06-2005', 'dd-mm-yyyy'), 103076);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100077, 'Pamela', 108077, to_date('05-01-2008', 'dd-mm-yyyy'), 103077);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100078, 'Keith', 108078, to_date('25-06-2006', 'dd-mm-yyyy'), 103078);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100079, 'Ariana', 108079, to_date('24-07-2007', 'dd-mm-yyyy'), 103079);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100080, 'Andrew', 108080, to_date('15-09-2008', 'dd-mm-yyyy'), 103080);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100081, 'Deborah', 108081, to_date('03-04-2006', 'dd-mm-yyyy'), 103081);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100082, 'Susan', 108082, to_date('31-10-2009', 'dd-mm-yyyy'), 103082);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100083, 'Patrick', 108083, to_date('25-03-2009', 'dd-mm-yyyy'), 103083);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100084, 'Jennifer', 108084, to_date('19-10-2009', 'dd-mm-yyyy'), 103084);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100085, 'John', 108085, to_date('05-05-2006', 'dd-mm-yyyy'), 103085);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100086, 'Jerry', 108086, to_date('03-12-2007', 'dd-mm-yyyy'), 103086);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100087, 'Brittany', 108087, to_date('21-11-2008', 'dd-mm-yyyy'), 103087);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100088, 'Elizabeth', 108088, to_date('24-03-2006', 'dd-mm-yyyy'), 103088);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100089, 'Rebecca', 108089, to_date('01-03-2008', 'dd-mm-yyyy'), 103089);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100090, 'Joseph', 108090, to_date('31-07-2006', 'dd-mm-yyyy'), 103090);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100091, 'John', 108091, to_date('21-03-2007', 'dd-mm-yyyy'), 103091);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100092, 'Mason', 108092, to_date('10-03-2009', 'dd-mm-yyyy'), 103092);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100093, 'Joseph', 108093, to_date('03-09-2007', 'dd-mm-yyyy'), 103093);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100094, 'Stacy', 108094, to_date('12-03-2008', 'dd-mm-yyyy'), 103094);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100095, 'Debra', 108095, to_date('01-12-2007', 'dd-mm-yyyy'), 103095);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100096, 'Wendy', 108096, to_date('21-05-2005', 'dd-mm-yyyy'), 103096);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100097, 'Anthony', 108097, to_date('13-09-2006', 'dd-mm-yyyy'), 103097);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100098, 'Randy', 108098, to_date('01-10-2007', 'dd-mm-yyyy'), 103098);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100099, 'Joann', 108099, to_date('09-01-2005', 'dd-mm-yyyy'), 103099);
commit;
prompt 100 records committed...
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100100, 'Lisa', 108100, to_date('18-04-2007', 'dd-mm-yyyy'), 103100);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100101, 'Carol', 108101, to_date('03-12-2007', 'dd-mm-yyyy'), 103101);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100102, 'Beverly', 108102, to_date('22-02-2005', 'dd-mm-yyyy'), 103102);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100103, 'Cynthia', 108103, to_date('27-03-2009', 'dd-mm-yyyy'), 103103);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100104, 'Michelle', 108104, to_date('03-01-2009', 'dd-mm-yyyy'), 103104);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100105, 'Jasmine', 108105, to_date('04-10-2006', 'dd-mm-yyyy'), 103105);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100106, 'Tina', 108106, to_date('05-11-2009', 'dd-mm-yyyy'), 103106);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100107, 'Kevin', 108107, to_date('21-02-2005', 'dd-mm-yyyy'), 103107);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100108, 'Kayla', 108108, to_date('02-05-2008', 'dd-mm-yyyy'), 103108);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100109, 'Dawn', 108109, to_date('05-08-2006', 'dd-mm-yyyy'), 103109);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100110, 'Karen', 108110, to_date('10-09-2008', 'dd-mm-yyyy'), 103110);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100111, 'Jessica', 108111, to_date('14-10-2005', 'dd-mm-yyyy'), 103111);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100112, 'Tanya', 108112, to_date('01-12-2007', 'dd-mm-yyyy'), 103112);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100113, 'Michael', 108113, to_date('03-12-2008', 'dd-mm-yyyy'), 103113);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100114, 'Kerry', 108114, to_date('13-06-2008', 'dd-mm-yyyy'), 103114);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100115, 'Lisa', 108115, to_date('04-09-2005', 'dd-mm-yyyy'), 103115);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100116, 'Richard', 108116, to_date('21-06-2008', 'dd-mm-yyyy'), 103116);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100117, 'Lori', 108117, to_date('11-05-2007', 'dd-mm-yyyy'), 103117);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100118, 'Amanda', 108118, to_date('31-10-2005', 'dd-mm-yyyy'), 103118);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100119, 'Christian', 108119, to_date('26-10-2009', 'dd-mm-yyyy'), 103119);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100120, 'Richard', 108120, to_date('08-09-2008', 'dd-mm-yyyy'), 103120);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100121, 'Craig', 108121, to_date('06-08-2006', 'dd-mm-yyyy'), 103121);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100122, 'Tammy', 108122, to_date('30-07-2006', 'dd-mm-yyyy'), 103122);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100123, 'Jeffrey', 108123, to_date('11-09-2005', 'dd-mm-yyyy'), 103123);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100124, 'Barbara', 108124, to_date('27-08-2008', 'dd-mm-yyyy'), 103124);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100125, 'Robert', 108125, to_date('04-12-2008', 'dd-mm-yyyy'), 103125);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100126, 'Juan', 108126, to_date('19-08-2005', 'dd-mm-yyyy'), 103126);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100127, 'Lindsey', 108127, to_date('02-12-2009', 'dd-mm-yyyy'), 103127);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100128, 'Richard', 108128, to_date('23-01-2007', 'dd-mm-yyyy'), 103128);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100129, 'Parker', 108129, to_date('13-05-2005', 'dd-mm-yyyy'), 103129);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100130, 'Tyler', 108130, to_date('09-11-2007', 'dd-mm-yyyy'), 103130);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100131, 'Dorothy', 108131, to_date('13-08-2007', 'dd-mm-yyyy'), 103131);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100132, 'Tonya', 108132, to_date('20-02-2008', 'dd-mm-yyyy'), 103132);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100133, 'George', 108133, to_date('20-06-2008', 'dd-mm-yyyy'), 103133);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100134, 'Mark', 108134, to_date('13-05-2007', 'dd-mm-yyyy'), 103134);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100135, 'Andrew', 108135, to_date('23-08-2008', 'dd-mm-yyyy'), 103135);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100136, 'Richard', 108136, to_date('05-12-2006', 'dd-mm-yyyy'), 103136);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100137, 'Henry', 108137, to_date('06-01-2007', 'dd-mm-yyyy'), 103137);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100138, 'Michael', 108138, to_date('03-08-2007', 'dd-mm-yyyy'), 103138);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100139, 'Dennis', 108139, to_date('05-02-2005', 'dd-mm-yyyy'), 103139);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100140, 'Nicole', 108140, to_date('17-03-2009', 'dd-mm-yyyy'), 103140);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100141, 'Mary', 108141, to_date('26-02-2009', 'dd-mm-yyyy'), 103141);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100142, 'Robert', 108142, to_date('27-11-2006', 'dd-mm-yyyy'), 103142);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100143, 'Candice', 108143, to_date('20-08-2007', 'dd-mm-yyyy'), 103143);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100144, 'Lucas', 108144, to_date('27-10-2009', 'dd-mm-yyyy'), 103144);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100145, 'Michele', 108145, to_date('08-06-2009', 'dd-mm-yyyy'), 103145);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100146, 'Amber', 108146, to_date('06-11-2009', 'dd-mm-yyyy'), 103146);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100147, 'Allison', 108147, to_date('13-05-2007', 'dd-mm-yyyy'), 103147);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100148, 'Timothy', 108148, to_date('03-08-2005', 'dd-mm-yyyy'), 103148);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100149, 'Molly', 108149, to_date('08-11-2009', 'dd-mm-yyyy'), 103149);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100150, 'Matthew', 108150, to_date('07-02-2008', 'dd-mm-yyyy'), 103150);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100151, 'Holly', 108151, to_date('07-07-2007', 'dd-mm-yyyy'), 103151);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100152, 'Melissa', 108152, to_date('15-08-2006', 'dd-mm-yyyy'), 103152);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100153, 'Melissa', 108153, to_date('14-06-2007', 'dd-mm-yyyy'), 103153);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100154, 'Victoria', 108154, to_date('24-11-2005', 'dd-mm-yyyy'), 103154);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100155, 'David', 108155, to_date('17-07-2005', 'dd-mm-yyyy'), 103155);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100156, 'David', 108156, to_date('05-10-2009', 'dd-mm-yyyy'), 103156);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100157, 'Tracy', 108157, to_date('21-06-2006', 'dd-mm-yyyy'), 103157);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100158, 'Christopher', 108158, to_date('10-06-2007', 'dd-mm-yyyy'), 103158);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100159, 'Rita', 108159, to_date('02-05-2009', 'dd-mm-yyyy'), 103159);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100160, 'Kevin', 108160, to_date('08-07-2006', 'dd-mm-yyyy'), 103160);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100161, 'Kathryn', 108161, to_date('16-06-2007', 'dd-mm-yyyy'), 103161);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100162, 'Joshua', 108162, to_date('01-12-2008', 'dd-mm-yyyy'), 103162);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100163, 'Sean', 108163, to_date('27-08-2008', 'dd-mm-yyyy'), 103163);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100164, 'Joshua', 108164, to_date('01-12-2009', 'dd-mm-yyyy'), 103164);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100165, 'Michael', 108165, to_date('09-10-2008', 'dd-mm-yyyy'), 103165);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100166, 'William', 108166, to_date('11-06-2009', 'dd-mm-yyyy'), 103166);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100167, 'Elizabeth', 108167, to_date('16-01-2006', 'dd-mm-yyyy'), 103167);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100168, 'Jessica', 108168, to_date('30-10-2006', 'dd-mm-yyyy'), 103168);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100169, 'Derek', 108169, to_date('16-12-2005', 'dd-mm-yyyy'), 103169);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100170, 'Erik', 108170, to_date('15-02-2006', 'dd-mm-yyyy'), 103170);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100171, 'Christopher', 108171, to_date('28-04-2007', 'dd-mm-yyyy'), 103171);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100172, 'Felicia', 108172, to_date('12-09-2005', 'dd-mm-yyyy'), 103172);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100173, 'Amy', 108173, to_date('13-03-2008', 'dd-mm-yyyy'), 103173);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100174, 'Karen', 108174, to_date('03-06-2006', 'dd-mm-yyyy'), 103174);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100175, 'Brittany', 108175, to_date('24-09-2006', 'dd-mm-yyyy'), 103175);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100176, 'Colton', 108176, to_date('03-03-2009', 'dd-mm-yyyy'), 103176);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100177, 'Stephanie', 108177, to_date('27-11-2009', 'dd-mm-yyyy'), 103177);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100178, 'David', 108178, to_date('17-03-2005', 'dd-mm-yyyy'), 103178);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100179, 'Michael', 108179, to_date('17-04-2006', 'dd-mm-yyyy'), 103179);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100180, 'Diana', 108180, to_date('08-09-2005', 'dd-mm-yyyy'), 103180);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100181, 'James', 108181, to_date('12-02-2005', 'dd-mm-yyyy'), 103181);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100182, 'Charles', 108182, to_date('29-11-2008', 'dd-mm-yyyy'), 103182);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100183, 'Matthew', 108183, to_date('11-05-2005', 'dd-mm-yyyy'), 103183);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100184, 'Zachary', 108184, to_date('30-04-2006', 'dd-mm-yyyy'), 103184);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100185, 'Scott', 108185, to_date('06-04-2007', 'dd-mm-yyyy'), 103185);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100186, 'Danielle', 108186, to_date('10-12-2009', 'dd-mm-yyyy'), 103186);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100187, 'Ethan', 108187, to_date('15-12-2007', 'dd-mm-yyyy'), 103187);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100188, 'Haley', 108188, to_date('23-04-2007', 'dd-mm-yyyy'), 103188);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100189, 'Roy', 108189, to_date('26-09-2005', 'dd-mm-yyyy'), 103189);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100190, 'Ryan', 108190, to_date('25-08-2005', 'dd-mm-yyyy'), 103190);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100191, 'Anthony', 108191, to_date('19-05-2006', 'dd-mm-yyyy'), 103191);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100192, 'Jesus', 108192, to_date('01-05-2006', 'dd-mm-yyyy'), 103192);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100193, 'Daniel', 108193, to_date('05-10-2006', 'dd-mm-yyyy'), 103193);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100194, 'Alexander', 108194, to_date('27-12-2008', 'dd-mm-yyyy'), 103194);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100195, 'Susan', 108195, to_date('04-09-2008', 'dd-mm-yyyy'), 103195);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100196, 'Briana', 108196, to_date('08-01-2006', 'dd-mm-yyyy'), 103196);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100197, 'Nicole', 108197, to_date('07-02-2006', 'dd-mm-yyyy'), 103197);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100198, 'Ellen', 108198, to_date('05-12-2007', 'dd-mm-yyyy'), 103198);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100199, 'Michael', 108199, to_date('05-04-2009', 'dd-mm-yyyy'), 103199);
commit;
prompt 200 records committed...
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100200, 'Lucas', 108200, to_date('24-10-2007', 'dd-mm-yyyy'), 103200);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100201, 'Brett', 108201, to_date('24-03-2005', 'dd-mm-yyyy'), 103201);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100202, 'Carolyn', 108202, to_date('23-12-2007', 'dd-mm-yyyy'), 103202);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100203, 'Jennifer', 108203, to_date('13-06-2006', 'dd-mm-yyyy'), 103203);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100204, 'Angela', 108204, to_date('29-04-2007', 'dd-mm-yyyy'), 103204);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100205, 'Deanna', 108205, to_date('06-03-2006', 'dd-mm-yyyy'), 103205);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100206, 'Christine', 108206, to_date('22-06-2007', 'dd-mm-yyyy'), 103206);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100207, 'Jessica', 108207, to_date('18-03-2007', 'dd-mm-yyyy'), 103207);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100208, 'Shelby', 108208, to_date('11-01-2008', 'dd-mm-yyyy'), 103208);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100209, 'Phillip', 108209, to_date('11-03-2008', 'dd-mm-yyyy'), 103209);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100210, 'Andrew', 108210, to_date('05-09-2008', 'dd-mm-yyyy'), 103210);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100211, 'Justin', 108211, to_date('23-09-2005', 'dd-mm-yyyy'), 103211);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100212, 'Leroy', 108212, to_date('28-08-2008', 'dd-mm-yyyy'), 103212);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100213, 'Danielle', 108213, to_date('02-10-2006', 'dd-mm-yyyy'), 103213);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100214, 'Sara', 108214, to_date('15-06-2009', 'dd-mm-yyyy'), 103214);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100215, 'Emily', 108215, to_date('07-04-2007', 'dd-mm-yyyy'), 103215);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100216, 'Anthony', 108216, to_date('18-01-2007', 'dd-mm-yyyy'), 103216);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100217, 'Maria', 108217, to_date('30-01-2006', 'dd-mm-yyyy'), 103217);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100218, 'Ana', 108218, to_date('17-07-2009', 'dd-mm-yyyy'), 103218);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100219, 'Steven', 108219, to_date('11-02-2008', 'dd-mm-yyyy'), 103219);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100220, 'Brian', 108220, to_date('23-04-2005', 'dd-mm-yyyy'), 103220);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100221, 'Shawn', 108221, to_date('27-09-2008', 'dd-mm-yyyy'), 103221);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100222, 'Pamela', 108222, to_date('03-03-2005', 'dd-mm-yyyy'), 103222);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100223, 'Jonathan', 108223, to_date('19-06-2006', 'dd-mm-yyyy'), 103223);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100224, 'Jill', 108224, to_date('09-08-2009', 'dd-mm-yyyy'), 103224);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100225, 'Jennifer', 108225, to_date('11-04-2005', 'dd-mm-yyyy'), 103225);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100226, 'William', 108226, to_date('27-06-2008', 'dd-mm-yyyy'), 103226);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100227, 'Mckenzie', 108227, to_date('02-03-2008', 'dd-mm-yyyy'), 103227);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100228, 'Donna', 108228, to_date('23-11-2005', 'dd-mm-yyyy'), 103228);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100229, 'Karen', 108229, to_date('13-09-2009', 'dd-mm-yyyy'), 103229);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100230, 'Angela', 108230, to_date('02-10-2009', 'dd-mm-yyyy'), 103230);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100231, 'Sierra', 108231, to_date('28-04-2006', 'dd-mm-yyyy'), 103231);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100232, 'Jacob', 108232, to_date('04-08-2008', 'dd-mm-yyyy'), 103232);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100233, 'Kristen', 108233, to_date('02-06-2007', 'dd-mm-yyyy'), 103233);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100234, 'Lisa', 108234, to_date('02-09-2009', 'dd-mm-yyyy'), 103234);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100235, 'Andrea', 108235, to_date('12-09-2005', 'dd-mm-yyyy'), 103235);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100236, 'Justin', 108236, to_date('09-06-2008', 'dd-mm-yyyy'), 103236);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100237, 'David', 108237, to_date('20-07-2006', 'dd-mm-yyyy'), 103237);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100238, 'Justin', 108238, to_date('16-10-2007', 'dd-mm-yyyy'), 103238);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100239, 'Kayla', 108239, to_date('07-08-2006', 'dd-mm-yyyy'), 103239);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100240, 'Richard', 108240, to_date('24-06-2009', 'dd-mm-yyyy'), 103240);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100241, 'Margaret', 108241, to_date('05-06-2005', 'dd-mm-yyyy'), 103241);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100242, 'Victoria', 108242, to_date('04-07-2006', 'dd-mm-yyyy'), 103242);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100243, 'Lisa', 108243, to_date('02-09-2006', 'dd-mm-yyyy'), 103243);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100244, 'Donald', 108244, to_date('27-11-2007', 'dd-mm-yyyy'), 103244);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100245, 'Alicia', 108245, to_date('23-02-2005', 'dd-mm-yyyy'), 103245);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100246, 'Victoria', 108246, to_date('02-09-2008', 'dd-mm-yyyy'), 103246);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100247, 'Peter', 108247, to_date('14-01-2007', 'dd-mm-yyyy'), 103247);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100248, 'Sara', 108248, to_date('18-07-2005', 'dd-mm-yyyy'), 103248);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100249, 'Brian', 108249, to_date('03-02-2009', 'dd-mm-yyyy'), 103249);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100250, 'Nancy', 108250, to_date('14-10-2008', 'dd-mm-yyyy'), 103250);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100251, 'Denise', 108251, to_date('21-06-2007', 'dd-mm-yyyy'), 103251);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100252, 'Stanley', 108252, to_date('15-08-2006', 'dd-mm-yyyy'), 103252);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100253, 'Olivia', 108253, to_date('14-09-2006', 'dd-mm-yyyy'), 103253);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100254, 'Pamela', 108254, to_date('29-01-2007', 'dd-mm-yyyy'), 103254);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100255, 'George', 108255, to_date('01-06-2006', 'dd-mm-yyyy'), 103255);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100256, 'Allison', 108256, to_date('06-03-2009', 'dd-mm-yyyy'), 103256);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100257, 'Timothy', 108257, to_date('22-09-2007', 'dd-mm-yyyy'), 103257);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100258, 'Devin', 108258, to_date('14-02-2006', 'dd-mm-yyyy'), 103258);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100259, 'Mackenzie', 108259, to_date('10-10-2009', 'dd-mm-yyyy'), 103259);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100260, 'Daniel', 108260, to_date('11-10-2006', 'dd-mm-yyyy'), 103260);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100261, 'Raymond', 108261, to_date('13-02-2005', 'dd-mm-yyyy'), 103261);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100262, 'John', 108262, to_date('29-01-2005', 'dd-mm-yyyy'), 103262);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100263, 'Jessica', 108263, to_date('07-12-2008', 'dd-mm-yyyy'), 103263);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100264, 'Kevin', 108264, to_date('06-10-2006', 'dd-mm-yyyy'), 103264);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100265, 'Donna', 108265, to_date('26-10-2006', 'dd-mm-yyyy'), 103265);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100266, 'Tammy', 108266, to_date('29-04-2005', 'dd-mm-yyyy'), 103266);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100267, 'Adam', 108267, to_date('18-10-2007', 'dd-mm-yyyy'), 103267);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100268, 'Brianna', 108268, to_date('12-12-2006', 'dd-mm-yyyy'), 103268);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100269, 'Hunter', 108269, to_date('07-07-2007', 'dd-mm-yyyy'), 103269);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100270, 'Anna', 108270, to_date('20-03-2009', 'dd-mm-yyyy'), 103270);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100271, 'Elizabeth', 108271, to_date('27-11-2005', 'dd-mm-yyyy'), 103271);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100272, 'James', 108272, to_date('02-07-2007', 'dd-mm-yyyy'), 103272);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100273, 'Nathan', 108273, to_date('29-05-2005', 'dd-mm-yyyy'), 103273);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100274, 'Alexis', 108274, to_date('24-11-2009', 'dd-mm-yyyy'), 103274);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100275, 'Jacob', 108275, to_date('01-12-2007', 'dd-mm-yyyy'), 103275);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100276, 'Susan', 108276, to_date('30-09-2005', 'dd-mm-yyyy'), 103276);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100277, 'Laura', 108277, to_date('28-09-2006', 'dd-mm-yyyy'), 103277);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100278, 'John', 108278, to_date('11-11-2005', 'dd-mm-yyyy'), 103278);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100279, 'David', 108279, to_date('16-07-2008', 'dd-mm-yyyy'), 103279);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100280, 'Cassandra', 108280, to_date('08-02-2008', 'dd-mm-yyyy'), 103280);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100281, 'Wendy', 108281, to_date('06-06-2009', 'dd-mm-yyyy'), 103281);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100282, 'Tina', 108282, to_date('23-02-2006', 'dd-mm-yyyy'), 103282);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100283, 'Summer', 108283, to_date('09-11-2009', 'dd-mm-yyyy'), 103283);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100284, 'Nancy', 108284, to_date('31-03-2005', 'dd-mm-yyyy'), 103284);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100285, 'Jennifer', 108285, to_date('18-07-2009', 'dd-mm-yyyy'), 103285);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100286, 'Tara', 108286, to_date('04-12-2007', 'dd-mm-yyyy'), 103286);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100287, 'Nicholas', 108287, to_date('12-03-2009', 'dd-mm-yyyy'), 103287);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100288, 'Meagan', 108288, to_date('15-01-2005', 'dd-mm-yyyy'), 103288);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100289, 'Nicholas', 108289, to_date('05-12-2005', 'dd-mm-yyyy'), 103289);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100290, 'Christopher', 108290, to_date('03-12-2005', 'dd-mm-yyyy'), 103290);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100291, 'Alexis', 108291, to_date('18-11-2009', 'dd-mm-yyyy'), 103291);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100292, 'Barbara', 108292, to_date('26-11-2008', 'dd-mm-yyyy'), 103292);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100293, 'Lindsay', 108293, to_date('08-07-2006', 'dd-mm-yyyy'), 103293);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100294, 'Samantha', 108294, to_date('26-07-2007', 'dd-mm-yyyy'), 103294);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100295, 'Tina', 108295, to_date('28-05-2005', 'dd-mm-yyyy'), 103295);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100296, 'Stephanie', 108296, to_date('21-04-2007', 'dd-mm-yyyy'), 103296);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100297, 'Daniel', 108297, to_date('20-08-2009', 'dd-mm-yyyy'), 103297);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100298, 'Donald', 108298, to_date('15-05-2006', 'dd-mm-yyyy'), 103298);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100299, 'Michael', 108299, to_date('26-08-2007', 'dd-mm-yyyy'), 103299);
commit;
prompt 300 records committed...
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100300, 'Tina', 108300, to_date('01-10-2009', 'dd-mm-yyyy'), 103300);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100301, 'Jackie', 108301, to_date('11-12-2005', 'dd-mm-yyyy'), 103301);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100302, 'Erica', 108302, to_date('18-07-2008', 'dd-mm-yyyy'), 103302);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100303, 'Daniel', 108303, to_date('19-08-2007', 'dd-mm-yyyy'), 103303);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100304, 'Tara', 108304, to_date('05-01-2008', 'dd-mm-yyyy'), 103304);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100305, 'Sean', 108305, to_date('17-06-2006', 'dd-mm-yyyy'), 103305);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100306, 'Scott', 108306, to_date('30-10-2007', 'dd-mm-yyyy'), 103306);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100307, 'Christina', 108307, to_date('29-05-2006', 'dd-mm-yyyy'), 103307);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100308, 'Alexander', 108308, to_date('03-10-2006', 'dd-mm-yyyy'), 103308);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100309, 'Angela', 108309, to_date('01-01-2006', 'dd-mm-yyyy'), 103309);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100310, 'Maria', 108310, to_date('13-02-2007', 'dd-mm-yyyy'), 103310);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100311, 'Robert', 108311, to_date('05-07-2008', 'dd-mm-yyyy'), 103311);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100312, 'Robert', 108312, to_date('07-12-2009', 'dd-mm-yyyy'), 103312);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100313, 'Charles', 108313, to_date('13-08-2009', 'dd-mm-yyyy'), 103313);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100314, 'Tracey', 108314, to_date('22-08-2008', 'dd-mm-yyyy'), 103314);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100315, 'Donald', 108315, to_date('14-12-2008', 'dd-mm-yyyy'), 103315);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100316, 'Chris', 108316, to_date('26-09-2007', 'dd-mm-yyyy'), 103316);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100317, 'Nicole', 108317, to_date('31-08-2008', 'dd-mm-yyyy'), 103317);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100318, 'Suzanne', 108318, to_date('05-02-2008', 'dd-mm-yyyy'), 103318);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100319, 'Sandra', 108319, to_date('13-04-2005', 'dd-mm-yyyy'), 103319);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100320, 'Brandon', 108320, to_date('16-08-2008', 'dd-mm-yyyy'), 103320);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100321, 'Michael', 108321, to_date('22-09-2005', 'dd-mm-yyyy'), 103321);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100322, 'Matthew', 108322, to_date('12-05-2008', 'dd-mm-yyyy'), 103322);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100323, 'Robert', 108323, to_date('31-07-2009', 'dd-mm-yyyy'), 103323);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100324, 'Scott', 108324, to_date('19-07-2005', 'dd-mm-yyyy'), 103324);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100325, 'Carol', 108325, to_date('03-03-2008', 'dd-mm-yyyy'), 103325);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100326, 'Peter', 108326, to_date('26-03-2007', 'dd-mm-yyyy'), 103326);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100327, 'Nicholas', 108327, to_date('01-11-2009', 'dd-mm-yyyy'), 103327);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100328, 'John', 108328, to_date('12-01-2006', 'dd-mm-yyyy'), 103328);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100329, 'Eric', 108329, to_date('16-07-2005', 'dd-mm-yyyy'), 103329);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100330, 'Jessica', 108330, to_date('06-10-2006', 'dd-mm-yyyy'), 103330);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100331, 'Alexandra', 108331, to_date('20-03-2005', 'dd-mm-yyyy'), 103331);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100332, 'Jenna', 108332, to_date('07-01-2009', 'dd-mm-yyyy'), 103332);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100333, 'Curtis', 108333, to_date('09-09-2006', 'dd-mm-yyyy'), 103333);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100334, 'Gloria', 108334, to_date('01-06-2007', 'dd-mm-yyyy'), 103334);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100335, 'Jessica', 108335, to_date('31-08-2008', 'dd-mm-yyyy'), 103335);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100336, 'Andrew', 108336, to_date('12-01-2009', 'dd-mm-yyyy'), 103336);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100337, 'Michelle', 108337, to_date('03-08-2005', 'dd-mm-yyyy'), 103337);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100338, 'Vicki', 108338, to_date('30-10-2008', 'dd-mm-yyyy'), 103338);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100339, 'Chelsea', 108339, to_date('11-01-2005', 'dd-mm-yyyy'), 103339);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100340, 'Rose', 108340, to_date('05-02-2005', 'dd-mm-yyyy'), 103340);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100341, 'Denise', 108341, to_date('16-02-2006', 'dd-mm-yyyy'), 103341);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100342, 'Jessica', 108342, to_date('24-03-2006', 'dd-mm-yyyy'), 103342);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100343, 'Shannon', 108343, to_date('12-07-2006', 'dd-mm-yyyy'), 103343);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100344, 'Cynthia', 108344, to_date('17-04-2009', 'dd-mm-yyyy'), 103344);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100345, 'Shari', 108345, to_date('18-04-2006', 'dd-mm-yyyy'), 103345);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100346, 'Veronica', 108346, to_date('04-03-2009', 'dd-mm-yyyy'), 103346);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100347, 'Robert', 108347, to_date('09-06-2009', 'dd-mm-yyyy'), 103347);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100348, 'Jamie', 108348, to_date('07-09-2005', 'dd-mm-yyyy'), 103348);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100349, 'Sandra', 108349, to_date('18-01-2008', 'dd-mm-yyyy'), 103349);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100350, 'Ethan', 108350, to_date('14-03-2006', 'dd-mm-yyyy'), 103350);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100351, 'John', 108351, to_date('06-08-2009', 'dd-mm-yyyy'), 103351);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100352, 'Wendy', 108352, to_date('21-05-2008', 'dd-mm-yyyy'), 103352);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100353, 'Dennis', 108353, to_date('14-11-2005', 'dd-mm-yyyy'), 103353);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100354, 'Nicole', 108354, to_date('14-06-2005', 'dd-mm-yyyy'), 103354);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100355, 'Billy', 108355, to_date('11-07-2006', 'dd-mm-yyyy'), 103355);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100356, 'Patricia', 108356, to_date('13-07-2008', 'dd-mm-yyyy'), 103356);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100357, 'Ronald', 108357, to_date('24-03-2005', 'dd-mm-yyyy'), 103357);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100358, 'Joseph', 108358, to_date('21-05-2008', 'dd-mm-yyyy'), 103358);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100359, 'Shawn', 108359, to_date('20-08-2005', 'dd-mm-yyyy'), 103359);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100360, 'Sarah', 108360, to_date('24-10-2009', 'dd-mm-yyyy'), 103360);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100361, 'Joshua', 108361, to_date('11-05-2006', 'dd-mm-yyyy'), 103361);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100362, 'Ricardo', 108362, to_date('18-01-2009', 'dd-mm-yyyy'), 103362);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100363, 'Linda', 108363, to_date('24-09-2006', 'dd-mm-yyyy'), 103363);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100364, 'Jeffrey', 108364, to_date('20-06-2009', 'dd-mm-yyyy'), 103364);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100365, 'Mike', 108365, to_date('27-04-2007', 'dd-mm-yyyy'), 103365);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100366, 'Michelle', 108366, to_date('14-04-2005', 'dd-mm-yyyy'), 103366);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100367, 'Steven', 108367, to_date('27-06-2009', 'dd-mm-yyyy'), 103367);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100368, 'Sandra', 108368, to_date('03-04-2005', 'dd-mm-yyyy'), 103368);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100369, 'Daniel', 108369, to_date('19-09-2009', 'dd-mm-yyyy'), 103369);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100370, 'Nicole', 108370, to_date('24-08-2008', 'dd-mm-yyyy'), 103370);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100371, 'Robert', 108371, to_date('09-10-2006', 'dd-mm-yyyy'), 103371);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100372, 'Alexandra', 108372, to_date('13-11-2007', 'dd-mm-yyyy'), 103372);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100373, 'Kyle', 108373, to_date('12-06-2005', 'dd-mm-yyyy'), 103373);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100374, 'Alexis', 108374, to_date('16-12-2005', 'dd-mm-yyyy'), 103374);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100375, 'Rodney', 108375, to_date('08-11-2007', 'dd-mm-yyyy'), 103375);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100376, 'Victoria', 108376, to_date('24-01-2006', 'dd-mm-yyyy'), 103376);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100377, 'Thomas', 108377, to_date('09-06-2009', 'dd-mm-yyyy'), 103377);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100378, 'Christine', 108378, to_date('19-12-2005', 'dd-mm-yyyy'), 103378);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100379, 'Cody', 108379, to_date('21-01-2008', 'dd-mm-yyyy'), 103379);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100380, 'Matthew', 108380, to_date('13-08-2005', 'dd-mm-yyyy'), 103380);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100381, 'Cody', 108381, to_date('26-06-2008', 'dd-mm-yyyy'), 103381);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100382, 'Geoffrey', 108382, to_date('08-11-2005', 'dd-mm-yyyy'), 103382);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100383, 'Carlos', 108383, to_date('13-09-2008', 'dd-mm-yyyy'), 103383);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100384, 'Bruce', 108384, to_date('12-03-2008', 'dd-mm-yyyy'), 103384);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100385, 'Sally', 108385, to_date('24-02-2005', 'dd-mm-yyyy'), 103385);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100386, 'John', 108386, to_date('18-12-2007', 'dd-mm-yyyy'), 103386);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100387, 'Kyle', 108387, to_date('28-09-2009', 'dd-mm-yyyy'), 103387);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100388, 'Steven', 108388, to_date('19-05-2006', 'dd-mm-yyyy'), 103388);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100389, 'Roger', 108389, to_date('24-09-2005', 'dd-mm-yyyy'), 103389);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100390, 'George', 108390, to_date('21-06-2009', 'dd-mm-yyyy'), 103390);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100391, 'Jack', 108391, to_date('12-11-2005', 'dd-mm-yyyy'), 103391);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100392, 'Harold', 108392, to_date('26-08-2008', 'dd-mm-yyyy'), 103392);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100393, 'Kristine', 108393, to_date('10-12-2005', 'dd-mm-yyyy'), 103393);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100394, 'Roger', 108394, to_date('20-11-2009', 'dd-mm-yyyy'), 103394);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100395, 'Adrienne', 108395, to_date('17-05-2008', 'dd-mm-yyyy'), 103395);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100396, 'Sarah', 108396, to_date('30-11-2007', 'dd-mm-yyyy'), 103396);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100397, 'Kim', 108397, to_date('17-07-2008', 'dd-mm-yyyy'), 103397);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100398, 'Barbara', 108398, to_date('07-02-2009', 'dd-mm-yyyy'), 103398);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100399, 'Jeremy', 108399, to_date('26-12-2005', 'dd-mm-yyyy'), 103399);
commit;
prompt 400 records committed...
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100401, 'Juliette', 108401, to_date('24-07-2006', 'dd-mm-yyyy'), 103401);
commit;
prompt 401 records loaded
prompt Loading LOANS...
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101000, 12147, 100000, to_date('07-04-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101001, 2425, 100001, to_date('07-04-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101002, 59698, 100002, to_date('17-11-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101003, 4686, 100003, to_date('04-12-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101004, 32566, 100004, to_date('29-02-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101005, 2459, 100005, to_date('01-08-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101006, 83420, 100006, to_date('19-06-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101007, 16409, 100007, to_date('29-05-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101008, 57804, 100008, to_date('02-12-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101009, 77309, 100009, to_date('30-05-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101010, 22561, 100010, to_date('09-12-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101011, 69068, 100011, to_date('03-09-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101012, 58817, 100012, to_date('15-03-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101013, 93868, 100013, to_date('16-05-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101014, 70954, 100014, to_date('06-02-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101015, 7206, 100015, to_date('02-01-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101016, 23995, 100016, to_date('03-12-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101017, 64144, 100017, to_date('15-12-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101018, 85714, 100018, to_date('30-10-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101019, 12522, 100019, to_date('04-10-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101020, 92021, 100020, to_date('15-04-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101021, 44694, 100021, to_date('06-10-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101022, 77388, 100022, to_date('07-04-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101023, 38357, 100023, to_date('17-12-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101024, 1655, 100024, to_date('24-04-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101025, 26242, 100025, to_date('18-04-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101026, 61235, 100026, to_date('19-04-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101027, 18764, 100027, to_date('06-08-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101028, 59144, 100028, to_date('13-03-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101029, 71036, 100029, to_date('18-03-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101030, 16796, 100030, to_date('28-07-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101031, 82694, 100031, to_date('22-12-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101032, 11085, 100032, to_date('19-05-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101033, 92205, 100033, to_date('28-06-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101034, 99188, 100034, to_date('04-07-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101035, 12409, 100035, to_date('01-04-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101036, 56872, 100036, to_date('11-10-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101037, 78576, 100037, to_date('28-05-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101038, 78536, 100038, to_date('15-11-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101039, 76839, 100039, to_date('23-10-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101040, 50841, 100040, to_date('25-09-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101041, 93013, 100041, to_date('29-07-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101042, 58204, 100042, to_date('11-07-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101043, 62444, 100043, to_date('03-02-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101044, 83199, 100044, to_date('24-10-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101045, 68369, 100045, to_date('10-11-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101046, 57005, 100046, to_date('21-03-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101047, 74544, 100047, to_date('12-04-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101048, 69904, 100048, to_date('02-08-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101049, 30388, 100049, to_date('10-02-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101050, 91266, 100050, to_date('08-10-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101051, 81235, 100051, to_date('13-11-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101052, 80833, 100052, to_date('26-04-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101053, 33198, 100053, to_date('24-04-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101054, 58515, 100054, to_date('17-08-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101055, 4666, 100055, to_date('08-06-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101056, 12443, 100056, to_date('21-02-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101057, 89440, 100057, to_date('23-06-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101058, 28691, 100058, to_date('03-01-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101059, 75265, 100059, to_date('05-02-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101060, 27460, 100060, to_date('15-05-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101061, 7730, 100061, to_date('23-01-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101062, 43802, 100062, to_date('26-04-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101063, 80697, 100063, to_date('13-07-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101064, 57577, 100064, to_date('03-11-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101065, 15912, 100065, to_date('08-02-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101066, 70071, 100066, to_date('05-02-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101067, 43278, 100067, to_date('09-01-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101068, 8982, 100068, to_date('13-06-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101069, 99984, 100069, to_date('02-03-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101070, 96401, 100070, to_date('29-09-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101071, 74279, 100071, to_date('25-12-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101072, 4154, 100072, to_date('26-11-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101073, 39650, 100073, to_date('08-11-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101074, 9948, 100074, to_date('05-07-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101075, 19224, 100075, to_date('06-04-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101076, 80904, 100076, to_date('30-04-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101077, 96476, 100077, to_date('18-09-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101078, 79199, 100078, to_date('19-05-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101079, 53405, 100079, to_date('01-04-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101080, 43832, 100080, to_date('17-05-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101081, 79685, 100081, to_date('11-02-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101082, 9767, 100082, to_date('08-12-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101083, 65388, 100083, to_date('16-04-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101084, 98171, 100084, to_date('07-10-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101085, 69075, 100085, to_date('24-05-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101086, 3096, 100086, to_date('19-10-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101087, 95061, 100087, to_date('06-07-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101088, 69131, 100088, to_date('25-11-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101089, 20472, 100089, to_date('06-06-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101090, 3944, 100090, to_date('01-07-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101091, 51912, 100091, to_date('05-07-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101092, 3460, 100092, to_date('20-08-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101093, 13758, 100093, to_date('07-06-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101094, 37685, 100094, to_date('03-02-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101095, 87387, 100095, to_date('28-04-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101096, 44750, 100096, to_date('06-11-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101097, 43581, 100097, to_date('20-11-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101098, 15044, 100098, to_date('23-08-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101099, 74412, 100099, to_date('11-02-2010', 'dd-mm-yyyy'));
commit;
prompt 100 records committed...
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101100, 9421, 100100, to_date('20-03-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101101, 89127, 100101, to_date('19-03-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101102, 47385, 100102, to_date('16-01-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101103, 2331, 100103, to_date('03-07-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101104, 89471, 100104, to_date('23-01-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101105, 52842, 100105, to_date('15-03-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101106, 27049, 100106, to_date('09-06-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101107, 49943, 100107, to_date('11-05-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101108, 42595, 100108, to_date('26-03-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101109, 89142, 100109, to_date('05-06-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101110, 55308, 100110, to_date('07-03-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101111, 52455, 100111, to_date('19-06-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101112, 46098, 100112, to_date('17-05-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101113, 75195, 100113, to_date('03-07-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101114, 87610, 100114, to_date('22-09-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101115, 36459, 100115, to_date('13-05-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101116, 73937, 100116, to_date('18-08-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101117, 38012, 100117, to_date('25-08-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101118, 21339, 100118, to_date('30-11-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101119, 99825, 100119, to_date('12-01-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101120, 16695, 100120, to_date('19-04-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101121, 66211, 100121, to_date('05-12-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101122, 1771, 100122, to_date('28-12-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101123, 33794, 100123, to_date('03-02-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101124, 37455, 100124, to_date('19-11-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101125, 70604, 100125, to_date('17-05-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101126, 22441, 100126, to_date('25-07-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101127, 62947, 100127, to_date('11-08-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101128, 31913, 100128, to_date('09-08-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101129, 88741, 100129, to_date('28-01-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101130, 79269, 100130, to_date('29-04-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101131, 35631, 100131, to_date('16-01-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101132, 93308, 100132, to_date('12-11-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101133, 78596, 100133, to_date('03-06-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101134, 30137, 100134, to_date('27-11-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101135, 81860, 100135, to_date('29-07-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101136, 92207, 100136, to_date('27-07-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101137, 94547, 100137, to_date('10-08-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101138, 16154, 100138, to_date('20-01-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101139, 79977, 100139, to_date('05-03-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101140, 49522, 100140, to_date('02-03-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101141, 10601, 100141, to_date('07-11-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101142, 21611, 100142, to_date('28-01-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101143, 8884, 100143, to_date('21-02-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101144, 71599, 100144, to_date('03-09-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101145, 4016, 100145, to_date('13-01-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101146, 33588, 100146, to_date('27-03-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101147, 97223, 100147, to_date('26-12-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101148, 49865, 100148, to_date('19-07-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101149, 4285, 100149, to_date('12-11-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101150, 98614, 100150, to_date('25-03-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101151, 49868, 100151, to_date('25-03-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101152, 64638, 100152, to_date('27-07-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101153, 30588, 100153, to_date('04-05-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101154, 14976, 100154, to_date('13-12-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101155, 22211, 100155, to_date('24-02-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101156, 96802, 100156, to_date('12-09-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101157, 11597, 100157, to_date('18-05-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101158, 91849, 100158, to_date('15-11-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101159, 33909, 100159, to_date('02-04-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101160, 49435, 100160, to_date('27-03-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101161, 56273, 100161, to_date('22-10-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101162, 45876, 100162, to_date('12-05-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101163, 8185, 100163, to_date('22-05-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101164, 49323, 100164, to_date('25-09-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101165, 91248, 100165, to_date('18-04-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101166, 27561, 100166, to_date('18-02-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101167, 77088, 100167, to_date('09-08-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101168, 17119, 100168, to_date('03-04-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101169, 35238, 100169, to_date('15-08-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101170, 44974, 100170, to_date('30-03-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101171, 26977, 100171, to_date('19-01-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101172, 27186, 100172, to_date('15-06-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101173, 44401, 100173, to_date('31-08-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101174, 22082, 100174, to_date('23-04-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101175, 91020, 100175, to_date('13-01-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101176, 20357, 100176, to_date('09-02-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101177, 74331, 100177, to_date('17-07-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101178, 74715, 100178, to_date('29-05-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101179, 44052, 100179, to_date('09-11-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101180, 75596, 100180, to_date('10-08-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101181, 25667, 100181, to_date('22-07-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101182, 59120, 100182, to_date('28-02-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101183, 47187, 100183, to_date('22-03-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101184, 26365, 100184, to_date('11-02-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101185, 79663, 100185, to_date('21-03-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101186, 11296, 100186, to_date('15-12-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101187, 38319, 100187, to_date('02-07-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101188, 10580, 100188, to_date('06-08-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101189, 23963, 100189, to_date('04-09-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101190, 9959, 100190, to_date('16-07-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101191, 52571, 100191, to_date('23-09-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101192, 94395, 100192, to_date('30-01-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101193, 43864, 100193, to_date('19-11-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101194, 94632, 100194, to_date('08-09-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101195, 77356, 100195, to_date('03-02-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101196, 52683, 100196, to_date('02-02-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101197, 3682, 100197, to_date('13-11-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101198, 53301, 100198, to_date('19-10-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101199, 69303, 100199, to_date('31-01-2013', 'dd-mm-yyyy'));
commit;
prompt 200 records committed...
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101200, 44359, 100200, to_date('25-12-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101201, 99500, 100201, to_date('04-01-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101202, 3626, 100202, to_date('12-05-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101203, 98957, 100203, to_date('22-09-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101204, 37440, 100204, to_date('09-04-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101205, 67142, 100205, to_date('13-01-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101206, 89418, 100206, to_date('28-02-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101207, 12039, 100207, to_date('28-03-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101208, 80780, 100208, to_date('07-04-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101209, 89831, 100209, to_date('01-11-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101210, 1845, 100210, to_date('22-03-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101211, 39055, 100211, to_date('24-07-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101212, 78666, 100212, to_date('16-06-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101213, 32330, 100213, to_date('01-05-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101214, 82396, 100214, to_date('12-08-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101215, 7193, 100215, to_date('30-10-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101216, 63540, 100216, to_date('28-02-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101217, 26162, 100217, to_date('11-09-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101218, 75844, 100218, to_date('12-05-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101219, 50596, 100219, to_date('12-11-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101220, 66600, 100220, to_date('13-03-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101221, 87136, 100221, to_date('04-03-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101222, 82175, 100222, to_date('24-05-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101223, 32254, 100223, to_date('03-12-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101224, 58503, 100224, to_date('19-01-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101225, 57424, 100225, to_date('19-04-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101226, 80097, 100226, to_date('18-02-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101227, 4917, 100227, to_date('02-03-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101228, 99138, 100228, to_date('27-08-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101229, 9245, 100229, to_date('28-07-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101230, 86349, 100230, to_date('12-04-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101231, 17345, 100231, to_date('05-10-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101232, 2141, 100232, to_date('06-12-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101233, 33871, 100233, to_date('21-05-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101234, 91756, 100234, to_date('13-05-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101235, 98770, 100235, to_date('07-02-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101236, 12564, 100236, to_date('03-10-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101237, 80315, 100237, to_date('10-11-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101238, 31725, 100238, to_date('17-04-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101239, 14611, 100239, to_date('24-03-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101240, 64786, 100240, to_date('09-03-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101241, 19270, 100241, to_date('21-03-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101242, 70232, 100242, to_date('22-05-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101243, 94423, 100243, to_date('06-12-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101244, 14084, 100244, to_date('10-11-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101245, 87667, 100245, to_date('11-12-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101246, 40573, 100246, to_date('18-02-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101247, 50803, 100247, to_date('30-09-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101248, 32270, 100248, to_date('19-07-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101249, 78048, 100249, to_date('11-09-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101250, 99750, 100250, to_date('11-05-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101251, 6138, 100251, to_date('19-10-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101252, 67967, 100252, to_date('25-12-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101253, 19121, 100253, to_date('13-10-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101254, 27424, 100254, to_date('04-10-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101255, 10103, 100255, to_date('15-01-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101256, 24854, 100256, to_date('20-10-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101257, 77855, 100257, to_date('14-09-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101258, 63345, 100258, to_date('21-11-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101259, 32138, 100259, to_date('24-07-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101260, 28045, 100260, to_date('03-08-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101261, 5697, 100261, to_date('05-03-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101262, 47633, 100262, to_date('11-07-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101263, 16898, 100263, to_date('30-03-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101264, 62943, 100264, to_date('01-08-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101265, 25372, 100265, to_date('09-09-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101266, 71779, 100266, to_date('03-03-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101267, 40214, 100267, to_date('24-07-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101268, 49497, 100268, to_date('20-03-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101269, 63203, 100269, to_date('25-10-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101270, 86368, 100270, to_date('11-08-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101271, 16996, 100271, to_date('21-05-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101272, 32395, 100272, to_date('01-07-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101273, 65608, 100273, to_date('12-10-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101274, 91149, 100274, to_date('01-09-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101275, 28867, 100275, to_date('05-07-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101276, 83118, 100276, to_date('08-06-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101277, 68664, 100277, to_date('06-04-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101278, 92728, 100278, to_date('14-08-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101279, 25434, 100279, to_date('14-06-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101280, 95179, 100280, to_date('18-05-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101281, 95618, 100281, to_date('16-03-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101282, 10529, 100282, to_date('12-11-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101283, 39137, 100283, to_date('23-12-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101284, 41089, 100284, to_date('17-07-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101285, 77301, 100285, to_date('01-07-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101286, 28442, 100286, to_date('20-08-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101287, 77438, 100287, to_date('17-02-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101288, 42018, 100288, to_date('09-01-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101289, 26573, 100289, to_date('17-07-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101290, 59486, 100290, to_date('02-08-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101291, 38372, 100291, to_date('31-12-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101292, 20832, 100292, to_date('05-03-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101293, 22552, 100293, to_date('14-10-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101294, 74536, 100294, to_date('06-04-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101295, 3283, 100295, to_date('08-11-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101296, 75393, 100296, to_date('07-06-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101297, 96839, 100297, to_date('04-07-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101298, 39288, 100298, to_date('20-02-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101299, 15840, 100299, to_date('04-05-2015', 'dd-mm-yyyy'));
commit;
prompt 300 records committed...
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101300, 37715, 100300, to_date('26-12-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101301, 45335, 100301, to_date('02-04-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101302, 4246, 100302, to_date('03-12-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101303, 3942, 100303, to_date('06-06-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101304, 6067, 100304, to_date('25-07-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101305, 82995, 100305, to_date('20-03-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101306, 18134, 100306, to_date('15-12-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101307, 50952, 100307, to_date('02-09-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101308, 53027, 100308, to_date('08-08-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101309, 45209, 100309, to_date('16-01-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101310, 31105, 100310, to_date('03-12-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101311, 4870, 100311, to_date('29-02-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101312, 19304, 100312, to_date('03-07-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101313, 5033, 100313, to_date('06-07-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101314, 94757, 100314, to_date('21-09-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101315, 30332, 100315, to_date('15-04-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101316, 65981, 100316, to_date('08-09-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101317, 34828, 100317, to_date('23-04-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101318, 39088, 100318, to_date('03-06-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101319, 70767, 100319, to_date('18-07-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101320, 67469, 100320, to_date('23-07-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101321, 83150, 100321, to_date('25-02-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101322, 36877, 100322, to_date('08-06-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101323, 65855, 100323, to_date('07-10-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101324, 45376, 100324, to_date('15-12-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101325, 13863, 100325, to_date('14-07-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101326, 22801, 100326, to_date('18-01-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101327, 39823, 100327, to_date('24-10-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101328, 44386, 100328, to_date('05-10-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101329, 18084, 100329, to_date('21-02-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101330, 3322, 100330, to_date('28-10-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101331, 18377, 100331, to_date('04-06-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101332, 60117, 100332, to_date('11-02-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101333, 57790, 100333, to_date('08-08-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101334, 8268, 100334, to_date('12-09-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101335, 40405, 100335, to_date('03-05-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101336, 49186, 100336, to_date('17-05-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101337, 39480, 100337, to_date('28-06-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101338, 14186, 100338, to_date('04-07-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101339, 79940, 100339, to_date('31-10-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101340, 99279, 100340, to_date('20-06-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101341, 67162, 100341, to_date('02-11-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101342, 14081, 100342, to_date('28-03-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101343, 54898, 100343, to_date('19-07-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101344, 24474, 100344, to_date('06-06-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101345, 63040, 100345, to_date('12-07-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101346, 86861, 100346, to_date('01-08-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101347, 99412, 100347, to_date('14-05-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101348, 16497, 100348, to_date('06-06-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101349, 81322, 100349, to_date('10-03-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101350, 10836, 100350, to_date('03-09-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101351, 5668, 100351, to_date('24-06-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101352, 55771, 100352, to_date('17-04-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101353, 18860, 100353, to_date('17-01-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101354, 99222, 100354, to_date('04-09-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101355, 78511, 100355, to_date('12-03-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101356, 29421, 100356, to_date('01-01-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101357, 29199, 100357, to_date('02-01-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101358, 63752, 100358, to_date('15-04-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101359, 42994, 100359, to_date('08-05-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101360, 77318, 100360, to_date('13-08-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101361, 73653, 100361, to_date('17-04-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101362, 50271, 100362, to_date('11-11-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101363, 82207, 100363, to_date('08-01-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101364, 31855, 100364, to_date('27-03-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101365, 50069, 100365, to_date('03-09-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101366, 48178, 100366, to_date('24-08-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101367, 89247, 100367, to_date('08-09-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101368, 16458, 100368, to_date('20-10-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101369, 44089, 100369, to_date('07-08-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101370, 24909, 100370, to_date('27-02-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101371, 35721, 100371, to_date('28-05-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101372, 53619, 100372, to_date('03-08-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101373, 36411, 100373, to_date('11-02-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101374, 99287, 100374, to_date('22-09-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101375, 20762, 100375, to_date('12-10-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101376, 81647, 100376, to_date('13-10-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101377, 70302, 100377, to_date('20-08-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101378, 41448, 100378, to_date('05-04-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101379, 85306, 100379, to_date('16-02-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101380, 78289, 100380, to_date('17-03-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101381, 53699, 100381, to_date('15-10-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101382, 13902, 100382, to_date('27-08-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101383, 83257, 100383, to_date('30-05-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101384, 93945, 100384, to_date('30-06-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101385, 71660, 100385, to_date('22-02-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101386, 14751, 100386, to_date('12-07-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101387, 45189, 100387, to_date('05-07-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101388, 89050, 100388, to_date('01-05-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101389, 30526, 100389, to_date('08-02-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101390, 69865, 100390, to_date('06-01-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101391, 74955, 100391, to_date('01-08-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101392, 81877, 100392, to_date('20-05-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101393, 74813, 100393, to_date('05-01-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101394, 57249, 100394, to_date('24-02-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101395, 74710, 100395, to_date('15-07-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101396, 13677, 100396, to_date('16-09-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101397, 20485, 100397, to_date('31-01-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101398, 52639, 100398, to_date('22-08-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101399, 56653, 100399, to_date('03-11-2010', 'dd-mm-yyyy'));
commit;
prompt 400 records loaded
prompt Loading TEAMS...
insert into TEAMS (teamid, workday)
values (104000, 'Monday');
insert into TEAMS (teamid, workday)
values (104001, 'Tuesday');
insert into TEAMS (teamid, workday)
values (104002, 'Wednesday');
insert into TEAMS (teamid, workday)
values (104003, 'Thursday');
insert into TEAMS (teamid, workday)
values (104004, 'Friday');
insert into TEAMS (teamid, workday)
values (104005, 'Saturday');
insert into TEAMS (teamid, workday)
values (104006, 'Sunday');
insert into TEAMS (teamid, workday)
values (104007, 'Monday');
insert into TEAMS (teamid, workday)
values (104008, 'Tuesday');
insert into TEAMS (teamid, workday)
values (104009, 'Wednesday');
insert into TEAMS (teamid, workday)
values (104010, 'Thursday');
insert into TEAMS (teamid, workday)
values (104011, 'Friday');
insert into TEAMS (teamid, workday)
values (104012, 'Saturday');
insert into TEAMS (teamid, workday)
values (104013, 'Sunday');
insert into TEAMS (teamid, workday)
values (104014, 'Monday');
insert into TEAMS (teamid, workday)
values (104015, 'Tuesday');
insert into TEAMS (teamid, workday)
values (104016, 'Wednesday');
insert into TEAMS (teamid, workday)
values (104017, 'Thursday');
insert into TEAMS (teamid, workday)
values (104018, 'Friday');
insert into TEAMS (teamid, workday)
values (104019, 'Saturday');
insert into TEAMS (teamid, workday)
values (104020, 'Sunday');
insert into TEAMS (teamid, workday)
values (104021, 'Monday');
insert into TEAMS (teamid, workday)
values (104022, 'Tuesday');
insert into TEAMS (teamid, workday)
values (104023, 'Wednesday');
insert into TEAMS (teamid, workday)
values (104024, 'Thursday');
insert into TEAMS (teamid, workday)
values (104025, 'Friday');
insert into TEAMS (teamid, workday)
values (104026, 'Saturday');
insert into TEAMS (teamid, workday)
values (104027, 'Sunday');
insert into TEAMS (teamid, workday)
values (104028, 'Monday');
insert into TEAMS (teamid, workday)
values (104029, 'Tuesday');
insert into TEAMS (teamid, workday)
values (104030, 'Wednesday');
insert into TEAMS (teamid, workday)
values (104031, 'Thursday');
insert into TEAMS (teamid, workday)
values (104032, 'Friday');
insert into TEAMS (teamid, workday)
values (104033, 'Saturday');
insert into TEAMS (teamid, workday)
values (104034, 'Sunday');
insert into TEAMS (teamid, workday)
values (104035, 'Monday');
insert into TEAMS (teamid, workday)
values (104036, 'Tuesday');
insert into TEAMS (teamid, workday)
values (104037, 'Wednesday');
insert into TEAMS (teamid, workday)
values (104038, 'Thursday');
insert into TEAMS (teamid, workday)
values (104039, 'Friday');
insert into TEAMS (teamid, workday)
values (104040, 'Saturday');
insert into TEAMS (teamid, workday)
values (104041, 'Sunday');
insert into TEAMS (teamid, workday)
values (104042, 'Monday');
insert into TEAMS (teamid, workday)
values (104043, 'Tuesday');
insert into TEAMS (teamid, workday)
values (104044, 'Wednesday');
insert into TEAMS (teamid, workday)
values (104045, 'Thursday');
insert into TEAMS (teamid, workday)
values (104046, 'Friday');
insert into TEAMS (teamid, workday)
values (104047, 'Saturday');
insert into TEAMS (teamid, workday)
values (104048, 'Sunday');
insert into TEAMS (teamid, workday)
values (104049, 'Monday');
insert into TEAMS (teamid, workday)
values (104050, 'Tuesday');
insert into TEAMS (teamid, workday)
values (104051, 'Wednesday');
insert into TEAMS (teamid, workday)
values (104052, 'Thursday');
insert into TEAMS (teamid, workday)
values (104053, 'Friday');
insert into TEAMS (teamid, workday)
values (104054, 'Saturday');
insert into TEAMS (teamid, workday)
values (104055, 'Sunday');
insert into TEAMS (teamid, workday)
values (104056, 'Monday');
insert into TEAMS (teamid, workday)
values (104057, 'Tuesday');
insert into TEAMS (teamid, workday)
values (104058, 'Wednesday');
insert into TEAMS (teamid, workday)
values (104059, 'Thursday');
insert into TEAMS (teamid, workday)
values (104060, 'Friday');
insert into TEAMS (teamid, workday)
values (104061, 'Saturday');
insert into TEAMS (teamid, workday)
values (104062, 'Sunday');
insert into TEAMS (teamid, workday)
values (104063, 'Monday');
insert into TEAMS (teamid, workday)
values (104064, 'Tuesday');
insert into TEAMS (teamid, workday)
values (104065, 'Wednesday');
insert into TEAMS (teamid, workday)
values (104066, 'Thursday');
insert into TEAMS (teamid, workday)
values (104067, 'Friday');
insert into TEAMS (teamid, workday)
values (104068, 'Saturday');
insert into TEAMS (teamid, workday)
values (104069, 'Sunday');
insert into TEAMS (teamid, workday)
values (104070, 'Monday');
insert into TEAMS (teamid, workday)
values (104071, 'Tuesday');
insert into TEAMS (teamid, workday)
values (104072, 'Wednesday');
insert into TEAMS (teamid, workday)
values (104073, 'Thursday');
insert into TEAMS (teamid, workday)
values (104074, 'Friday');
insert into TEAMS (teamid, workday)
values (104075, 'Saturday');
insert into TEAMS (teamid, workday)
values (104076, 'Sunday');
insert into TEAMS (teamid, workday)
values (104077, 'Monday');
insert into TEAMS (teamid, workday)
values (104078, 'Tuesday');
insert into TEAMS (teamid, workday)
values (104079, 'Wednesday');
insert into TEAMS (teamid, workday)
values (104080, 'Thursday');
insert into TEAMS (teamid, workday)
values (104081, 'Friday');
insert into TEAMS (teamid, workday)
values (104082, 'Saturday');
insert into TEAMS (teamid, workday)
values (104083, 'Sunday');
insert into TEAMS (teamid, workday)
values (104084, 'Monday');
insert into TEAMS (teamid, workday)
values (104085, 'Tuesday');
insert into TEAMS (teamid, workday)
values (104086, 'Wednesday');
insert into TEAMS (teamid, workday)
values (104087, 'Thursday');
insert into TEAMS (teamid, workday)
values (104088, 'Friday');
insert into TEAMS (teamid, workday)
values (104089, 'Saturday');
insert into TEAMS (teamid, workday)
values (104090, 'Sunday');
insert into TEAMS (teamid, workday)
values (104091, 'Monday');
insert into TEAMS (teamid, workday)
values (104092, 'Tuesday');
insert into TEAMS (teamid, workday)
values (104093, 'Wednesday');
insert into TEAMS (teamid, workday)
values (104094, 'Thursday');
insert into TEAMS (teamid, workday)
values (104095, 'Friday');
insert into TEAMS (teamid, workday)
values (104096, 'Saturday');
insert into TEAMS (teamid, workday)
values (104097, 'Sunday');
insert into TEAMS (teamid, workday)
values (104098, 'Monday');
insert into TEAMS (teamid, workday)
values (104099, 'Tuesday');
commit;
prompt 100 records committed...
insert into TEAMS (teamid, workday)
values (104100, 'Wednesday');
insert into TEAMS (teamid, workday)
values (104101, 'Thursday');
insert into TEAMS (teamid, workday)
values (104102, 'Friday');
insert into TEAMS (teamid, workday)
values (104103, 'Saturday');
insert into TEAMS (teamid, workday)
values (104104, 'Sunday');
insert into TEAMS (teamid, workday)
values (104105, 'Monday');
insert into TEAMS (teamid, workday)
values (104106, 'Tuesday');
insert into TEAMS (teamid, workday)
values (104107, 'Wednesday');
insert into TEAMS (teamid, workday)
values (104108, 'Thursday');
insert into TEAMS (teamid, workday)
values (104109, 'Friday');
insert into TEAMS (teamid, workday)
values (104110, 'Saturday');
insert into TEAMS (teamid, workday)
values (104111, 'Sunday');
insert into TEAMS (teamid, workday)
values (104112, 'Monday');
insert into TEAMS (teamid, workday)
values (104113, 'Tuesday');
insert into TEAMS (teamid, workday)
values (104114, 'Wednesday');
insert into TEAMS (teamid, workday)
values (104115, 'Thursday');
insert into TEAMS (teamid, workday)
values (104116, 'Friday');
insert into TEAMS (teamid, workday)
values (104117, 'Saturday');
insert into TEAMS (teamid, workday)
values (104118, 'Sunday');
insert into TEAMS (teamid, workday)
values (104119, 'Monday');
insert into TEAMS (teamid, workday)
values (104120, 'Tuesday');
insert into TEAMS (teamid, workday)
values (104121, 'Wednesday');
insert into TEAMS (teamid, workday)
values (104122, 'Thursday');
insert into TEAMS (teamid, workday)
values (104123, 'Friday');
insert into TEAMS (teamid, workday)
values (104124, 'Saturday');
insert into TEAMS (teamid, workday)
values (104125, 'Sunday');
insert into TEAMS (teamid, workday)
values (104126, 'Monday');
insert into TEAMS (teamid, workday)
values (104127, 'Tuesday');
insert into TEAMS (teamid, workday)
values (104128, 'Wednesday');
insert into TEAMS (teamid, workday)
values (104129, 'Thursday');
insert into TEAMS (teamid, workday)
values (104130, 'Friday');
insert into TEAMS (teamid, workday)
values (104131, 'Saturday');
insert into TEAMS (teamid, workday)
values (104132, 'Sunday');
insert into TEAMS (teamid, workday)
values (104133, 'Monday');
insert into TEAMS (teamid, workday)
values (104134, 'Tuesday');
insert into TEAMS (teamid, workday)
values (104135, 'Wednesday');
insert into TEAMS (teamid, workday)
values (104136, 'Thursday');
insert into TEAMS (teamid, workday)
values (104137, 'Friday');
insert into TEAMS (teamid, workday)
values (104138, 'Saturday');
insert into TEAMS (teamid, workday)
values (104139, 'Sunday');
insert into TEAMS (teamid, workday)
values (104140, 'Monday');
insert into TEAMS (teamid, workday)
values (104141, 'Tuesday');
insert into TEAMS (teamid, workday)
values (104142, 'Wednesday');
insert into TEAMS (teamid, workday)
values (104143, 'Thursday');
insert into TEAMS (teamid, workday)
values (104144, 'Friday');
insert into TEAMS (teamid, workday)
values (104145, 'Saturday');
insert into TEAMS (teamid, workday)
values (104146, 'Sunday');
insert into TEAMS (teamid, workday)
values (104147, 'Monday');
insert into TEAMS (teamid, workday)
values (104148, 'Tuesday');
insert into TEAMS (teamid, workday)
values (104149, 'Wednesday');
insert into TEAMS (teamid, workday)
values (104150, 'Thursday');
insert into TEAMS (teamid, workday)
values (104151, 'Friday');
insert into TEAMS (teamid, workday)
values (104152, 'Saturday');
insert into TEAMS (teamid, workday)
values (104153, 'Sunday');
insert into TEAMS (teamid, workday)
values (104154, 'Monday');
insert into TEAMS (teamid, workday)
values (104155, 'Tuesday');
insert into TEAMS (teamid, workday)
values (104156, 'Wednesday');
insert into TEAMS (teamid, workday)
values (104157, 'Thursday');
insert into TEAMS (teamid, workday)
values (104158, 'Friday');
insert into TEAMS (teamid, workday)
values (104159, 'Saturday');
insert into TEAMS (teamid, workday)
values (104160, 'Sunday');
insert into TEAMS (teamid, workday)
values (104161, 'Monday');
insert into TEAMS (teamid, workday)
values (104162, 'Tuesday');
insert into TEAMS (teamid, workday)
values (104163, 'Wednesday');
insert into TEAMS (teamid, workday)
values (104164, 'Thursday');
insert into TEAMS (teamid, workday)
values (104165, 'Friday');
insert into TEAMS (teamid, workday)
values (104166, 'Saturday');
insert into TEAMS (teamid, workday)
values (104167, 'Sunday');
insert into TEAMS (teamid, workday)
values (104168, 'Monday');
insert into TEAMS (teamid, workday)
values (104169, 'Tuesday');
insert into TEAMS (teamid, workday)
values (104170, 'Wednesday');
insert into TEAMS (teamid, workday)
values (104171, 'Thursday');
insert into TEAMS (teamid, workday)
values (104172, 'Friday');
insert into TEAMS (teamid, workday)
values (104173, 'Saturday');
insert into TEAMS (teamid, workday)
values (104174, 'Sunday');
insert into TEAMS (teamid, workday)
values (104175, 'Monday');
insert into TEAMS (teamid, workday)
values (104176, 'Tuesday');
insert into TEAMS (teamid, workday)
values (104177, 'Wednesday');
insert into TEAMS (teamid, workday)
values (104178, 'Thursday');
insert into TEAMS (teamid, workday)
values (104179, 'Friday');
insert into TEAMS (teamid, workday)
values (104180, 'Saturday');
insert into TEAMS (teamid, workday)
values (104181, 'Sunday');
insert into TEAMS (teamid, workday)
values (104182, 'Monday');
insert into TEAMS (teamid, workday)
values (104183, 'Tuesday');
insert into TEAMS (teamid, workday)
values (104184, 'Wednesday');
insert into TEAMS (teamid, workday)
values (104185, 'Thursday');
insert into TEAMS (teamid, workday)
values (104186, 'Friday');
insert into TEAMS (teamid, workday)
values (104187, 'Saturday');
insert into TEAMS (teamid, workday)
values (104188, 'Sunday');
insert into TEAMS (teamid, workday)
values (104189, 'Monday');
insert into TEAMS (teamid, workday)
values (104190, 'Tuesday');
insert into TEAMS (teamid, workday)
values (104191, 'Wednesday');
insert into TEAMS (teamid, workday)
values (104192, 'Thursday');
insert into TEAMS (teamid, workday)
values (104193, 'Friday');
insert into TEAMS (teamid, workday)
values (104194, 'Saturday');
insert into TEAMS (teamid, workday)
values (104195, 'Sunday');
insert into TEAMS (teamid, workday)
values (104196, 'Monday');
insert into TEAMS (teamid, workday)
values (104197, 'Tuesday');
insert into TEAMS (teamid, workday)
values (104198, 'Wednesday');
insert into TEAMS (teamid, workday)
values (104199, 'Thursday');
commit;
prompt 200 records committed...
insert into TEAMS (teamid, workday)
values (104200, 'Friday');
insert into TEAMS (teamid, workday)
values (104201, 'Saturday');
insert into TEAMS (teamid, workday)
values (104202, 'Sunday');
insert into TEAMS (teamid, workday)
values (104203, 'Monday');
insert into TEAMS (teamid, workday)
values (104204, 'Tuesday');
insert into TEAMS (teamid, workday)
values (104205, 'Wednesday');
insert into TEAMS (teamid, workday)
values (104206, 'Thursday');
insert into TEAMS (teamid, workday)
values (104207, 'Friday');
insert into TEAMS (teamid, workday)
values (104208, 'Saturday');
insert into TEAMS (teamid, workday)
values (104209, 'Sunday');
insert into TEAMS (teamid, workday)
values (104210, 'Monday');
insert into TEAMS (teamid, workday)
values (104211, 'Tuesday');
insert into TEAMS (teamid, workday)
values (104212, 'Wednesday');
insert into TEAMS (teamid, workday)
values (104213, 'Thursday');
insert into TEAMS (teamid, workday)
values (104214, 'Friday');
insert into TEAMS (teamid, workday)
values (104215, 'Saturday');
insert into TEAMS (teamid, workday)
values (104216, 'Sunday');
insert into TEAMS (teamid, workday)
values (104217, 'Monday');
insert into TEAMS (teamid, workday)
values (104218, 'Tuesday');
insert into TEAMS (teamid, workday)
values (104219, 'Wednesday');
insert into TEAMS (teamid, workday)
values (104220, 'Thursday');
insert into TEAMS (teamid, workday)
values (104221, 'Friday');
insert into TEAMS (teamid, workday)
values (104222, 'Saturday');
insert into TEAMS (teamid, workday)
values (104223, 'Sunday');
insert into TEAMS (teamid, workday)
values (104224, 'Monday');
insert into TEAMS (teamid, workday)
values (104225, 'Tuesday');
insert into TEAMS (teamid, workday)
values (104226, 'Wednesday');
insert into TEAMS (teamid, workday)
values (104227, 'Thursday');
insert into TEAMS (teamid, workday)
values (104228, 'Friday');
insert into TEAMS (teamid, workday)
values (104229, 'Saturday');
insert into TEAMS (teamid, workday)
values (104230, 'Sunday');
insert into TEAMS (teamid, workday)
values (104231, 'Monday');
insert into TEAMS (teamid, workday)
values (104232, 'Tuesday');
insert into TEAMS (teamid, workday)
values (104233, 'Wednesday');
insert into TEAMS (teamid, workday)
values (104234, 'Thursday');
insert into TEAMS (teamid, workday)
values (104235, 'Friday');
insert into TEAMS (teamid, workday)
values (104236, 'Saturday');
insert into TEAMS (teamid, workday)
values (104237, 'Sunday');
insert into TEAMS (teamid, workday)
values (104238, 'Monday');
insert into TEAMS (teamid, workday)
values (104239, 'Tuesday');
insert into TEAMS (teamid, workday)
values (104240, 'Wednesday');
insert into TEAMS (teamid, workday)
values (104241, 'Thursday');
insert into TEAMS (teamid, workday)
values (104242, 'Friday');
insert into TEAMS (teamid, workday)
values (104243, 'Saturday');
insert into TEAMS (teamid, workday)
values (104244, 'Sunday');
insert into TEAMS (teamid, workday)
values (104245, 'Monday');
insert into TEAMS (teamid, workday)
values (104246, 'Tuesday');
insert into TEAMS (teamid, workday)
values (104247, 'Wednesday');
insert into TEAMS (teamid, workday)
values (104248, 'Thursday');
insert into TEAMS (teamid, workday)
values (104249, 'Friday');
insert into TEAMS (teamid, workday)
values (104250, 'Saturday');
insert into TEAMS (teamid, workday)
values (104251, 'Sunday');
insert into TEAMS (teamid, workday)
values (104252, 'Monday');
insert into TEAMS (teamid, workday)
values (104253, 'Tuesday');
insert into TEAMS (teamid, workday)
values (104254, 'Wednesday');
insert into TEAMS (teamid, workday)
values (104255, 'Thursday');
insert into TEAMS (teamid, workday)
values (104256, 'Friday');
insert into TEAMS (teamid, workday)
values (104257, 'Saturday');
insert into TEAMS (teamid, workday)
values (104258, 'Sunday');
insert into TEAMS (teamid, workday)
values (104259, 'Monday');
insert into TEAMS (teamid, workday)
values (104260, 'Tuesday');
insert into TEAMS (teamid, workday)
values (104261, 'Wednesday');
insert into TEAMS (teamid, workday)
values (104262, 'Thursday');
insert into TEAMS (teamid, workday)
values (104263, 'Friday');
insert into TEAMS (teamid, workday)
values (104264, 'Saturday');
insert into TEAMS (teamid, workday)
values (104265, 'Sunday');
insert into TEAMS (teamid, workday)
values (104266, 'Monday');
insert into TEAMS (teamid, workday)
values (104267, 'Tuesday');
insert into TEAMS (teamid, workday)
values (104268, 'Wednesday');
insert into TEAMS (teamid, workday)
values (104269, 'Thursday');
insert into TEAMS (teamid, workday)
values (104270, 'Friday');
insert into TEAMS (teamid, workday)
values (104271, 'Saturday');
insert into TEAMS (teamid, workday)
values (104272, 'Sunday');
insert into TEAMS (teamid, workday)
values (104273, 'Monday');
insert into TEAMS (teamid, workday)
values (104274, 'Tuesday');
insert into TEAMS (teamid, workday)
values (104275, 'Wednesday');
insert into TEAMS (teamid, workday)
values (104276, 'Thursday');
insert into TEAMS (teamid, workday)
values (104277, 'Friday');
insert into TEAMS (teamid, workday)
values (104278, 'Saturday');
insert into TEAMS (teamid, workday)
values (104279, 'Sunday');
insert into TEAMS (teamid, workday)
values (104280, 'Monday');
insert into TEAMS (teamid, workday)
values (104281, 'Tuesday');
insert into TEAMS (teamid, workday)
values (104282, 'Wednesday');
insert into TEAMS (teamid, workday)
values (104283, 'Thursday');
insert into TEAMS (teamid, workday)
values (104284, 'Friday');
insert into TEAMS (teamid, workday)
values (104285, 'Saturday');
insert into TEAMS (teamid, workday)
values (104286, 'Sunday');
insert into TEAMS (teamid, workday)
values (104287, 'Monday');
insert into TEAMS (teamid, workday)
values (104288, 'Tuesday');
insert into TEAMS (teamid, workday)
values (104289, 'Wednesday');
insert into TEAMS (teamid, workday)
values (104290, 'Thursday');
insert into TEAMS (teamid, workday)
values (104291, 'Friday');
insert into TEAMS (teamid, workday)
values (104292, 'Saturday');
insert into TEAMS (teamid, workday)
values (104293, 'Sunday');
insert into TEAMS (teamid, workday)
values (104294, 'Monday');
insert into TEAMS (teamid, workday)
values (104295, 'Tuesday');
insert into TEAMS (teamid, workday)
values (104296, 'Wednesday');
insert into TEAMS (teamid, workday)
values (104297, 'Thursday');
insert into TEAMS (teamid, workday)
values (104298, 'Friday');
insert into TEAMS (teamid, workday)
values (104299, 'Saturday');
commit;
prompt 300 records committed...
insert into TEAMS (teamid, workday)
values (104300, 'Sunday');
insert into TEAMS (teamid, workday)
values (104301, 'Monday');
insert into TEAMS (teamid, workday)
values (104302, 'Tuesday');
insert into TEAMS (teamid, workday)
values (104303, 'Wednesday');
insert into TEAMS (teamid, workday)
values (104304, 'Thursday');
insert into TEAMS (teamid, workday)
values (104305, 'Friday');
insert into TEAMS (teamid, workday)
values (104306, 'Saturday');
insert into TEAMS (teamid, workday)
values (104307, 'Sunday');
insert into TEAMS (teamid, workday)
values (104308, 'Monday');
insert into TEAMS (teamid, workday)
values (104309, 'Tuesday');
insert into TEAMS (teamid, workday)
values (104310, 'Wednesday');
insert into TEAMS (teamid, workday)
values (104311, 'Thursday');
insert into TEAMS (teamid, workday)
values (104312, 'Friday');
insert into TEAMS (teamid, workday)
values (104313, 'Saturday');
insert into TEAMS (teamid, workday)
values (104314, 'Sunday');
insert into TEAMS (teamid, workday)
values (104315, 'Monday');
insert into TEAMS (teamid, workday)
values (104316, 'Tuesday');
insert into TEAMS (teamid, workday)
values (104317, 'Wednesday');
insert into TEAMS (teamid, workday)
values (104318, 'Thursday');
insert into TEAMS (teamid, workday)
values (104319, 'Friday');
insert into TEAMS (teamid, workday)
values (104320, 'Saturday');
insert into TEAMS (teamid, workday)
values (104321, 'Sunday');
insert into TEAMS (teamid, workday)
values (104322, 'Monday');
insert into TEAMS (teamid, workday)
values (104323, 'Tuesday');
insert into TEAMS (teamid, workday)
values (104324, 'Wednesday');
insert into TEAMS (teamid, workday)
values (104325, 'Thursday');
insert into TEAMS (teamid, workday)
values (104326, 'Friday');
insert into TEAMS (teamid, workday)
values (104327, 'Saturday');
insert into TEAMS (teamid, workday)
values (104328, 'Sunday');
insert into TEAMS (teamid, workday)
values (104329, 'Monday');
insert into TEAMS (teamid, workday)
values (104330, 'Tuesday');
insert into TEAMS (teamid, workday)
values (104331, 'Wednesday');
insert into TEAMS (teamid, workday)
values (104332, 'Thursday');
insert into TEAMS (teamid, workday)
values (104333, 'Friday');
insert into TEAMS (teamid, workday)
values (104334, 'Saturday');
insert into TEAMS (teamid, workday)
values (104335, 'Sunday');
insert into TEAMS (teamid, workday)
values (104336, 'Monday');
insert into TEAMS (teamid, workday)
values (104337, 'Tuesday');
insert into TEAMS (teamid, workday)
values (104338, 'Wednesday');
insert into TEAMS (teamid, workday)
values (104339, 'Thursday');
insert into TEAMS (teamid, workday)
values (104340, 'Friday');
insert into TEAMS (teamid, workday)
values (104341, 'Saturday');
insert into TEAMS (teamid, workday)
values (104342, 'Sunday');
insert into TEAMS (teamid, workday)
values (104343, 'Monday');
insert into TEAMS (teamid, workday)
values (104344, 'Tuesday');
insert into TEAMS (teamid, workday)
values (104345, 'Wednesday');
insert into TEAMS (teamid, workday)
values (104346, 'Thursday');
insert into TEAMS (teamid, workday)
values (104347, 'Friday');
insert into TEAMS (teamid, workday)
values (104348, 'Saturday');
insert into TEAMS (teamid, workday)
values (104349, 'Sunday');
insert into TEAMS (teamid, workday)
values (104350, 'Monday');
insert into TEAMS (teamid, workday)
values (104351, 'Tuesday');
insert into TEAMS (teamid, workday)
values (104352, 'Wednesday');
insert into TEAMS (teamid, workday)
values (104353, 'Thursday');
insert into TEAMS (teamid, workday)
values (104354, 'Friday');
insert into TEAMS (teamid, workday)
values (104355, 'Saturday');
insert into TEAMS (teamid, workday)
values (104356, 'Sunday');
insert into TEAMS (teamid, workday)
values (104357, 'Monday');
insert into TEAMS (teamid, workday)
values (104358, 'Tuesday');
insert into TEAMS (teamid, workday)
values (104359, 'Wednesday');
insert into TEAMS (teamid, workday)
values (104360, 'Thursday');
insert into TEAMS (teamid, workday)
values (104361, 'Friday');
insert into TEAMS (teamid, workday)
values (104362, 'Saturday');
insert into TEAMS (teamid, workday)
values (104363, 'Sunday');
insert into TEAMS (teamid, workday)
values (104364, 'Monday');
insert into TEAMS (teamid, workday)
values (104365, 'Tuesday');
insert into TEAMS (teamid, workday)
values (104366, 'Wednesday');
insert into TEAMS (teamid, workday)
values (104367, 'Thursday');
insert into TEAMS (teamid, workday)
values (104368, 'Friday');
insert into TEAMS (teamid, workday)
values (104369, 'Saturday');
insert into TEAMS (teamid, workday)
values (104370, 'Sunday');
insert into TEAMS (teamid, workday)
values (104371, 'Monday');
insert into TEAMS (teamid, workday)
values (104372, 'Tuesday');
insert into TEAMS (teamid, workday)
values (104373, 'Wednesday');
insert into TEAMS (teamid, workday)
values (104374, 'Thursday');
insert into TEAMS (teamid, workday)
values (104375, 'Friday');
insert into TEAMS (teamid, workday)
values (104376, 'Saturday');
insert into TEAMS (teamid, workday)
values (104377, 'Sunday');
insert into TEAMS (teamid, workday)
values (104378, 'Monday');
insert into TEAMS (teamid, workday)
values (104379, 'Tuesday');
insert into TEAMS (teamid, workday)
values (104380, 'Wednesday');
insert into TEAMS (teamid, workday)
values (104381, 'Thursday');
insert into TEAMS (teamid, workday)
values (104382, 'Friday');
insert into TEAMS (teamid, workday)
values (104383, 'Saturday');
insert into TEAMS (teamid, workday)
values (104384, 'Sunday');
insert into TEAMS (teamid, workday)
values (104385, 'Monday');
insert into TEAMS (teamid, workday)
values (104386, 'Tuesday');
insert into TEAMS (teamid, workday)
values (104387, 'Wednesday');
insert into TEAMS (teamid, workday)
values (104388, 'Thursday');
insert into TEAMS (teamid, workday)
values (104389, 'Friday');
insert into TEAMS (teamid, workday)
values (104390, 'Saturday');
insert into TEAMS (teamid, workday)
values (104391, 'Sunday');
insert into TEAMS (teamid, workday)
values (104392, 'Monday');
insert into TEAMS (teamid, workday)
values (104393, 'Tuesday');
insert into TEAMS (teamid, workday)
values (104394, 'Wednesday');
insert into TEAMS (teamid, workday)
values (104395, 'Thursday');
insert into TEAMS (teamid, workday)
values (104396, 'Friday');
insert into TEAMS (teamid, workday)
values (104397, 'Saturday');
insert into TEAMS (teamid, workday)
values (104398, 'Sunday');
insert into TEAMS (teamid, workday)
values (104399, 'Monday');
commit;
prompt 400 records committed...
insert into TEAMS (teamid, workday)
values (104996, 'sunday');
commit;
prompt 401 records loaded
prompt Loading WORKERS...
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105000, 'Sharon', 'Manager', 103000, 104000, 65);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105001, 'Susan', 'Officer', 103001, 104000, 67);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105002, 'Justin', 'Credit Analyst', 103002, 104000, 68);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105003, 'Troy', 'Loan Closer', 103003, 104000, 64);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105004, 'Alvin', 'Manager', 103004, 104001, 64);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105005, 'Hector', 'Officer', 103005, 104001, 54);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105006, 'Carol', 'Credit Analyst', 103006, 104001, 47);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105007, 'Christopher', 'Loan Closer', 103007, 104001, 34);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105008, 'Melanie', 'Manager', 103008, 104002, 25);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105009, 'Monica', 'Officer', 103009, 104002, 19);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105010, 'Bradley', 'Credit Analyst', 103010, 104002, 82);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105011, 'Ryan', 'Loan Closer', 103011, 104002, 68);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105012, 'Jennifer', 'Manager', 103012, 104003, 80);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105013, 'Anna', 'Officer', 103013, 104003, 85);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105014, 'Loretta', 'Credit Analyst', 103014, 104003, 57);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105015, 'Stacey', 'Loan Closer', 103015, 104003, 80);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105016, 'Brandon', 'Manager', 103016, 104004, 57);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105017, 'Thomas', 'Officer', 103017, 104004, 31);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105018, 'Wayne', 'Credit Analyst', 103018, 104004, 73);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105019, 'Jason', 'Loan Closer', 103019, 104004, 27);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105020, 'Bryan', 'Manager', 103020, 104005, 66);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105021, 'Maria', 'Officer', 103021, 104005, 43);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105022, 'Juan', 'Credit Analyst', 103022, 104005, 64);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105023, 'Carl', 'Loan Closer', 103023, 104005, 66);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105024, 'Andrea', 'Manager', 103024, 104006, 31);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105025, 'Luke', 'Officer', 103025, 104006, 27);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105026, 'Victoria', 'Credit Analyst', 103026, 104006, 29);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105027, 'Jake', 'Loan Closer', 103027, 104006, 41);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105028, 'Amanda', 'Manager', 103028, 104007, 69);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105029, 'Juan', 'Officer', 103029, 104007, 49);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105030, 'James', 'Credit Analyst', 103030, 104007, 55);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105031, 'Brian', 'Loan Closer', 103031, 104007, 37);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105032, 'Samuel', 'Manager', 103032, 104008, 87);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105033, 'Matthew', 'Officer', 103033, 104008, 48);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105034, 'Michael', 'Credit Analyst', 103034, 104008, 64);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105035, 'Jimmy', 'Loan Closer', 103035, 104008, 46);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105036, 'Benjamin', 'Manager', 103036, 104009, 84);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105037, 'Cheryl', 'Officer', 103037, 104009, 77);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105038, 'Bryan', 'Credit Analyst', 103038, 104009, 48);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105039, 'Kayla', 'Loan Closer', 103039, 104009, 87);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105040, 'Stephanie', 'Manager', 103040, 104010, 83);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105041, 'Lisa', 'Officer', 103041, 104010, 70);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105042, 'Ricardo', 'Credit Analyst', 103042, 104010, 70);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105043, 'Theodore', 'Loan Closer', 103043, 104010, 81);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105044, 'Brittany', 'Manager', 103044, 104011, 44);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105045, 'Robert', 'Officer', 103045, 104011, 56);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105046, 'Susan', 'Credit Analyst', 103046, 104011, 65);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105047, 'Nicole', 'Loan Closer', 103047, 104011, 24);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105048, 'Melanie', 'Manager', 103048, 104012, 80);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105049, 'Andrew', 'Officer', 103049, 104012, 22);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105050, 'David', 'Credit Analyst', 103050, 104012, 48);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105051, 'Brett', 'Loan Closer', 103051, 104012, 69);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105052, 'Vincent', 'Manager', 103052, 104013, 24);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105053, 'Kimberly', 'Officer', 103053, 104013, 67);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105054, 'Meghan', 'Credit Analyst', 103054, 104013, 52);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105055, 'Brandi', 'Loan Closer', 103055, 104013, 37);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105056, 'James', 'Manager', 103056, 104014, 40);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105057, 'Sarah', 'Officer', 103057, 104014, 24);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105058, 'Michael', 'Credit Analyst', 103058, 104014, 90);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105059, 'Tracy', 'Loan Closer', 103059, 104014, 56);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105060, 'Emily', 'Manager', 103060, 104015, 33);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105061, 'Rachel', 'Officer', 103061, 104015, 22);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105062, 'Mitchell', 'Credit Analyst', 103062, 104015, 85);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105063, 'Blake', 'Loan Closer', 103063, 104015, 53);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105064, 'Nichole', 'Manager', 103064, 104016, 89);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105065, 'Rachel', 'Officer', 103065, 104016, 85);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105066, 'Amanda', 'Credit Analyst', 103066, 104016, 43);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105067, 'Amanda', 'Loan Closer', 103067, 104016, 64);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105068, 'Mary', 'Manager', 103068, 104017, 55);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105069, 'Catherine', 'Officer', 103069, 104017, 65);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105070, 'Lisa', 'Credit Analyst', 103070, 104017, 60);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105071, 'Jessica', 'Loan Closer', 103071, 104017, 43);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105072, 'Kathryn', 'Manager', 103072, 104018, 26);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105073, 'Mary', 'Officer', 103073, 104018, 27);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105074, 'Glenn', 'Credit Analyst', 103074, 104018, 34);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105075, 'Ryan', 'Loan Closer', 103075, 104018, 79);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105076, 'Jason', 'Manager', 103076, 104019, 88);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105077, 'Brittany', 'Officer', 103077, 104019, 50);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105078, 'Joseph', 'Credit Analyst', 103078, 104019, 48);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105079, 'Eric', 'Loan Closer', 103079, 104019, 68);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105080, 'Albert', 'Manager', 103080, 104020, 20);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105081, 'Tara', 'Officer', 103081, 104020, 80);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105082, 'Kristy', 'Credit Analyst', 103082, 104020, 72);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105083, 'Joseph', 'Loan Closer', 103083, 104020, 38);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105084, 'John', 'Manager', 103084, 104021, 48);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105085, 'Derek', 'Officer', 103085, 104021, 32);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105086, 'Troy', 'Credit Analyst', 103086, 104021, 35);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105087, 'Chad', 'Loan Closer', 103087, 104021, 19);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105088, 'Sarah', 'Manager', 103088, 104022, 79);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105089, 'Donald', 'Officer', 103089, 104022, 78);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105090, 'Steven', 'Credit Analyst', 103090, 104022, 42);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105091, 'Linda', 'Loan Closer', 103091, 104022, 66);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105092, 'Diana', 'Manager', 103092, 104023, 76);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105093, 'Alexander', 'Officer', 103093, 104023, 87);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105094, 'Jennifer', 'Credit Analyst', 103094, 104023, 85);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105095, 'Diane', 'Loan Closer', 103095, 104023, 76);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105096, 'Charles', 'Manager', 103096, 104024, 73);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105097, 'Tracy', 'Officer', 103097, 104024, 68);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105098, 'Stephanie', 'Credit Analyst', 103098, 104024, 20);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105099, 'Lori', 'Loan Closer', 103099, 104024, 82);
commit;
prompt 100 records committed...
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105100, 'Alexandra', 'Manager', 103100, 104025, 25);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105101, 'Sharon', 'Officer', 103101, 104025, 71);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105102, 'Jeffrey', 'Credit Analyst', 103102, 104025, 35);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105103, 'Molly', 'Loan Closer', 103103, 104025, 78);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105104, 'Olivia', 'Manager', 103104, 104026, 59);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105105, 'Ronald', 'Officer', 103105, 104026, 61);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105106, 'Joseph', 'Credit Analyst', 103106, 104026, 89);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105107, 'Brian', 'Loan Closer', 103107, 104026, 80);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105108, 'Russell', 'Manager', 103108, 104027, 87);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105109, 'Sarah', 'Officer', 103109, 104027, 31);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105110, 'Michele', 'Credit Analyst', 103110, 104027, 42);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105111, 'Michelle', 'Loan Closer', 103111, 104027, 76);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105112, 'Sarah', 'Manager', 103112, 104028, 89);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105113, 'Ian', 'Officer', 103113, 104028, 40);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105114, 'Kelly', 'Credit Analyst', 103114, 104028, 25);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105115, 'Eric', 'Loan Closer', 103115, 104028, 54);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105116, 'Richard', 'Manager', 103116, 104029, 58);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105117, 'Gloria', 'Officer', 103117, 104029, 74);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105118, 'William', 'Credit Analyst', 103118, 104029, 32);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105119, 'Jennifer', 'Loan Closer', 103119, 104029, 31);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105120, 'Heather', 'Manager', 103120, 104030, 59);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105121, 'Ashley', 'Officer', 103121, 104030, 27);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105122, 'Shannon', 'Credit Analyst', 103122, 104030, 46);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105123, 'Annette', 'Loan Closer', 103123, 104030, 62);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105124, 'Lawrence', 'Manager', 103124, 104031, 89);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105125, 'Jennifer', 'Officer', 103125, 104031, 19);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105126, 'Kirk', 'Credit Analyst', 103126, 104031, 74);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105127, 'Michele', 'Loan Closer', 103127, 104031, 73);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105128, 'Jeffery', 'Manager', 103128, 104032, 19);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105129, 'Joshua', 'Officer', 103129, 104032, 40);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105130, 'John', 'Credit Analyst', 103130, 104032, 34);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105131, 'Tammy', 'Loan Closer', 103131, 104032, 87);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105132, 'Brandy', 'Manager', 103132, 104033, 78);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105133, 'Brittney', 'Officer', 103133, 104033, 79);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105134, 'Aaron', 'Credit Analyst', 103134, 104033, 41);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105135, 'Adam', 'Loan Closer', 103135, 104033, 44);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105136, 'Darlene', 'Manager', 103136, 104034, 34);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105137, 'Alisha', 'Officer', 103137, 104034, 85);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105138, 'Melanie', 'Credit Analyst', 103138, 104034, 18);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105139, 'Erika', 'Loan Closer', 103139, 104034, 31);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105140, 'Tanya', 'Manager', 103140, 104035, 51);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105141, 'Ana', 'Officer', 103141, 104035, 55);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105142, 'Joshua', 'Credit Analyst', 103142, 104035, 85);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105143, 'Ronnie', 'Loan Closer', 103143, 104035, 73);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105144, 'Christina', 'Manager', 103144, 104036, 34);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105145, 'Alan', 'Officer', 103145, 104036, 51);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105146, 'Daniel', 'Credit Analyst', 103146, 104036, 53);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105147, 'Patrick', 'Loan Closer', 103147, 104036, 69);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105148, 'Jeremy', 'Manager', 103148, 104037, 25);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105149, 'Deborah', 'Officer', 103149, 104037, 68);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105150, 'Stephanie', 'Credit Analyst', 103150, 104037, 71);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105151, 'Adam', 'Loan Closer', 103151, 104037, 77);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105152, 'Denise', 'Manager', 103152, 104038, 32);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105153, 'John', 'Officer', 103153, 104038, 85);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105154, 'Jonathan', 'Credit Analyst', 103154, 104038, 41);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105155, 'Victoria', 'Loan Closer', 103155, 104038, 84);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105156, 'Kristen', 'Manager', 103156, 104039, 73);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105157, 'Nicole', 'Officer', 103157, 104039, 76);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105158, 'Kathleen', 'Credit Analyst', 103158, 104039, 48);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105159, 'Katherine', 'Loan Closer', 103159, 104039, 52);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105160, 'Kenneth', 'Manager', 103160, 104040, 47);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105161, 'Nathan', 'Officer', 103161, 104040, 55);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105162, 'Dana', 'Credit Analyst', 103162, 104040, 80);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105163, 'Melissa', 'Loan Closer', 103163, 104040, 33);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105164, 'Crystal', 'Manager', 103164, 104041, 90);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105165, 'Michael', 'Officer', 103165, 104041, 78);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105166, 'Kyle', 'Credit Analyst', 103166, 104041, 34);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105167, 'David', 'Loan Closer', 103167, 104041, 81);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105168, 'Ronald', 'Manager', 103168, 104042, 59);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105169, 'Vincent', 'Officer', 103169, 104042, 73);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105170, 'Leah', 'Credit Analyst', 103170, 104042, 67);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105171, 'Stephen', 'Loan Closer', 103171, 104042, 65);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105172, 'Jenna', 'Manager', 103172, 104043, 82);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105173, 'Anna', 'Officer', 103173, 104043, 19);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105174, 'Charles', 'Credit Analyst', 103174, 104043, 69);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105175, 'Dustin', 'Loan Closer', 103175, 104043, 30);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105176, 'Jennifer', 'Manager', 103176, 104044, 66);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105177, 'Jacob', 'Officer', 103177, 104044, 75);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105178, 'Kevin', 'Credit Analyst', 103178, 104044, 28);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105179, 'David', 'Loan Closer', 103179, 104044, 65);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105180, 'Brett', 'Manager', 103180, 104045, 79);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105181, 'Logan', 'Officer', 103181, 104045, 75);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105182, 'Aaron', 'Credit Analyst', 103182, 104045, 41);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105183, 'Christine', 'Loan Closer', 103183, 104045, 43);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105184, 'Maria', 'Manager', 103184, 104046, 72);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105185, 'Danielle', 'Officer', 103185, 104046, 61);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105186, 'Caleb', 'Credit Analyst', 103186, 104046, 39);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105187, 'Leslie', 'Loan Closer', 103187, 104046, 21);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105188, 'Steven', 'Manager', 103188, 104047, 90);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105189, 'Heather', 'Officer', 103189, 104047, 41);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105190, 'Devon', 'Credit Analyst', 103190, 104047, 54);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105191, 'Richard', 'Loan Closer', 103191, 104047, 34);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105192, 'Patricia', 'Manager', 103192, 104048, 43);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105193, 'Carly', 'Officer', 103193, 104048, 79);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105194, 'David', 'Credit Analyst', 103194, 104048, 86);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105195, 'Nicole', 'Loan Closer', 103195, 104048, 46);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105196, 'Deanna', 'Manager', 103196, 104049, 21);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105197, 'Bobby', 'Officer', 103197, 104049, 40);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105198, 'Timothy', 'Credit Analyst', 103198, 104049, 45);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105199, 'Michelle', 'Loan Closer', 103199, 104049, 25);
commit;
prompt 200 records committed...
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105200, 'Lindsay', 'Manager', 103200, 104050, 47);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105201, 'Lindsay', 'Officer', 103201, 104050, 58);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105202, 'Brandon', 'Credit Analyst', 103202, 104050, 48);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105203, 'Jason', 'Loan Closer', 103203, 104050, 82);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105204, 'Nicole', 'Manager', 103204, 104051, 29);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105205, 'Erin', 'Officer', 103205, 104051, 56);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105206, 'Melissa', 'Credit Analyst', 103206, 104051, 67);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105207, 'Susan', 'Loan Closer', 103207, 104051, 24);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105208, 'Tiffany', 'Manager', 103208, 104052, 64);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105209, 'Maria', 'Officer', 103209, 104052, 54);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105210, 'Sarah', 'Credit Analyst', 103210, 104052, 44);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105211, 'Sandra', 'Loan Closer', 103211, 104052, 35);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105212, 'Nathan', 'Manager', 103212, 104053, 63);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105213, 'Jessica', 'Officer', 103213, 104053, 89);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105214, 'Renee', 'Credit Analyst', 103214, 104053, 81);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105215, 'Cindy', 'Loan Closer', 103215, 104053, 61);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105216, 'Tracy', 'Manager', 103216, 104054, 55);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105217, 'Nicholas', 'Officer', 103217, 104054, 79);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105218, 'Zachary', 'Credit Analyst', 103218, 104054, 28);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105219, 'Brad', 'Loan Closer', 103219, 104054, 62);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105220, 'Michael', 'Manager', 103220, 104055, 65);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105221, 'Spencer', 'Officer', 103221, 104055, 22);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105222, 'Alex', 'Credit Analyst', 103222, 104055, 68);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105223, 'Eric', 'Loan Closer', 103223, 104055, 67);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105224, 'Aaron', 'Manager', 103224, 104056, 27);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105225, 'Kenneth', 'Officer', 103225, 104056, 53);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105226, 'Michael', 'Credit Analyst', 103226, 104056, 49);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105227, 'James', 'Loan Closer', 103227, 104056, 85);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105228, 'Nathan', 'Manager', 103228, 104057, 29);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105229, 'Tracy', 'Officer', 103229, 104057, 26);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105230, 'Dawn', 'Credit Analyst', 103230, 104057, 42);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105231, 'Mikayla', 'Loan Closer', 103231, 104057, 41);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105232, 'Samantha', 'Manager', 103232, 104058, 72);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105233, 'Gloria', 'Officer', 103233, 104058, 36);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105234, 'Candice', 'Credit Analyst', 103234, 104058, 21);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105235, 'Brandon', 'Loan Closer', 103235, 104058, 69);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105236, 'Debbie', 'Manager', 103236, 104059, 77);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105237, 'Bryan', 'Officer', 103237, 104059, 27);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105238, 'John', 'Credit Analyst', 103238, 104059, 72);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105239, 'Melissa', 'Loan Closer', 103239, 104059, 43);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105240, 'Yolanda', 'Manager', 103240, 104060, 36);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105241, 'Michael', 'Officer', 103241, 104060, 26);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105242, 'Jessica', 'Credit Analyst', 103242, 104060, 63);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105243, 'Elizabeth', 'Loan Closer', 103243, 104060, 48);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105244, 'Russell', 'Manager', 103244, 104061, 22);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105245, 'Valerie', 'Officer', 103245, 104061, 82);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105246, 'Charles', 'Credit Analyst', 103246, 104061, 21);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105247, 'Paul', 'Loan Closer', 103247, 104061, 39);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105248, 'Bradley', 'Manager', 103248, 104062, 21);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105249, 'Allison', 'Officer', 103249, 104062, 33);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105250, 'Nicholas', 'Credit Analyst', 103250, 104062, 26);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105251, 'Cheryl', 'Loan Closer', 103251, 104062, 27);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105252, 'Amanda', 'Manager', 103252, 104063, 23);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105253, 'Loretta', 'Officer', 103253, 104063, 58);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105254, 'Ruth', 'Credit Analyst', 103254, 104063, 51);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105255, 'Patricia', 'Loan Closer', 103255, 104063, 80);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105256, 'Luke', 'Manager', 103256, 104064, 63);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105257, 'Donald', 'Officer', 103257, 104064, 44);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105258, 'Sheena', 'Credit Analyst', 103258, 104064, 76);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105259, 'Sherry', 'Loan Closer', 103259, 104064, 38);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105260, 'Meghan', 'Manager', 103260, 104065, 67);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105261, 'Lisa', 'Officer', 103261, 104065, 22);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105262, 'Kristina', 'Credit Analyst', 103262, 104065, 70);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105263, 'Tina', 'Loan Closer', 103263, 104065, 37);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105264, 'Randall', 'Manager', 103264, 104066, 31);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105265, 'Shelley', 'Officer', 103265, 104066, 59);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105266, 'Suzanne', 'Credit Analyst', 103266, 104066, 55);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105267, 'Sandra', 'Loan Closer', 103267, 104066, 73);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105268, 'John', 'Manager', 103268, 104067, 26);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105269, 'Rick', 'Officer', 103269, 104067, 50);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105270, 'Sarah', 'Credit Analyst', 103270, 104067, 69);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105271, 'Gregory', 'Loan Closer', 103271, 104067, 23);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105272, 'John', 'Manager', 103272, 104068, 39);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105273, 'Thomas', 'Officer', 103273, 104068, 54);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105274, 'Matthew', 'Credit Analyst', 103274, 104068, 81);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105275, 'Gregory', 'Loan Closer', 103275, 104068, 73);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105276, 'Henry', 'Manager', 103276, 104069, 44);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105277, 'Angela', 'Officer', 103277, 104069, 81);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105278, 'Kristin', 'Credit Analyst', 103278, 104069, 31);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105279, 'Kimberly', 'Loan Closer', 103279, 104069, 85);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105280, 'Ronald', 'Manager', 103280, 104070, 23);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105281, 'Brittany', 'Officer', 103281, 104070, 67);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105282, 'Ryan', 'Credit Analyst', 103282, 104070, 87);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105283, 'Adrian', 'Loan Closer', 103283, 104070, 63);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105284, 'Mindy', 'Manager', 103284, 104071, 56);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105285, 'Stacy', 'Officer', 103285, 104071, 46);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105286, 'Michelle', 'Credit Analyst', 103286, 104071, 76);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105287, 'Jeffrey', 'Loan Closer', 103287, 104071, 28);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105288, 'Stephanie', 'Manager', 103288, 104072, 41);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105289, 'Sean', 'Officer', 103289, 104072, 77);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105290, 'Kevin', 'Credit Analyst', 103290, 104072, 60);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105291, 'Stephanie', 'Loan Closer', 103291, 104072, 70);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105292, 'Ernest', 'Manager', 103292, 104073, 80);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105293, 'Joel', 'Officer', 103293, 104073, 40);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105294, 'Harry', 'Credit Analyst', 103294, 104073, 32);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105295, 'Linda', 'Loan Closer', 103295, 104073, 81);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105296, 'Erica', 'Manager', 103296, 104074, 68);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105297, 'Patricia', 'Officer', 103297, 104074, 68);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105298, 'Kendra', 'Credit Analyst', 103298, 104074, 32);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105299, 'Dennis', 'Loan Closer', 103299, 104074, 25);
commit;
prompt 300 records committed...
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105300, 'Nicole', 'Manager', 103300, 104075, 18);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105301, 'Andrew', 'Officer', 103301, 104075, 55);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105302, 'Jenna', 'Credit Analyst', 103302, 104075, 69);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105303, 'Caitlin', 'Loan Closer', 103303, 104075, 31);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105304, 'Robert', 'Manager', 103304, 104076, 76);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105305, 'Frank', 'Officer', 103305, 104076, 78);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105306, 'Luis', 'Credit Analyst', 103306, 104076, 63);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105307, 'Ryan', 'Loan Closer', 103307, 104076, 60);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105308, 'Katelyn', 'Manager', 103308, 104077, 51);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105309, 'Rachel', 'Officer', 103309, 104077, 45);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105310, 'Jessica', 'Credit Analyst', 103310, 104077, 86);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105311, 'Elizabeth', 'Loan Closer', 103311, 104077, 71);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105312, 'Lisa', 'Manager', 103312, 104078, 75);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105313, 'Heather', 'Officer', 103313, 104078, 43);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105314, 'Brian', 'Credit Analyst', 103314, 104078, 56);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105315, 'Richard', 'Loan Closer', 103315, 104078, 64);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105316, 'Phyllis', 'Manager', 103316, 104079, 27);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105317, 'Carla', 'Officer', 103317, 104079, 44);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105318, 'James', 'Credit Analyst', 103318, 104079, 74);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105319, 'Andrea', 'Loan Closer', 103319, 104079, 31);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105320, 'Scott', 'Manager', 103320, 104080, 71);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105321, 'William', 'Officer', 103321, 104080, 73);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105322, 'Marissa', 'Credit Analyst', 103322, 104080, 23);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105323, 'Aaron', 'Loan Closer', 103323, 104080, 86);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105324, 'Teresa', 'Manager', 103324, 104081, 76);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105325, 'Steve', 'Officer', 103325, 104081, 31);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105326, 'Jeffrey', 'Credit Analyst', 103326, 104081, 56);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105327, 'Dorothy', 'Loan Closer', 103327, 104081, 36);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105328, 'Mark', 'Manager', 103328, 104082, 18);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105329, 'Kristi', 'Officer', 103329, 104082, 54);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105330, 'Martha', 'Credit Analyst', 103330, 104082, 56);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105331, 'Melissa', 'Loan Closer', 103331, 104082, 78);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105332, 'Sergio', 'Manager', 103332, 104083, 25);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105333, 'Julia', 'Officer', 103333, 104083, 64);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105334, 'Jason', 'Credit Analyst', 103334, 104083, 32);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105335, 'John', 'Loan Closer', 103335, 104083, 84);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105336, 'Christine', 'Manager', 103336, 104084, 49);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105337, 'Stephen', 'Officer', 103337, 104084, 52);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105338, 'Jason', 'Credit Analyst', 103338, 104084, 54);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105339, 'Sheila', 'Loan Closer', 103339, 104084, 50);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105340, 'Christopher', 'Manager', 103340, 104085, 79);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105341, 'Cory', 'Officer', 103341, 104085, 71);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105342, 'Ian', 'Credit Analyst', 103342, 104085, 32);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105343, 'Felicia', 'Loan Closer', 103343, 104085, 20);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105344, 'Mark', 'Manager', 103344, 104086, 68);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105345, 'George', 'Officer', 103345, 104086, 51);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105346, 'Breanna', 'Credit Analyst', 103346, 104086, 73);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105347, 'Megan', 'Loan Closer', 103347, 104086, 20);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105348, 'Emily', 'Manager', 103348, 104087, 77);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105349, 'Tina', 'Officer', 103349, 104087, 33);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105350, 'Kyle', 'Credit Analyst', 103350, 104087, 61);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105351, 'Christopher', 'Loan Closer', 103351, 104087, 51);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105352, 'Meagan', 'Manager', 103352, 104088, 46);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105353, 'Brandi', 'Officer', 103353, 104088, 30);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105354, 'Bryan', 'Credit Analyst', 103354, 104088, 71);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105355, 'Jonathan', 'Loan Closer', 103355, 104088, 63);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105356, 'Dennis', 'Manager', 103356, 104089, 70);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105357, 'Daniel', 'Officer', 103357, 104089, 34);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105358, 'Donald', 'Credit Analyst', 103358, 104089, 57);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105359, 'Charles', 'Loan Closer', 103359, 104089, 59);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105360, 'Shawn', 'Manager', 103360, 104090, 32);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105361, 'Ann', 'Officer', 103361, 104090, 21);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105362, 'Rebekah', 'Credit Analyst', 103362, 104090, 20);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105363, 'Jonathan', 'Loan Closer', 103363, 104090, 61);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105364, 'Natasha', 'Manager', 103364, 104091, 42);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105365, 'Samantha', 'Officer', 103365, 104091, 50);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105366, 'Shawn', 'Credit Analyst', 103366, 104091, 31);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105367, 'Erin', 'Loan Closer', 103367, 104091, 64);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105368, 'Jennifer', 'Manager', 103368, 104092, 72);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105369, 'Sharon', 'Officer', 103369, 104092, 30);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105370, 'Andrew', 'Credit Analyst', 103370, 104092, 46);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105371, 'Brandy', 'Loan Closer', 103371, 104092, 24);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105372, 'Jo', 'Manager', 103372, 104093, 25);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105373, 'Kevin', 'Officer', 103373, 104093, 49);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105374, 'Zachary', 'Credit Analyst', 103374, 104093, 37);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105375, 'Kelly', 'Loan Closer', 103375, 104093, 87);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105376, 'Allen', 'Manager', 103376, 104094, 87);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105377, 'Julia', 'Officer', 103377, 104094, 72);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105378, 'Brian', 'Credit Analyst', 103378, 104094, 80);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105379, 'Tracy', 'Loan Closer', 103379, 104094, 19);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105380, 'Craig', 'Manager', 103380, 104095, 70);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105381, 'Elizabeth', 'Officer', 103381, 104095, 60);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105382, 'William', 'Credit Analyst', 103382, 104095, 51);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105383, 'Kaylee', 'Loan Closer', 103383, 104095, 56);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105384, 'Jennifer', 'Manager', 103384, 104096, 40);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105385, 'Charles', 'Officer', 103385, 104096, 23);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105386, 'Joshua', 'Credit Analyst', 103386, 104096, 69);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105387, 'Wesley', 'Loan Closer', 103387, 104096, 62);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105388, 'Marvin', 'Manager', 103388, 104097, 68);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105389, 'Anthony', 'Officer', 103389, 104097, 69);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105390, 'Danielle', 'Credit Analyst', 103390, 104097, 66);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105391, 'William', 'Loan Closer', 103391, 104097, 34);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105392, 'Theresa', 'Manager', 103392, 104098, 22);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105393, 'Mary', 'Officer', 103393, 104098, 79);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105394, 'Mallory', 'Credit Analyst', 103394, 104098, 47);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105395, 'James', 'Loan Closer', 103395, 104098, 35);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105396, 'Timothy', 'Manager', 103396, 104099, 80);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105397, 'Jonathan', 'Officer', 103397, 104099, 59);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105398, 'Samantha', 'Credit Analyst', 103398, 104099, 66);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105399, 'Melvin', 'Loan Closer', 103399, 104099, 37);
commit;
prompt 400 records committed...
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105400, 'Nathaniel', 'Manager', 103000, 104100, 87);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105401, 'Elizabeth', 'Officer', 103001, 104100, 87);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105402, 'Edward', 'Credit Analyst', 103002, 104100, 83);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105403, 'Theresa', 'Loan Closer', 103003, 104100, 84);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105404, 'Danielle', 'Manager', 103004, 104101, 58);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105405, 'Diane', 'Officer', 103005, 104101, 25);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105406, 'Logan', 'Credit Analyst', 103006, 104101, 71);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105407, 'Gregory', 'Loan Closer', 103007, 104101, 18);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105408, 'Jessica', 'Manager', 103008, 104102, 87);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105409, 'Alexis', 'Officer', 103009, 104102, 40);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105410, 'John', 'Credit Analyst', 103010, 104102, 90);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105411, 'Erica', 'Loan Closer', 103011, 104102, 79);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105412, 'Joseph', 'Manager', 103012, 104103, 49);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105413, 'Samantha', 'Officer', 103013, 104103, 67);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105414, 'George', 'Credit Analyst', 103014, 104103, 48);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105415, 'Manuel', 'Loan Closer', 103015, 104103, 69);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105416, 'Diana', 'Manager', 103016, 104104, 33);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105417, 'Victor', 'Officer', 103017, 104104, 26);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105418, 'Dylan', 'Credit Analyst', 103018, 104104, 24);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105419, 'Patricia', 'Loan Closer', 103019, 104104, 53);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105420, 'Brian', 'Manager', 103020, 104105, 72);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105421, 'Lindsey', 'Officer', 103021, 104105, 63);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105422, 'David', 'Credit Analyst', 103022, 104105, 24);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105423, 'Jack', 'Loan Closer', 103023, 104105, 44);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105424, 'Zoe', 'Manager', 103024, 104106, 90);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105425, 'Mary', 'Officer', 103025, 104106, 87);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105426, 'Benjamin', 'Credit Analyst', 103026, 104106, 78);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105427, 'Julia', 'Loan Closer', 103027, 104106, 19);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105428, 'Allison', 'Manager', 103028, 104107, 54);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105429, 'Todd', 'Officer', 103029, 104107, 57);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105430, 'Anna', 'Credit Analyst', 103030, 104107, 54);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105431, 'Barbara', 'Loan Closer', 103031, 104107, 87);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105432, 'Anthony', 'Manager', 103032, 104108, 69);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105433, 'Matthew', 'Officer', 103033, 104108, 57);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105434, 'David', 'Credit Analyst', 103034, 104108, 85);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105435, 'Tracy', 'Loan Closer', 103035, 104108, 58);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105436, 'Anita', 'Manager', 103036, 104109, 50);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105437, 'Jeremy', 'Officer', 103037, 104109, 29);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105438, 'Kim', 'Credit Analyst', 103038, 104109, 65);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105439, 'Christopher', 'Loan Closer', 103039, 104109, 60);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105440, 'James', 'Manager', 103040, 104110, 68);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105441, 'Jose', 'Officer', 103041, 104110, 72);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105442, 'William', 'Credit Analyst', 103042, 104110, 39);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105443, 'Jennifer', 'Loan Closer', 103043, 104110, 87);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105444, 'Lisa', 'Manager', 103044, 104111, 89);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105445, 'Emily', 'Officer', 103045, 104111, 44);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105446, 'Robert', 'Credit Analyst', 103046, 104111, 70);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105447, 'Kathy', 'Loan Closer', 103047, 104111, 24);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105448, 'John', 'Manager', 103048, 104112, 34);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105449, 'Megan', 'Officer', 103049, 104112, 20);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105450, 'Willie', 'Credit Analyst', 103050, 104112, 63);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105451, 'Ethan', 'Loan Closer', 103051, 104112, 28);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105452, 'Lance', 'Manager', 103052, 104113, 73);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105453, 'Denise', 'Officer', 103053, 104113, 71);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105454, 'Darlene', 'Credit Analyst', 103054, 104113, 79);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105455, 'Kathryn', 'Loan Closer', 103055, 104113, 20);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105456, 'Joseph', 'Manager', 103056, 104114, 19);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105457, 'Amanda', 'Officer', 103057, 104114, 23);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105458, 'Tracy', 'Credit Analyst', 103058, 104114, 62);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105459, 'Christine', 'Loan Closer', 103059, 104114, 20);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105460, 'Rachel', 'Manager', 103060, 104115, 75);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105461, 'Elizabeth', 'Officer', 103061, 104115, 47);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105462, 'Brian', 'Credit Analyst', 103062, 104115, 39);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105463, 'Angela', 'Loan Closer', 103063, 104115, 78);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105464, 'Anthony', 'Manager', 103064, 104116, 40);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105465, 'Theresa', 'Officer', 103065, 104116, 72);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105466, 'Antonio', 'Credit Analyst', 103066, 104116, 71);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105467, 'Ebony', 'Loan Closer', 103067, 104116, 40);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105468, 'Taylor', 'Manager', 103068, 104117, 82);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105469, 'Darius', 'Officer', 103069, 104117, 33);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105470, 'Angela', 'Credit Analyst', 103070, 104117, 83);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105471, 'Laura', 'Loan Closer', 103071, 104117, 22);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105472, 'Gregory', 'Manager', 103072, 104118, 71);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105473, 'Denise', 'Officer', 103073, 104118, 67);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105474, 'Melissa', 'Credit Analyst', 103074, 104118, 49);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105475, 'Jenna', 'Loan Closer', 103075, 104118, 85);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105476, 'Kayla', 'Manager', 103076, 104119, 86);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105477, 'Tammy', 'Officer', 103077, 104119, 35);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105478, 'Laura', 'Credit Analyst', 103078, 104119, 46);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105479, 'Brent', 'Loan Closer', 103079, 104119, 33);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105480, 'Luis', 'Manager', 103080, 104120, 38);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105481, 'Sarah', 'Officer', 103081, 104120, 37);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105482, 'Brett', 'Credit Analyst', 103082, 104120, 18);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105483, 'Frank', 'Loan Closer', 103083, 104120, 38);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105484, 'Eric', 'Manager', 103084, 104121, 71);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105485, 'Alexander', 'Officer', 103085, 104121, 60);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105486, 'Erin', 'Credit Analyst', 103086, 104121, 61);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105487, 'Elizabeth', 'Loan Closer', 103087, 104121, 63);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105488, 'Dominique', 'Manager', 103088, 104122, 30);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105489, 'Nicole', 'Officer', 103089, 104122, 73);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105490, 'James', 'Credit Analyst', 103090, 104122, 48);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105491, 'Jamie', 'Loan Closer', 103091, 104122, 68);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105492, 'Sydney', 'Manager', 103092, 104123, 44);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105493, 'John', 'Officer', 103093, 104123, 43);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105494, 'Bill', 'Credit Analyst', 103094, 104123, 36);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105495, 'Matthew', 'Loan Closer', 103095, 104123, 18);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105496, 'Robert', 'Manager', 103096, 104124, 84);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105497, 'Beth', 'Officer', 103097, 104124, 22);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105498, 'Jessica', 'Credit Analyst', 103098, 104124, 54);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105499, 'Troy', 'Loan Closer', 103099, 104124, 21);
commit;
prompt 500 records committed...
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105500, 'Joshua', 'Manager', 103100, 104125, 85);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105501, 'Brandy', 'Officer', 103101, 104125, 34);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105502, 'Brittany', 'Credit Analyst', 103102, 104125, 42);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105503, 'Laura', 'Loan Closer', 103103, 104125, 46);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105504, 'Kyle', 'Manager', 103104, 104126, 74);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105505, 'Jesse', 'Officer', 103105, 104126, 71);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105506, 'Anthony', 'Credit Analyst', 103106, 104126, 74);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105507, 'Kyle', 'Loan Closer', 103107, 104126, 63);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105508, 'Tina', 'Manager', 103108, 104127, 56);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105509, 'Ashley', 'Officer', 103109, 104127, 46);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105510, 'Andre', 'Credit Analyst', 103110, 104127, 83);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105511, 'Abigail', 'Loan Closer', 103111, 104127, 40);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105512, 'Rose', 'Manager', 103112, 104128, 85);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105513, 'Jason', 'Officer', 103113, 104128, 64);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105514, 'John', 'Credit Analyst', 103114, 104128, 34);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105515, 'Brittany', 'Loan Closer', 103115, 104128, 60);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105516, 'Tiffany', 'Manager', 103116, 104129, 67);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105517, 'Mark', 'Officer', 103117, 104129, 76);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105518, 'Hannah', 'Credit Analyst', 103118, 104129, 82);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105519, 'Bryce', 'Loan Closer', 103119, 104129, 83);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105520, 'Robert', 'Manager', 103120, 104130, 20);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105521, 'Kathryn', 'Officer', 103121, 104130, 44);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105522, 'Brandon', 'Credit Analyst', 103122, 104130, 40);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105523, 'Heather', 'Loan Closer', 103123, 104130, 76);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105524, 'Robert', 'Manager', 103124, 104131, 53);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105525, 'Kevin', 'Officer', 103125, 104131, 70);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105526, 'Sarah', 'Credit Analyst', 103126, 104131, 81);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105527, 'Joseph', 'Loan Closer', 103127, 104131, 38);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105528, 'Dean', 'Manager', 103128, 104132, 61);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105529, 'Seth', 'Officer', 103129, 104132, 48);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105530, 'Eric', 'Credit Analyst', 103130, 104132, 33);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105531, 'Brian', 'Loan Closer', 103131, 104132, 68);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105532, 'Carla', 'Manager', 103132, 104133, 58);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105533, 'Robert', 'Officer', 103133, 104133, 86);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105534, 'Stephanie', 'Credit Analyst', 103134, 104133, 25);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105535, 'Laurie', 'Loan Closer', 103135, 104133, 67);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105536, 'Kyle', 'Manager', 103136, 104134, 57);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105537, 'Lisa', 'Officer', 103137, 104134, 27);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105538, 'Stacy', 'Credit Analyst', 103138, 104134, 57);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105539, 'Mary', 'Loan Closer', 103139, 104134, 68);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105540, 'Gerald', 'Manager', 103140, 104135, 48);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105541, 'Brittany', 'Officer', 103141, 104135, 88);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105542, 'Cynthia', 'Credit Analyst', 103142, 104135, 38);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105543, 'Tyler', 'Loan Closer', 103143, 104135, 81);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105544, 'Carly', 'Manager', 103144, 104136, 29);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105545, 'Sally', 'Officer', 103145, 104136, 72);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105546, 'Donald', 'Credit Analyst', 103146, 104136, 84);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105547, 'Pamela', 'Loan Closer', 103147, 104136, 19);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105548, 'Catherine', 'Manager', 103148, 104137, 24);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105549, 'William', 'Officer', 103149, 104137, 19);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105550, 'Bobby', 'Credit Analyst', 103150, 104137, 55);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105551, 'John', 'Loan Closer', 103151, 104137, 22);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105552, 'Christina', 'Manager', 103152, 104138, 33);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105553, 'Nicole', 'Officer', 103153, 104138, 27);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105554, 'Jessica', 'Credit Analyst', 103154, 104138, 18);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105555, 'Kimberly', 'Loan Closer', 103155, 104138, 59);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105556, 'Nicole', 'Manager', 103156, 104139, 26);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105557, 'Johnny', 'Officer', 103157, 104139, 68);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105558, 'Martha', 'Credit Analyst', 103158, 104139, 53);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105559, 'Riley', 'Loan Closer', 103159, 104139, 72);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105560, 'Dennis', 'Manager', 103160, 104140, 22);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105561, 'Sean', 'Officer', 103161, 104140, 58);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105562, 'Tina', 'Credit Analyst', 103162, 104140, 49);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105563, 'Raymond', 'Loan Closer', 103163, 104140, 88);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105564, 'Joshua', 'Manager', 103164, 104141, 63);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105565, 'Clayton', 'Officer', 103165, 104141, 56);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105566, 'Carolyn', 'Credit Analyst', 103166, 104141, 64);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105567, 'Walter', 'Loan Closer', 103167, 104141, 47);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105568, 'Taylor', 'Manager', 103168, 104142, 48);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105569, 'Eric', 'Officer', 103169, 104142, 60);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105570, 'Elizabeth', 'Credit Analyst', 103170, 104142, 24);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105571, 'Hannah', 'Loan Closer', 103171, 104142, 21);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105572, 'Jennifer', 'Manager', 103172, 104143, 88);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105573, 'Jennifer', 'Officer', 103173, 104143, 73);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105574, 'Olivia', 'Credit Analyst', 103174, 104143, 23);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105575, 'Sean', 'Loan Closer', 103175, 104143, 56);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105576, 'Tanya', 'Manager', 103176, 104144, 78);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105577, 'Morgan', 'Officer', 103177, 104144, 63);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105578, 'James', 'Credit Analyst', 103178, 104144, 44);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105579, 'Sarah', 'Loan Closer', 103179, 104144, 32);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105580, 'Jeffrey', 'Manager', 103180, 104145, 45);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105581, 'Sherri', 'Officer', 103181, 104145, 73);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105582, 'Katie', 'Credit Analyst', 103182, 104145, 60);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105583, 'Sally', 'Loan Closer', 103183, 104145, 21);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105584, 'Christine', 'Manager', 103184, 104146, 21);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105585, 'Renee', 'Officer', 103185, 104146, 88);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105586, 'Karen', 'Credit Analyst', 103186, 104146, 88);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105587, 'Kimberly', 'Loan Closer', 103187, 104146, 26);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105588, 'Margaret', 'Manager', 103188, 104147, 63);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105589, 'Linda', 'Officer', 103189, 104147, 28);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105590, 'Ashley', 'Credit Analyst', 103190, 104147, 67);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105591, 'Mark', 'Loan Closer', 103191, 104147, 62);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105592, 'Julie', 'Manager', 103192, 104148, 43);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105593, 'Daniel', 'Officer', 103193, 104148, 48);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105594, 'Kara', 'Credit Analyst', 103194, 104148, 63);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105595, 'Kimberly', 'Loan Closer', 103195, 104148, 46);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105596, 'Maria', 'Manager', 103196, 104149, 33);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105597, 'Debra', 'Officer', 103197, 104149, 62);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105598, 'John', 'Credit Analyst', 103198, 104149, 18);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105599, 'Daniel', 'Loan Closer', 103199, 104149, 32);
commit;
prompt 600 records committed...
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105600, 'Krystal', 'Manager', 103200, 104150, 66);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105601, 'Jennifer', 'Officer', 103201, 104150, 40);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105602, 'Misty', 'Credit Analyst', 103202, 104150, 64);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105603, 'Julia', 'Loan Closer', 103203, 104150, 46);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105604, 'Richard', 'Manager', 103204, 104151, 20);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105605, 'Heather', 'Officer', 103205, 104151, 34);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105606, 'Steven', 'Credit Analyst', 103206, 104151, 52);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105607, 'Charles', 'Loan Closer', 103207, 104151, 61);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105608, 'Deborah', 'Manager', 103208, 104152, 64);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105609, 'Susan', 'Officer', 103209, 104152, 86);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105610, 'Dennis', 'Credit Analyst', 103210, 104152, 48);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105611, 'Cynthia', 'Loan Closer', 103211, 104152, 45);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105612, 'Ricky', 'Manager', 103212, 104153, 35);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105613, 'Laura', 'Officer', 103213, 104153, 85);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105614, 'Jose', 'Credit Analyst', 103214, 104153, 66);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105615, 'Jonathan', 'Loan Closer', 103215, 104153, 44);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105616, 'William', 'Manager', 103216, 104154, 50);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105617, 'Robert', 'Officer', 103217, 104154, 55);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105618, 'Leah', 'Credit Analyst', 103218, 104154, 57);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105619, 'Michael', 'Loan Closer', 103219, 104154, 65);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105620, 'Leslie', 'Manager', 103220, 104155, 83);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105621, 'Sheila', 'Officer', 103221, 104155, 41);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105622, 'Catherine', 'Credit Analyst', 103222, 104155, 85);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105623, 'Anthony', 'Loan Closer', 103223, 104155, 31);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105624, 'Ann', 'Manager', 103224, 104156, 79);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105625, 'Anthony', 'Officer', 103225, 104156, 46);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105626, 'Eric', 'Credit Analyst', 103226, 104156, 81);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105627, 'Justin', 'Loan Closer', 103227, 104156, 84);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105628, 'Dana', 'Manager', 103228, 104157, 38);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105629, 'Cheyenne', 'Officer', 103229, 104157, 63);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105630, 'Erin', 'Credit Analyst', 103230, 104157, 43);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105631, 'Michael', 'Loan Closer', 103231, 104157, 75);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105632, 'Christopher', 'Manager', 103232, 104158, 30);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105633, 'Brittany', 'Officer', 103233, 104158, 70);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105634, 'Sharon', 'Credit Analyst', 103234, 104158, 37);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105635, 'Stephanie', 'Loan Closer', 103235, 104158, 44);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105636, 'Kristi', 'Manager', 103236, 104159, 73);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105637, 'Danielle', 'Officer', 103237, 104159, 20);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105638, 'Lori', 'Credit Analyst', 103238, 104159, 79);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105639, 'Abigail', 'Loan Closer', 103239, 104159, 45);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105640, 'John', 'Manager', 103240, 104160, 69);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105641, 'Laura', 'Officer', 103241, 104160, 75);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105642, 'Elizabeth', 'Credit Analyst', 103242, 104160, 63);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105643, 'Jessica', 'Loan Closer', 103243, 104160, 87);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105644, 'Troy', 'Manager', 103244, 104161, 83);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105645, 'Anthony', 'Officer', 103245, 104161, 24);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105646, 'Jesse', 'Credit Analyst', 103246, 104161, 70);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105647, 'Nicholas', 'Loan Closer', 103247, 104161, 83);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105648, 'Christine', 'Manager', 103248, 104162, 76);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105649, 'Dave', 'Officer', 103249, 104162, 85);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105650, 'Corey', 'Credit Analyst', 103250, 104162, 71);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105651, 'Anthony', 'Loan Closer', 103251, 104162, 39);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105652, 'Timothy', 'Manager', 103252, 104163, 67);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105653, 'Charlotte', 'Officer', 103253, 104163, 78);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105654, 'Adam', 'Credit Analyst', 103254, 104163, 86);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105655, 'Kari', 'Loan Closer', 103255, 104163, 68);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105656, 'Cynthia', 'Manager', 103256, 104164, 74);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105657, 'Lori', 'Officer', 103257, 104164, 22);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105658, 'Melissa', 'Credit Analyst', 103258, 104164, 29);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105659, 'Christina', 'Loan Closer', 103259, 104164, 35);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105660, 'Lynn', 'Manager', 103260, 104165, 64);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105661, 'Karen', 'Officer', 103261, 104165, 21);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105662, 'Alexandra', 'Credit Analyst', 103262, 104165, 50);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105663, 'Angel', 'Loan Closer', 103263, 104165, 48);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105664, 'Richard', 'Manager', 103264, 104166, 48);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105665, 'Matthew', 'Officer', 103265, 104166, 71);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105666, 'Thomas', 'Credit Analyst', 103266, 104166, 77);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105667, 'Heather', 'Loan Closer', 103267, 104166, 44);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105668, 'Angela', 'Manager', 103268, 104167, 43);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105669, 'Devon', 'Officer', 103269, 104167, 62);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105670, 'Kristen', 'Credit Analyst', 103270, 104167, 57);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105671, 'Steven', 'Loan Closer', 103271, 104167, 82);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105672, 'Julia', 'Manager', 103272, 104168, 90);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105673, 'Amber', 'Officer', 103273, 104168, 72);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105674, 'Kristen', 'Credit Analyst', 103274, 104168, 48);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105675, 'Gina', 'Loan Closer', 103275, 104168, 57);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105676, 'Terri', 'Manager', 103276, 104169, 29);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105677, 'Joan', 'Officer', 103277, 104169, 53);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105678, 'Anthony', 'Credit Analyst', 103278, 104169, 84);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105679, 'Paul', 'Loan Closer', 103279, 104169, 83);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105680, 'Kenneth', 'Manager', 103280, 104170, 59);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105681, 'Erik', 'Officer', 103281, 104170, 39);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105682, 'Joshua', 'Credit Analyst', 103282, 104170, 57);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105683, 'Erin', 'Loan Closer', 103283, 104170, 83);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105684, 'David', 'Manager', 103284, 104171, 67);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105685, 'David', 'Officer', 103285, 104171, 44);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105686, 'Jeffery', 'Credit Analyst', 103286, 104171, 76);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105687, 'Jeremy', 'Loan Closer', 103287, 104171, 79);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105688, 'Judith', 'Manager', 103288, 104172, 27);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105689, 'David', 'Officer', 103289, 104172, 30);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105690, 'Dana', 'Credit Analyst', 103290, 104172, 24);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105691, 'Michelle', 'Loan Closer', 103291, 104172, 55);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105692, 'Christopher', 'Manager', 103292, 104173, 52);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105693, 'James', 'Officer', 103293, 104173, 79);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105694, 'Kelly', 'Credit Analyst', 103294, 104173, 73);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105695, 'Sarah', 'Loan Closer', 103295, 104173, 55);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105696, 'Leslie', 'Manager', 103296, 104174, 78);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105697, 'Kathryn', 'Officer', 103297, 104174, 58);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105698, 'Gabriela', 'Credit Analyst', 103298, 104174, 35);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105699, 'Natasha', 'Loan Closer', 103299, 104174, 24);
commit;
prompt 700 records committed...
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105700, 'Sean', 'Manager', 103300, 104175, 36);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105701, 'Harry', 'Officer', 103301, 104175, 41);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105702, 'Judy', 'Credit Analyst', 103302, 104175, 68);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105703, 'Sara', 'Loan Closer', 103303, 104175, 57);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105704, 'Thomas', 'Manager', 103304, 104176, 71);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105705, 'Randy', 'Officer', 103305, 104176, 86);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105706, 'Lance', 'Credit Analyst', 103306, 104176, 35);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105707, 'Russell', 'Loan Closer', 103307, 104176, 69);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105708, 'Catherine', 'Manager', 103308, 104177, 47);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105709, 'Ashley', 'Officer', 103309, 104177, 77);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105710, 'Cynthia', 'Credit Analyst', 103310, 104177, 86);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105711, 'Hannah', 'Loan Closer', 103311, 104177, 49);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105712, 'Michael', 'Manager', 103312, 104178, 48);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105713, 'Joseph', 'Officer', 103313, 104178, 24);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105714, 'Jacqueline', 'Credit Analyst', 103314, 104178, 70);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105715, 'Daniel', 'Loan Closer', 103315, 104178, 26);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105716, 'William', 'Manager', 103316, 104179, 52);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105717, 'Tina', 'Officer', 103317, 104179, 48);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105718, 'Paul', 'Credit Analyst', 103318, 104179, 46);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105719, 'Michelle', 'Loan Closer', 103319, 104179, 55);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105720, 'Jennifer', 'Manager', 103320, 104180, 69);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105721, 'Michael', 'Officer', 103321, 104180, 65);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105722, 'Chelsea', 'Credit Analyst', 103322, 104180, 48);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105723, 'Kaitlin', 'Loan Closer', 103323, 104180, 76);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105724, 'Erin', 'Manager', 103324, 104181, 58);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105725, 'Jose', 'Officer', 103325, 104181, 56);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105726, 'Andrea', 'Credit Analyst', 103326, 104181, 52);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105727, 'Jennifer', 'Loan Closer', 103327, 104181, 60);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105728, 'Rebecca', 'Manager', 103328, 104182, 50);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105729, 'Destiny', 'Officer', 103329, 104182, 56);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105730, 'Douglas', 'Credit Analyst', 103330, 104182, 61);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105731, 'Micheal', 'Loan Closer', 103331, 104182, 51);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105732, 'Joshua', 'Manager', 103332, 104183, 20);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105733, 'Gail', 'Officer', 103333, 104183, 73);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105734, 'Eric', 'Credit Analyst', 103334, 104183, 62);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105735, 'Aaron', 'Loan Closer', 103335, 104183, 85);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105736, 'Jennifer', 'Manager', 103336, 104184, 85);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105737, 'Justin', 'Officer', 103337, 104184, 88);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105738, 'Susan', 'Credit Analyst', 103338, 104184, 73);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105739, 'Matthew', 'Loan Closer', 103339, 104184, 78);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105740, 'William', 'Manager', 103340, 104185, 67);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105741, 'Amy', 'Officer', 103341, 104185, 65);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105742, 'David', 'Credit Analyst', 103342, 104185, 63);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105743, 'Alexander', 'Loan Closer', 103343, 104185, 56);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105744, 'Jessica', 'Manager', 103344, 104186, 29);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105745, 'Kelly', 'Officer', 103345, 104186, 52);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105746, 'John', 'Credit Analyst', 103346, 104186, 64);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105747, 'Joseph', 'Loan Closer', 103347, 104186, 50);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105748, 'Anna', 'Manager', 103348, 104187, 19);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105749, 'Calvin', 'Officer', 103349, 104187, 60);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105750, 'Melissa', 'Credit Analyst', 103350, 104187, 64);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105751, 'Kyle', 'Loan Closer', 103351, 104187, 36);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105752, 'Samantha', 'Manager', 103352, 104188, 64);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105753, 'Vickie', 'Officer', 103353, 104188, 66);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105754, 'Bonnie', 'Credit Analyst', 103354, 104188, 26);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105755, 'Elizabeth', 'Loan Closer', 103355, 104188, 88);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105756, 'Norma', 'Manager', 103356, 104189, 57);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105757, 'Darius', 'Officer', 103357, 104189, 31);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105758, 'Linda', 'Credit Analyst', 103358, 104189, 45);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105759, 'Jerry', 'Loan Closer', 103359, 104189, 37);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105760, 'Lucas', 'Manager', 103360, 104190, 38);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105761, 'Jamie', 'Officer', 103361, 104190, 54);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105762, 'Melanie', 'Credit Analyst', 103362, 104190, 65);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105763, 'Amber', 'Loan Closer', 103363, 104190, 66);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105764, 'Edward', 'Manager', 103364, 104191, 82);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105765, 'Michele', 'Officer', 103365, 104191, 80);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105766, 'Benjamin', 'Credit Analyst', 103366, 104191, 57);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105767, 'Ronald', 'Loan Closer', 103367, 104191, 66);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105768, 'Jenny', 'Manager', 103368, 104192, 88);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105769, 'Lisa', 'Officer', 103369, 104192, 22);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105770, 'Chase', 'Credit Analyst', 103370, 104192, 90);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105771, 'Lisa', 'Loan Closer', 103371, 104192, 81);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105772, 'Chelsea', 'Manager', 103372, 104193, 89);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105773, 'Lori', 'Officer', 103373, 104193, 40);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105774, 'Michelle', 'Credit Analyst', 103374, 104193, 66);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105775, 'Gregory', 'Loan Closer', 103375, 104193, 19);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105776, 'Katherine', 'Manager', 103376, 104194, 67);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105777, 'Kyle', 'Officer', 103377, 104194, 69);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105778, 'Blake', 'Credit Analyst', 103378, 104194, 51);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105779, 'Anthony', 'Loan Closer', 103379, 104194, 80);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105780, 'Anita', 'Manager', 103380, 104195, 81);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105781, 'Michael', 'Officer', 103381, 104195, 72);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105782, 'Nichole', 'Credit Analyst', 103382, 104195, 36);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105783, 'James', 'Loan Closer', 103383, 104195, 89);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105784, 'Ryan', 'Manager', 103384, 104196, 80);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105785, 'Corey', 'Officer', 103385, 104196, 71);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105786, 'Christopher', 'Credit Analyst', 103386, 104196, 48);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105787, 'Meghan', 'Loan Closer', 103387, 104196, 87);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105788, 'Shawn', 'Manager', 103388, 104197, 34);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105789, 'Dan', 'Officer', 103389, 104197, 62);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105790, 'Bradley', 'Credit Analyst', 103390, 104197, 69);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105791, 'Darrell', 'Loan Closer', 103391, 104197, 55);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105792, 'Angela', 'Manager', 103392, 104198, 71);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105793, 'Joshua', 'Officer', 103393, 104198, 66);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105794, 'Danielle', 'Credit Analyst', 103394, 104198, 86);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105795, 'Lawrence', 'Loan Closer', 103395, 104198, 42);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105796, 'Mark', 'Manager', 103396, 104199, 85);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105797, 'Mark', 'Officer', 103397, 104199, 71);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105798, 'Matthew', 'Credit Analyst', 103398, 104199, 79);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105799, 'David', 'Loan Closer', 103399, 104199, 69);
commit;
prompt 800 records committed...
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105800, 'Eric', 'Manager', 103000, 104200, 64);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105801, 'Anthony', 'Officer', 103001, 104200, 84);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105802, 'Daryl', 'Credit Analyst', 103002, 104200, 43);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105803, 'Joshua', 'Loan Closer', 103003, 104200, 22);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105804, 'Barbara', 'Manager', 103004, 104201, 79);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105805, 'Lisa', 'Officer', 103005, 104201, 62);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105806, 'Harry', 'Credit Analyst', 103006, 104201, 62);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105807, 'Dana', 'Loan Closer', 103007, 104201, 42);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105808, 'Gerald', 'Manager', 103008, 104202, 64);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105809, 'Amber', 'Officer', 103009, 104202, 47);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105810, 'Ronald', 'Credit Analyst', 103010, 104202, 18);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105811, 'John', 'Loan Closer', 103011, 104202, 30);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105812, 'Leah', 'Manager', 103012, 104203, 40);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105813, 'Michael', 'Officer', 103013, 104203, 41);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105814, 'Tiffany', 'Credit Analyst', 103014, 104203, 80);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105815, 'Travis', 'Loan Closer', 103015, 104203, 55);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105816, 'Julie', 'Manager', 103016, 104204, 21);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105817, 'Chad', 'Officer', 103017, 104204, 58);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105818, 'Alyssa', 'Credit Analyst', 103018, 104204, 18);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105819, 'Timothy', 'Loan Closer', 103019, 104204, 43);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105820, 'Joshua', 'Manager', 103020, 104205, 57);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105821, 'Ann', 'Officer', 103021, 104205, 46);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105822, 'Jamie', 'Credit Analyst', 103022, 104205, 31);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105823, 'Melissa', 'Loan Closer', 103023, 104205, 86);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105824, 'Eric', 'Manager', 103024, 104206, 78);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105825, 'William', 'Officer', 103025, 104206, 76);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105826, 'Cynthia', 'Credit Analyst', 103026, 104206, 30);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105827, 'Randy', 'Loan Closer', 103027, 104206, 77);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105828, 'Ricky', 'Manager', 103028, 104207, 48);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105829, 'Virginia', 'Officer', 103029, 104207, 28);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105830, 'Joshua', 'Credit Analyst', 103030, 104207, 67);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105831, 'Robert', 'Loan Closer', 103031, 104207, 32);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105832, 'Larry', 'Manager', 103032, 104208, 78);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105833, 'Regina', 'Officer', 103033, 104208, 19);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105834, 'Charles', 'Credit Analyst', 103034, 104208, 60);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105835, 'Kathryn', 'Loan Closer', 103035, 104208, 60);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105836, 'Ashley', 'Manager', 103036, 104209, 56);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105837, 'John', 'Officer', 103037, 104209, 35);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105838, 'Alexander', 'Credit Analyst', 103038, 104209, 84);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105839, 'Sharon', 'Loan Closer', 103039, 104209, 75);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105840, 'Diane', 'Manager', 103040, 104210, 89);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105841, 'Michelle', 'Officer', 103041, 104210, 60);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105842, 'Gregory', 'Credit Analyst', 103042, 104210, 39);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105843, 'Vincent', 'Loan Closer', 103043, 104210, 73);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105844, 'Parker', 'Manager', 103044, 104211, 53);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105845, 'Theresa', 'Officer', 103045, 104211, 29);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105846, 'Sean', 'Credit Analyst', 103046, 104211, 50);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105847, 'Latoya', 'Loan Closer', 103047, 104211, 36);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105848, 'Amanda', 'Manager', 103048, 104212, 27);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105849, 'Alexander', 'Officer', 103049, 104212, 62);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105850, 'Toni', 'Credit Analyst', 103050, 104212, 90);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105851, 'Jamie', 'Loan Closer', 103051, 104212, 25);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105852, 'Amanda', 'Manager', 103052, 104213, 30);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105853, 'Laura', 'Officer', 103053, 104213, 87);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105854, 'Karen', 'Credit Analyst', 103054, 104213, 71);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105855, 'Laura', 'Loan Closer', 103055, 104213, 68);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105856, 'Shawna', 'Manager', 103056, 104214, 21);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105857, 'Diana', 'Officer', 103057, 104214, 86);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105858, 'Jamie', 'Credit Analyst', 103058, 104214, 37);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105859, 'Daniel', 'Loan Closer', 103059, 104214, 88);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105860, 'Kaitlyn', 'Manager', 103060, 104215, 76);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105861, 'Michael', 'Officer', 103061, 104215, 65);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105862, 'James', 'Credit Analyst', 103062, 104215, 24);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105863, 'Steven', 'Loan Closer', 103063, 104215, 67);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105864, 'Michael', 'Manager', 103064, 104216, 18);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105865, 'Sarah', 'Officer', 103065, 104216, 33);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105866, 'Stephanie', 'Credit Analyst', 103066, 104216, 27);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105867, 'Roger', 'Loan Closer', 103067, 104216, 54);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105868, 'Shirley', 'Manager', 103068, 104217, 88);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105869, 'Courtney', 'Officer', 103069, 104217, 41);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105870, 'Eric', 'Credit Analyst', 103070, 104217, 43);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105871, 'Robin', 'Loan Closer', 103071, 104217, 34);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105872, 'Danielle', 'Manager', 103072, 104218, 54);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105873, 'Nicole', 'Officer', 103073, 104218, 47);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105874, 'Mark', 'Credit Analyst', 103074, 104218, 74);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105875, 'Samantha', 'Loan Closer', 103075, 104218, 49);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105876, 'Wendy', 'Manager', 103076, 104219, 40);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105877, 'Angela', 'Officer', 103077, 104219, 44);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105878, 'Thomas', 'Credit Analyst', 103078, 104219, 25);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105879, 'Thomas', 'Loan Closer', 103079, 104219, 77);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105880, 'Victoria', 'Manager', 103080, 104220, 84);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105881, 'Christopher', 'Officer', 103081, 104220, 50);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105882, 'Lauren', 'Credit Analyst', 103082, 104220, 62);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105883, 'Carl', 'Loan Closer', 103083, 104220, 33);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105884, 'William', 'Manager', 103084, 104221, 62);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105885, 'Scott', 'Officer', 103085, 104221, 66);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105886, 'Sally', 'Credit Analyst', 103086, 104221, 56);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105887, 'Patrick', 'Loan Closer', 103087, 104221, 68);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105888, 'Molly', 'Manager', 103088, 104222, 43);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105889, 'Brian', 'Officer', 103089, 104222, 82);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105890, 'Michael', 'Credit Analyst', 103090, 104222, 22);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105891, 'Edward', 'Loan Closer', 103091, 104222, 82);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105892, 'Emily', 'Manager', 103092, 104223, 48);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105893, 'Ivan', 'Officer', 103093, 104223, 48);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105894, 'Shelly', 'Credit Analyst', 103094, 104223, 81);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105895, 'Cody', 'Loan Closer', 103095, 104223, 84);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105896, 'Andrew', 'Manager', 103096, 104224, 86);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105897, 'Joshua', 'Officer', 103097, 104224, 53);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105898, 'Kyle', 'Credit Analyst', 103098, 104224, 51);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105899, 'Andrea', 'Loan Closer', 103099, 104224, 57);
commit;
prompt 900 records committed...
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105900, 'Heather', 'Manager', 103100, 104225, 81);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105901, 'James', 'Officer', 103101, 104225, 46);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105902, 'Kendra', 'Credit Analyst', 103102, 104225, 49);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105903, 'Jennifer', 'Loan Closer', 103103, 104225, 48);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105904, 'Mark', 'Manager', 103104, 104226, 23);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105905, 'Mike', 'Officer', 103105, 104226, 50);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105906, 'Darren', 'Credit Analyst', 103106, 104226, 33);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105907, 'Jennifer', 'Loan Closer', 103107, 104226, 60);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105908, 'Eric', 'Manager', 103108, 104227, 60);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105909, 'Michelle', 'Officer', 103109, 104227, 82);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105910, 'Lindsay', 'Credit Analyst', 103110, 104227, 73);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105911, 'Jamie', 'Loan Closer', 103111, 104227, 61);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105912, 'Joann', 'Manager', 103112, 104228, 45);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105913, 'Makayla', 'Officer', 103113, 104228, 73);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105914, 'Steven', 'Credit Analyst', 103114, 104228, 71);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105915, 'Justin', 'Loan Closer', 103115, 104228, 90);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105916, 'Karen', 'Manager', 103116, 104229, 82);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105917, 'Stephanie', 'Officer', 103117, 104229, 71);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105918, 'Robert', 'Credit Analyst', 103118, 104229, 38);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105919, 'Lucas', 'Loan Closer', 103119, 104229, 20);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105920, 'Jesus', 'Manager', 103120, 104230, 59);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105921, 'Alexis', 'Officer', 103121, 104230, 22);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105922, 'Donna', 'Credit Analyst', 103122, 104230, 73);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105923, 'Melissa', 'Loan Closer', 103123, 104230, 69);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105924, 'Shawn', 'Manager', 103124, 104231, 84);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105925, 'Misty', 'Officer', 103125, 104231, 77);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105926, 'Tiffany', 'Credit Analyst', 103126, 104231, 87);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105927, 'Angela', 'Loan Closer', 103127, 104231, 77);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105928, 'David', 'Manager', 103128, 104232, 61);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105929, 'Jason', 'Officer', 103129, 104232, 25);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105930, 'Jeffrey', 'Credit Analyst', 103130, 104232, 63);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105931, 'Jennifer', 'Loan Closer', 103131, 104232, 33);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105932, 'Ashley', 'Manager', 103132, 104233, 41);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105933, 'Austin', 'Officer', 103133, 104233, 77);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105934, 'Crystal', 'Credit Analyst', 103134, 104233, 46);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105935, 'Cheryl', 'Loan Closer', 103135, 104233, 80);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105936, 'Annette', 'Manager', 103136, 104234, 82);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105937, 'Kevin', 'Officer', 103137, 104234, 45);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105938, 'Claire', 'Credit Analyst', 103138, 104234, 89);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105939, 'Michelle', 'Loan Closer', 103139, 104234, 31);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105940, 'Keith', 'Manager', 103140, 104235, 70);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105941, 'Stacy', 'Officer', 103141, 104235, 86);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105942, 'Robyn', 'Credit Analyst', 103142, 104235, 64);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105943, 'John', 'Loan Closer', 103143, 104235, 63);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105944, 'Richard', 'Manager', 103144, 104236, 18);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105945, 'Grant', 'Officer', 103145, 104236, 20);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105946, 'Erik', 'Credit Analyst', 103146, 104236, 37);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105947, 'David', 'Loan Closer', 103147, 104236, 76);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105948, 'Sharon', 'Manager', 103148, 104237, 18);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105949, 'Linda', 'Officer', 103149, 104237, 77);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105950, 'Linda', 'Credit Analyst', 103150, 104237, 54);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105951, 'Billy', 'Loan Closer', 103151, 104237, 57);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105952, 'Jenna', 'Manager', 103152, 104238, 35);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105953, 'Melissa', 'Officer', 103153, 104238, 46);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105954, 'Allison', 'Credit Analyst', 103154, 104238, 83);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105955, 'Lisa', 'Loan Closer', 103155, 104238, 18);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105956, 'Katrina', 'Manager', 103156, 104239, 24);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105957, 'Carolyn', 'Officer', 103157, 104239, 82);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105958, 'Rebecca', 'Credit Analyst', 103158, 104239, 54);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105959, 'Eric', 'Loan Closer', 103159, 104239, 38);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105960, 'Steven', 'Manager', 103160, 104240, 65);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105961, 'Danielle', 'Officer', 103161, 104240, 56);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105962, 'Evan', 'Credit Analyst', 103162, 104240, 37);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105963, 'Tracy', 'Loan Closer', 103163, 104240, 43);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105964, 'Christopher', 'Manager', 103164, 104241, 85);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105965, 'Amy', 'Officer', 103165, 104241, 46);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105966, 'Nathan', 'Credit Analyst', 103166, 104241, 77);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105967, 'Joshua', 'Loan Closer', 103167, 104241, 35);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105968, 'Lauren', 'Manager', 103168, 104242, 36);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105969, 'Matthew', 'Officer', 103169, 104242, 52);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105970, 'Erica', 'Credit Analyst', 103170, 104242, 33);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105971, 'Peter', 'Loan Closer', 103171, 104242, 60);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105972, 'Katelyn', 'Manager', 103172, 104243, 39);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105973, 'Alexandria', 'Officer', 103173, 104243, 57);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105974, 'Isaiah', 'Credit Analyst', 103174, 104243, 73);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105975, 'Douglas', 'Loan Closer', 103175, 104243, 33);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105976, 'Kyle', 'Manager', 103176, 104244, 42);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105977, 'Lynn', 'Officer', 103177, 104244, 35);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105978, 'Rachel', 'Credit Analyst', 103178, 104244, 28);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105979, 'Nancy', 'Loan Closer', 103179, 104244, 21);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105980, 'Todd', 'Manager', 103180, 104245, 40);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105981, 'Margaret', 'Officer', 103181, 104245, 59);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105982, 'Kayla', 'Credit Analyst', 103182, 104245, 32);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105983, 'Sabrina', 'Loan Closer', 103183, 104245, 25);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105984, 'Paige', 'Manager', 103184, 104246, 48);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105985, 'Joseph', 'Officer', 103185, 104246, 37);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105986, 'Casey', 'Credit Analyst', 103186, 104246, 41);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105987, 'Heather', 'Loan Closer', 103187, 104246, 25);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105988, 'Jamie', 'Manager', 103188, 104247, 49);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105989, 'Rachel', 'Officer', 103189, 104247, 33);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105990, 'Kirsten', 'Credit Analyst', 103190, 104247, 39);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105991, 'Christopher', 'Loan Closer', 103191, 104247, 40);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105992, 'Christina', 'Manager', 103192, 104248, 41);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105993, 'Ariana', 'Officer', 103193, 104248, 53);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105994, 'Rhonda', 'Credit Analyst', 103194, 104248, 28);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105995, 'Juan', 'Loan Closer', 103195, 104248, 77);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105996, 'Michael', 'Manager', 103196, 104249, 52);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105997, 'Xavier', 'Officer', 103197, 104249, 34);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105998, 'William', 'Credit Analyst', 103198, 104249, 49);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (105999, 'Patrick', 'Loan Closer', 103199, 104249, 18);
commit;
prompt 1000 records committed...
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106000, 'Tom', 'Manager', 103200, 104250, 44);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106001, 'Alyssa', 'Officer', 103201, 104250, 32);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106002, 'Sherri', 'Credit Analyst', 103202, 104250, 57);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106003, 'Jennifer', 'Loan Closer', 103203, 104250, 81);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106004, 'Michael', 'Manager', 103204, 104251, 23);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106005, 'Chad', 'Officer', 103205, 104251, 76);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106006, 'Jasmine', 'Credit Analyst', 103206, 104251, 39);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106007, 'Danielle', 'Loan Closer', 103207, 104251, 48);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106008, 'Samantha', 'Manager', 103208, 104252, 41);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106009, 'Robert', 'Officer', 103209, 104252, 62);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106010, 'Jack', 'Credit Analyst', 103210, 104252, 75);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106011, 'Lori', 'Loan Closer', 103211, 104252, 27);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106012, 'Rebecca', 'Manager', 103212, 104253, 43);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106013, 'Christian', 'Officer', 103213, 104253, 33);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106014, 'Kenneth', 'Credit Analyst', 103214, 104253, 56);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106015, 'Jason', 'Loan Closer', 103215, 104253, 63);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106016, 'Joseph', 'Manager', 103216, 104254, 86);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106017, 'John', 'Officer', 103217, 104254, 42);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106018, 'Billy', 'Credit Analyst', 103218, 104254, 85);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106019, 'Lisa', 'Loan Closer', 103219, 104254, 20);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106020, 'Matthew', 'Manager', 103220, 104255, 67);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106021, 'Brooke', 'Officer', 103221, 104255, 36);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106022, 'Jessica', 'Credit Analyst', 103222, 104255, 32);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106023, 'Thomas', 'Loan Closer', 103223, 104255, 84);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106024, 'Lisa', 'Manager', 103224, 104256, 24);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106025, 'Jennifer', 'Officer', 103225, 104256, 65);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106026, 'Richard', 'Credit Analyst', 103226, 104256, 51);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106027, 'Brian', 'Loan Closer', 103227, 104256, 43);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106028, 'Nicole', 'Manager', 103228, 104257, 74);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106029, 'Melissa', 'Officer', 103229, 104257, 86);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106030, 'Troy', 'Credit Analyst', 103230, 104257, 73);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106031, 'Julia', 'Loan Closer', 103231, 104257, 68);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106032, 'Jessica', 'Manager', 103232, 104258, 28);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106033, 'Amy', 'Officer', 103233, 104258, 47);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106034, 'Victor', 'Credit Analyst', 103234, 104258, 88);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106035, 'Jaime', 'Loan Closer', 103235, 104258, 20);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106036, 'Brian', 'Manager', 103236, 104259, 75);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106037, 'Christopher', 'Officer', 103237, 104259, 49);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106038, 'Yolanda', 'Credit Analyst', 103238, 104259, 84);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106039, 'James', 'Loan Closer', 103239, 104259, 23);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106040, 'Julie', 'Manager', 103240, 104260, 26);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106041, 'Rebecca', 'Officer', 103241, 104260, 55);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106042, 'Jose', 'Credit Analyst', 103242, 104260, 46);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106043, 'Lisa', 'Loan Closer', 103243, 104260, 67);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106044, 'Thomas', 'Manager', 103244, 104261, 47);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106045, 'Sherri', 'Officer', 103245, 104261, 68);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106046, 'Sandra', 'Credit Analyst', 103246, 104261, 24);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106047, 'Pamela', 'Loan Closer', 103247, 104261, 46);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106048, 'Jessica', 'Manager', 103248, 104262, 87);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106049, 'Benjamin', 'Officer', 103249, 104262, 71);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106050, 'William', 'Credit Analyst', 103250, 104262, 35);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106051, 'Tom', 'Loan Closer', 103251, 104262, 86);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106052, 'Patricia', 'Manager', 103252, 104263, 48);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106053, 'Helen', 'Officer', 103253, 104263, 50);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106054, 'Shawn', 'Credit Analyst', 103254, 104263, 36);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106055, 'Nicholas', 'Loan Closer', 103255, 104263, 60);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106056, 'Timothy', 'Manager', 103256, 104264, 24);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106057, 'Kelli', 'Officer', 103257, 104264, 53);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106058, 'Michael', 'Credit Analyst', 103258, 104264, 72);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106059, 'Paige', 'Loan Closer', 103259, 104264, 50);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106060, 'Nicholas', 'Manager', 103260, 104265, 35);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106061, 'Brittany', 'Officer', 103261, 104265, 56);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106062, 'Phyllis', 'Credit Analyst', 103262, 104265, 78);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106063, 'David', 'Loan Closer', 103263, 104265, 40);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106064, 'Joseph', 'Manager', 103264, 104266, 86);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106065, 'Victoria', 'Officer', 103265, 104266, 66);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106066, 'Gregory', 'Credit Analyst', 103266, 104266, 73);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106067, 'Sarah', 'Loan Closer', 103267, 104266, 63);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106068, 'Brittany', 'Manager', 103268, 104267, 78);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106069, 'Kenneth', 'Officer', 103269, 104267, 33);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106070, 'Ryan', 'Credit Analyst', 103270, 104267, 18);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106071, 'Sylvia', 'Loan Closer', 103271, 104267, 45);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106072, 'Meredith', 'Manager', 103272, 104268, 41);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106073, 'Jennifer', 'Officer', 103273, 104268, 40);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106074, 'Jacob', 'Credit Analyst', 103274, 104268, 66);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106075, 'Holly', 'Loan Closer', 103275, 104268, 34);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106076, 'Henry', 'Manager', 103276, 104269, 42);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106077, 'David', 'Officer', 103277, 104269, 49);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106078, 'Richard', 'Credit Analyst', 103278, 104269, 77);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106079, 'Donna', 'Loan Closer', 103279, 104269, 25);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106080, 'Frances', 'Manager', 103280, 104270, 87);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106081, 'Pamela', 'Officer', 103281, 104270, 29);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106082, 'Amanda', 'Credit Analyst', 103282, 104270, 84);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106083, 'Lauren', 'Loan Closer', 103283, 104270, 31);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106084, 'Lisa', 'Manager', 103284, 104271, 79);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106085, 'Joanna', 'Officer', 103285, 104271, 35);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106086, 'James', 'Credit Analyst', 103286, 104271, 37);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106087, 'Anthony', 'Loan Closer', 103287, 104271, 28);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106088, 'Sandy', 'Manager', 103288, 104272, 29);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106089, 'Amanda', 'Officer', 103289, 104272, 58);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106090, 'Neil', 'Credit Analyst', 103290, 104272, 35);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106091, 'Carrie', 'Loan Closer', 103291, 104272, 34);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106092, 'Nicholas', 'Manager', 103292, 104273, 49);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106093, 'Heather', 'Officer', 103293, 104273, 29);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106094, 'Sheryl', 'Credit Analyst', 103294, 104273, 89);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106095, 'Ricardo', 'Loan Closer', 103295, 104273, 20);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106096, 'Joseph', 'Manager', 103296, 104274, 72);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106097, 'Christine', 'Officer', 103297, 104274, 71);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106098, 'Pamela', 'Credit Analyst', 103298, 104274, 23);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106099, 'Blake', 'Loan Closer', 103299, 104274, 53);
commit;
prompt 1100 records committed...
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106100, 'Jack', 'Manager', 103300, 104275, 40);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106101, 'Kyle', 'Officer', 103301, 104275, 54);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106102, 'Leah', 'Credit Analyst', 103302, 104275, 33);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106103, 'Hannah', 'Loan Closer', 103303, 104275, 62);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106104, 'Alexis', 'Manager', 103304, 104276, 47);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106105, 'Jason', 'Officer', 103305, 104276, 71);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106106, 'Melissa', 'Credit Analyst', 103306, 104276, 36);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106107, 'Amber', 'Loan Closer', 103307, 104276, 62);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106108, 'Jeffrey', 'Manager', 103308, 104277, 47);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106109, 'Sara', 'Officer', 103309, 104277, 89);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106110, 'Tammie', 'Credit Analyst', 103310, 104277, 45);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106111, 'Alyssa', 'Loan Closer', 103311, 104277, 18);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106112, 'Eric', 'Manager', 103312, 104278, 19);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106113, 'Deborah', 'Officer', 103313, 104278, 73);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106114, 'Shannon', 'Credit Analyst', 103314, 104278, 66);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106115, 'Amber', 'Loan Closer', 103315, 104278, 58);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106116, 'Andrew', 'Manager', 103316, 104279, 62);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106117, 'Amy', 'Officer', 103317, 104279, 36);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106118, 'Debbie', 'Credit Analyst', 103318, 104279, 72);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106119, 'Christopher', 'Loan Closer', 103319, 104279, 44);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106120, 'James', 'Manager', 103320, 104280, 58);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106121, 'Kenneth', 'Officer', 103321, 104280, 39);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106122, 'Tracy', 'Credit Analyst', 103322, 104280, 86);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106123, 'Ryan', 'Loan Closer', 103323, 104280, 88);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106124, 'Nathan', 'Manager', 103324, 104281, 43);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106125, 'Kathleen', 'Officer', 103325, 104281, 23);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106126, 'Theodore', 'Credit Analyst', 103326, 104281, 19);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106127, 'Edgar', 'Loan Closer', 103327, 104281, 56);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106128, 'Kevin', 'Manager', 103328, 104282, 37);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106129, 'Brianna', 'Officer', 103329, 104282, 76);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106130, 'Karl', 'Credit Analyst', 103330, 104282, 59);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106131, 'Roberto', 'Loan Closer', 103331, 104282, 74);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106132, 'Christopher', 'Manager', 103332, 104283, 70);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106133, 'Michael', 'Officer', 103333, 104283, 63);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106134, 'Jeffrey', 'Credit Analyst', 103334, 104283, 33);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106135, 'Sean', 'Loan Closer', 103335, 104283, 90);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106136, 'David', 'Manager', 103336, 104284, 38);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106137, 'Danny', 'Officer', 103337, 104284, 23);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106138, 'Elizabeth', 'Credit Analyst', 103338, 104284, 57);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106139, 'Kelly', 'Loan Closer', 103339, 104284, 81);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106140, 'Sharon', 'Manager', 103340, 104285, 40);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106141, 'Alex', 'Officer', 103341, 104285, 49);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106142, 'Ronald', 'Credit Analyst', 103342, 104285, 18);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106143, 'Ricky', 'Loan Closer', 103343, 104285, 41);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106144, 'Linda', 'Manager', 103344, 104286, 36);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106145, 'Eric', 'Officer', 103345, 104286, 80);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106146, 'Ronald', 'Credit Analyst', 103346, 104286, 59);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106147, 'Kevin', 'Loan Closer', 103347, 104286, 89);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106148, 'Benjamin', 'Manager', 103348, 104287, 35);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106149, 'David', 'Officer', 103349, 104287, 89);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106150, 'Joseph', 'Credit Analyst', 103350, 104287, 74);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106151, 'Michelle', 'Loan Closer', 103351, 104287, 59);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106152, 'Brenda', 'Manager', 103352, 104288, 82);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106153, 'Samantha', 'Officer', 103353, 104288, 89);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106154, 'Daniel', 'Credit Analyst', 103354, 104288, 26);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106155, 'Geoffrey', 'Loan Closer', 103355, 104288, 88);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106156, 'Renee', 'Manager', 103356, 104289, 61);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106157, 'Matthew', 'Officer', 103357, 104289, 33);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106158, 'Mark', 'Credit Analyst', 103358, 104289, 86);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106159, 'Luis', 'Loan Closer', 103359, 104289, 78);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106160, 'Tina', 'Manager', 103360, 104290, 21);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106161, 'Sherry', 'Officer', 103361, 104290, 67);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106162, 'Joshua', 'Credit Analyst', 103362, 104290, 64);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106163, 'Matthew', 'Loan Closer', 103363, 104290, 53);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106164, 'Kathleen', 'Manager', 103364, 104291, 56);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106165, 'Zachary', 'Officer', 103365, 104291, 26);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106166, 'Stacey', 'Credit Analyst', 103366, 104291, 37);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106167, 'Jaime', 'Loan Closer', 103367, 104291, 32);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106168, 'Mario', 'Manager', 103368, 104292, 20);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106169, 'Christopher', 'Officer', 103369, 104292, 44);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106170, 'Patrick', 'Credit Analyst', 103370, 104292, 49);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106171, 'Christopher', 'Loan Closer', 103371, 104292, 81);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106172, 'Kevin', 'Manager', 103372, 104293, 60);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106173, 'Timothy', 'Officer', 103373, 104293, 38);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106174, 'Jason', 'Credit Analyst', 103374, 104293, 52);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106175, 'Linda', 'Loan Closer', 103375, 104293, 65);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106176, 'John', 'Manager', 103376, 104294, 89);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106177, 'Christopher', 'Officer', 103377, 104294, 30);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106178, 'Michael', 'Credit Analyst', 103378, 104294, 76);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106179, 'Thomas', 'Loan Closer', 103379, 104294, 52);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106180, 'Jessica', 'Manager', 103380, 104295, 72);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106181, 'Michelle', 'Officer', 103381, 104295, 61);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106182, 'Jacob', 'Credit Analyst', 103382, 104295, 24);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106183, 'Jason', 'Loan Closer', 103383, 104295, 66);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106184, 'Matthew', 'Manager', 103384, 104296, 76);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106185, 'Thomas', 'Officer', 103385, 104296, 32);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106186, 'Bridget', 'Credit Analyst', 103386, 104296, 77);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106187, 'Michael', 'Loan Closer', 103387, 104296, 89);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106188, 'Martha', 'Manager', 103388, 104297, 81);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106189, 'Alexander', 'Officer', 103389, 104297, 47);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106190, 'Jessica', 'Credit Analyst', 103390, 104297, 87);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106191, 'Susan', 'Loan Closer', 103391, 104297, 54);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106192, 'Debra', 'Manager', 103392, 104298, 55);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106193, 'James', 'Officer', 103393, 104298, 71);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106194, 'Martin', 'Credit Analyst', 103394, 104298, 26);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106195, 'Stephanie', 'Loan Closer', 103395, 104298, 64);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106196, 'Robyn', 'Manager', 103396, 104299, 49);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106197, 'Matthew', 'Officer', 103397, 104299, 87);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106198, 'Elizabeth', 'Credit Analyst', 103398, 104299, 43);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106199, 'Matthew', 'Loan Closer', 103399, 104299, 65);
commit;
prompt 1200 records committed...
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106200, 'Anthony', 'Manager', 103000, 104300, 39);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106201, 'Mark', 'Officer', 103001, 104300, 37);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106202, 'Donald', 'Credit Analyst', 103002, 104300, 44);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106203, 'Kim', 'Loan Closer', 103003, 104300, 53);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106204, 'Jacob', 'Manager', 103004, 104301, 19);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106205, 'Edgar', 'Officer', 103005, 104301, 52);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106206, 'Sabrina', 'Credit Analyst', 103006, 104301, 19);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106207, 'Gail', 'Loan Closer', 103007, 104301, 55);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106208, 'Donna', 'Manager', 103008, 104302, 25);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106209, 'Danielle', 'Officer', 103009, 104302, 35);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106210, 'Jacqueline', 'Credit Analyst', 103010, 104302, 22);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106211, 'Carl', 'Loan Closer', 103011, 104302, 89);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106212, 'Jonathan', 'Manager', 103012, 104303, 89);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106213, 'Christopher', 'Officer', 103013, 104303, 68);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106214, 'Amber', 'Credit Analyst', 103014, 104303, 63);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106215, 'Jessica', 'Loan Closer', 103015, 104303, 42);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106216, 'Emily', 'Manager', 103016, 104304, 24);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106217, 'Mary', 'Officer', 103017, 104304, 22);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106218, 'Kim', 'Credit Analyst', 103018, 104304, 22);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106219, 'Laura', 'Loan Closer', 103019, 104304, 23);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106220, 'Robert', 'Manager', 103020, 104305, 68);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106221, 'Allison', 'Officer', 103021, 104305, 84);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106222, 'Matthew', 'Credit Analyst', 103022, 104305, 55);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106223, 'Donald', 'Loan Closer', 103023, 104305, 51);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106224, 'Beverly', 'Manager', 103024, 104306, 59);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106225, 'Blake', 'Officer', 103025, 104306, 80);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106226, 'William', 'Credit Analyst', 103026, 104306, 59);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106227, 'Christopher', 'Loan Closer', 103027, 104306, 22);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106228, 'Allen', 'Manager', 103028, 104307, 64);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106229, 'Barbara', 'Officer', 103029, 104307, 41);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106230, 'Jacob', 'Credit Analyst', 103030, 104307, 49);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106231, 'Kelly', 'Loan Closer', 103031, 104307, 51);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106232, 'Jessica', 'Manager', 103032, 104308, 70);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106233, 'Julia', 'Officer', 103033, 104308, 82);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106234, 'Patrick', 'Credit Analyst', 103034, 104308, 41);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106235, 'Rebecca', 'Loan Closer', 103035, 104308, 67);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106236, 'Travis', 'Manager', 103036, 104309, 89);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106237, 'Tammy', 'Officer', 103037, 104309, 32);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106238, 'Kim', 'Credit Analyst', 103038, 104309, 32);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106239, 'Michael', 'Loan Closer', 103039, 104309, 33);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106240, 'Timothy', 'Manager', 103040, 104310, 35);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106241, 'Daniel', 'Officer', 103041, 104310, 24);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106242, 'Michael', 'Credit Analyst', 103042, 104310, 43);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106243, 'Tony', 'Loan Closer', 103043, 104310, 62);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106244, 'Jennifer', 'Manager', 103044, 104311, 36);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106245, 'Johnny', 'Officer', 103045, 104311, 54);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106246, 'Nicole', 'Credit Analyst', 103046, 104311, 68);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106247, 'Scott', 'Loan Closer', 103047, 104311, 56);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106248, 'Melissa', 'Manager', 103048, 104312, 24);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106249, 'Jason', 'Officer', 103049, 104312, 41);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106250, 'Pamela', 'Credit Analyst', 103050, 104312, 82);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106251, 'Brian', 'Loan Closer', 103051, 104312, 90);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106252, 'David', 'Manager', 103052, 104313, 86);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106253, 'John', 'Officer', 103053, 104313, 78);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106254, 'Robert', 'Credit Analyst', 103054, 104313, 54);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106255, 'Sarah', 'Loan Closer', 103055, 104313, 28);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106256, 'Christopher', 'Manager', 103056, 104314, 75);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106257, 'Dana', 'Officer', 103057, 104314, 70);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106258, 'Cindy', 'Credit Analyst', 103058, 104314, 88);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106259, 'Denise', 'Loan Closer', 103059, 104314, 27);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106260, 'Deborah', 'Manager', 103060, 104315, 57);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106261, 'Monique', 'Officer', 103061, 104315, 31);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106262, 'Andrew', 'Credit Analyst', 103062, 104315, 67);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106263, 'Kelsey', 'Loan Closer', 103063, 104315, 70);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106264, 'Joshua', 'Manager', 103064, 104316, 90);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106265, 'Terri', 'Officer', 103065, 104316, 37);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106266, 'Tommy', 'Credit Analyst', 103066, 104316, 25);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106267, 'Susan', 'Loan Closer', 103067, 104316, 72);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106268, 'Raymond', 'Manager', 103068, 104317, 80);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106269, 'Patricia', 'Officer', 103069, 104317, 90);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106270, 'Jacqueline', 'Credit Analyst', 103070, 104317, 81);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106271, 'Rachel', 'Loan Closer', 103071, 104317, 66);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106272, 'Lauren', 'Manager', 103072, 104318, 41);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106273, 'Linda', 'Officer', 103073, 104318, 45);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106274, 'Michael', 'Credit Analyst', 103074, 104318, 55);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106275, 'Anthony', 'Loan Closer', 103075, 104318, 83);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106276, 'James', 'Manager', 103076, 104319, 90);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106277, 'Lindsay', 'Officer', 103077, 104319, 90);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106278, 'Stephanie', 'Credit Analyst', 103078, 104319, 85);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106279, 'Katie', 'Loan Closer', 103079, 104319, 46);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106280, 'Deborah', 'Manager', 103080, 104320, 21);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106281, 'Jill', 'Officer', 103081, 104320, 69);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106282, 'David', 'Credit Analyst', 103082, 104320, 51);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106283, 'Vicki', 'Loan Closer', 103083, 104320, 85);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106284, 'Wendy', 'Manager', 103084, 104321, 80);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106285, 'Aaron', 'Officer', 103085, 104321, 74);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106286, 'Renee', 'Credit Analyst', 103086, 104321, 70);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106287, 'Jody', 'Loan Closer', 103087, 104321, 33);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106288, 'Kyle', 'Manager', 103088, 104322, 60);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106289, 'Roy', 'Officer', 103089, 104322, 35);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106290, 'Michael', 'Credit Analyst', 103090, 104322, 76);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106291, 'David', 'Loan Closer', 103091, 104322, 56);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106292, 'Jeffrey', 'Manager', 103092, 104323, 62);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106293, 'Diana', 'Officer', 103093, 104323, 85);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106294, 'Aimee', 'Credit Analyst', 103094, 104323, 46);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106295, 'Chelsea', 'Loan Closer', 103095, 104323, 87);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106296, 'Caitlin', 'Manager', 103096, 104324, 88);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106297, 'Jennifer', 'Officer', 103097, 104324, 48);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106298, 'Charles', 'Credit Analyst', 103098, 104324, 74);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106299, 'Trevor', 'Loan Closer', 103099, 104324, 66);
commit;
prompt 1300 records committed...
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106300, 'Jennifer', 'Manager', 103100, 104325, 45);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106301, 'Michele', 'Officer', 103101, 104325, 28);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106302, 'Kevin', 'Credit Analyst', 103102, 104325, 74);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106303, 'Margaret', 'Loan Closer', 103103, 104325, 39);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106304, 'Christine', 'Manager', 103104, 104326, 44);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106305, 'Heather', 'Officer', 103105, 104326, 81);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106306, 'Thomas', 'Credit Analyst', 103106, 104326, 58);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106307, 'Katelyn', 'Loan Closer', 103107, 104326, 40);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106308, 'Catherine', 'Manager', 103108, 104327, 53);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106309, 'Caleb', 'Officer', 103109, 104327, 76);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106310, 'Alexander', 'Credit Analyst', 103110, 104327, 81);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106311, 'Lauren', 'Loan Closer', 103111, 104327, 33);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106312, 'Katherine', 'Manager', 103112, 104328, 68);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106313, 'Adam', 'Officer', 103113, 104328, 25);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106314, 'Kelly', 'Credit Analyst', 103114, 104328, 79);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106315, 'Mark', 'Loan Closer', 103115, 104328, 45);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106316, 'Aaron', 'Manager', 103116, 104329, 70);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106317, 'Denise', 'Officer', 103117, 104329, 50);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106318, 'John', 'Credit Analyst', 103118, 104329, 40);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106319, 'Marisa', 'Loan Closer', 103119, 104329, 47);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106320, 'Emily', 'Manager', 103120, 104330, 56);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106321, 'Alisha', 'Officer', 103121, 104330, 88);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106322, 'Tiffany', 'Credit Analyst', 103122, 104330, 82);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106323, 'Priscilla', 'Loan Closer', 103123, 104330, 31);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106324, 'Kevin', 'Manager', 103124, 104331, 45);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106325, 'Andre', 'Officer', 103125, 104331, 19);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106326, 'Belinda', 'Credit Analyst', 103126, 104331, 74);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106327, 'Connie', 'Loan Closer', 103127, 104331, 56);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106328, 'Jennifer', 'Manager', 103128, 104332, 63);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106329, 'Luis', 'Officer', 103129, 104332, 41);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106330, 'Robert', 'Credit Analyst', 103130, 104332, 39);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106331, 'Craig', 'Loan Closer', 103131, 104332, 21);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106332, 'Rebecca', 'Manager', 103132, 104333, 84);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106333, 'Billy', 'Officer', 103133, 104333, 58);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106334, 'Matthew', 'Credit Analyst', 103134, 104333, 66);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106335, 'Melissa', 'Loan Closer', 103135, 104333, 45);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106336, 'Timothy', 'Manager', 103136, 104334, 78);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106337, 'Katie', 'Officer', 103137, 104334, 77);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106338, 'Jesse', 'Credit Analyst', 103138, 104334, 53);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106339, 'Nicholas', 'Loan Closer', 103139, 104334, 42);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106340, 'Aaron', 'Manager', 103140, 104335, 51);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106341, 'Sara', 'Officer', 103141, 104335, 70);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106342, 'Robert', 'Credit Analyst', 103142, 104335, 81);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106343, 'Sabrina', 'Loan Closer', 103143, 104335, 49);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106344, 'Melissa', 'Manager', 103144, 104336, 31);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106345, 'Jasmine', 'Officer', 103145, 104336, 78);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106346, 'Joseph', 'Credit Analyst', 103146, 104336, 88);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106347, 'John', 'Loan Closer', 103147, 104336, 43);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106348, 'Cassandra', 'Manager', 103148, 104337, 65);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106349, 'Kari', 'Officer', 103149, 104337, 48);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106350, 'Mary', 'Credit Analyst', 103150, 104337, 82);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106351, 'Michael', 'Loan Closer', 103151, 104337, 55);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106352, 'Nicole', 'Manager', 103152, 104338, 60);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106353, 'Pamela', 'Officer', 103153, 104338, 69);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106354, 'Eric', 'Credit Analyst', 103154, 104338, 57);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106355, 'Ronald', 'Loan Closer', 103155, 104338, 52);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106356, 'Adrian', 'Manager', 103156, 104339, 60);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106357, 'Julie', 'Officer', 103157, 104339, 46);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106358, 'Amy', 'Credit Analyst', 103158, 104339, 45);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106359, 'Bradley', 'Loan Closer', 103159, 104339, 41);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106360, 'Nicholas', 'Manager', 103160, 104340, 50);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106361, 'David', 'Officer', 103161, 104340, 66);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106362, 'John', 'Credit Analyst', 103162, 104340, 54);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106363, 'Sonya', 'Loan Closer', 103163, 104340, 52);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106364, 'Trevor', 'Manager', 103164, 104341, 37);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106365, 'Michelle', 'Officer', 103165, 104341, 75);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106366, 'Leonard', 'Credit Analyst', 103166, 104341, 23);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106367, 'Jeffery', 'Loan Closer', 103167, 104341, 71);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106368, 'Jeffrey', 'Manager', 103168, 104342, 32);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106369, 'Erica', 'Officer', 103169, 104342, 29);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106370, 'Sarah', 'Credit Analyst', 103170, 104342, 56);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106371, 'Mary', 'Loan Closer', 103171, 104342, 38);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106372, 'Heather', 'Manager', 103172, 104343, 86);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106373, 'Abigail', 'Officer', 103173, 104343, 69);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106374, 'Andre', 'Credit Analyst', 103174, 104343, 79);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106375, 'Ivan', 'Loan Closer', 103175, 104343, 89);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106376, 'Tiffany', 'Manager', 103176, 104344, 38);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106377, 'Jose', 'Officer', 103177, 104344, 35);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106378, 'Pamela', 'Credit Analyst', 103178, 104344, 72);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106379, 'Cynthia', 'Loan Closer', 103179, 104344, 79);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106380, 'Connie', 'Manager', 103180, 104345, 44);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106381, 'Richard', 'Officer', 103181, 104345, 42);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106382, 'Dana', 'Credit Analyst', 103182, 104345, 21);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106383, 'Manuel', 'Loan Closer', 103183, 104345, 26);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106384, 'Melissa', 'Manager', 103184, 104346, 39);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106385, 'Jessica', 'Officer', 103185, 104346, 58);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106386, 'Mary', 'Credit Analyst', 103186, 104346, 34);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106387, 'David', 'Loan Closer', 103187, 104346, 72);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106388, 'Daniel', 'Manager', 103188, 104347, 59);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106389, 'Eric', 'Officer', 103189, 104347, 75);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106390, 'James', 'Credit Analyst', 103190, 104347, 51);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106391, 'Wendy', 'Loan Closer', 103191, 104347, 21);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106392, 'Eric', 'Manager', 103192, 104348, 21);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106393, 'Jonathan', 'Officer', 103193, 104348, 90);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106394, 'Emily', 'Credit Analyst', 103194, 104348, 69);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106395, 'Carolyn', 'Loan Closer', 103195, 104348, 57);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106396, 'Lauren', 'Manager', 103196, 104349, 39);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106397, 'Lisa', 'Officer', 103197, 104349, 72);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106398, 'Brittany', 'Credit Analyst', 103198, 104349, 60);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106399, 'Jason', 'Loan Closer', 103199, 104349, 74);
commit;
prompt 1400 records committed...
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106400, 'Carolyn', 'Manager', 103200, 104350, 90);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106401, 'Margaret', 'Officer', 103201, 104350, 86);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106402, 'Miguel', 'Credit Analyst', 103202, 104350, 35);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106403, 'Susan', 'Loan Closer', 103203, 104350, 40);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106404, 'Michael', 'Manager', 103204, 104351, 52);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106405, 'Brett', 'Officer', 103205, 104351, 76);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106406, 'Jason', 'Credit Analyst', 103206, 104351, 73);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106407, 'Olivia', 'Loan Closer', 103207, 104351, 52);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106408, 'Christopher', 'Manager', 103208, 104352, 35);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106409, 'Erin', 'Officer', 103209, 104352, 29);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106410, 'Christopher', 'Credit Analyst', 103210, 104352, 43);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106411, 'Michael', 'Loan Closer', 103211, 104352, 83);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106412, 'Christopher', 'Manager', 103212, 104353, 71);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106413, 'Barbara', 'Officer', 103213, 104353, 49);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106414, 'Erika', 'Credit Analyst', 103214, 104353, 40);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106415, 'Evan', 'Loan Closer', 103215, 104353, 29);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106416, 'Lee', 'Manager', 103216, 104354, 52);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106417, 'Kevin', 'Officer', 103217, 104354, 83);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106418, 'Lee', 'Credit Analyst', 103218, 104354, 73);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106419, 'Willie', 'Loan Closer', 103219, 104354, 79);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106420, 'Leslie', 'Manager', 103220, 104355, 78);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106421, 'Zachary', 'Officer', 103221, 104355, 58);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106422, 'Tyler', 'Credit Analyst', 103222, 104355, 49);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106423, 'Priscilla', 'Loan Closer', 103223, 104355, 86);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106424, 'Michael', 'Manager', 103224, 104356, 56);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106425, 'Ashley', 'Officer', 103225, 104356, 23);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106426, 'Brittany', 'Credit Analyst', 103226, 104356, 83);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106427, 'Alvin', 'Loan Closer', 103227, 104356, 34);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106428, 'Veronica', 'Manager', 103228, 104357, 24);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106429, 'Ruben', 'Officer', 103229, 104357, 37);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106430, 'Samuel', 'Credit Analyst', 103230, 104357, 26);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106431, 'Stephanie', 'Loan Closer', 103231, 104357, 86);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106432, 'Philip', 'Manager', 103232, 104358, 27);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106433, 'Lori', 'Officer', 103233, 104358, 44);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106434, 'Janice', 'Credit Analyst', 103234, 104358, 32);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106435, 'Jason', 'Loan Closer', 103235, 104358, 58);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106436, 'Cheryl', 'Manager', 103236, 104359, 58);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106437, 'Ann', 'Officer', 103237, 104359, 73);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106438, 'Shelby', 'Credit Analyst', 103238, 104359, 27);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106439, 'Robert', 'Loan Closer', 103239, 104359, 29);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106440, 'Stephanie', 'Manager', 103240, 104360, 84);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106441, 'Daniel', 'Officer', 103241, 104360, 63);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106442, 'Linda', 'Credit Analyst', 103242, 104360, 60);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106443, 'Cory', 'Loan Closer', 103243, 104360, 60);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106444, 'Aaron', 'Manager', 103244, 104361, 36);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106445, 'Amy', 'Officer', 103245, 104361, 18);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106446, 'John', 'Credit Analyst', 103246, 104361, 67);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106447, 'Rachel', 'Loan Closer', 103247, 104361, 58);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106448, 'Barry', 'Manager', 103248, 104362, 57);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106449, 'Gregory', 'Officer', 103249, 104362, 29);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106450, 'Kenneth', 'Credit Analyst', 103250, 104362, 45);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106451, 'Elizabeth', 'Loan Closer', 103251, 104362, 30);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106452, 'Nicole', 'Manager', 103252, 104363, 50);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106453, 'Kristin', 'Officer', 103253, 104363, 46);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106454, 'Zachary', 'Credit Analyst', 103254, 104363, 64);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106455, 'Diana', 'Loan Closer', 103255, 104363, 21);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106456, 'Sarah', 'Manager', 103256, 104364, 86);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106457, 'John', 'Officer', 103257, 104364, 83);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106458, 'Henry', 'Credit Analyst', 103258, 104364, 60);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106459, 'Alice', 'Loan Closer', 103259, 104364, 46);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106460, 'Dylan', 'Manager', 103260, 104365, 37);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106461, 'Kelly', 'Officer', 103261, 104365, 76);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106462, 'Laura', 'Credit Analyst', 103262, 104365, 62);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106463, 'Scott', 'Loan Closer', 103263, 104365, 51);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106464, 'Lindsey', 'Manager', 103264, 104366, 38);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106465, 'Chad', 'Officer', 103265, 104366, 77);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106466, 'Yesenia', 'Credit Analyst', 103266, 104366, 47);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106467, 'Karen', 'Loan Closer', 103267, 104366, 89);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106468, 'Danielle', 'Manager', 103268, 104367, 40);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106469, 'Elizabeth', 'Officer', 103269, 104367, 64);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106470, 'Samuel', 'Credit Analyst', 103270, 104367, 86);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106471, 'Michael', 'Loan Closer', 103271, 104367, 67);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106472, 'Gregory', 'Manager', 103272, 104368, 56);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106473, 'Rita', 'Officer', 103273, 104368, 46);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106474, 'Thomas', 'Credit Analyst', 103274, 104368, 85);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106475, 'Elizabeth', 'Loan Closer', 103275, 104368, 68);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106476, 'Matthew', 'Manager', 103276, 104369, 36);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106477, 'Douglas', 'Officer', 103277, 104369, 86);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106478, 'Alice', 'Credit Analyst', 103278, 104369, 69);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106479, 'Christina', 'Loan Closer', 103279, 104369, 37);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106480, 'Angela', 'Manager', 103280, 104370, 40);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106481, 'Patricia', 'Officer', 103281, 104370, 60);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106482, 'Antonio', 'Credit Analyst', 103282, 104370, 50);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106483, 'Christina', 'Loan Closer', 103283, 104370, 77);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106484, 'Sara', 'Manager', 103284, 104371, 49);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106485, 'Garrett', 'Officer', 103285, 104371, 76);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106486, 'Kevin', 'Credit Analyst', 103286, 104371, 70);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106487, 'Laura', 'Loan Closer', 103287, 104371, 79);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106488, 'Angela', 'Manager', 103288, 104372, 52);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106489, 'Frank', 'Officer', 103289, 104372, 24);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106490, 'Barbara', 'Credit Analyst', 103290, 104372, 78);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106491, 'Kathryn', 'Loan Closer', 103291, 104372, 84);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106492, 'David', 'Manager', 103292, 104373, 38);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106493, 'Danielle', 'Officer', 103293, 104373, 47);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106494, 'Courtney', 'Credit Analyst', 103294, 104373, 46);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106495, 'Hannah', 'Loan Closer', 103295, 104373, 75);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106496, 'Anthony', 'Manager', 103296, 104374, 78);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106497, 'Joseph', 'Officer', 103297, 104374, 78);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106498, 'Reginald', 'Credit Analyst', 103298, 104374, 19);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106499, 'Tyler', 'Loan Closer', 103299, 104374, 90);
commit;
prompt 1500 records committed...
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106500, 'Erik', 'Manager', 103300, 104375, 27);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106501, 'David', 'Officer', 103301, 104375, 36);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106502, 'Katherine', 'Credit Analyst', 103302, 104375, 32);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106503, 'Matthew', 'Loan Closer', 103303, 104375, 27);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106504, 'Susan', 'Manager', 103304, 104376, 58);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106505, 'Theodore', 'Officer', 103305, 104376, 85);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106506, 'Joe', 'Credit Analyst', 103306, 104376, 62);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106507, 'Summer', 'Loan Closer', 103307, 104376, 27);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106508, 'Donald', 'Manager', 103308, 104377, 36);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106509, 'Melissa', 'Officer', 103309, 104377, 27);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106510, 'Meredith', 'Credit Analyst', 103310, 104377, 79);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106511, 'Gregory', 'Loan Closer', 103311, 104377, 85);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106512, 'Danielle', 'Manager', 103312, 104378, 67);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106513, 'Gerald', 'Officer', 103313, 104378, 77);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106514, 'Laura', 'Credit Analyst', 103314, 104378, 53);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106515, 'Mary', 'Loan Closer', 103315, 104378, 76);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106516, 'Phillip', 'Manager', 103316, 104379, 79);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106517, 'Seth', 'Officer', 103317, 104379, 34);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106518, 'Calvin', 'Credit Analyst', 103318, 104379, 25);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106519, 'Rebecca', 'Loan Closer', 103319, 104379, 69);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106520, 'Mary', 'Manager', 103320, 104380, 53);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106521, 'Dawn', 'Officer', 103321, 104380, 72);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106522, 'Ashley', 'Credit Analyst', 103322, 104380, 79);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106523, 'Donna', 'Loan Closer', 103323, 104380, 37);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106524, 'Mary', 'Manager', 103324, 104381, 60);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106525, 'Stacy', 'Officer', 103325, 104381, 79);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106526, 'Steven', 'Credit Analyst', 103326, 104381, 59);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106527, 'James', 'Loan Closer', 103327, 104381, 84);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106528, 'Jennifer', 'Manager', 103328, 104382, 36);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106529, 'Mary', 'Officer', 103329, 104382, 71);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106530, 'Casey', 'Credit Analyst', 103330, 104382, 84);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106531, 'Jason', 'Loan Closer', 103331, 104382, 53);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106532, 'Makayla', 'Manager', 103332, 104383, 75);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106533, 'Victor', 'Officer', 103333, 104383, 65);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106534, 'Brenda', 'Credit Analyst', 103334, 104383, 86);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106535, 'Amanda', 'Loan Closer', 103335, 104383, 46);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106536, 'Rachel', 'Manager', 103336, 104384, 74);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106537, 'Donald', 'Officer', 103337, 104384, 53);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106538, 'Marc', 'Credit Analyst', 103338, 104384, 29);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106539, 'Stephanie', 'Loan Closer', 103339, 104384, 53);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106540, 'Charles', 'Manager', 103340, 104385, 77);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106541, 'Jennifer', 'Officer', 103341, 104385, 69);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106542, 'Alex', 'Credit Analyst', 103342, 104385, 67);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106543, 'Tyler', 'Loan Closer', 103343, 104385, 34);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106544, 'Richard', 'Manager', 103344, 104386, 40);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106545, 'Christy', 'Officer', 103345, 104386, 90);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106546, 'Alexander', 'Credit Analyst', 103346, 104386, 65);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106547, 'Maria', 'Loan Closer', 103347, 104386, 24);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106548, 'Nicole', 'Manager', 103348, 104387, 73);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106549, 'Lisa', 'Officer', 103349, 104387, 84);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106550, 'Sharon', 'Credit Analyst', 103350, 104387, 83);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106551, 'Toni', 'Loan Closer', 103351, 104387, 70);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106552, 'Michael', 'Manager', 103352, 104388, 89);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106553, 'Alex', 'Officer', 103353, 104388, 56);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106554, 'Mark', 'Credit Analyst', 103354, 104388, 36);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106555, 'Jessica', 'Loan Closer', 103355, 104388, 59);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106556, 'Alexis', 'Manager', 103356, 104389, 76);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106557, 'Claudia', 'Officer', 103357, 104389, 82);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106558, 'Tiffany', 'Credit Analyst', 103358, 104389, 68);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106559, 'Donald', 'Loan Closer', 103359, 104389, 33);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106560, 'Jose', 'Manager', 103360, 104390, 63);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106561, 'Jessica', 'Officer', 103361, 104390, 58);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106562, 'Robert', 'Credit Analyst', 103362, 104390, 25);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106563, 'Julie', 'Loan Closer', 103363, 104390, 33);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106564, 'Stacy', 'Manager', 103364, 104391, 34);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106565, 'Sabrina', 'Officer', 103365, 104391, 72);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106566, 'Amy', 'Credit Analyst', 103366, 104391, 61);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106567, 'Karen', 'Loan Closer', 103367, 104391, 47);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106568, 'Deborah', 'Manager', 103368, 104392, 44);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106569, 'Harold', 'Officer', 103369, 104392, 65);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106570, 'Lawrence', 'Credit Analyst', 103370, 104392, 45);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106571, 'Kenneth', 'Loan Closer', 103371, 104392, 90);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106572, 'Toni', 'Manager', 103372, 104393, 55);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106573, 'Bradley', 'Officer', 103373, 104393, 88);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106574, 'Darryl', 'Credit Analyst', 103374, 104393, 37);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106575, 'Audrey', 'Loan Closer', 103375, 104393, 25);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106576, 'Steven', 'Manager', 103376, 104394, 61);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106577, 'Krista', 'Officer', 103377, 104394, 19);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106578, 'Lisa', 'Credit Analyst', 103378, 104394, 79);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106579, 'Dan', 'Loan Closer', 103379, 104394, 77);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106580, 'Mark', 'Manager', 103380, 104395, 79);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106581, 'David', 'Officer', 103381, 104395, 63);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106582, 'James', 'Credit Analyst', 103382, 104395, 81);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106583, 'Robert', 'Loan Closer', 103383, 104395, 88);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106584, 'Earl', 'Manager', 103384, 104396, 31);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106585, 'Tanya', 'Officer', 103385, 104396, 68);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106586, 'Wendy', 'Credit Analyst', 103386, 104396, 68);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106587, 'William', 'Loan Closer', 103387, 104396, 46);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106588, 'Kevin', 'Manager', 103388, 104397, 61);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106589, 'Gina', 'Officer', 103389, 104397, 21);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106590, 'Matthew', 'Credit Analyst', 103390, 104397, 51);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106591, 'William', 'Loan Closer', 103391, 104397, 66);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106592, 'Michael', 'Manager', 103392, 104398, 54);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106593, 'Amy', 'Officer', 103393, 104398, 52);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106594, 'Ryan', 'Credit Analyst', 103394, 104398, 35);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106595, 'Christine', 'Loan Closer', 103395, 104398, 85);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106596, 'Michele', 'Manager', 103396, 104399, 28);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106597, 'Caitlin', 'Officer', 103397, 104399, 73);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106598, 'Patrick', 'Credit Analyst', 103398, 104399, 61);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (106599, 'Christopher', 'Loan Closer', 103399, 104399, 90);
commit;
prompt 1600 records committed...
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid, workerage)
values (107001, 'Taryn', 'Manager', 103401, 104996, 120);
commit;
prompt 1601 records loaded
prompt Enabling foreign key constraints for BRANCHE...
alter table BRANCHE enable constraint SYS_C008920;
prompt Enabling foreign key constraints for CUSTOMERS...
alter table CUSTOMERS enable constraint SYS_C008927;
prompt Enabling foreign key constraints for LOANS...
alter table LOANS enable constraint SYS_C008933;
prompt Enabling foreign key constraints for WORKERS...
alter table WORKERS enable constraint SYS_C008941;
alter table WORKERS enable constraint SYS_C008942;
prompt Enabling triggers for REPORTERS...
alter table REPORTERS enable all triggers;
prompt Enabling triggers for BRANCHE...
alter table BRANCHE enable all triggers;
prompt Enabling triggers for CUSTOMERS...
alter table CUSTOMERS enable all triggers;
prompt Enabling triggers for LOANS...
alter table LOANS enable all triggers;
prompt Enabling triggers for TEAMS...
alter table TEAMS enable all triggers;
prompt Enabling triggers for WORKERS...
alter table WORKERS enable all triggers;

set feedback on
set define on
prompt Done

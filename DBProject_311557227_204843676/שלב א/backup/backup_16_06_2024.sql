prompt PL/SQL Developer Export Tables for user SYS@XE
prompt Created by tsuri on Sunday, June 16, 2024
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
  branchelocation VARCHAR2(20) not null,
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
  workday VARCHAR2(10)
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
  teamid     INTEGER not null
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
alter table BRANCHE disable constraint SYS_C008788;
prompt Disabling foreign key constraints for CUSTOMERS...
alter table CUSTOMERS disable constraint SYS_C008795;
prompt Disabling foreign key constraints for LOANS...
alter table LOANS disable constraint SYS_C008801;
prompt Disabling foreign key constraints for WORKERS...
alter table WORKERS disable constraint SYS_C008808;
alter table WORKERS disable constraint SYS_C008809;
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
values (102000, 'Bonnie');
insert into REPORTERS (reporterid, reportername)
values (102001, 'Summer');
insert into REPORTERS (reporterid, reportername)
values (102002, 'Hannah');
insert into REPORTERS (reporterid, reportername)
values (102003, 'Melissa');
insert into REPORTERS (reporterid, reportername)
values (102004, 'Wyatt');
insert into REPORTERS (reporterid, reportername)
values (102005, 'Jessica');
insert into REPORTERS (reporterid, reportername)
values (102006, 'Nancy');
insert into REPORTERS (reporterid, reportername)
values (102007, 'Jonathan');
insert into REPORTERS (reporterid, reportername)
values (102008, 'Crystal');
insert into REPORTERS (reporterid, reportername)
values (102009, 'Jamie');
insert into REPORTERS (reporterid, reportername)
values (102010, 'Kathleen');
insert into REPORTERS (reporterid, reportername)
values (102011, 'Matthew');
insert into REPORTERS (reporterid, reportername)
values (102012, 'Jacob');
insert into REPORTERS (reporterid, reportername)
values (102013, 'Michelle');
insert into REPORTERS (reporterid, reportername)
values (102014, 'Michael');
insert into REPORTERS (reporterid, reportername)
values (102015, 'Matthew');
insert into REPORTERS (reporterid, reportername)
values (102016, 'Jessica');
insert into REPORTERS (reporterid, reportername)
values (102017, 'Michele');
insert into REPORTERS (reporterid, reportername)
values (102018, 'Nathan');
insert into REPORTERS (reporterid, reportername)
values (102019, 'Charles');
insert into REPORTERS (reporterid, reportername)
values (102020, 'Jennifer');
insert into REPORTERS (reporterid, reportername)
values (102021, 'Michael');
insert into REPORTERS (reporterid, reportername)
values (102022, 'Breanna');
insert into REPORTERS (reporterid, reportername)
values (102023, 'Benjamin');
insert into REPORTERS (reporterid, reportername)
values (102024, 'Julia');
insert into REPORTERS (reporterid, reportername)
values (102025, 'Kristen');
insert into REPORTERS (reporterid, reportername)
values (102026, 'Meredith');
insert into REPORTERS (reporterid, reportername)
values (102027, 'Kevin');
insert into REPORTERS (reporterid, reportername)
values (102028, 'Natasha');
insert into REPORTERS (reporterid, reportername)
values (102029, 'Katie');
insert into REPORTERS (reporterid, reportername)
values (102030, 'Shannon');
insert into REPORTERS (reporterid, reportername)
values (102031, 'Luis');
insert into REPORTERS (reporterid, reportername)
values (102032, 'Denise');
insert into REPORTERS (reporterid, reportername)
values (102033, 'Jennifer');
insert into REPORTERS (reporterid, reportername)
values (102034, 'Emily');
insert into REPORTERS (reporterid, reportername)
values (102035, 'Joseph');
insert into REPORTERS (reporterid, reportername)
values (102036, 'Lisa');
insert into REPORTERS (reporterid, reportername)
values (102037, 'Jennifer');
insert into REPORTERS (reporterid, reportername)
values (102038, 'Heather');
insert into REPORTERS (reporterid, reportername)
values (102039, 'Marc');
insert into REPORTERS (reporterid, reportername)
values (102040, 'Tiffany');
insert into REPORTERS (reporterid, reportername)
values (102041, 'Lisa');
insert into REPORTERS (reporterid, reportername)
values (102042, 'Andrea');
insert into REPORTERS (reporterid, reportername)
values (102043, 'Angela');
insert into REPORTERS (reporterid, reportername)
values (102044, 'Gina');
insert into REPORTERS (reporterid, reportername)
values (102045, 'Scott');
insert into REPORTERS (reporterid, reportername)
values (102046, 'Sherri');
insert into REPORTERS (reporterid, reportername)
values (102047, 'Yolanda');
insert into REPORTERS (reporterid, reportername)
values (102048, 'Shannon');
insert into REPORTERS (reporterid, reportername)
values (102049, 'Samantha');
insert into REPORTERS (reporterid, reportername)
values (102050, 'Lisa');
insert into REPORTERS (reporterid, reportername)
values (102051, 'Brittney');
insert into REPORTERS (reporterid, reportername)
values (102052, 'Katie');
insert into REPORTERS (reporterid, reportername)
values (102053, 'Monica');
insert into REPORTERS (reporterid, reportername)
values (102054, 'Dawn');
insert into REPORTERS (reporterid, reportername)
values (102055, 'Kenneth');
insert into REPORTERS (reporterid, reportername)
values (102056, 'Anthony');
insert into REPORTERS (reporterid, reportername)
values (102057, 'Brenda');
insert into REPORTERS (reporterid, reportername)
values (102058, 'Stacy');
insert into REPORTERS (reporterid, reportername)
values (102059, 'Rebecca');
insert into REPORTERS (reporterid, reportername)
values (102060, 'Jonathan');
insert into REPORTERS (reporterid, reportername)
values (102061, 'Kelly');
insert into REPORTERS (reporterid, reportername)
values (102062, 'Frank');
insert into REPORTERS (reporterid, reportername)
values (102063, 'Russell');
insert into REPORTERS (reporterid, reportername)
values (102064, 'Michael');
insert into REPORTERS (reporterid, reportername)
values (102065, 'Kimberly');
insert into REPORTERS (reporterid, reportername)
values (102066, 'Kimberly');
insert into REPORTERS (reporterid, reportername)
values (102067, 'Elizabeth');
insert into REPORTERS (reporterid, reportername)
values (102068, 'Jeffrey');
insert into REPORTERS (reporterid, reportername)
values (102069, 'Robert');
insert into REPORTERS (reporterid, reportername)
values (102070, 'Jacqueline');
insert into REPORTERS (reporterid, reportername)
values (102071, 'Teresa');
insert into REPORTERS (reporterid, reportername)
values (102072, 'Lisa');
insert into REPORTERS (reporterid, reportername)
values (102073, 'Bryan');
insert into REPORTERS (reporterid, reportername)
values (102074, 'Steve');
insert into REPORTERS (reporterid, reportername)
values (102075, 'Nicole');
insert into REPORTERS (reporterid, reportername)
values (102076, 'Barbara');
insert into REPORTERS (reporterid, reportername)
values (102077, 'Shawn');
insert into REPORTERS (reporterid, reportername)
values (102078, 'Julie');
insert into REPORTERS (reporterid, reportername)
values (102079, 'Jeremy');
insert into REPORTERS (reporterid, reportername)
values (102080, 'Drew');
insert into REPORTERS (reporterid, reportername)
values (102081, 'Ashley');
insert into REPORTERS (reporterid, reportername)
values (102082, 'Joseph');
insert into REPORTERS (reporterid, reportername)
values (102083, 'John');
insert into REPORTERS (reporterid, reportername)
values (102084, 'Sarah');
insert into REPORTERS (reporterid, reportername)
values (102085, 'Jeanne');
insert into REPORTERS (reporterid, reportername)
values (102086, 'Ronald');
insert into REPORTERS (reporterid, reportername)
values (102087, 'Patrick');
insert into REPORTERS (reporterid, reportername)
values (102088, 'Tommy');
insert into REPORTERS (reporterid, reportername)
values (102089, 'Barbara');
insert into REPORTERS (reporterid, reportername)
values (102090, 'Elizabeth');
insert into REPORTERS (reporterid, reportername)
values (102091, 'Alan');
insert into REPORTERS (reporterid, reportername)
values (102092, 'Pamela');
insert into REPORTERS (reporterid, reportername)
values (102093, 'Robert');
insert into REPORTERS (reporterid, reportername)
values (102094, 'Joseph');
insert into REPORTERS (reporterid, reportername)
values (102095, 'Dana');
insert into REPORTERS (reporterid, reportername)
values (102096, 'Thomas');
insert into REPORTERS (reporterid, reportername)
values (102097, 'Jared');
insert into REPORTERS (reporterid, reportername)
values (102098, 'Alexandra');
insert into REPORTERS (reporterid, reportername)
values (102099, 'Richard');
commit;
prompt 100 records committed...
insert into REPORTERS (reporterid, reportername)
values (102100, 'Daniel');
insert into REPORTERS (reporterid, reportername)
values (102101, 'Donald');
insert into REPORTERS (reporterid, reportername)
values (102102, 'Arthur');
insert into REPORTERS (reporterid, reportername)
values (102103, 'Desiree');
insert into REPORTERS (reporterid, reportername)
values (102104, 'Jake');
insert into REPORTERS (reporterid, reportername)
values (102105, 'Jason');
insert into REPORTERS (reporterid, reportername)
values (102106, 'Zoe');
insert into REPORTERS (reporterid, reportername)
values (102107, 'Linda');
insert into REPORTERS (reporterid, reportername)
values (102108, 'Briana');
insert into REPORTERS (reporterid, reportername)
values (102109, 'Natalie');
insert into REPORTERS (reporterid, reportername)
values (102110, 'Melissa');
insert into REPORTERS (reporterid, reportername)
values (102111, 'Daniel');
insert into REPORTERS (reporterid, reportername)
values (102112, 'Jeffrey');
insert into REPORTERS (reporterid, reportername)
values (102113, 'Sharon');
insert into REPORTERS (reporterid, reportername)
values (102114, 'Michele');
insert into REPORTERS (reporterid, reportername)
values (102115, 'Cassandra');
insert into REPORTERS (reporterid, reportername)
values (102116, 'Joel');
insert into REPORTERS (reporterid, reportername)
values (102117, 'Crystal');
insert into REPORTERS (reporterid, reportername)
values (102118, 'Sarah');
insert into REPORTERS (reporterid, reportername)
values (102119, 'Kathleen');
insert into REPORTERS (reporterid, reportername)
values (102120, 'Aaron');
insert into REPORTERS (reporterid, reportername)
values (102121, 'Gary');
insert into REPORTERS (reporterid, reportername)
values (102122, 'Ryan');
insert into REPORTERS (reporterid, reportername)
values (102123, 'Amber');
insert into REPORTERS (reporterid, reportername)
values (102124, 'Danielle');
insert into REPORTERS (reporterid, reportername)
values (102125, 'Tracey');
insert into REPORTERS (reporterid, reportername)
values (102126, 'Kayla');
insert into REPORTERS (reporterid, reportername)
values (102127, 'Theresa');
insert into REPORTERS (reporterid, reportername)
values (102128, 'George');
insert into REPORTERS (reporterid, reportername)
values (102129, 'Dana');
insert into REPORTERS (reporterid, reportername)
values (102130, 'Cindy');
insert into REPORTERS (reporterid, reportername)
values (102131, 'Matthew');
insert into REPORTERS (reporterid, reportername)
values (102132, 'Julie');
insert into REPORTERS (reporterid, reportername)
values (102133, 'Meagan');
insert into REPORTERS (reporterid, reportername)
values (102134, 'Charles');
insert into REPORTERS (reporterid, reportername)
values (102135, 'Lynn');
insert into REPORTERS (reporterid, reportername)
values (102136, 'Lori');
insert into REPORTERS (reporterid, reportername)
values (102137, 'John');
insert into REPORTERS (reporterid, reportername)
values (102138, 'Kayla');
insert into REPORTERS (reporterid, reportername)
values (102139, 'Shane');
insert into REPORTERS (reporterid, reportername)
values (102140, 'Jessica');
insert into REPORTERS (reporterid, reportername)
values (102141, 'Mario');
insert into REPORTERS (reporterid, reportername)
values (102142, 'Raymond');
insert into REPORTERS (reporterid, reportername)
values (102143, 'Sally');
insert into REPORTERS (reporterid, reportername)
values (102144, 'Natasha');
insert into REPORTERS (reporterid, reportername)
values (102145, 'Heather');
insert into REPORTERS (reporterid, reportername)
values (102146, 'Wyatt');
insert into REPORTERS (reporterid, reportername)
values (102147, 'Cassandra');
insert into REPORTERS (reporterid, reportername)
values (102148, 'Maxwell');
insert into REPORTERS (reporterid, reportername)
values (102149, 'Pamela');
insert into REPORTERS (reporterid, reportername)
values (102150, 'Justin');
insert into REPORTERS (reporterid, reportername)
values (102151, 'Bradley');
insert into REPORTERS (reporterid, reportername)
values (102152, 'Tamara');
insert into REPORTERS (reporterid, reportername)
values (102153, 'William');
insert into REPORTERS (reporterid, reportername)
values (102154, 'Patrick');
insert into REPORTERS (reporterid, reportername)
values (102155, 'Alicia');
insert into REPORTERS (reporterid, reportername)
values (102156, 'Vanessa');
insert into REPORTERS (reporterid, reportername)
values (102157, 'Natalie');
insert into REPORTERS (reporterid, reportername)
values (102158, 'Andrew');
insert into REPORTERS (reporterid, reportername)
values (102159, 'Jesse');
insert into REPORTERS (reporterid, reportername)
values (102160, 'Jonathan');
insert into REPORTERS (reporterid, reportername)
values (102161, 'Nicole');
insert into REPORTERS (reporterid, reportername)
values (102162, 'Tiffany');
insert into REPORTERS (reporterid, reportername)
values (102163, 'Aaron');
insert into REPORTERS (reporterid, reportername)
values (102164, 'Tracey');
insert into REPORTERS (reporterid, reportername)
values (102165, 'Phyllis');
insert into REPORTERS (reporterid, reportername)
values (102166, 'Mary');
insert into REPORTERS (reporterid, reportername)
values (102167, 'Charles');
insert into REPORTERS (reporterid, reportername)
values (102168, 'Amber');
insert into REPORTERS (reporterid, reportername)
values (102169, 'Teresa');
insert into REPORTERS (reporterid, reportername)
values (102170, 'Sara');
insert into REPORTERS (reporterid, reportername)
values (102171, 'Kelly');
insert into REPORTERS (reporterid, reportername)
values (102172, 'Kristine');
insert into REPORTERS (reporterid, reportername)
values (102173, 'Nicholas');
insert into REPORTERS (reporterid, reportername)
values (102174, 'Travis');
insert into REPORTERS (reporterid, reportername)
values (102175, 'Gary');
insert into REPORTERS (reporterid, reportername)
values (102176, 'Jonathan');
insert into REPORTERS (reporterid, reportername)
values (102177, 'Debra');
insert into REPORTERS (reporterid, reportername)
values (102178, 'Robert');
insert into REPORTERS (reporterid, reportername)
values (102179, 'Terri');
insert into REPORTERS (reporterid, reportername)
values (102180, 'Christine');
insert into REPORTERS (reporterid, reportername)
values (102181, 'Emily');
insert into REPORTERS (reporterid, reportername)
values (102182, 'Jasmine');
insert into REPORTERS (reporterid, reportername)
values (102183, 'Taylor');
insert into REPORTERS (reporterid, reportername)
values (102184, 'Amy');
insert into REPORTERS (reporterid, reportername)
values (102185, 'Christopher');
insert into REPORTERS (reporterid, reportername)
values (102186, 'Julia');
insert into REPORTERS (reporterid, reportername)
values (102187, 'Brooke');
insert into REPORTERS (reporterid, reportername)
values (102188, 'Steven');
insert into REPORTERS (reporterid, reportername)
values (102189, 'Scott');
insert into REPORTERS (reporterid, reportername)
values (102190, 'William');
insert into REPORTERS (reporterid, reportername)
values (102191, 'Deborah');
insert into REPORTERS (reporterid, reportername)
values (102192, 'Anthony');
insert into REPORTERS (reporterid, reportername)
values (102193, 'Carrie');
insert into REPORTERS (reporterid, reportername)
values (102194, 'Rebecca');
insert into REPORTERS (reporterid, reportername)
values (102195, 'Belinda');
insert into REPORTERS (reporterid, reportername)
values (102196, 'Matthew');
insert into REPORTERS (reporterid, reportername)
values (102197, 'Jonathon');
insert into REPORTERS (reporterid, reportername)
values (102198, 'Mary');
insert into REPORTERS (reporterid, reportername)
values (102199, 'Jessica');
commit;
prompt 200 records committed...
insert into REPORTERS (reporterid, reportername)
values (102200, 'Brenda');
insert into REPORTERS (reporterid, reportername)
values (102201, 'Melissa');
insert into REPORTERS (reporterid, reportername)
values (102202, 'George');
insert into REPORTERS (reporterid, reportername)
values (102203, 'Mark');
insert into REPORTERS (reporterid, reportername)
values (102204, 'Tonya');
insert into REPORTERS (reporterid, reportername)
values (102205, 'Paul');
insert into REPORTERS (reporterid, reportername)
values (102206, 'Alan');
insert into REPORTERS (reporterid, reportername)
values (102207, 'Stacy');
insert into REPORTERS (reporterid, reportername)
values (102208, 'Mary');
insert into REPORTERS (reporterid, reportername)
values (102209, 'Spencer');
insert into REPORTERS (reporterid, reportername)
values (102210, 'Robert');
insert into REPORTERS (reporterid, reportername)
values (102211, 'Joel');
insert into REPORTERS (reporterid, reportername)
values (102212, 'Erik');
insert into REPORTERS (reporterid, reportername)
values (102213, 'Maria');
insert into REPORTERS (reporterid, reportername)
values (102214, 'Stephanie');
insert into REPORTERS (reporterid, reportername)
values (102215, 'Matthew');
insert into REPORTERS (reporterid, reportername)
values (102216, 'Nicole');
insert into REPORTERS (reporterid, reportername)
values (102217, 'Christopher');
insert into REPORTERS (reporterid, reportername)
values (102218, 'Erica');
insert into REPORTERS (reporterid, reportername)
values (102219, 'Sharon');
insert into REPORTERS (reporterid, reportername)
values (102220, 'Brooke');
insert into REPORTERS (reporterid, reportername)
values (102221, 'Anna');
insert into REPORTERS (reporterid, reportername)
values (102222, 'Stephen');
insert into REPORTERS (reporterid, reportername)
values (102223, 'Michael');
insert into REPORTERS (reporterid, reportername)
values (102224, 'Brad');
insert into REPORTERS (reporterid, reportername)
values (102225, 'Pamela');
insert into REPORTERS (reporterid, reportername)
values (102226, 'Richard');
insert into REPORTERS (reporterid, reportername)
values (102227, 'John');
insert into REPORTERS (reporterid, reportername)
values (102228, 'Jeffery');
insert into REPORTERS (reporterid, reportername)
values (102229, 'Sarah');
insert into REPORTERS (reporterid, reportername)
values (102230, 'Cheyenne');
insert into REPORTERS (reporterid, reportername)
values (102231, 'Anna');
insert into REPORTERS (reporterid, reportername)
values (102232, 'Nicholas');
insert into REPORTERS (reporterid, reportername)
values (102233, 'Andrea');
insert into REPORTERS (reporterid, reportername)
values (102234, 'Jesus');
insert into REPORTERS (reporterid, reportername)
values (102235, 'Dawn');
insert into REPORTERS (reporterid, reportername)
values (102236, 'Michael');
insert into REPORTERS (reporterid, reportername)
values (102237, 'Brandon');
insert into REPORTERS (reporterid, reportername)
values (102238, 'James');
insert into REPORTERS (reporterid, reportername)
values (102239, 'Kelly');
insert into REPORTERS (reporterid, reportername)
values (102240, 'Michelle');
insert into REPORTERS (reporterid, reportername)
values (102241, 'Courtney');
insert into REPORTERS (reporterid, reportername)
values (102242, 'Randall');
insert into REPORTERS (reporterid, reportername)
values (102243, 'Joann');
insert into REPORTERS (reporterid, reportername)
values (102244, 'Caroline');
insert into REPORTERS (reporterid, reportername)
values (102245, 'Justin');
insert into REPORTERS (reporterid, reportername)
values (102246, 'Jason');
insert into REPORTERS (reporterid, reportername)
values (102247, 'Whitney');
insert into REPORTERS (reporterid, reportername)
values (102248, 'Donald');
insert into REPORTERS (reporterid, reportername)
values (102249, 'Stephanie');
insert into REPORTERS (reporterid, reportername)
values (102250, 'Yolanda');
insert into REPORTERS (reporterid, reportername)
values (102251, 'Dawn');
insert into REPORTERS (reporterid, reportername)
values (102252, 'Stephen');
insert into REPORTERS (reporterid, reportername)
values (102253, 'John');
insert into REPORTERS (reporterid, reportername)
values (102254, 'Marcus');
insert into REPORTERS (reporterid, reportername)
values (102255, 'Lindsey');
insert into REPORTERS (reporterid, reportername)
values (102256, 'Keith');
insert into REPORTERS (reporterid, reportername)
values (102257, 'Nicholas');
insert into REPORTERS (reporterid, reportername)
values (102258, 'Seth');
insert into REPORTERS (reporterid, reportername)
values (102259, 'Jason');
insert into REPORTERS (reporterid, reportername)
values (102260, 'Jerry');
insert into REPORTERS (reporterid, reportername)
values (102261, 'Robert');
insert into REPORTERS (reporterid, reportername)
values (102262, 'James');
insert into REPORTERS (reporterid, reportername)
values (102263, 'Lauren');
insert into REPORTERS (reporterid, reportername)
values (102264, 'Jeffrey');
insert into REPORTERS (reporterid, reportername)
values (102265, 'Kirk');
insert into REPORTERS (reporterid, reportername)
values (102266, 'Connie');
insert into REPORTERS (reporterid, reportername)
values (102267, 'Eric');
insert into REPORTERS (reporterid, reportername)
values (102268, 'Cole');
insert into REPORTERS (reporterid, reportername)
values (102269, 'Tina');
insert into REPORTERS (reporterid, reportername)
values (102270, 'Jennifer');
insert into REPORTERS (reporterid, reportername)
values (102271, 'Alexandria');
insert into REPORTERS (reporterid, reportername)
values (102272, 'Katherine');
insert into REPORTERS (reporterid, reportername)
values (102273, 'Tammy');
insert into REPORTERS (reporterid, reportername)
values (102274, 'Martha');
insert into REPORTERS (reporterid, reportername)
values (102275, 'Kevin');
insert into REPORTERS (reporterid, reportername)
values (102276, 'Henry');
insert into REPORTERS (reporterid, reportername)
values (102277, 'Stephanie');
insert into REPORTERS (reporterid, reportername)
values (102278, 'William');
insert into REPORTERS (reporterid, reportername)
values (102279, 'Meghan');
insert into REPORTERS (reporterid, reportername)
values (102280, 'Catherine');
insert into REPORTERS (reporterid, reportername)
values (102281, 'Jennifer');
insert into REPORTERS (reporterid, reportername)
values (102282, 'Lisa');
insert into REPORTERS (reporterid, reportername)
values (102283, 'Cindy');
insert into REPORTERS (reporterid, reportername)
values (102284, 'Justin');
insert into REPORTERS (reporterid, reportername)
values (102285, 'Laura');
insert into REPORTERS (reporterid, reportername)
values (102286, 'Alejandra');
insert into REPORTERS (reporterid, reportername)
values (102287, 'Michael');
insert into REPORTERS (reporterid, reportername)
values (102288, 'Lori');
insert into REPORTERS (reporterid, reportername)
values (102289, 'Michelle');
insert into REPORTERS (reporterid, reportername)
values (102290, 'Lindsay');
insert into REPORTERS (reporterid, reportername)
values (102291, 'Sean');
insert into REPORTERS (reporterid, reportername)
values (102292, 'Dawn');
insert into REPORTERS (reporterid, reportername)
values (102293, 'Robert');
insert into REPORTERS (reporterid, reportername)
values (102294, 'John');
insert into REPORTERS (reporterid, reportername)
values (102295, 'Marissa');
insert into REPORTERS (reporterid, reportername)
values (102296, 'Kristen');
insert into REPORTERS (reporterid, reportername)
values (102297, 'Jose');
insert into REPORTERS (reporterid, reportername)
values (102298, 'Christopher');
insert into REPORTERS (reporterid, reportername)
values (102299, 'Megan');
commit;
prompt 300 records committed...
insert into REPORTERS (reporterid, reportername)
values (102300, 'Rachel');
insert into REPORTERS (reporterid, reportername)
values (102301, 'Jackson');
insert into REPORTERS (reporterid, reportername)
values (102302, 'John');
insert into REPORTERS (reporterid, reportername)
values (102303, 'Matthew');
insert into REPORTERS (reporterid, reportername)
values (102304, 'Kimberly');
insert into REPORTERS (reporterid, reportername)
values (102305, 'Kenneth');
insert into REPORTERS (reporterid, reportername)
values (102306, 'Catherine');
insert into REPORTERS (reporterid, reportername)
values (102307, 'Tracy');
insert into REPORTERS (reporterid, reportername)
values (102308, 'Tina');
insert into REPORTERS (reporterid, reportername)
values (102309, 'Lisa');
insert into REPORTERS (reporterid, reportername)
values (102310, 'Samuel');
insert into REPORTERS (reporterid, reportername)
values (102311, 'James');
insert into REPORTERS (reporterid, reportername)
values (102312, 'Barbara');
insert into REPORTERS (reporterid, reportername)
values (102313, 'Wanda');
insert into REPORTERS (reporterid, reportername)
values (102314, 'William');
insert into REPORTERS (reporterid, reportername)
values (102315, 'Timothy');
insert into REPORTERS (reporterid, reportername)
values (102316, 'Julie');
insert into REPORTERS (reporterid, reportername)
values (102317, 'Andrew');
insert into REPORTERS (reporterid, reportername)
values (102318, 'Jerry');
insert into REPORTERS (reporterid, reportername)
values (102319, 'Rebecca');
insert into REPORTERS (reporterid, reportername)
values (102320, 'Jacob');
insert into REPORTERS (reporterid, reportername)
values (102321, 'Joseph');
insert into REPORTERS (reporterid, reportername)
values (102322, 'Patricia');
insert into REPORTERS (reporterid, reportername)
values (102323, 'Eric');
insert into REPORTERS (reporterid, reportername)
values (102324, 'Patricia');
insert into REPORTERS (reporterid, reportername)
values (102325, 'Jacob');
insert into REPORTERS (reporterid, reportername)
values (102326, 'Shawn');
insert into REPORTERS (reporterid, reportername)
values (102327, 'Cassidy');
insert into REPORTERS (reporterid, reportername)
values (102328, 'Luke');
insert into REPORTERS (reporterid, reportername)
values (102329, 'Michelle');
insert into REPORTERS (reporterid, reportername)
values (102330, 'Erin');
insert into REPORTERS (reporterid, reportername)
values (102331, 'Joyce');
insert into REPORTERS (reporterid, reportername)
values (102332, 'Patrick');
insert into REPORTERS (reporterid, reportername)
values (102333, 'Carolyn');
insert into REPORTERS (reporterid, reportername)
values (102334, 'Joseph');
insert into REPORTERS (reporterid, reportername)
values (102335, 'Ashley');
insert into REPORTERS (reporterid, reportername)
values (102336, 'Gary');
insert into REPORTERS (reporterid, reportername)
values (102337, 'Tim');
insert into REPORTERS (reporterid, reportername)
values (102338, 'Stephanie');
insert into REPORTERS (reporterid, reportername)
values (102339, 'Ashley');
insert into REPORTERS (reporterid, reportername)
values (102340, 'Joseph');
insert into REPORTERS (reporterid, reportername)
values (102341, 'Robert');
insert into REPORTERS (reporterid, reportername)
values (102342, 'Sara');
insert into REPORTERS (reporterid, reportername)
values (102343, 'Kevin');
insert into REPORTERS (reporterid, reportername)
values (102344, 'Mark');
insert into REPORTERS (reporterid, reportername)
values (102345, 'Jared');
insert into REPORTERS (reporterid, reportername)
values (102346, 'Morgan');
insert into REPORTERS (reporterid, reportername)
values (102347, 'Alicia');
insert into REPORTERS (reporterid, reportername)
values (102348, 'Melissa');
insert into REPORTERS (reporterid, reportername)
values (102349, 'Mark');
insert into REPORTERS (reporterid, reportername)
values (102350, 'Bethany');
insert into REPORTERS (reporterid, reportername)
values (102351, 'Jacob');
insert into REPORTERS (reporterid, reportername)
values (102352, 'Preston');
insert into REPORTERS (reporterid, reportername)
values (102353, 'David');
insert into REPORTERS (reporterid, reportername)
values (102354, 'Ryan');
insert into REPORTERS (reporterid, reportername)
values (102355, 'Sandra');
insert into REPORTERS (reporterid, reportername)
values (102356, 'Mia');
insert into REPORTERS (reporterid, reportername)
values (102357, 'Tara');
insert into REPORTERS (reporterid, reportername)
values (102358, 'Tammy');
insert into REPORTERS (reporterid, reportername)
values (102359, 'Adrian');
insert into REPORTERS (reporterid, reportername)
values (102360, 'David');
insert into REPORTERS (reporterid, reportername)
values (102361, 'Danielle');
insert into REPORTERS (reporterid, reportername)
values (102362, 'Curtis');
insert into REPORTERS (reporterid, reportername)
values (102363, 'Jennifer');
insert into REPORTERS (reporterid, reportername)
values (102364, 'Jason');
insert into REPORTERS (reporterid, reportername)
values (102365, 'Michael');
insert into REPORTERS (reporterid, reportername)
values (102366, 'Lauren');
insert into REPORTERS (reporterid, reportername)
values (102367, 'Colleen');
insert into REPORTERS (reporterid, reportername)
values (102368, 'Lauren');
insert into REPORTERS (reporterid, reportername)
values (102369, 'Dennis');
insert into REPORTERS (reporterid, reportername)
values (102370, 'Samantha');
insert into REPORTERS (reporterid, reportername)
values (102371, 'Brandon');
insert into REPORTERS (reporterid, reportername)
values (102372, 'Casey');
insert into REPORTERS (reporterid, reportername)
values (102373, 'Julie');
insert into REPORTERS (reporterid, reportername)
values (102374, 'Anthony');
insert into REPORTERS (reporterid, reportername)
values (102375, 'Holly');
insert into REPORTERS (reporterid, reportername)
values (102376, 'Benjamin');
insert into REPORTERS (reporterid, reportername)
values (102377, 'Dalton');
insert into REPORTERS (reporterid, reportername)
values (102378, 'Matthew');
insert into REPORTERS (reporterid, reportername)
values (102379, 'Joel');
insert into REPORTERS (reporterid, reportername)
values (102380, 'Steven');
insert into REPORTERS (reporterid, reportername)
values (102381, 'Ryan');
insert into REPORTERS (reporterid, reportername)
values (102382, 'Zachary');
insert into REPORTERS (reporterid, reportername)
values (102383, 'Michael');
insert into REPORTERS (reporterid, reportername)
values (102384, 'Austin');
insert into REPORTERS (reporterid, reportername)
values (102385, 'Margaret');
insert into REPORTERS (reporterid, reportername)
values (102386, 'Lauren');
insert into REPORTERS (reporterid, reportername)
values (102387, 'Carl');
insert into REPORTERS (reporterid, reportername)
values (102388, 'David');
insert into REPORTERS (reporterid, reportername)
values (102389, 'Larry');
insert into REPORTERS (reporterid, reportername)
values (102390, 'Zachary');
insert into REPORTERS (reporterid, reportername)
values (102391, 'Rachel');
insert into REPORTERS (reporterid, reportername)
values (102392, 'Emily');
insert into REPORTERS (reporterid, reportername)
values (102393, 'Anthony');
insert into REPORTERS (reporterid, reportername)
values (102394, 'Leonard');
insert into REPORTERS (reporterid, reportername)
values (102395, 'Christopher');
insert into REPORTERS (reporterid, reportername)
values (102396, 'Eric');
insert into REPORTERS (reporterid, reportername)
values (102397, 'Bryan');
insert into REPORTERS (reporterid, reportername)
values (102398, 'Laura');
insert into REPORTERS (reporterid, reportername)
values (102399, 'Peter');
commit;
prompt 400 records loaded
prompt Loading BRANCHE...
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103000, 'tel aviv', 102000, to_date('28-09-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103001, 'jerusalem', 102001, to_date('10-07-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103002, 'new york', 102002, to_date('06-10-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103003, 'chicago', 102003, to_date('18-07-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103004, 'berlin', 102004, to_date('09-02-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103005, 'paris', 102005, to_date('02-10-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103006, 'denver', 102006, to_date('01-09-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103007, 'madrid', 102007, to_date('30-04-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103008, 'tel aviv', 102008, to_date('12-03-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103009, 'jerusalem', 102009, to_date('26-12-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103010, 'new york', 102010, to_date('24-02-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103011, 'chicago', 102011, to_date('16-06-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103012, 'berlin', 102012, to_date('08-04-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103013, 'paris', 102013, to_date('12-08-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103014, 'denver', 102014, to_date('31-03-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103015, 'madrid', 102015, to_date('26-11-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103016, 'tel aviv', 102016, to_date('01-02-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103017, 'jerusalem', 102017, to_date('11-11-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103018, 'new york', 102018, to_date('31-08-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103019, 'chicago', 102019, to_date('06-02-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103020, 'berlin', 102020, to_date('15-05-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103021, 'paris', 102021, to_date('01-01-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103022, 'denver', 102022, to_date('21-02-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103023, 'madrid', 102023, to_date('18-03-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103024, 'tel aviv', 102024, to_date('17-11-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103025, 'jerusalem', 102025, to_date('05-09-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103026, 'new york', 102026, to_date('17-11-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103027, 'chicago', 102027, to_date('13-02-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103028, 'berlin', 102028, to_date('25-09-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103029, 'paris', 102029, to_date('22-02-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103030, 'denver', 102030, to_date('28-06-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103031, 'madrid', 102031, to_date('17-09-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103032, 'tel aviv', 102032, to_date('08-07-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103033, 'jerusalem', 102033, to_date('30-12-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103034, 'new york', 102034, to_date('14-06-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103035, 'chicago', 102035, to_date('18-02-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103036, 'berlin', 102036, to_date('08-01-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103037, 'paris', 102037, to_date('21-11-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103038, 'denver', 102038, to_date('07-08-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103039, 'madrid', 102039, to_date('06-12-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103040, 'tel aviv', 102040, to_date('26-10-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103041, 'jerusalem', 102041, to_date('26-05-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103042, 'new york', 102042, to_date('14-07-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103043, 'chicago', 102043, to_date('18-05-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103044, 'berlin', 102044, to_date('09-11-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103045, 'paris', 102045, to_date('22-09-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103046, 'denver', 102046, to_date('27-01-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103047, 'madrid', 102047, to_date('14-01-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103048, 'tel aviv', 102048, to_date('13-08-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103049, 'jerusalem', 102049, to_date('11-11-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103050, 'new york', 102050, to_date('10-11-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103051, 'chicago', 102051, to_date('22-02-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103052, 'berlin', 102052, to_date('15-10-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103053, 'paris', 102053, to_date('12-02-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103054, 'denver', 102054, to_date('12-12-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103055, 'madrid', 102055, to_date('23-01-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103056, 'tel aviv', 102056, to_date('27-06-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103057, 'jerusalem', 102057, to_date('03-05-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103058, 'new york', 102058, to_date('26-01-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103059, 'chicago', 102059, to_date('17-12-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103060, 'berlin', 102060, to_date('27-07-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103061, 'paris', 102061, to_date('17-11-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103062, 'denver', 102062, to_date('09-03-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103063, 'madrid', 102063, to_date('04-11-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103064, 'tel aviv', 102064, to_date('09-12-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103065, 'jerusalem', 102065, to_date('21-03-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103066, 'new york', 102066, to_date('11-10-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103067, 'chicago', 102067, to_date('27-09-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103068, 'berlin', 102068, to_date('06-04-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103069, 'paris', 102069, to_date('25-05-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103070, 'denver', 102070, to_date('14-06-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103071, 'madrid', 102071, to_date('24-03-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103072, 'tel aviv', 102072, to_date('28-04-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103073, 'jerusalem', 102073, to_date('06-07-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103074, 'new york', 102074, to_date('10-06-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103075, 'chicago', 102075, to_date('14-02-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103076, 'berlin', 102076, to_date('04-06-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103077, 'paris', 102077, to_date('27-11-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103078, 'denver', 102078, to_date('26-05-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103079, 'madrid', 102079, to_date('25-11-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103080, 'tel aviv', 102080, to_date('31-05-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103081, 'jerusalem', 102081, to_date('06-06-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103082, 'new york', 102082, to_date('12-04-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103083, 'chicago', 102083, to_date('03-03-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103084, 'berlin', 102084, to_date('28-08-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103085, 'paris', 102085, to_date('08-07-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103086, 'denver', 102086, to_date('18-09-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103087, 'madrid', 102087, to_date('04-10-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103088, 'tel aviv', 102088, to_date('28-10-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103089, 'jerusalem', 102089, to_date('18-01-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103090, 'new york', 102090, to_date('11-11-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103091, 'chicago', 102091, to_date('07-09-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103092, 'berlin', 102092, to_date('11-02-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103093, 'paris', 102093, to_date('18-10-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103094, 'denver', 102094, to_date('08-02-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103095, 'madrid', 102095, to_date('02-09-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103096, 'tel aviv', 102096, to_date('03-09-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103097, 'jerusalem', 102097, to_date('14-08-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103098, 'new york', 102098, to_date('14-05-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103099, 'chicago', 102099, to_date('31-12-2003', 'dd-mm-yyyy'));
commit;
prompt 100 records committed...
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103100, 'berlin', 102100, to_date('15-03-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103101, 'paris', 102101, to_date('07-10-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103102, 'denver', 102102, to_date('15-12-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103103, 'madrid', 102103, to_date('08-12-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103104, 'tel aviv', 102104, to_date('11-01-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103105, 'jerusalem', 102105, to_date('04-09-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103106, 'new york', 102106, to_date('23-05-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103107, 'chicago', 102107, to_date('02-12-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103108, 'berlin', 102108, to_date('27-08-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103109, 'paris', 102109, to_date('17-06-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103110, 'denver', 102110, to_date('18-03-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103111, 'madrid', 102111, to_date('01-07-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103112, 'tel aviv', 102112, to_date('05-07-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103113, 'jerusalem', 102113, to_date('19-08-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103114, 'new york', 102114, to_date('15-10-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103115, 'chicago', 102115, to_date('29-04-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103116, 'berlin', 102116, to_date('01-10-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103117, 'paris', 102117, to_date('16-08-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103118, 'denver', 102118, to_date('07-03-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103119, 'madrid', 102119, to_date('25-02-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103120, 'tel aviv', 102120, to_date('27-10-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103121, 'jerusalem', 102121, to_date('27-12-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103122, 'new york', 102122, to_date('14-03-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103123, 'chicago', 102123, to_date('12-08-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103124, 'berlin', 102124, to_date('18-05-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103125, 'paris', 102125, to_date('25-02-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103126, 'denver', 102126, to_date('30-07-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103127, 'madrid', 102127, to_date('27-08-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103128, 'tel aviv', 102128, to_date('07-08-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103129, 'jerusalem', 102129, to_date('13-03-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103130, 'new york', 102130, to_date('05-01-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103131, 'chicago', 102131, to_date('26-09-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103132, 'berlin', 102132, to_date('10-01-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103133, 'paris', 102133, to_date('14-12-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103134, 'denver', 102134, to_date('01-07-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103135, 'madrid', 102135, to_date('09-03-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103136, 'tel aviv', 102136, to_date('14-11-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103137, 'jerusalem', 102137, to_date('01-01-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103138, 'new york', 102138, to_date('01-01-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103139, 'chicago', 102139, to_date('20-11-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103140, 'berlin', 102140, to_date('21-12-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103141, 'paris', 102141, to_date('15-10-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103142, 'denver', 102142, to_date('14-02-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103143, 'madrid', 102143, to_date('31-05-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103144, 'tel aviv', 102144, to_date('27-12-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103145, 'jerusalem', 102145, to_date('16-05-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103146, 'new york', 102146, to_date('12-05-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103147, 'chicago', 102147, to_date('09-09-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103148, 'berlin', 102148, to_date('14-08-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103149, 'paris', 102149, to_date('18-04-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103150, 'denver', 102150, to_date('24-10-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103151, 'madrid', 102151, to_date('22-01-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103152, 'tel aviv', 102152, to_date('20-12-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103153, 'jerusalem', 102153, to_date('18-05-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103154, 'new york', 102154, to_date('19-05-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103155, 'chicago', 102155, to_date('31-03-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103156, 'berlin', 102156, to_date('07-06-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103157, 'paris', 102157, to_date('05-01-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103158, 'denver', 102158, to_date('19-05-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103159, 'madrid', 102159, to_date('15-05-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103160, 'tel aviv', 102160, to_date('10-02-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103161, 'jerusalem', 102161, to_date('19-02-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103162, 'new york', 102162, to_date('18-06-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103163, 'chicago', 102163, to_date('08-01-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103164, 'berlin', 102164, to_date('08-02-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103165, 'paris', 102165, to_date('10-08-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103166, 'denver', 102166, to_date('18-01-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103167, 'madrid', 102167, to_date('31-05-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103168, 'tel aviv', 102168, to_date('04-08-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103169, 'jerusalem', 102169, to_date('03-12-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103170, 'new york', 102170, to_date('15-10-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103171, 'chicago', 102171, to_date('09-04-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103172, 'berlin', 102172, to_date('10-09-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103173, 'paris', 102173, to_date('09-09-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103174, 'denver', 102174, to_date('21-02-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103175, 'madrid', 102175, to_date('01-05-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103176, 'tel aviv', 102176, to_date('07-03-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103177, 'jerusalem', 102177, to_date('29-04-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103178, 'new york', 102178, to_date('13-11-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103179, 'chicago', 102179, to_date('18-01-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103180, 'berlin', 102180, to_date('20-01-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103181, 'paris', 102181, to_date('15-11-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103182, 'denver', 102182, to_date('27-03-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103183, 'madrid', 102183, to_date('10-11-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103184, 'tel aviv', 102184, to_date('07-02-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103185, 'jerusalem', 102185, to_date('18-02-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103186, 'new york', 102186, to_date('02-04-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103187, 'chicago', 102187, to_date('28-10-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103188, 'berlin', 102188, to_date('28-12-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103189, 'paris', 102189, to_date('29-10-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103190, 'denver', 102190, to_date('20-10-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103191, 'madrid', 102191, to_date('12-03-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103192, 'tel aviv', 102192, to_date('20-03-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103193, 'jerusalem', 102193, to_date('26-10-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103194, 'new york', 102194, to_date('02-04-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103195, 'chicago', 102195, to_date('29-05-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103196, 'berlin', 102196, to_date('17-08-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103197, 'paris', 102197, to_date('03-12-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103198, 'denver', 102198, to_date('04-01-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103199, 'madrid', 102199, to_date('18-11-2004', 'dd-mm-yyyy'));
commit;
prompt 200 records committed...
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103200, 'tel aviv', 102200, to_date('18-08-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103201, 'jerusalem', 102201, to_date('01-02-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103202, 'new york', 102202, to_date('04-03-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103203, 'chicago', 102203, to_date('24-10-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103204, 'berlin', 102204, to_date('10-01-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103205, 'paris', 102205, to_date('05-12-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103206, 'denver', 102206, to_date('04-07-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103207, 'madrid', 102207, to_date('01-01-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103208, 'tel aviv', 102208, to_date('05-09-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103209, 'jerusalem', 102209, to_date('20-06-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103210, 'new york', 102210, to_date('17-01-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103211, 'chicago', 102211, to_date('26-02-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103212, 'berlin', 102212, to_date('14-03-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103213, 'paris', 102213, to_date('20-06-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103214, 'denver', 102214, to_date('16-11-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103215, 'madrid', 102215, to_date('11-03-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103216, 'tel aviv', 102216, to_date('07-11-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103217, 'jerusalem', 102217, to_date('04-03-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103218, 'new york', 102218, to_date('06-02-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103219, 'chicago', 102219, to_date('08-08-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103220, 'berlin', 102220, to_date('29-08-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103221, 'paris', 102221, to_date('10-06-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103222, 'denver', 102222, to_date('11-02-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103223, 'madrid', 102223, to_date('06-01-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103224, 'tel aviv', 102224, to_date('18-10-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103225, 'jerusalem', 102225, to_date('07-08-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103226, 'new york', 102226, to_date('09-02-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103227, 'chicago', 102227, to_date('31-07-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103228, 'berlin', 102228, to_date('13-10-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103229, 'paris', 102229, to_date('09-01-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103230, 'denver', 102230, to_date('10-12-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103231, 'madrid', 102231, to_date('19-10-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103232, 'tel aviv', 102232, to_date('16-09-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103233, 'jerusalem', 102233, to_date('04-08-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103234, 'new york', 102234, to_date('14-03-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103235, 'chicago', 102235, to_date('05-07-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103236, 'berlin', 102236, to_date('10-07-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103237, 'paris', 102237, to_date('17-11-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103238, 'denver', 102238, to_date('16-07-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103239, 'madrid', 102239, to_date('16-12-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103240, 'tel aviv', 102240, to_date('09-04-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103241, 'jerusalem', 102241, to_date('11-07-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103242, 'new york', 102242, to_date('22-01-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103243, 'chicago', 102243, to_date('14-05-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103244, 'berlin', 102244, to_date('15-04-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103245, 'paris', 102245, to_date('25-05-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103246, 'denver', 102246, to_date('14-07-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103247, 'madrid', 102247, to_date('09-09-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103248, 'tel aviv', 102248, to_date('11-08-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103249, 'jerusalem', 102249, to_date('07-09-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103250, 'new york', 102250, to_date('04-06-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103251, 'chicago', 102251, to_date('10-03-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103252, 'berlin', 102252, to_date('18-03-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103253, 'paris', 102253, to_date('23-03-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103254, 'denver', 102254, to_date('17-12-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103255, 'madrid', 102255, to_date('01-02-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103256, 'tel aviv', 102256, to_date('15-05-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103257, 'jerusalem', 102257, to_date('27-05-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103258, 'new york', 102258, to_date('08-10-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103259, 'chicago', 102259, to_date('13-05-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103260, 'berlin', 102260, to_date('15-11-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103261, 'paris', 102261, to_date('25-06-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103262, 'denver', 102262, to_date('19-01-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103263, 'madrid', 102263, to_date('30-12-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103264, 'tel aviv', 102264, to_date('23-02-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103265, 'jerusalem', 102265, to_date('16-01-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103266, 'new york', 102266, to_date('02-12-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103267, 'chicago', 102267, to_date('05-01-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103268, 'berlin', 102268, to_date('17-06-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103269, 'paris', 102269, to_date('25-02-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103270, 'denver', 102270, to_date('10-02-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103271, 'madrid', 102271, to_date('22-04-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103272, 'tel aviv', 102272, to_date('25-07-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103273, 'jerusalem', 102273, to_date('11-06-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103274, 'new york', 102274, to_date('03-11-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103275, 'chicago', 102275, to_date('15-12-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103276, 'berlin', 102276, to_date('25-03-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103277, 'paris', 102277, to_date('01-10-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103278, 'denver', 102278, to_date('21-12-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103279, 'madrid', 102279, to_date('29-03-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103280, 'tel aviv', 102280, to_date('03-06-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103281, 'jerusalem', 102281, to_date('19-01-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103282, 'new york', 102282, to_date('18-07-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103283, 'chicago', 102283, to_date('05-03-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103284, 'berlin', 102284, to_date('17-06-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103285, 'paris', 102285, to_date('17-07-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103286, 'denver', 102286, to_date('01-08-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103287, 'madrid', 102287, to_date('12-02-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103288, 'tel aviv', 102288, to_date('27-01-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103289, 'jerusalem', 102289, to_date('18-10-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103290, 'new york', 102290, to_date('26-09-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103291, 'chicago', 102291, to_date('05-07-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103292, 'berlin', 102292, to_date('08-08-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103293, 'paris', 102293, to_date('08-12-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103294, 'denver', 102294, to_date('01-03-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103295, 'madrid', 102295, to_date('03-02-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103296, 'tel aviv', 102296, to_date('05-05-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103297, 'jerusalem', 102297, to_date('15-05-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103298, 'new york', 102298, to_date('17-02-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103299, 'chicago', 102299, to_date('14-11-2000', 'dd-mm-yyyy'));
commit;
prompt 300 records committed...
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103300, 'berlin', 102300, to_date('11-12-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103301, 'paris', 102301, to_date('08-06-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103302, 'denver', 102302, to_date('12-10-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103303, 'madrid', 102303, to_date('20-07-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103304, 'tel aviv', 102304, to_date('27-10-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103305, 'jerusalem', 102305, to_date('16-05-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103306, 'new york', 102306, to_date('24-03-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103307, 'chicago', 102307, to_date('11-02-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103308, 'berlin', 102308, to_date('23-04-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103309, 'paris', 102309, to_date('22-02-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103310, 'denver', 102310, to_date('21-02-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103311, 'madrid', 102311, to_date('31-05-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103312, 'tel aviv', 102312, to_date('28-04-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103313, 'jerusalem', 102313, to_date('24-09-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103314, 'new york', 102314, to_date('18-05-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103315, 'chicago', 102315, to_date('01-12-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103316, 'berlin', 102316, to_date('06-11-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103317, 'paris', 102317, to_date('30-10-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103318, 'denver', 102318, to_date('25-03-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103319, 'madrid', 102319, to_date('19-07-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103320, 'tel aviv', 102320, to_date('31-03-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103321, 'jerusalem', 102321, to_date('30-01-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103322, 'new york', 102322, to_date('22-08-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103323, 'chicago', 102323, to_date('25-05-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103324, 'berlin', 102324, to_date('02-10-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103325, 'paris', 102325, to_date('02-08-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103326, 'denver', 102326, to_date('27-03-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103327, 'madrid', 102327, to_date('03-12-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103328, 'tel aviv', 102328, to_date('22-11-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103329, 'jerusalem', 102329, to_date('23-06-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103330, 'new york', 102330, to_date('15-08-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103331, 'chicago', 102331, to_date('22-10-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103332, 'berlin', 102332, to_date('26-08-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103333, 'paris', 102333, to_date('05-10-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103334, 'denver', 102334, to_date('14-08-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103335, 'madrid', 102335, to_date('13-11-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103336, 'tel aviv', 102336, to_date('01-10-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103337, 'jerusalem', 102337, to_date('15-02-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103338, 'new york', 102338, to_date('21-08-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103339, 'chicago', 102339, to_date('25-05-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103340, 'berlin', 102340, to_date('06-11-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103341, 'paris', 102341, to_date('22-08-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103342, 'denver', 102342, to_date('11-03-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103343, 'madrid', 102343, to_date('29-12-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103344, 'tel aviv', 102344, to_date('17-08-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103345, 'jerusalem', 102345, to_date('19-09-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103346, 'new york', 102346, to_date('11-07-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103347, 'chicago', 102347, to_date('14-09-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103348, 'berlin', 102348, to_date('26-04-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103349, 'paris', 102349, to_date('03-06-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103350, 'denver', 102350, to_date('10-04-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103351, 'madrid', 102351, to_date('18-09-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103352, 'tel aviv', 102352, to_date('06-06-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103353, 'jerusalem', 102353, to_date('07-03-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103354, 'new york', 102354, to_date('28-02-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103355, 'chicago', 102355, to_date('24-11-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103356, 'berlin', 102356, to_date('11-03-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103357, 'paris', 102357, to_date('12-03-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103358, 'denver', 102358, to_date('06-10-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103359, 'madrid', 102359, to_date('08-06-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103360, 'tel aviv', 102360, to_date('22-03-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103361, 'jerusalem', 102361, to_date('07-04-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103362, 'new york', 102362, to_date('26-07-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103363, 'chicago', 102363, to_date('24-06-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103364, 'berlin', 102364, to_date('15-02-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103365, 'paris', 102365, to_date('23-02-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103366, 'denver', 102366, to_date('17-09-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103367, 'madrid', 102367, to_date('12-11-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103368, 'tel aviv', 102368, to_date('28-10-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103369, 'jerusalem', 102369, to_date('03-05-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103370, 'new york', 102370, to_date('19-04-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103371, 'chicago', 102371, to_date('01-04-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103372, 'berlin', 102372, to_date('13-05-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103373, 'paris', 102373, to_date('29-11-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103374, 'denver', 102374, to_date('28-05-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103375, 'madrid', 102375, to_date('13-10-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103376, 'tel aviv', 102376, to_date('08-06-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103377, 'jerusalem', 102377, to_date('08-03-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103378, 'new york', 102378, to_date('31-03-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103379, 'chicago', 102379, to_date('17-03-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103380, 'berlin', 102380, to_date('13-11-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103381, 'paris', 102381, to_date('08-04-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103382, 'denver', 102382, to_date('11-08-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103383, 'madrid', 102383, to_date('27-11-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103384, 'tel aviv', 102384, to_date('08-03-2000', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103385, 'jerusalem', 102385, to_date('16-12-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103386, 'new york', 102386, to_date('08-07-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103387, 'chicago', 102387, to_date('20-03-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103388, 'berlin', 102388, to_date('05-05-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103389, 'paris', 102389, to_date('09-04-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103390, 'denver', 102390, to_date('08-11-1999', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103391, 'madrid', 102391, to_date('29-03-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103392, 'tel aviv', 102392, to_date('01-07-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103393, 'jerusalem', 102393, to_date('13-05-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103394, 'new york', 102394, to_date('24-07-2002', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103395, 'chicago', 102395, to_date('15-07-2004', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103396, 'berlin', 102396, to_date('05-09-2001', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103397, 'paris', 102397, to_date('11-04-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103398, 'denver', 102398, to_date('12-09-2003', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103399, 'madrid', 102399, to_date('29-05-2000', 'dd-mm-yyyy'));
commit;
prompt 400 records loaded
prompt Loading CUSTOMERS...
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100000, 'Katelyn', 108000, to_date('11-06-2022', 'dd-mm-yyyy'), 103000);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100001, 'Barbara', 108001, to_date('29-05-2021', 'dd-mm-yyyy'), 103001);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100002, 'Cathy', 108002, to_date('04-05-2024', 'dd-mm-yyyy'), 103002);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100003, 'Thomas', 108003, to_date('01-05-2023', 'dd-mm-yyyy'), 103003);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100004, 'Kara', 108004, to_date('09-09-2020', 'dd-mm-yyyy'), 103004);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100005, 'Christina', 108005, to_date('18-08-2022', 'dd-mm-yyyy'), 103005);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100006, 'Reginald', 108006, to_date('30-04-2023', 'dd-mm-yyyy'), 103006);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100007, 'Jill', 108007, to_date('01-07-2023', 'dd-mm-yyyy'), 103007);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100008, 'Andrew', 108008, to_date('03-04-2024', 'dd-mm-yyyy'), 103008);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100009, 'Suzanne', 108009, to_date('14-09-2020', 'dd-mm-yyyy'), 103009);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100010, 'William', 108010, to_date('18-04-2020', 'dd-mm-yyyy'), 103010);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100011, 'Deborah', 108011, to_date('02-09-2020', 'dd-mm-yyyy'), 103011);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100012, 'Margaret', 108012, to_date('24-12-2022', 'dd-mm-yyyy'), 103012);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100013, 'Tina', 108013, to_date('12-12-2021', 'dd-mm-yyyy'), 103013);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100014, 'Mary', 108014, to_date('31-08-2020', 'dd-mm-yyyy'), 103014);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100015, 'Kimberly', 108015, to_date('21-08-2020', 'dd-mm-yyyy'), 103015);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100016, 'Amanda', 108016, to_date('23-05-2021', 'dd-mm-yyyy'), 103016);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100017, 'Michael', 108017, to_date('15-09-2021', 'dd-mm-yyyy'), 103017);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100018, 'Marissa', 108018, to_date('12-05-2022', 'dd-mm-yyyy'), 103018);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100019, 'Luis', 108019, to_date('18-02-2023', 'dd-mm-yyyy'), 103019);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100020, 'Michael', 108020, to_date('07-06-2024', 'dd-mm-yyyy'), 103020);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100021, 'Bruce', 108021, to_date('13-03-2022', 'dd-mm-yyyy'), 103021);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100022, 'Theresa', 108022, to_date('08-03-2024', 'dd-mm-yyyy'), 103022);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100023, 'Jennifer', 108023, to_date('05-04-2024', 'dd-mm-yyyy'), 103023);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100024, 'Travis', 108024, to_date('18-03-2020', 'dd-mm-yyyy'), 103024);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100025, 'Ruth', 108025, to_date('25-10-2020', 'dd-mm-yyyy'), 103025);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100026, 'Cory', 108026, to_date('11-11-2023', 'dd-mm-yyyy'), 103026);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100027, 'Karen', 108027, to_date('17-04-2024', 'dd-mm-yyyy'), 103027);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100028, 'Kristen', 108028, to_date('03-03-2020', 'dd-mm-yyyy'), 103028);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100029, 'Suzanne', 108029, to_date('31-01-2023', 'dd-mm-yyyy'), 103029);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100030, 'Kelsey', 108030, to_date('22-03-2023', 'dd-mm-yyyy'), 103030);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100031, 'James', 108031, to_date('12-07-2021', 'dd-mm-yyyy'), 103031);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100032, 'Richard', 108032, to_date('13-04-2020', 'dd-mm-yyyy'), 103032);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100033, 'Deborah', 108033, to_date('18-06-2021', 'dd-mm-yyyy'), 103033);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100034, 'Calvin', 108034, to_date('23-10-2020', 'dd-mm-yyyy'), 103034);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100035, 'John', 108035, to_date('14-04-2023', 'dd-mm-yyyy'), 103035);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100036, 'Diane', 108036, to_date('10-05-2020', 'dd-mm-yyyy'), 103036);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100037, 'Adrienne', 108037, to_date('22-03-2022', 'dd-mm-yyyy'), 103037);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100038, 'Rachel', 108038, to_date('03-08-2022', 'dd-mm-yyyy'), 103038);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100039, 'David', 108039, to_date('03-03-2021', 'dd-mm-yyyy'), 103039);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100040, 'Daniel', 108040, to_date('15-10-2022', 'dd-mm-yyyy'), 103040);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100041, 'Jeremy', 108041, to_date('01-10-2020', 'dd-mm-yyyy'), 103041);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100042, 'Anna', 108042, to_date('06-10-2021', 'dd-mm-yyyy'), 103042);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100043, 'Matthew', 108043, to_date('11-01-2024', 'dd-mm-yyyy'), 103043);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100044, 'Kristina', 108044, to_date('08-06-2024', 'dd-mm-yyyy'), 103044);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100045, 'Lisa', 108045, to_date('17-08-2020', 'dd-mm-yyyy'), 103045);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100046, 'James', 108046, to_date('28-02-2024', 'dd-mm-yyyy'), 103046);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100047, 'Michele', 108047, to_date('13-06-2020', 'dd-mm-yyyy'), 103047);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100048, 'Erica', 108048, to_date('10-10-2021', 'dd-mm-yyyy'), 103048);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100049, 'James', 108049, to_date('12-10-2020', 'dd-mm-yyyy'), 103049);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100050, 'Charles', 108050, to_date('24-05-2021', 'dd-mm-yyyy'), 103050);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100051, 'Lisa', 108051, to_date('23-03-2024', 'dd-mm-yyyy'), 103051);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100052, 'Elaine', 108052, to_date('10-03-2020', 'dd-mm-yyyy'), 103052);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100053, 'Jennifer', 108053, to_date('21-12-2020', 'dd-mm-yyyy'), 103053);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100054, 'Joseph', 108054, to_date('19-06-2020', 'dd-mm-yyyy'), 103054);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100055, 'Shane', 108055, to_date('25-01-2020', 'dd-mm-yyyy'), 103055);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100056, 'Patricia', 108056, to_date('04-02-2021', 'dd-mm-yyyy'), 103056);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100057, 'Ian', 108057, to_date('19-10-2023', 'dd-mm-yyyy'), 103057);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100058, 'Ellen', 108058, to_date('11-03-2024', 'dd-mm-yyyy'), 103058);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100059, 'Michael', 108059, to_date('24-03-2022', 'dd-mm-yyyy'), 103059);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100060, 'Joshua', 108060, to_date('12-03-2021', 'dd-mm-yyyy'), 103060);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100061, 'Mary', 108061, to_date('12-01-2024', 'dd-mm-yyyy'), 103061);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100062, 'Todd', 108062, to_date('20-02-2020', 'dd-mm-yyyy'), 103062);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100063, 'Alejandro', 108063, to_date('16-04-2022', 'dd-mm-yyyy'), 103063);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100064, 'Michelle', 108064, to_date('25-03-2023', 'dd-mm-yyyy'), 103064);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100065, 'Brittany', 108065, to_date('07-11-2020', 'dd-mm-yyyy'), 103065);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100066, 'Steven', 108066, to_date('14-10-2020', 'dd-mm-yyyy'), 103066);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100067, 'Elaine', 108067, to_date('14-11-2023', 'dd-mm-yyyy'), 103067);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100068, 'Bryan', 108068, to_date('18-12-2023', 'dd-mm-yyyy'), 103068);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100069, 'Kevin', 108069, to_date('02-09-2021', 'dd-mm-yyyy'), 103069);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100070, 'Tina', 108070, to_date('27-06-2022', 'dd-mm-yyyy'), 103070);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100071, 'Cindy', 108071, to_date('03-04-2023', 'dd-mm-yyyy'), 103071);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100072, 'Eric', 108072, to_date('04-06-2020', 'dd-mm-yyyy'), 103072);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100073, 'Randy', 108073, to_date('06-07-2020', 'dd-mm-yyyy'), 103073);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100074, 'Tyler', 108074, to_date('20-03-2020', 'dd-mm-yyyy'), 103074);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100075, 'Dana', 108075, to_date('27-10-2023', 'dd-mm-yyyy'), 103075);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100076, 'Debra', 108076, to_date('25-04-2023', 'dd-mm-yyyy'), 103076);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100077, 'Tony', 108077, to_date('13-04-2023', 'dd-mm-yyyy'), 103077);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100078, 'Keith', 108078, to_date('26-12-2022', 'dd-mm-yyyy'), 103078);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100079, 'Heather', 108079, to_date('13-11-2021', 'dd-mm-yyyy'), 103079);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100080, 'Christine', 108080, to_date('22-05-2020', 'dd-mm-yyyy'), 103080);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100081, 'Olivia', 108081, to_date('01-01-2021', 'dd-mm-yyyy'), 103081);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100082, 'Amanda', 108082, to_date('06-05-2020', 'dd-mm-yyyy'), 103082);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100083, 'Hannah', 108083, to_date('15-05-2020', 'dd-mm-yyyy'), 103083);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100084, 'Amanda', 108084, to_date('25-12-2021', 'dd-mm-yyyy'), 103084);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100085, 'Stephen', 108085, to_date('27-08-2020', 'dd-mm-yyyy'), 103085);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100086, 'Ryan', 108086, to_date('25-12-2020', 'dd-mm-yyyy'), 103086);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100087, 'Jason', 108087, to_date('12-02-2023', 'dd-mm-yyyy'), 103087);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100088, 'Evelyn', 108088, to_date('06-04-2024', 'dd-mm-yyyy'), 103088);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100089, 'Debra', 108089, to_date('18-05-2021', 'dd-mm-yyyy'), 103089);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100090, 'Willie', 108090, to_date('29-04-2023', 'dd-mm-yyyy'), 103090);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100091, 'Lisa', 108091, to_date('03-04-2022', 'dd-mm-yyyy'), 103091);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100092, 'Ashley', 108092, to_date('29-07-2023', 'dd-mm-yyyy'), 103092);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100093, 'Michael', 108093, to_date('15-02-2023', 'dd-mm-yyyy'), 103093);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100094, 'Justin', 108094, to_date('25-03-2020', 'dd-mm-yyyy'), 103094);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100095, 'Amy', 108095, to_date('04-07-2022', 'dd-mm-yyyy'), 103095);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100096, 'Melanie', 108096, to_date('02-12-2022', 'dd-mm-yyyy'), 103096);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100097, 'Erica', 108097, to_date('21-01-2020', 'dd-mm-yyyy'), 103097);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100098, 'Maria', 108098, to_date('29-02-2024', 'dd-mm-yyyy'), 103098);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100099, 'Tracie', 108099, to_date('08-02-2023', 'dd-mm-yyyy'), 103099);
commit;
prompt 100 records committed...
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100100, 'Kathryn', 108100, to_date('11-01-2021', 'dd-mm-yyyy'), 103100);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100101, 'Julie', 108101, to_date('17-05-2024', 'dd-mm-yyyy'), 103101);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100102, 'Nancy', 108102, to_date('08-07-2020', 'dd-mm-yyyy'), 103102);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100103, 'Isaiah', 108103, to_date('05-10-2023', 'dd-mm-yyyy'), 103103);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100104, 'Daniel', 108104, to_date('03-08-2022', 'dd-mm-yyyy'), 103104);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100105, 'Joshua', 108105, to_date('09-08-2023', 'dd-mm-yyyy'), 103105);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100106, 'Colleen', 108106, to_date('15-11-2021', 'dd-mm-yyyy'), 103106);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100107, 'William', 108107, to_date('28-07-2022', 'dd-mm-yyyy'), 103107);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100108, 'Christian', 108108, to_date('17-11-2020', 'dd-mm-yyyy'), 103108);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100109, 'Crystal', 108109, to_date('25-05-2022', 'dd-mm-yyyy'), 103109);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100110, 'Lee', 108110, to_date('01-09-2023', 'dd-mm-yyyy'), 103110);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100111, 'Kevin', 108111, to_date('06-11-2022', 'dd-mm-yyyy'), 103111);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100112, 'Bethany', 108112, to_date('03-11-2023', 'dd-mm-yyyy'), 103112);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100113, 'Denise', 108113, to_date('22-12-2020', 'dd-mm-yyyy'), 103113);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100114, 'Jim', 108114, to_date('18-01-2023', 'dd-mm-yyyy'), 103114);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100115, 'Brian', 108115, to_date('29-05-2021', 'dd-mm-yyyy'), 103115);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100116, 'Elizabeth', 108116, to_date('20-04-2022', 'dd-mm-yyyy'), 103116);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100117, 'Francisco', 108117, to_date('17-01-2022', 'dd-mm-yyyy'), 103117);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100118, 'Casey', 108118, to_date('13-04-2021', 'dd-mm-yyyy'), 103118);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100119, 'Edward', 108119, to_date('29-09-2020', 'dd-mm-yyyy'), 103119);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100120, 'Jeffrey', 108120, to_date('14-03-2021', 'dd-mm-yyyy'), 103120);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100121, 'John', 108121, to_date('22-06-2021', 'dd-mm-yyyy'), 103121);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100122, 'Danielle', 108122, to_date('14-05-2023', 'dd-mm-yyyy'), 103122);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100123, 'Monica', 108123, to_date('28-05-2023', 'dd-mm-yyyy'), 103123);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100124, 'Melissa', 108124, to_date('01-10-2021', 'dd-mm-yyyy'), 103124);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100125, 'Robert', 108125, to_date('13-05-2020', 'dd-mm-yyyy'), 103125);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100126, 'Desiree', 108126, to_date('29-03-2023', 'dd-mm-yyyy'), 103126);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100127, 'Crystal', 108127, to_date('15-02-2022', 'dd-mm-yyyy'), 103127);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100128, 'Jennifer', 108128, to_date('16-08-2023', 'dd-mm-yyyy'), 103128);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100129, 'Maxwell', 108129, to_date('07-01-2024', 'dd-mm-yyyy'), 103129);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100130, 'Pamela', 108130, to_date('01-02-2020', 'dd-mm-yyyy'), 103130);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100131, 'David', 108131, to_date('23-08-2023', 'dd-mm-yyyy'), 103131);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100132, 'Kathleen', 108132, to_date('20-06-2022', 'dd-mm-yyyy'), 103132);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100133, 'Ashley', 108133, to_date('19-05-2022', 'dd-mm-yyyy'), 103133);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100134, 'William', 108134, to_date('06-12-2021', 'dd-mm-yyyy'), 103134);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100135, 'David', 108135, to_date('08-11-2023', 'dd-mm-yyyy'), 103135);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100136, 'David', 108136, to_date('26-08-2021', 'dd-mm-yyyy'), 103136);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100137, 'Timothy', 108137, to_date('12-03-2020', 'dd-mm-yyyy'), 103137);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100138, 'Mary', 108138, to_date('12-01-2023', 'dd-mm-yyyy'), 103138);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100139, 'Kenneth', 108139, to_date('14-12-2022', 'dd-mm-yyyy'), 103139);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100140, 'Billy', 108140, to_date('17-06-2022', 'dd-mm-yyyy'), 103140);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100141, 'Michelle', 108141, to_date('30-03-2022', 'dd-mm-yyyy'), 103141);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100142, 'Linda', 108142, to_date('04-05-2021', 'dd-mm-yyyy'), 103142);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100143, 'Jason', 108143, to_date('06-03-2020', 'dd-mm-yyyy'), 103143);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100144, 'Maxwell', 108144, to_date('20-05-2024', 'dd-mm-yyyy'), 103144);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100145, 'Colton', 108145, to_date('26-11-2023', 'dd-mm-yyyy'), 103145);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100146, 'John', 108146, to_date('29-01-2022', 'dd-mm-yyyy'), 103146);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100147, 'William', 108147, to_date('16-08-2020', 'dd-mm-yyyy'), 103147);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100148, 'Lori', 108148, to_date('17-08-2020', 'dd-mm-yyyy'), 103148);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100149, 'Jerry', 108149, to_date('05-08-2021', 'dd-mm-yyyy'), 103149);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100150, 'Amy', 108150, to_date('16-02-2024', 'dd-mm-yyyy'), 103150);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100151, 'David', 108151, to_date('23-11-2023', 'dd-mm-yyyy'), 103151);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100152, 'Nancy', 108152, to_date('07-10-2021', 'dd-mm-yyyy'), 103152);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100153, 'Eric', 108153, to_date('21-08-2022', 'dd-mm-yyyy'), 103153);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100154, 'Mark', 108154, to_date('05-10-2021', 'dd-mm-yyyy'), 103154);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100155, 'Colleen', 108155, to_date('12-07-2021', 'dd-mm-yyyy'), 103155);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100156, 'Jeremy', 108156, to_date('01-08-2023', 'dd-mm-yyyy'), 103156);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100157, 'Cody', 108157, to_date('04-05-2023', 'dd-mm-yyyy'), 103157);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100158, 'Ashley', 108158, to_date('08-01-2023', 'dd-mm-yyyy'), 103158);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100159, 'Jose', 108159, to_date('10-11-2020', 'dd-mm-yyyy'), 103159);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100160, 'Teresa', 108160, to_date('23-06-2023', 'dd-mm-yyyy'), 103160);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100161, 'Tyler', 108161, to_date('10-06-2021', 'dd-mm-yyyy'), 103161);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100162, 'Julia', 108162, to_date('26-12-2022', 'dd-mm-yyyy'), 103162);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100163, 'Michelle', 108163, to_date('23-01-2023', 'dd-mm-yyyy'), 103163);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100164, 'Elizabeth', 108164, to_date('06-01-2023', 'dd-mm-yyyy'), 103164);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100165, 'David', 108165, to_date('09-06-2023', 'dd-mm-yyyy'), 103165);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100166, 'Suzanne', 108166, to_date('01-03-2024', 'dd-mm-yyyy'), 103166);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100167, 'Nathan', 108167, to_date('18-01-2023', 'dd-mm-yyyy'), 103167);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100168, 'Christina', 108168, to_date('28-07-2022', 'dd-mm-yyyy'), 103168);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100169, 'Hayley', 108169, to_date('31-03-2022', 'dd-mm-yyyy'), 103169);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100170, 'Lori', 108170, to_date('17-01-2023', 'dd-mm-yyyy'), 103170);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100171, 'Erin', 108171, to_date('25-04-2021', 'dd-mm-yyyy'), 103171);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100172, 'Marissa', 108172, to_date('20-10-2023', 'dd-mm-yyyy'), 103172);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100173, 'Catherine', 108173, to_date('10-03-2021', 'dd-mm-yyyy'), 103173);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100174, 'William', 108174, to_date('08-01-2021', 'dd-mm-yyyy'), 103174);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100175, 'John', 108175, to_date('06-08-2023', 'dd-mm-yyyy'), 103175);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100176, 'Jennifer', 108176, to_date('19-04-2020', 'dd-mm-yyyy'), 103176);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100177, 'Julia', 108177, to_date('04-01-2021', 'dd-mm-yyyy'), 103177);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100178, 'James', 108178, to_date('09-12-2023', 'dd-mm-yyyy'), 103178);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100179, 'Melissa', 108179, to_date('28-07-2023', 'dd-mm-yyyy'), 103179);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100180, 'Amanda', 108180, to_date('21-01-2022', 'dd-mm-yyyy'), 103180);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100181, 'Maria', 108181, to_date('02-03-2022', 'dd-mm-yyyy'), 103181);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100182, 'Alexander', 108182, to_date('14-04-2024', 'dd-mm-yyyy'), 103182);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100183, 'Deborah', 108183, to_date('13-12-2022', 'dd-mm-yyyy'), 103183);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100184, 'Barbara', 108184, to_date('16-04-2022', 'dd-mm-yyyy'), 103184);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100185, 'Adam', 108185, to_date('19-01-2021', 'dd-mm-yyyy'), 103185);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100186, 'Sara', 108186, to_date('02-11-2023', 'dd-mm-yyyy'), 103186);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100187, 'Richard', 108187, to_date('09-05-2022', 'dd-mm-yyyy'), 103187);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100188, 'Erica', 108188, to_date('12-11-2021', 'dd-mm-yyyy'), 103188);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100189, 'Martha', 108189, to_date('27-12-2022', 'dd-mm-yyyy'), 103189);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100190, 'Dawn', 108190, to_date('25-08-2021', 'dd-mm-yyyy'), 103190);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100191, 'Katherine', 108191, to_date('28-05-2020', 'dd-mm-yyyy'), 103191);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100192, 'Stephen', 108192, to_date('13-10-2021', 'dd-mm-yyyy'), 103192);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100193, 'Jean', 108193, to_date('30-06-2021', 'dd-mm-yyyy'), 103193);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100194, 'Robert', 108194, to_date('26-09-2020', 'dd-mm-yyyy'), 103194);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100195, 'Robin', 108195, to_date('08-08-2022', 'dd-mm-yyyy'), 103195);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100196, 'Pamela', 108196, to_date('20-07-2023', 'dd-mm-yyyy'), 103196);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100197, 'John', 108197, to_date('28-02-2024', 'dd-mm-yyyy'), 103197);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100198, 'Gilbert', 108198, to_date('09-07-2021', 'dd-mm-yyyy'), 103198);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100199, 'Charles', 108199, to_date('11-02-2024', 'dd-mm-yyyy'), 103199);
commit;
prompt 200 records committed...
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100200, 'Brent', 108200, to_date('25-07-2020', 'dd-mm-yyyy'), 103200);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100201, 'Elizabeth', 108201, to_date('30-03-2024', 'dd-mm-yyyy'), 103201);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100202, 'Jacqueline', 108202, to_date('23-06-2023', 'dd-mm-yyyy'), 103202);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100203, 'Elizabeth', 108203, to_date('23-11-2022', 'dd-mm-yyyy'), 103203);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100204, 'David', 108204, to_date('29-10-2021', 'dd-mm-yyyy'), 103204);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100205, 'Kristine', 108205, to_date('15-03-2023', 'dd-mm-yyyy'), 103205);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100206, 'Adam', 108206, to_date('14-07-2022', 'dd-mm-yyyy'), 103206);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100207, 'Daniel', 108207, to_date('22-11-2023', 'dd-mm-yyyy'), 103207);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100208, 'Rhonda', 108208, to_date('05-06-2024', 'dd-mm-yyyy'), 103208);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100209, 'Carlos', 108209, to_date('21-12-2023', 'dd-mm-yyyy'), 103209);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100210, 'Jeremy', 108210, to_date('31-10-2023', 'dd-mm-yyyy'), 103210);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100211, 'Patrick', 108211, to_date('08-05-2020', 'dd-mm-yyyy'), 103211);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100212, 'Gregory', 108212, to_date('20-08-2022', 'dd-mm-yyyy'), 103212);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100213, 'Jessica', 108213, to_date('27-07-2023', 'dd-mm-yyyy'), 103213);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100214, 'Joann', 108214, to_date('17-08-2022', 'dd-mm-yyyy'), 103214);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100215, 'Gabrielle', 108215, to_date('31-01-2023', 'dd-mm-yyyy'), 103215);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100216, 'Sandra', 108216, to_date('13-09-2022', 'dd-mm-yyyy'), 103216);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100217, 'Matthew', 108217, to_date('14-11-2022', 'dd-mm-yyyy'), 103217);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100218, 'Daniel', 108218, to_date('14-05-2020', 'dd-mm-yyyy'), 103218);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100219, 'Maria', 108219, to_date('21-11-2023', 'dd-mm-yyyy'), 103219);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100220, 'Anna', 108220, to_date('16-10-2022', 'dd-mm-yyyy'), 103220);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100221, 'Lisa', 108221, to_date('11-02-2024', 'dd-mm-yyyy'), 103221);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100222, 'Morgan', 108222, to_date('12-07-2022', 'dd-mm-yyyy'), 103222);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100223, 'John', 108223, to_date('27-07-2023', 'dd-mm-yyyy'), 103223);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100224, 'Michael', 108224, to_date('08-12-2021', 'dd-mm-yyyy'), 103224);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100225, 'Dalton', 108225, to_date('30-08-2021', 'dd-mm-yyyy'), 103225);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100226, 'Kelly', 108226, to_date('04-06-2022', 'dd-mm-yyyy'), 103226);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100227, 'Michael', 108227, to_date('03-05-2021', 'dd-mm-yyyy'), 103227);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100228, 'Michael', 108228, to_date('15-11-2022', 'dd-mm-yyyy'), 103228);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100229, 'Kim', 108229, to_date('25-11-2020', 'dd-mm-yyyy'), 103229);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100230, 'Melvin', 108230, to_date('17-05-2024', 'dd-mm-yyyy'), 103230);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100231, 'Eric', 108231, to_date('02-12-2021', 'dd-mm-yyyy'), 103231);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100232, 'Ashley', 108232, to_date('14-02-2020', 'dd-mm-yyyy'), 103232);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100233, 'Ronnie', 108233, to_date('24-06-2020', 'dd-mm-yyyy'), 103233);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100234, 'Gerald', 108234, to_date('14-11-2023', 'dd-mm-yyyy'), 103234);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100235, 'Tara', 108235, to_date('07-06-2023', 'dd-mm-yyyy'), 103235);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100236, 'Bruce', 108236, to_date('06-03-2020', 'dd-mm-yyyy'), 103236);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100237, 'Laurie', 108237, to_date('15-09-2023', 'dd-mm-yyyy'), 103237);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100238, 'Michelle', 108238, to_date('14-06-2022', 'dd-mm-yyyy'), 103238);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100239, 'Michael', 108239, to_date('10-06-2022', 'dd-mm-yyyy'), 103239);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100240, 'Jeffrey', 108240, to_date('27-08-2023', 'dd-mm-yyyy'), 103240);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100241, 'Michelle', 108241, to_date('15-08-2021', 'dd-mm-yyyy'), 103241);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100242, 'Pamela', 108242, to_date('06-07-2021', 'dd-mm-yyyy'), 103242);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100243, 'Michael', 108243, to_date('11-01-2023', 'dd-mm-yyyy'), 103243);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100244, 'Gabriel', 108244, to_date('22-06-2021', 'dd-mm-yyyy'), 103244);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100245, 'Nicholas', 108245, to_date('03-01-2023', 'dd-mm-yyyy'), 103245);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100246, 'Christopher', 108246, to_date('02-02-2024', 'dd-mm-yyyy'), 103246);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100247, 'Glenn', 108247, to_date('07-07-2021', 'dd-mm-yyyy'), 103247);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100248, 'Scott', 108248, to_date('05-02-2024', 'dd-mm-yyyy'), 103248);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100249, 'Alexander', 108249, to_date('30-10-2023', 'dd-mm-yyyy'), 103249);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100250, 'Annette', 108250, to_date('17-09-2023', 'dd-mm-yyyy'), 103250);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100251, 'Stephanie', 108251, to_date('12-09-2021', 'dd-mm-yyyy'), 103251);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100252, 'Lauren', 108252, to_date('13-03-2024', 'dd-mm-yyyy'), 103252);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100253, 'Leah', 108253, to_date('31-05-2020', 'dd-mm-yyyy'), 103253);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100254, 'George', 108254, to_date('05-04-2020', 'dd-mm-yyyy'), 103254);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100255, 'Jesse', 108255, to_date('07-06-2024', 'dd-mm-yyyy'), 103255);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100256, 'Carrie', 108256, to_date('14-10-2022', 'dd-mm-yyyy'), 103256);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100257, 'Ann', 108257, to_date('29-01-2023', 'dd-mm-yyyy'), 103257);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100258, 'Denise', 108258, to_date('09-01-2022', 'dd-mm-yyyy'), 103258);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100259, 'Maria', 108259, to_date('18-12-2020', 'dd-mm-yyyy'), 103259);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100260, 'Tara', 108260, to_date('13-03-2022', 'dd-mm-yyyy'), 103260);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100261, 'Brooke', 108261, to_date('17-04-2022', 'dd-mm-yyyy'), 103261);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100262, 'Lindsey', 108262, to_date('05-10-2021', 'dd-mm-yyyy'), 103262);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100263, 'Richard', 108263, to_date('11-05-2021', 'dd-mm-yyyy'), 103263);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100264, 'Kimberly', 108264, to_date('30-04-2020', 'dd-mm-yyyy'), 103264);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100265, 'Christopher', 108265, to_date('28-06-2022', 'dd-mm-yyyy'), 103265);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100266, 'Thomas', 108266, to_date('22-07-2020', 'dd-mm-yyyy'), 103266);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100267, 'James', 108267, to_date('29-09-2022', 'dd-mm-yyyy'), 103267);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100268, 'Abigail', 108268, to_date('06-10-2022', 'dd-mm-yyyy'), 103268);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100269, 'Thomas', 108269, to_date('11-02-2023', 'dd-mm-yyyy'), 103269);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100270, 'Nicolas', 108270, to_date('30-11-2021', 'dd-mm-yyyy'), 103270);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100271, 'Richard', 108271, to_date('18-05-2020', 'dd-mm-yyyy'), 103271);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100272, 'Sheila', 108272, to_date('23-04-2024', 'dd-mm-yyyy'), 103272);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100273, 'Jennifer', 108273, to_date('16-06-2020', 'dd-mm-yyyy'), 103273);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100274, 'Jessica', 108274, to_date('15-03-2024', 'dd-mm-yyyy'), 103274);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100275, 'James', 108275, to_date('23-04-2023', 'dd-mm-yyyy'), 103275);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100276, 'Bailey', 108276, to_date('07-01-2024', 'dd-mm-yyyy'), 103276);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100277, 'Eric', 108277, to_date('13-03-2024', 'dd-mm-yyyy'), 103277);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100278, 'Tina', 108278, to_date('24-09-2020', 'dd-mm-yyyy'), 103278);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100279, 'Lori', 108279, to_date('29-07-2023', 'dd-mm-yyyy'), 103279);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100280, 'David', 108280, to_date('07-01-2024', 'dd-mm-yyyy'), 103280);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100281, 'Carolyn', 108281, to_date('22-02-2024', 'dd-mm-yyyy'), 103281);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100282, 'Elizabeth', 108282, to_date('19-06-2021', 'dd-mm-yyyy'), 103282);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100283, 'Katherine', 108283, to_date('10-04-2024', 'dd-mm-yyyy'), 103283);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100284, 'Bryan', 108284, to_date('28-03-2020', 'dd-mm-yyyy'), 103284);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100285, 'Curtis', 108285, to_date('05-11-2021', 'dd-mm-yyyy'), 103285);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100286, 'Jacob', 108286, to_date('10-02-2024', 'dd-mm-yyyy'), 103286);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100287, 'Daniel', 108287, to_date('25-04-2020', 'dd-mm-yyyy'), 103287);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100288, 'Brandon', 108288, to_date('29-04-2023', 'dd-mm-yyyy'), 103288);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100289, 'Gavin', 108289, to_date('20-06-2021', 'dd-mm-yyyy'), 103289);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100290, 'Justin', 108290, to_date('01-05-2021', 'dd-mm-yyyy'), 103290);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100291, 'Patricia', 108291, to_date('22-02-2023', 'dd-mm-yyyy'), 103291);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100292, 'Joseph', 108292, to_date('09-01-2020', 'dd-mm-yyyy'), 103292);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100293, 'Brandon', 108293, to_date('17-03-2023', 'dd-mm-yyyy'), 103293);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100294, 'Gary', 108294, to_date('10-02-2021', 'dd-mm-yyyy'), 103294);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100295, 'Paula', 108295, to_date('24-05-2020', 'dd-mm-yyyy'), 103295);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100296, 'Christopher', 108296, to_date('11-04-2023', 'dd-mm-yyyy'), 103296);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100297, 'Nicole', 108297, to_date('07-03-2023', 'dd-mm-yyyy'), 103297);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100298, 'Benjamin', 108298, to_date('13-06-2021', 'dd-mm-yyyy'), 103298);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100299, 'Austin', 108299, to_date('17-03-2020', 'dd-mm-yyyy'), 103299);
commit;
prompt 300 records committed...
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100300, 'Michael', 108300, to_date('27-07-2023', 'dd-mm-yyyy'), 103300);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100301, 'Regina', 108301, to_date('05-06-2020', 'dd-mm-yyyy'), 103301);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100302, 'David', 108302, to_date('06-03-2024', 'dd-mm-yyyy'), 103302);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100303, 'Michael', 108303, to_date('15-04-2021', 'dd-mm-yyyy'), 103303);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100304, 'Mark', 108304, to_date('18-12-2021', 'dd-mm-yyyy'), 103304);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100305, 'Karen', 108305, to_date('08-11-2023', 'dd-mm-yyyy'), 103305);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100306, 'Gary', 108306, to_date('08-03-2022', 'dd-mm-yyyy'), 103306);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100307, 'James', 108307, to_date('12-07-2020', 'dd-mm-yyyy'), 103307);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100308, 'Jacob', 108308, to_date('18-05-2020', 'dd-mm-yyyy'), 103308);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100309, 'Patricia', 108309, to_date('20-10-2020', 'dd-mm-yyyy'), 103309);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100310, 'Sara', 108310, to_date('31-01-2020', 'dd-mm-yyyy'), 103310);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100311, 'Elizabeth', 108311, to_date('09-12-2020', 'dd-mm-yyyy'), 103311);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100312, 'Olivia', 108312, to_date('24-11-2021', 'dd-mm-yyyy'), 103312);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100313, 'Carmen', 108313, to_date('19-09-2022', 'dd-mm-yyyy'), 103313);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100314, 'Derek', 108314, to_date('27-11-2020', 'dd-mm-yyyy'), 103314);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100315, 'Meredith', 108315, to_date('31-01-2022', 'dd-mm-yyyy'), 103315);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100316, 'Jacqueline', 108316, to_date('07-11-2020', 'dd-mm-yyyy'), 103316);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100317, 'Whitney', 108317, to_date('21-03-2021', 'dd-mm-yyyy'), 103317);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100318, 'Tina', 108318, to_date('03-02-2023', 'dd-mm-yyyy'), 103318);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100319, 'John', 108319, to_date('25-09-2022', 'dd-mm-yyyy'), 103319);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100320, 'Edward', 108320, to_date('12-06-2022', 'dd-mm-yyyy'), 103320);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100321, 'Gerald', 108321, to_date('23-04-2021', 'dd-mm-yyyy'), 103321);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100322, 'Michael', 108322, to_date('04-04-2023', 'dd-mm-yyyy'), 103322);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100323, 'Michael', 108323, to_date('08-01-2021', 'dd-mm-yyyy'), 103323);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100324, 'Christopher', 108324, to_date('03-11-2023', 'dd-mm-yyyy'), 103324);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100325, 'Frank', 108325, to_date('12-09-2023', 'dd-mm-yyyy'), 103325);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100326, 'Tiffany', 108326, to_date('29-06-2020', 'dd-mm-yyyy'), 103326);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100327, 'Carl', 108327, to_date('10-11-2020', 'dd-mm-yyyy'), 103327);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100328, 'Kelly', 108328, to_date('21-03-2023', 'dd-mm-yyyy'), 103328);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100329, 'Robert', 108329, to_date('10-03-2023', 'dd-mm-yyyy'), 103329);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100330, 'Samuel', 108330, to_date('05-12-2022', 'dd-mm-yyyy'), 103330);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100331, 'Joy', 108331, to_date('18-04-2022', 'dd-mm-yyyy'), 103331);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100332, 'Jesse', 108332, to_date('24-10-2023', 'dd-mm-yyyy'), 103332);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100333, 'Matthew', 108333, to_date('16-12-2022', 'dd-mm-yyyy'), 103333);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100334, 'Brandon', 108334, to_date('27-05-2023', 'dd-mm-yyyy'), 103334);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100335, 'Nathaniel', 108335, to_date('28-01-2024', 'dd-mm-yyyy'), 103335);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100336, 'Angela', 108336, to_date('12-04-2020', 'dd-mm-yyyy'), 103336);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100337, 'Tammy', 108337, to_date('17-04-2020', 'dd-mm-yyyy'), 103337);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100338, 'Brandon', 108338, to_date('13-05-2022', 'dd-mm-yyyy'), 103338);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100339, 'Timothy', 108339, to_date('04-11-2022', 'dd-mm-yyyy'), 103339);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100340, 'Shawn', 108340, to_date('06-01-2024', 'dd-mm-yyyy'), 103340);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100341, 'Meredith', 108341, to_date('25-05-2024', 'dd-mm-yyyy'), 103341);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100342, 'Amy', 108342, to_date('26-09-2020', 'dd-mm-yyyy'), 103342);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100343, 'Emily', 108343, to_date('17-07-2021', 'dd-mm-yyyy'), 103343);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100344, 'Luke', 108344, to_date('18-10-2021', 'dd-mm-yyyy'), 103344);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100345, 'Eric', 108345, to_date('03-08-2022', 'dd-mm-yyyy'), 103345);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100346, 'Lindsay', 108346, to_date('02-02-2024', 'dd-mm-yyyy'), 103346);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100347, 'Donna', 108347, to_date('20-01-2023', 'dd-mm-yyyy'), 103347);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100348, 'Paul', 108348, to_date('25-02-2021', 'dd-mm-yyyy'), 103348);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100349, 'Kimberly', 108349, to_date('19-01-2023', 'dd-mm-yyyy'), 103349);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100350, 'Kevin', 108350, to_date('01-07-2020', 'dd-mm-yyyy'), 103350);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100351, 'Randall', 108351, to_date('14-09-2020', 'dd-mm-yyyy'), 103351);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100352, 'Brandon', 108352, to_date('19-01-2022', 'dd-mm-yyyy'), 103352);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100353, 'Jonathon', 108353, to_date('20-05-2024', 'dd-mm-yyyy'), 103353);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100354, 'Kenneth', 108354, to_date('27-05-2022', 'dd-mm-yyyy'), 103354);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100355, 'Natalie', 108355, to_date('14-02-2021', 'dd-mm-yyyy'), 103355);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100356, 'Mark', 108356, to_date('23-05-2024', 'dd-mm-yyyy'), 103356);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100357, 'Matthew', 108357, to_date('30-12-2023', 'dd-mm-yyyy'), 103357);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100358, 'Joseph', 108358, to_date('09-06-2023', 'dd-mm-yyyy'), 103358);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100359, 'Christine', 108359, to_date('18-03-2023', 'dd-mm-yyyy'), 103359);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100360, 'Paul', 108360, to_date('14-10-2022', 'dd-mm-yyyy'), 103360);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100361, 'Maria', 108361, to_date('27-09-2020', 'dd-mm-yyyy'), 103361);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100362, 'James', 108362, to_date('11-12-2023', 'dd-mm-yyyy'), 103362);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100363, 'Jacqueline', 108363, to_date('06-02-2021', 'dd-mm-yyyy'), 103363);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100364, 'Danielle', 108364, to_date('08-07-2022', 'dd-mm-yyyy'), 103364);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100365, 'Tyler', 108365, to_date('29-05-2020', 'dd-mm-yyyy'), 103365);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100366, 'Barbara', 108366, to_date('03-07-2022', 'dd-mm-yyyy'), 103366);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100367, 'Zachary', 108367, to_date('25-03-2021', 'dd-mm-yyyy'), 103367);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100368, 'William', 108368, to_date('30-07-2020', 'dd-mm-yyyy'), 103368);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100369, 'Kenneth', 108369, to_date('12-07-2021', 'dd-mm-yyyy'), 103369);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100370, 'Christie', 108370, to_date('25-08-2021', 'dd-mm-yyyy'), 103370);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100371, 'Samuel', 108371, to_date('23-03-2021', 'dd-mm-yyyy'), 103371);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100372, 'Joseph', 108372, to_date('29-10-2021', 'dd-mm-yyyy'), 103372);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100373, 'Wayne', 108373, to_date('22-05-2024', 'dd-mm-yyyy'), 103373);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100374, 'Angela', 108374, to_date('27-09-2022', 'dd-mm-yyyy'), 103374);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100375, 'Julie', 108375, to_date('08-01-2020', 'dd-mm-yyyy'), 103375);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100376, 'Ashley', 108376, to_date('15-04-2023', 'dd-mm-yyyy'), 103376);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100377, 'Jesse', 108377, to_date('13-04-2023', 'dd-mm-yyyy'), 103377);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100378, 'Kevin', 108378, to_date('05-05-2021', 'dd-mm-yyyy'), 103378);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100379, 'Stephanie', 108379, to_date('14-11-2021', 'dd-mm-yyyy'), 103379);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100380, 'Tiffany', 108380, to_date('13-10-2021', 'dd-mm-yyyy'), 103380);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100381, 'Eric', 108381, to_date('04-09-2020', 'dd-mm-yyyy'), 103381);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100382, 'Jessica', 108382, to_date('28-05-2020', 'dd-mm-yyyy'), 103382);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100383, 'Timothy', 108383, to_date('04-01-2022', 'dd-mm-yyyy'), 103383);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100384, 'Danielle', 108384, to_date('04-05-2022', 'dd-mm-yyyy'), 103384);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100385, 'Ryan', 108385, to_date('13-06-2023', 'dd-mm-yyyy'), 103385);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100386, 'Kayla', 108386, to_date('02-12-2021', 'dd-mm-yyyy'), 103386);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100387, 'Tina', 108387, to_date('28-07-2023', 'dd-mm-yyyy'), 103387);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100388, 'Justin', 108388, to_date('11-04-2020', 'dd-mm-yyyy'), 103388);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100389, 'Valerie', 108389, to_date('19-07-2023', 'dd-mm-yyyy'), 103389);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100390, 'Jay', 108390, to_date('27-07-2023', 'dd-mm-yyyy'), 103390);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100391, 'Ashlee', 108391, to_date('06-01-2022', 'dd-mm-yyyy'), 103391);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100392, 'Keith', 108392, to_date('02-09-2023', 'dd-mm-yyyy'), 103392);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100393, 'Timothy', 108393, to_date('09-02-2021', 'dd-mm-yyyy'), 103393);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100394, 'Jeremy', 108394, to_date('16-07-2021', 'dd-mm-yyyy'), 103394);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100395, 'William', 108395, to_date('07-05-2024', 'dd-mm-yyyy'), 103395);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100396, 'Jason', 108396, to_date('19-05-2022', 'dd-mm-yyyy'), 103396);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100397, 'Gina', 108397, to_date('19-09-2023', 'dd-mm-yyyy'), 103397);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100398, 'Elizabeth', 108398, to_date('17-04-2022', 'dd-mm-yyyy'), 103398);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100399, 'Veronica', 108399, to_date('13-09-2021', 'dd-mm-yyyy'), 103399);
commit;
prompt 400 records loaded
prompt Loading LOANS...
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101000, 37987, 100000, to_date('11-12-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101001, 88354, 100001, to_date('31-07-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101002, 45963, 100002, to_date('26-04-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101003, 56067, 100003, to_date('06-02-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101004, 92104, 100004, to_date('26-01-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101005, 64442, 100005, to_date('07-05-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101006, 73645, 100006, to_date('11-01-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101007, 39267, 100007, to_date('14-09-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101008, 85730, 100008, to_date('13-06-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101009, 32453, 100009, to_date('21-08-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101010, 72901, 100010, to_date('29-05-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101011, 26589, 100011, to_date('14-02-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101012, 12304, 100012, to_date('30-05-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101013, 80722, 100013, to_date('10-05-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101014, 69120, 100014, to_date('26-05-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101015, 77828, 100015, to_date('08-10-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101016, 27243, 100016, to_date('25-02-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101017, 53640, 100017, to_date('16-09-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101018, 81133, 100018, to_date('16-11-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101019, 66621, 100019, to_date('28-11-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101020, 72311, 100020, to_date('11-11-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101021, 66771, 100021, to_date('15-04-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101022, 31747, 100022, to_date('19-11-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101023, 20444, 100023, to_date('12-06-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101024, 91509, 100024, to_date('27-02-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101025, 41723, 100025, to_date('13-12-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101026, 31067, 100026, to_date('29-12-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101027, 92820, 100027, to_date('07-11-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101028, 55960, 100028, to_date('11-12-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101029, 72965, 100029, to_date('28-07-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101030, 4860, 100030, to_date('26-05-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101031, 23963, 100031, to_date('09-03-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101032, 89898, 100032, to_date('03-03-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101033, 17401, 100033, to_date('10-02-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101034, 85509, 100034, to_date('03-03-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101035, 25552, 100035, to_date('10-12-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101036, 30027, 100036, to_date('18-07-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101037, 19705, 100037, to_date('25-04-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101038, 51020, 100038, to_date('10-07-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101039, 78058, 100039, to_date('08-04-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101040, 12159, 100040, to_date('20-10-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101041, 37704, 100041, to_date('17-10-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101042, 20643, 100042, to_date('24-09-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101043, 99689, 100043, to_date('25-07-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101044, 23821, 100044, to_date('06-01-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101045, 9296, 100045, to_date('13-08-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101046, 90255, 100046, to_date('20-02-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101047, 54989, 100047, to_date('13-11-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101048, 16283, 100048, to_date('22-05-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101049, 93357, 100049, to_date('02-08-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101050, 8027, 100050, to_date('09-11-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101051, 51290, 100051, to_date('28-04-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101052, 97545, 100052, to_date('07-12-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101053, 14570, 100053, to_date('15-02-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101054, 26285, 100054, to_date('24-01-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101055, 84840, 100055, to_date('11-03-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101056, 18157, 100056, to_date('14-04-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101057, 99543, 100057, to_date('31-12-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101058, 86522, 100058, to_date('08-05-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101059, 85323, 100059, to_date('21-03-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101060, 3488, 100060, to_date('30-03-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101061, 68031, 100061, to_date('11-11-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101062, 37709, 100062, to_date('14-06-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101063, 89029, 100063, to_date('02-05-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101064, 43972, 100064, to_date('03-09-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101065, 94183, 100065, to_date('11-04-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101066, 65873, 100066, to_date('25-09-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101067, 17889, 100067, to_date('01-04-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101068, 67403, 100068, to_date('08-03-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101069, 44067, 100069, to_date('13-03-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101070, 6423, 100070, to_date('03-08-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101071, 97163, 100071, to_date('28-12-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101072, 42226, 100072, to_date('18-09-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101073, 14663, 100073, to_date('02-12-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101074, 35713, 100074, to_date('06-01-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101075, 44590, 100075, to_date('11-02-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101076, 29680, 100076, to_date('10-08-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101077, 45040, 100077, to_date('03-12-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101078, 68716, 100078, to_date('04-05-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101079, 65235, 100079, to_date('30-07-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101080, 56791, 100080, to_date('08-10-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101081, 29196, 100081, to_date('16-06-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101082, 74036, 100082, to_date('25-04-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101083, 30875, 100083, to_date('09-06-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101084, 29817, 100084, to_date('19-03-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101085, 62057, 100085, to_date('05-01-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101086, 33120, 100086, to_date('22-09-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101087, 24162, 100087, to_date('06-04-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101088, 63625, 100088, to_date('02-05-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101089, 90278, 100089, to_date('19-03-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101090, 34128, 100090, to_date('05-10-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101091, 4297, 100091, to_date('17-04-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101092, 58505, 100092, to_date('31-07-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101093, 15138, 100093, to_date('08-07-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101094, 64988, 100094, to_date('17-02-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101095, 15757, 100095, to_date('26-01-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101096, 4633, 100096, to_date('11-07-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101097, 74116, 100097, to_date('04-06-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101098, 76080, 100098, to_date('04-03-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101099, 76868, 100099, to_date('12-01-2015', 'dd-mm-yyyy'));
commit;
prompt 100 records committed...
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101100, 31853, 100100, to_date('05-01-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101101, 62079, 100101, to_date('16-04-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101102, 79053, 100102, to_date('03-12-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101103, 51033, 100103, to_date('18-02-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101104, 84179, 100104, to_date('03-11-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101105, 74225, 100105, to_date('14-06-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101106, 10363, 100106, to_date('05-11-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101107, 73125, 100107, to_date('24-01-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101108, 28992, 100108, to_date('23-05-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101109, 64745, 100109, to_date('06-03-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101110, 87673, 100110, to_date('12-09-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101111, 83679, 100111, to_date('25-05-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101112, 21804, 100112, to_date('10-09-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101113, 79753, 100113, to_date('03-04-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101114, 30740, 100114, to_date('03-09-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101115, 10280, 100115, to_date('05-07-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101116, 41793, 100116, to_date('18-10-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101117, 44071, 100117, to_date('29-04-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101118, 63617, 100118, to_date('29-04-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101119, 63963, 100119, to_date('14-01-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101120, 45198, 100120, to_date('25-04-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101121, 53601, 100121, to_date('13-04-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101122, 92720, 100122, to_date('03-03-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101123, 89428, 100123, to_date('20-12-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101124, 38618, 100124, to_date('11-09-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101125, 73017, 100125, to_date('10-12-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101126, 51642, 100126, to_date('12-01-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101127, 7156, 100127, to_date('18-07-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101128, 20227, 100128, to_date('16-03-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101129, 86757, 100129, to_date('20-09-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101130, 10958, 100130, to_date('20-04-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101131, 75957, 100131, to_date('26-05-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101132, 90427, 100132, to_date('23-05-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101133, 36109, 100133, to_date('18-08-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101134, 78767, 100134, to_date('04-12-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101135, 40725, 100135, to_date('10-07-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101136, 35144, 100136, to_date('31-01-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101137, 66759, 100137, to_date('29-10-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101138, 24871, 100138, to_date('10-02-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101139, 48415, 100139, to_date('17-02-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101140, 6013, 100140, to_date('04-02-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101141, 16901, 100141, to_date('10-04-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101142, 44657, 100142, to_date('29-08-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101143, 59852, 100143, to_date('10-03-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101144, 82560, 100144, to_date('22-01-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101145, 17642, 100145, to_date('14-05-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101146, 80795, 100146, to_date('05-06-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101147, 26913, 100147, to_date('13-04-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101148, 65802, 100148, to_date('24-11-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101149, 12643, 100149, to_date('17-01-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101150, 79740, 100150, to_date('17-09-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101151, 22472, 100151, to_date('03-04-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101152, 83939, 100152, to_date('29-06-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101153, 10903, 100153, to_date('11-07-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101154, 60432, 100154, to_date('28-09-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101155, 54554, 100155, to_date('25-07-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101156, 85744, 100156, to_date('31-07-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101157, 84757, 100157, to_date('23-06-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101158, 40657, 100158, to_date('08-06-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101159, 17578, 100159, to_date('13-09-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101160, 10745, 100160, to_date('28-07-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101161, 51891, 100161, to_date('29-08-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101162, 38665, 100162, to_date('05-08-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101163, 87537, 100163, to_date('26-12-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101164, 13524, 100164, to_date('19-10-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101165, 40367, 100165, to_date('18-01-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101166, 91526, 100166, to_date('03-07-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101167, 5971, 100167, to_date('15-03-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101168, 59791, 100168, to_date('23-09-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101169, 35057, 100169, to_date('03-03-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101170, 49202, 100170, to_date('19-05-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101171, 69160, 100171, to_date('23-11-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101172, 98319, 100172, to_date('18-08-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101173, 65199, 100173, to_date('07-09-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101174, 15826, 100174, to_date('31-05-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101175, 43573, 100175, to_date('19-10-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101176, 93861, 100176, to_date('03-05-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101177, 30725, 100177, to_date('25-02-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101178, 46340, 100178, to_date('19-09-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101179, 4097, 100179, to_date('13-09-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101180, 54154, 100180, to_date('06-02-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101181, 62422, 100181, to_date('10-12-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101182, 67789, 100182, to_date('14-04-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101183, 7403, 100183, to_date('30-11-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101184, 51581, 100184, to_date('20-12-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101185, 70322, 100185, to_date('09-02-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101186, 63878, 100186, to_date('09-05-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101187, 26069, 100187, to_date('13-03-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101188, 80720, 100188, to_date('16-03-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101189, 58069, 100189, to_date('19-11-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101190, 69376, 100190, to_date('20-12-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101191, 72658, 100191, to_date('16-04-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101192, 29484, 100192, to_date('04-04-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101193, 2666, 100193, to_date('31-01-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101194, 92811, 100194, to_date('08-07-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101195, 42358, 100195, to_date('17-10-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101196, 24442, 100196, to_date('23-10-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101197, 43432, 100197, to_date('24-08-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101198, 22756, 100198, to_date('30-04-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101199, 52404, 100199, to_date('19-06-2011', 'dd-mm-yyyy'));
commit;
prompt 200 records committed...
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101200, 52776, 100200, to_date('10-02-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101201, 1158, 100201, to_date('10-08-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101202, 51573, 100202, to_date('13-06-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101203, 97493, 100203, to_date('19-02-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101204, 8909, 100204, to_date('20-05-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101205, 51854, 100205, to_date('24-03-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101206, 2807, 100206, to_date('19-12-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101207, 3941, 100207, to_date('07-08-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101208, 30694, 100208, to_date('06-12-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101209, 58444, 100209, to_date('11-02-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101210, 27932, 100210, to_date('22-09-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101211, 53187, 100211, to_date('05-05-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101212, 37362, 100212, to_date('14-08-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101213, 7331, 100213, to_date('09-08-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101214, 63304, 100214, to_date('31-07-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101215, 18998, 100215, to_date('10-10-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101216, 78088, 100216, to_date('23-03-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101217, 46537, 100217, to_date('12-12-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101218, 98361, 100218, to_date('01-01-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101219, 72665, 100219, to_date('26-10-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101220, 66383, 100220, to_date('03-06-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101221, 79000, 100221, to_date('04-07-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101222, 28361, 100222, to_date('08-04-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101223, 19902, 100223, to_date('10-09-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101224, 89742, 100224, to_date('10-02-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101225, 28117, 100225, to_date('19-03-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101226, 38944, 100226, to_date('19-06-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101227, 40916, 100227, to_date('27-12-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101228, 54340, 100228, to_date('02-10-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101229, 35719, 100229, to_date('23-03-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101230, 3315, 100230, to_date('20-06-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101231, 83402, 100231, to_date('16-10-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101232, 17184, 100232, to_date('22-01-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101233, 74075, 100233, to_date('14-09-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101234, 84254, 100234, to_date('10-07-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101235, 42134, 100235, to_date('04-08-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101236, 43253, 100236, to_date('28-01-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101237, 93002, 100237, to_date('04-08-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101238, 52465, 100238, to_date('21-10-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101239, 99816, 100239, to_date('22-09-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101240, 72461, 100240, to_date('25-04-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101241, 53913, 100241, to_date('12-01-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101242, 13036, 100242, to_date('17-04-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101243, 98866, 100243, to_date('14-10-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101244, 61398, 100244, to_date('16-11-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101245, 38549, 100245, to_date('26-10-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101246, 25781, 100246, to_date('18-04-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101247, 81995, 100247, to_date('14-10-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101248, 34258, 100248, to_date('20-11-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101249, 47607, 100249, to_date('04-01-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101250, 72994, 100250, to_date('12-09-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101251, 67416, 100251, to_date('19-06-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101252, 66881, 100252, to_date('30-05-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101253, 40976, 100253, to_date('15-06-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101254, 94773, 100254, to_date('27-06-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101255, 15974, 100255, to_date('20-08-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101256, 49749, 100256, to_date('02-07-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101257, 12335, 100257, to_date('01-07-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101258, 89999, 100258, to_date('07-11-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101259, 84727, 100259, to_date('05-01-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101260, 74315, 100260, to_date('13-10-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101261, 57289, 100261, to_date('04-01-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101262, 87643, 100262, to_date('05-05-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101263, 64648, 100263, to_date('27-04-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101264, 84212, 100264, to_date('06-04-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101265, 53682, 100265, to_date('05-08-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101266, 61352, 100266, to_date('07-11-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101267, 28476, 100267, to_date('27-01-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101268, 89345, 100268, to_date('28-12-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101269, 52004, 100269, to_date('16-08-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101270, 73542, 100270, to_date('09-02-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101271, 96100, 100271, to_date('13-11-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101272, 6186, 100272, to_date('06-08-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101273, 88085, 100273, to_date('22-01-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101274, 3160, 100274, to_date('13-04-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101275, 89932, 100275, to_date('22-12-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101276, 76944, 100276, to_date('08-09-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101277, 84643, 100277, to_date('24-06-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101278, 65577, 100278, to_date('06-02-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101279, 55919, 100279, to_date('26-01-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101280, 17447, 100280, to_date('03-12-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101281, 87695, 100281, to_date('25-08-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101282, 72791, 100282, to_date('09-11-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101283, 52330, 100283, to_date('05-06-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101284, 80770, 100284, to_date('21-07-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101285, 93224, 100285, to_date('20-08-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101286, 10854, 100286, to_date('09-05-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101287, 7692, 100287, to_date('02-03-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101288, 40618, 100288, to_date('08-06-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101289, 93550, 100289, to_date('19-05-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101290, 39717, 100290, to_date('08-02-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101291, 96516, 100291, to_date('23-11-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101292, 19942, 100292, to_date('15-11-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101293, 88836, 100293, to_date('11-04-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101294, 88675, 100294, to_date('04-09-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101295, 36902, 100295, to_date('02-04-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101296, 47171, 100296, to_date('03-05-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101297, 80126, 100297, to_date('05-08-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101298, 62545, 100298, to_date('31-07-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101299, 34023, 100299, to_date('11-01-2011', 'dd-mm-yyyy'));
commit;
prompt 300 records committed...
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101300, 24729, 100300, to_date('05-04-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101301, 44336, 100301, to_date('28-02-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101302, 83056, 100302, to_date('31-03-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101303, 83183, 100303, to_date('13-01-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101304, 77295, 100304, to_date('25-02-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101305, 58646, 100305, to_date('07-11-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101306, 52299, 100306, to_date('28-10-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101307, 38143, 100307, to_date('04-11-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101308, 98241, 100308, to_date('16-11-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101309, 25062, 100309, to_date('15-01-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101310, 57190, 100310, to_date('25-08-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101311, 97937, 100311, to_date('27-03-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101312, 86365, 100312, to_date('21-02-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101313, 85084, 100313, to_date('29-12-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101314, 75955, 100314, to_date('05-02-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101315, 54738, 100315, to_date('18-11-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101316, 95168, 100316, to_date('31-08-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101317, 30547, 100317, to_date('16-03-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101318, 96133, 100318, to_date('26-09-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101319, 99587, 100319, to_date('05-07-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101320, 5175, 100320, to_date('11-12-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101321, 85685, 100321, to_date('17-03-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101322, 65821, 100322, to_date('01-11-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101323, 20549, 100323, to_date('08-04-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101324, 66985, 100324, to_date('30-08-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101325, 72167, 100325, to_date('13-10-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101326, 62794, 100326, to_date('08-05-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101327, 94717, 100327, to_date('03-01-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101328, 31420, 100328, to_date('18-05-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101329, 21665, 100329, to_date('18-08-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101330, 32563, 100330, to_date('01-12-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101331, 31082, 100331, to_date('02-12-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101332, 12138, 100332, to_date('20-06-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101333, 25358, 100333, to_date('14-05-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101334, 23274, 100334, to_date('03-11-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101335, 26528, 100335, to_date('10-11-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101336, 9376, 100336, to_date('11-12-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101337, 52233, 100337, to_date('02-08-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101338, 46809, 100338, to_date('23-10-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101339, 84244, 100339, to_date('14-06-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101340, 30861, 100340, to_date('18-07-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101341, 69756, 100341, to_date('15-11-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101342, 75956, 100342, to_date('18-03-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101343, 72299, 100343, to_date('16-02-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101344, 16109, 100344, to_date('04-08-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101345, 27696, 100345, to_date('02-07-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101346, 80116, 100346, to_date('25-01-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101347, 21995, 100347, to_date('07-05-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101348, 79499, 100348, to_date('15-04-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101349, 82584, 100349, to_date('13-04-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101350, 98065, 100350, to_date('20-06-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101351, 30881, 100351, to_date('14-10-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101352, 53753, 100352, to_date('22-10-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101353, 3528, 100353, to_date('30-06-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101354, 2510, 100354, to_date('09-08-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101355, 29874, 100355, to_date('14-11-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101356, 57001, 100356, to_date('10-03-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101357, 56671, 100357, to_date('26-08-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101358, 41940, 100358, to_date('22-03-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101359, 53956, 100359, to_date('03-05-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101360, 49402, 100360, to_date('07-05-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101361, 72445, 100361, to_date('25-11-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101362, 61555, 100362, to_date('05-02-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101363, 97197, 100363, to_date('24-08-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101364, 34716, 100364, to_date('18-09-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101365, 62314, 100365, to_date('29-09-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101366, 89197, 100366, to_date('28-06-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101367, 48222, 100367, to_date('06-09-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101368, 79820, 100368, to_date('06-09-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101369, 31329, 100369, to_date('12-04-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101370, 14724, 100370, to_date('09-02-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101371, 95689, 100371, to_date('16-04-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101372, 30723, 100372, to_date('19-12-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101373, 61889, 100373, to_date('15-02-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101374, 79758, 100374, to_date('02-03-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101375, 30631, 100375, to_date('28-10-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101376, 17033, 100376, to_date('17-08-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101377, 1551, 100377, to_date('13-03-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101378, 84508, 100378, to_date('11-01-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101379, 35426, 100379, to_date('10-04-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101380, 19176, 100380, to_date('26-12-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101381, 15436, 100381, to_date('25-08-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101382, 88781, 100382, to_date('30-10-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101383, 47236, 100383, to_date('18-04-2013', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101384, 92193, 100384, to_date('16-03-2015', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101385, 13362, 100385, to_date('25-03-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101386, 77570, 100386, to_date('07-09-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101387, 75818, 100387, to_date('13-11-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101388, 57100, 100388, to_date('04-05-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101389, 89142, 100389, to_date('20-04-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101390, 6980, 100390, to_date('25-08-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101391, 67321, 100391, to_date('30-06-2010', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101392, 24954, 100392, to_date('08-03-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101393, 36764, 100393, to_date('04-07-2012', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101394, 32284, 100394, to_date('20-07-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101395, 17524, 100395, to_date('06-11-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101396, 80227, 100396, to_date('26-09-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101397, 76535, 100397, to_date('29-08-2011', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101398, 81314, 100398, to_date('02-08-2014', 'dd-mm-yyyy'));
insert into LOANS (loanid, loanamount, customerid, loandate)
values (101399, 7108, 100399, to_date('14-07-2010', 'dd-mm-yyyy'));
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
prompt 400 records loaded
prompt Loading WORKERS...
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105000, 'Robert', 'Manager', 103000, 104000);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105001, 'Stacie', 'Officer', 103001, 104000);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105002, 'Jeffrey', 'Credit Analyst', 103002, 104000);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105003, 'Melissa', 'Loan Closer', 103003, 104000);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105004, 'Antonio', 'Manager', 103004, 104001);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105005, 'Michael', 'Officer', 103005, 104001);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105006, 'Taylor', 'Credit Analyst', 103006, 104001);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105007, 'Dennis', 'Loan Closer', 103007, 104001);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105008, 'Victor', 'Manager', 103008, 104002);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105009, 'Dylan', 'Officer', 103009, 104002);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105010, 'Michael', 'Credit Analyst', 103010, 104002);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105011, 'Matthew', 'Loan Closer', 103011, 104002);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105012, 'Amanda', 'Manager', 103012, 104003);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105013, 'Megan', 'Officer', 103013, 104003);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105014, 'Richard', 'Credit Analyst', 103014, 104003);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105015, 'Samantha', 'Loan Closer', 103015, 104003);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105016, 'Misty', 'Manager', 103016, 104004);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105017, 'Steven', 'Officer', 103017, 104004);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105018, 'Stephanie', 'Credit Analyst', 103018, 104004);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105019, 'Michael', 'Loan Closer', 103019, 104004);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105020, 'Thomas', 'Manager', 103020, 104005);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105021, 'Shannon', 'Officer', 103021, 104005);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105022, 'Mary', 'Credit Analyst', 103022, 104005);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105023, 'Rachel', 'Loan Closer', 103023, 104005);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105024, 'Danny', 'Manager', 103024, 104006);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105025, 'Kathryn', 'Officer', 103025, 104006);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105026, 'Ronald', 'Credit Analyst', 103026, 104006);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105027, 'Rebecca', 'Loan Closer', 103027, 104006);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105028, 'Alyssa', 'Manager', 103028, 104007);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105029, 'Lori', 'Officer', 103029, 104007);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105030, 'Alex', 'Credit Analyst', 103030, 104007);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105031, 'Willie', 'Loan Closer', 103031, 104007);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105032, 'Deborah', 'Manager', 103032, 104008);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105033, 'Jonathan', 'Officer', 103033, 104008);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105034, 'Megan', 'Credit Analyst', 103034, 104008);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105035, 'Terry', 'Loan Closer', 103035, 104008);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105036, 'Carrie', 'Manager', 103036, 104009);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105037, 'Carolyn', 'Officer', 103037, 104009);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105038, 'Alicia', 'Credit Analyst', 103038, 104009);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105039, 'Richard', 'Loan Closer', 103039, 104009);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105040, 'Joshua', 'Manager', 103040, 104010);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105041, 'Holly', 'Officer', 103041, 104010);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105042, 'Kathleen', 'Credit Analyst', 103042, 104010);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105043, 'Thomas', 'Loan Closer', 103043, 104010);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105044, 'Jeffrey', 'Manager', 103044, 104011);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105045, 'Jenny', 'Officer', 103045, 104011);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105046, 'Robert', 'Credit Analyst', 103046, 104011);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105047, 'Jose', 'Loan Closer', 103047, 104011);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105048, 'Cathy', 'Manager', 103048, 104012);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105049, 'Andrew', 'Officer', 103049, 104012);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105050, 'Brandon', 'Credit Analyst', 103050, 104012);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105051, 'Blake', 'Loan Closer', 103051, 104012);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105052, 'Claudia', 'Manager', 103052, 104013);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105053, 'Cheyenne', 'Officer', 103053, 104013);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105054, 'James', 'Credit Analyst', 103054, 104013);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105055, 'Ashlee', 'Loan Closer', 103055, 104013);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105056, 'Lisa', 'Manager', 103056, 104014);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105057, 'Shawn', 'Officer', 103057, 104014);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105058, 'Samuel', 'Credit Analyst', 103058, 104014);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105059, 'Mike', 'Loan Closer', 103059, 104014);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105060, 'Savannah', 'Manager', 103060, 104015);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105061, 'Sarah', 'Officer', 103061, 104015);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105062, 'Elizabeth', 'Credit Analyst', 103062, 104015);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105063, 'Vicki', 'Loan Closer', 103063, 104015);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105064, 'Joseph', 'Manager', 103064, 104016);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105065, 'Richard', 'Officer', 103065, 104016);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105066, 'Madison', 'Credit Analyst', 103066, 104016);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105067, 'Ronald', 'Loan Closer', 103067, 104016);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105068, 'Kathleen', 'Manager', 103068, 104017);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105069, 'Stacey', 'Officer', 103069, 104017);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105070, 'John', 'Credit Analyst', 103070, 104017);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105071, 'Beverly', 'Loan Closer', 103071, 104017);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105072, 'Joseph', 'Manager', 103072, 104018);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105073, 'Andrew', 'Officer', 103073, 104018);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105074, 'Daniel', 'Credit Analyst', 103074, 104018);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105075, 'Michael', 'Loan Closer', 103075, 104018);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105076, 'Chase', 'Manager', 103076, 104019);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105077, 'Michael', 'Officer', 103077, 104019);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105078, 'Wanda', 'Credit Analyst', 103078, 104019);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105079, 'Charles', 'Loan Closer', 103079, 104019);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105080, 'Jesse', 'Manager', 103080, 104020);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105081, 'Christopher', 'Officer', 103081, 104020);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105082, 'Nancy', 'Credit Analyst', 103082, 104020);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105083, 'Michael', 'Loan Closer', 103083, 104020);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105084, 'James', 'Manager', 103084, 104021);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105085, 'Brad', 'Officer', 103085, 104021);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105086, 'Jonathan', 'Credit Analyst', 103086, 104021);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105087, 'Robert', 'Loan Closer', 103087, 104021);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105088, 'Brad', 'Manager', 103088, 104022);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105089, 'Pamela', 'Officer', 103089, 104022);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105090, 'Cameron', 'Credit Analyst', 103090, 104022);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105091, 'Eric', 'Loan Closer', 103091, 104022);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105092, 'Micheal', 'Manager', 103092, 104023);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105093, 'Hannah', 'Officer', 103093, 104023);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105094, 'Patrick', 'Credit Analyst', 103094, 104023);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105095, 'David', 'Loan Closer', 103095, 104023);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105096, 'Lee', 'Manager', 103096, 104024);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105097, 'Diane', 'Officer', 103097, 104024);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105098, 'Laura', 'Credit Analyst', 103098, 104024);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105099, 'Randy', 'Loan Closer', 103099, 104024);
commit;
prompt 100 records committed...
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105100, 'Joshua', 'Manager', 103100, 104025);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105101, 'David', 'Officer', 103101, 104025);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105102, 'Ronald', 'Credit Analyst', 103102, 104025);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105103, 'Michael', 'Loan Closer', 103103, 104025);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105104, 'Carol', 'Manager', 103104, 104026);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105105, 'Jessica', 'Officer', 103105, 104026);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105106, 'Anna', 'Credit Analyst', 103106, 104026);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105107, 'Victoria', 'Loan Closer', 103107, 104026);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105108, 'Carol', 'Manager', 103108, 104027);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105109, 'William', 'Officer', 103109, 104027);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105110, 'Dwayne', 'Credit Analyst', 103110, 104027);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105111, 'Megan', 'Loan Closer', 103111, 104027);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105112, 'Glenn', 'Manager', 103112, 104028);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105113, 'Robert', 'Officer', 103113, 104028);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105114, 'Barbara', 'Credit Analyst', 103114, 104028);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105115, 'Ryan', 'Loan Closer', 103115, 104028);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105116, 'Tyler', 'Manager', 103116, 104029);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105117, 'Erica', 'Officer', 103117, 104029);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105118, 'Jonathan', 'Credit Analyst', 103118, 104029);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105119, 'Melissa', 'Loan Closer', 103119, 104029);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105120, 'Drew', 'Manager', 103120, 104030);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105121, 'Jane', 'Officer', 103121, 104030);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105122, 'Kelli', 'Credit Analyst', 103122, 104030);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105123, 'Cheryl', 'Loan Closer', 103123, 104030);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105124, 'Lori', 'Manager', 103124, 104031);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105125, 'Danielle', 'Officer', 103125, 104031);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105126, 'Tara', 'Credit Analyst', 103126, 104031);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105127, 'Michael', 'Loan Closer', 103127, 104031);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105128, 'Marcus', 'Manager', 103128, 104032);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105129, 'William', 'Officer', 103129, 104032);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105130, 'Jacqueline', 'Credit Analyst', 103130, 104032);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105131, 'Rebecca', 'Loan Closer', 103131, 104032);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105132, 'Christina', 'Manager', 103132, 104033);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105133, 'Erin', 'Officer', 103133, 104033);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105134, 'Nicole', 'Credit Analyst', 103134, 104033);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105135, 'Shelly', 'Loan Closer', 103135, 104033);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105136, 'Stacy', 'Manager', 103136, 104034);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105137, 'Amanda', 'Officer', 103137, 104034);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105138, 'Elizabeth', 'Credit Analyst', 103138, 104034);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105139, 'Francisco', 'Loan Closer', 103139, 104034);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105140, 'Victoria', 'Manager', 103140, 104035);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105141, 'Brian', 'Officer', 103141, 104035);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105142, 'Krista', 'Credit Analyst', 103142, 104035);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105143, 'Jennifer', 'Loan Closer', 103143, 104035);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105144, 'Roberto', 'Manager', 103144, 104036);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105145, 'Yolanda', 'Officer', 103145, 104036);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105146, 'John', 'Credit Analyst', 103146, 104036);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105147, 'Brendan', 'Loan Closer', 103147, 104036);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105148, 'Malik', 'Manager', 103148, 104037);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105149, 'Jason', 'Officer', 103149, 104037);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105150, 'Jacob', 'Credit Analyst', 103150, 104037);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105151, 'Kevin', 'Loan Closer', 103151, 104037);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105152, 'Michael', 'Manager', 103152, 104038);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105153, 'Sarah', 'Officer', 103153, 104038);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105154, 'Theresa', 'Credit Analyst', 103154, 104038);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105155, 'Jacqueline', 'Loan Closer', 103155, 104038);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105156, 'Lawrence', 'Manager', 103156, 104039);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105157, 'Oscar', 'Officer', 103157, 104039);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105158, 'Stephanie', 'Credit Analyst', 103158, 104039);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105159, 'Morgan', 'Loan Closer', 103159, 104039);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105160, 'Robin', 'Manager', 103160, 104040);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105161, 'Justin', 'Officer', 103161, 104040);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105162, 'Beth', 'Credit Analyst', 103162, 104040);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105163, 'Carrie', 'Loan Closer', 103163, 104040);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105164, 'Gina', 'Manager', 103164, 104041);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105165, 'Donald', 'Officer', 103165, 104041);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105166, 'Susan', 'Credit Analyst', 103166, 104041);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105167, 'Antonio', 'Loan Closer', 103167, 104041);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105168, 'Jonathan', 'Manager', 103168, 104042);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105169, 'Robin', 'Officer', 103169, 104042);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105170, 'Calvin', 'Credit Analyst', 103170, 104042);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105171, 'Jeremy', 'Loan Closer', 103171, 104042);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105172, 'Ryan', 'Manager', 103172, 104043);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105173, 'Andrew', 'Officer', 103173, 104043);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105174, 'Stephen', 'Credit Analyst', 103174, 104043);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105175, 'Aaron', 'Loan Closer', 103175, 104043);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105176, 'Jonathan', 'Manager', 103176, 104044);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105177, 'Christine', 'Officer', 103177, 104044);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105178, 'Sheila', 'Credit Analyst', 103178, 104044);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105179, 'Kimberly', 'Loan Closer', 103179, 104044);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105180, 'Ronald', 'Manager', 103180, 104045);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105181, 'Ashlee', 'Officer', 103181, 104045);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105182, 'Carla', 'Credit Analyst', 103182, 104045);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105183, 'Michaela', 'Loan Closer', 103183, 104045);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105184, 'Joseph', 'Manager', 103184, 104046);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105185, 'Rebekah', 'Officer', 103185, 104046);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105186, 'Deborah', 'Credit Analyst', 103186, 104046);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105187, 'James', 'Loan Closer', 103187, 104046);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105188, 'Todd', 'Manager', 103188, 104047);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105189, 'Melanie', 'Officer', 103189, 104047);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105190, 'Russell', 'Credit Analyst', 103190, 104047);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105191, 'Dominique', 'Loan Closer', 103191, 104047);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105192, 'Collin', 'Manager', 103192, 104048);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105193, 'Christopher', 'Officer', 103193, 104048);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105194, 'Justin', 'Credit Analyst', 103194, 104048);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105195, 'George', 'Loan Closer', 103195, 104048);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105196, 'Michelle', 'Manager', 103196, 104049);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105197, 'Deborah', 'Officer', 103197, 104049);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105198, 'Christopher', 'Credit Analyst', 103198, 104049);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105199, 'Ruth', 'Loan Closer', 103199, 104049);
commit;
prompt 200 records committed...
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105200, 'David', 'Manager', 103200, 104050);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105201, 'Anna', 'Officer', 103201, 104050);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105202, 'Julie', 'Credit Analyst', 103202, 104050);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105203, 'Garrett', 'Loan Closer', 103203, 104050);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105204, 'Timothy', 'Manager', 103204, 104051);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105205, 'Frederick', 'Officer', 103205, 104051);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105206, 'Kathleen', 'Credit Analyst', 103206, 104051);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105207, 'Ashley', 'Loan Closer', 103207, 104051);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105208, 'Derrick', 'Manager', 103208, 104052);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105209, 'Amy', 'Officer', 103209, 104052);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105210, 'Bradley', 'Credit Analyst', 103210, 104052);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105211, 'Kim', 'Loan Closer', 103211, 104052);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105212, 'Ricardo', 'Manager', 103212, 104053);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105213, 'Jason', 'Officer', 103213, 104053);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105214, 'Chad', 'Credit Analyst', 103214, 104053);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105215, 'Brian', 'Loan Closer', 103215, 104053);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105216, 'Sharon', 'Manager', 103216, 104054);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105217, 'Denise', 'Officer', 103217, 104054);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105218, 'Marco', 'Credit Analyst', 103218, 104054);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105219, 'Brian', 'Loan Closer', 103219, 104054);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105220, 'Darlene', 'Manager', 103220, 104055);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105221, 'Alexis', 'Officer', 103221, 104055);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105222, 'David', 'Credit Analyst', 103222, 104055);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105223, 'Robyn', 'Loan Closer', 103223, 104055);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105224, 'Jerry', 'Manager', 103224, 104056);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105225, 'Alicia', 'Officer', 103225, 104056);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105226, 'Joseph', 'Credit Analyst', 103226, 104056);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105227, 'Amanda', 'Loan Closer', 103227, 104056);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105228, 'Charles', 'Manager', 103228, 104057);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105229, 'John', 'Officer', 103229, 104057);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105230, 'Erica', 'Credit Analyst', 103230, 104057);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105231, 'Daniel', 'Loan Closer', 103231, 104057);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105232, 'Charlene', 'Manager', 103232, 104058);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105233, 'Alex', 'Officer', 103233, 104058);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105234, 'Jason', 'Credit Analyst', 103234, 104058);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105235, 'Kimberly', 'Loan Closer', 103235, 104058);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105236, 'Jeffrey', 'Manager', 103236, 104059);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105237, 'Thomas', 'Officer', 103237, 104059);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105238, 'Beth', 'Credit Analyst', 103238, 104059);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105239, 'Michaela', 'Loan Closer', 103239, 104059);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105240, 'Lori', 'Manager', 103240, 104060);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105241, 'David', 'Officer', 103241, 104060);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105242, 'Ryan', 'Credit Analyst', 103242, 104060);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105243, 'Eric', 'Loan Closer', 103243, 104060);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105244, 'Jasmine', 'Manager', 103244, 104061);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105245, 'Thomas', 'Officer', 103245, 104061);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105246, 'Hunter', 'Credit Analyst', 103246, 104061);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105247, 'David', 'Loan Closer', 103247, 104061);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105248, 'Tina', 'Manager', 103248, 104062);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105249, 'Crystal', 'Officer', 103249, 104062);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105250, 'Alexander', 'Credit Analyst', 103250, 104062);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105251, 'Susan', 'Loan Closer', 103251, 104062);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105252, 'Thomas', 'Manager', 103252, 104063);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105253, 'Michaela', 'Officer', 103253, 104063);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105254, 'Stephanie', 'Credit Analyst', 103254, 104063);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105255, 'Brittany', 'Loan Closer', 103255, 104063);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105256, 'Daniel', 'Manager', 103256, 104064);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105257, 'Elizabeth', 'Officer', 103257, 104064);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105258, 'Cindy', 'Credit Analyst', 103258, 104064);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105259, 'Crystal', 'Loan Closer', 103259, 104064);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105260, 'April', 'Manager', 103260, 104065);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105261, 'David', 'Officer', 103261, 104065);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105262, 'Corey', 'Credit Analyst', 103262, 104065);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105263, 'Charles', 'Loan Closer', 103263, 104065);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105264, 'Michael', 'Manager', 103264, 104066);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105265, 'Justin', 'Officer', 103265, 104066);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105266, 'Wanda', 'Credit Analyst', 103266, 104066);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105267, 'Donna', 'Loan Closer', 103267, 104066);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105268, 'Matthew', 'Manager', 103268, 104067);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105269, 'Kimberly', 'Officer', 103269, 104067);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105270, 'Brian', 'Credit Analyst', 103270, 104067);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105271, 'Deborah', 'Loan Closer', 103271, 104067);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105272, 'Kyle', 'Manager', 103272, 104068);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105273, 'Andrea', 'Officer', 103273, 104068);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105274, 'Lindsay', 'Credit Analyst', 103274, 104068);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105275, 'Randall', 'Loan Closer', 103275, 104068);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105276, 'David', 'Manager', 103276, 104069);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105277, 'Nicole', 'Officer', 103277, 104069);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105278, 'Tammy', 'Credit Analyst', 103278, 104069);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105279, 'Christina', 'Loan Closer', 103279, 104069);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105280, 'Joseph', 'Manager', 103280, 104070);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105281, 'Jillian', 'Officer', 103281, 104070);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105282, 'Scott', 'Credit Analyst', 103282, 104070);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105283, 'Robert', 'Loan Closer', 103283, 104070);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105284, 'James', 'Manager', 103284, 104071);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105285, 'Chad', 'Officer', 103285, 104071);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105286, 'Alicia', 'Credit Analyst', 103286, 104071);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105287, 'Mark', 'Loan Closer', 103287, 104071);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105288, 'Casey', 'Manager', 103288, 104072);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105289, 'Mary', 'Officer', 103289, 104072);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105290, 'Francisco', 'Credit Analyst', 103290, 104072);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105291, 'Ruth', 'Loan Closer', 103291, 104072);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105292, 'Jeremy', 'Manager', 103292, 104073);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105293, 'Andrea', 'Officer', 103293, 104073);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105294, 'Rebecca', 'Credit Analyst', 103294, 104073);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105295, 'Jill', 'Loan Closer', 103295, 104073);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105296, 'Amber', 'Manager', 103296, 104074);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105297, 'Mark', 'Officer', 103297, 104074);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105298, 'Mary', 'Credit Analyst', 103298, 104074);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105299, 'Ashlee', 'Loan Closer', 103299, 104074);
commit;
prompt 300 records committed...
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105300, 'Gregory', 'Manager', 103300, 104075);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105301, 'Carolyn', 'Officer', 103301, 104075);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105302, 'Bonnie', 'Credit Analyst', 103302, 104075);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105303, 'Alyssa', 'Loan Closer', 103303, 104075);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105304, 'Ralph', 'Manager', 103304, 104076);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105305, 'Sarah', 'Officer', 103305, 104076);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105306, 'Jessica', 'Credit Analyst', 103306, 104076);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105307, 'Hayden', 'Loan Closer', 103307, 104076);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105308, 'Cody', 'Manager', 103308, 104077);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105309, 'Christine', 'Officer', 103309, 104077);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105310, 'Alison', 'Credit Analyst', 103310, 104077);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105311, 'Laura', 'Loan Closer', 103311, 104077);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105312, 'Larry', 'Manager', 103312, 104078);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105313, 'Preston', 'Officer', 103313, 104078);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105314, 'Leah', 'Credit Analyst', 103314, 104078);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105315, 'Allen', 'Loan Closer', 103315, 104078);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105316, 'Chad', 'Manager', 103316, 104079);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105317, 'Caitlin', 'Officer', 103317, 104079);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105318, 'Lauren', 'Credit Analyst', 103318, 104079);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105319, 'Dylan', 'Loan Closer', 103319, 104079);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105320, 'Kelsey', 'Manager', 103320, 104080);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105321, 'Tina', 'Officer', 103321, 104080);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105322, 'Justin', 'Credit Analyst', 103322, 104080);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105323, 'Brittany', 'Loan Closer', 103323, 104080);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105324, 'Susan', 'Manager', 103324, 104081);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105325, 'Samantha', 'Officer', 103325, 104081);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105326, 'Andrew', 'Credit Analyst', 103326, 104081);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105327, 'Maria', 'Loan Closer', 103327, 104081);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105328, 'Lindsey', 'Manager', 103328, 104082);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105329, 'Anna', 'Officer', 103329, 104082);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105330, 'Billy', 'Credit Analyst', 103330, 104082);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105331, 'Lisa', 'Loan Closer', 103331, 104082);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105332, 'Andrew', 'Manager', 103332, 104083);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105333, 'James', 'Officer', 103333, 104083);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105334, 'Ruben', 'Credit Analyst', 103334, 104083);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105335, 'Stephanie', 'Loan Closer', 103335, 104083);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105336, 'Erica', 'Manager', 103336, 104084);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105337, 'Christine', 'Officer', 103337, 104084);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105338, 'Mary', 'Credit Analyst', 103338, 104084);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105339, 'Joshua', 'Loan Closer', 103339, 104084);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105340, 'Alexander', 'Manager', 103340, 104085);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105341, 'Michael', 'Officer', 103341, 104085);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105342, 'Adam', 'Credit Analyst', 103342, 104085);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105343, 'Stephen', 'Loan Closer', 103343, 104085);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105344, 'Julie', 'Manager', 103344, 104086);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105345, 'Jennifer', 'Officer', 103345, 104086);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105346, 'Barbara', 'Credit Analyst', 103346, 104086);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105347, 'Robert', 'Loan Closer', 103347, 104086);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105348, 'Ryan', 'Manager', 103348, 104087);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105349, 'Garrett', 'Officer', 103349, 104087);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105350, 'Hannah', 'Credit Analyst', 103350, 104087);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105351, 'Ruth', 'Loan Closer', 103351, 104087);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105352, 'Louis', 'Manager', 103352, 104088);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105353, 'Amy', 'Officer', 103353, 104088);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105354, 'Erin', 'Credit Analyst', 103354, 104088);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105355, 'Ashley', 'Loan Closer', 103355, 104088);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105356, 'Patricia', 'Manager', 103356, 104089);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105357, 'Karen', 'Officer', 103357, 104089);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105358, 'Lori', 'Credit Analyst', 103358, 104089);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105359, 'Joe', 'Loan Closer', 103359, 104089);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105360, 'Alyssa', 'Manager', 103360, 104090);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105361, 'David', 'Officer', 103361, 104090);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105362, 'Heather', 'Credit Analyst', 103362, 104090);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105363, 'David', 'Loan Closer', 103363, 104090);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105364, 'Cynthia', 'Manager', 103364, 104091);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105365, 'Nicole', 'Officer', 103365, 104091);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105366, 'Jeffrey', 'Credit Analyst', 103366, 104091);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105367, 'Kim', 'Loan Closer', 103367, 104091);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105368, 'Kevin', 'Manager', 103368, 104092);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105369, 'Kristy', 'Officer', 103369, 104092);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105370, 'Monica', 'Credit Analyst', 103370, 104092);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105371, 'Mark', 'Loan Closer', 103371, 104092);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105372, 'Austin', 'Manager', 103372, 104093);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105373, 'Mark', 'Officer', 103373, 104093);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105374, 'Victoria', 'Credit Analyst', 103374, 104093);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105375, 'Robert', 'Loan Closer', 103375, 104093);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105376, 'Drew', 'Manager', 103376, 104094);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105377, 'Grant', 'Officer', 103377, 104094);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105378, 'Laurie', 'Credit Analyst', 103378, 104094);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105379, 'Robert', 'Loan Closer', 103379, 104094);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105380, 'Randall', 'Manager', 103380, 104095);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105381, 'Joel', 'Officer', 103381, 104095);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105382, 'Darlene', 'Credit Analyst', 103382, 104095);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105383, 'Lisa', 'Loan Closer', 103383, 104095);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105384, 'Lauren', 'Manager', 103384, 104096);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105385, 'Christine', 'Officer', 103385, 104096);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105386, 'Mary', 'Credit Analyst', 103386, 104096);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105387, 'Angela', 'Loan Closer', 103387, 104096);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105388, 'Patty', 'Manager', 103388, 104097);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105389, 'Scott', 'Officer', 103389, 104097);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105390, 'Pamela', 'Credit Analyst', 103390, 104097);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105391, 'Tommy', 'Loan Closer', 103391, 104097);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105392, 'Cheryl', 'Manager', 103392, 104098);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105393, 'Edgar', 'Officer', 103393, 104098);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105394, 'Barbara', 'Credit Analyst', 103394, 104098);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105395, 'Jennifer', 'Loan Closer', 103395, 104098);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105396, 'Drew', 'Manager', 103396, 104099);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105397, 'Pamela', 'Officer', 103397, 104099);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105398, 'Daniel', 'Credit Analyst', 103398, 104099);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105399, 'James', 'Loan Closer', 103399, 104099);
commit;
prompt 400 records committed...
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105400, 'Jonathon', 'Manager', 103000, 104100);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105401, 'Lisa', 'Officer', 103001, 104100);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105402, 'Roger', 'Credit Analyst', 103002, 104100);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105403, 'Thomas', 'Loan Closer', 103003, 104100);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105404, 'Steven', 'Manager', 103004, 104101);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105405, 'Patricia', 'Officer', 103005, 104101);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105406, 'Bryce', 'Credit Analyst', 103006, 104101);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105407, 'Sara', 'Loan Closer', 103007, 104101);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105408, 'John', 'Manager', 103008, 104102);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105409, 'Jason', 'Officer', 103009, 104102);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105410, 'Melanie', 'Credit Analyst', 103010, 104102);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105411, 'Morgan', 'Loan Closer', 103011, 104102);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105412, 'Bradley', 'Manager', 103012, 104103);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105413, 'Sheila', 'Officer', 103013, 104103);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105414, 'Megan', 'Credit Analyst', 103014, 104103);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105415, 'Leah', 'Loan Closer', 103015, 104103);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105416, 'Garrett', 'Manager', 103016, 104104);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105417, 'Zachary', 'Officer', 103017, 104104);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105418, 'Monica', 'Credit Analyst', 103018, 104104);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105419, 'Megan', 'Loan Closer', 103019, 104104);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105420, 'Emily', 'Manager', 103020, 104105);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105421, 'David', 'Officer', 103021, 104105);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105422, 'William', 'Credit Analyst', 103022, 104105);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105423, 'Austin', 'Loan Closer', 103023, 104105);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105424, 'Tracy', 'Manager', 103024, 104106);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105425, 'Brenda', 'Officer', 103025, 104106);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105426, 'Monica', 'Credit Analyst', 103026, 104106);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105427, 'Jeffrey', 'Loan Closer', 103027, 104106);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105428, 'Thomas', 'Manager', 103028, 104107);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105429, 'Mary', 'Officer', 103029, 104107);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105430, 'Dana', 'Credit Analyst', 103030, 104107);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105431, 'Amber', 'Loan Closer', 103031, 104107);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105432, 'Robert', 'Manager', 103032, 104108);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105433, 'Kristi', 'Officer', 103033, 104108);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105434, 'Cole', 'Credit Analyst', 103034, 104108);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105435, 'Nicholas', 'Loan Closer', 103035, 104108);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105436, 'Lisa', 'Manager', 103036, 104109);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105437, 'Kathleen', 'Officer', 103037, 104109);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105438, 'Ryan', 'Credit Analyst', 103038, 104109);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105439, 'Nathaniel', 'Loan Closer', 103039, 104109);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105440, 'Amy', 'Manager', 103040, 104110);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105441, 'Yvonne', 'Officer', 103041, 104110);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105442, 'Michael', 'Credit Analyst', 103042, 104110);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105443, 'Curtis', 'Loan Closer', 103043, 104110);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105444, 'Grant', 'Manager', 103044, 104111);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105445, 'Trevor', 'Officer', 103045, 104111);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105446, 'Samantha', 'Credit Analyst', 103046, 104111);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105447, 'Mark', 'Loan Closer', 103047, 104111);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105448, 'Zachary', 'Manager', 103048, 104112);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105449, 'Erica', 'Officer', 103049, 104112);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105450, 'Karen', 'Credit Analyst', 103050, 104112);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105451, 'Tina', 'Loan Closer', 103051, 104112);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105452, 'Teresa', 'Manager', 103052, 104113);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105453, 'Isaac', 'Officer', 103053, 104113);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105454, 'Anthony', 'Credit Analyst', 103054, 104113);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105455, 'Andres', 'Loan Closer', 103055, 104113);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105456, 'Ralph', 'Manager', 103056, 104114);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105457, 'Matthew', 'Officer', 103057, 104114);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105458, 'Paul', 'Credit Analyst', 103058, 104114);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105459, 'Melissa', 'Loan Closer', 103059, 104114);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105460, 'Jennifer', 'Manager', 103060, 104115);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105461, 'Abigail', 'Officer', 103061, 104115);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105462, 'Jennifer', 'Credit Analyst', 103062, 104115);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105463, 'Andrea', 'Loan Closer', 103063, 104115);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105464, 'Patricia', 'Manager', 103064, 104116);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105465, 'Annette', 'Officer', 103065, 104116);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105466, 'Jonathan', 'Credit Analyst', 103066, 104116);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105467, 'Valerie', 'Loan Closer', 103067, 104116);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105468, 'Kimberly', 'Manager', 103068, 104117);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105469, 'John', 'Officer', 103069, 104117);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105470, 'Patricia', 'Credit Analyst', 103070, 104117);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105471, 'Michael', 'Loan Closer', 103071, 104117);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105472, 'Colin', 'Manager', 103072, 104118);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105473, 'Craig', 'Officer', 103073, 104118);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105474, 'Jeremy', 'Credit Analyst', 103074, 104118);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105475, 'Lee', 'Loan Closer', 103075, 104118);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105476, 'Kurt', 'Manager', 103076, 104119);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105477, 'Cody', 'Officer', 103077, 104119);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105478, 'Rebecca', 'Credit Analyst', 103078, 104119);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105479, 'Veronica', 'Loan Closer', 103079, 104119);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105480, 'Rachel', 'Manager', 103080, 104120);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105481, 'Jeffrey', 'Officer', 103081, 104120);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105482, 'Tammy', 'Credit Analyst', 103082, 104120);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105483, 'Kara', 'Loan Closer', 103083, 104120);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105484, 'Christopher', 'Manager', 103084, 104121);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105485, 'Jacob', 'Officer', 103085, 104121);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105486, 'Evelyn', 'Credit Analyst', 103086, 104121);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105487, 'Jonathan', 'Loan Closer', 103087, 104121);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105488, 'John', 'Manager', 103088, 104122);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105489, 'Paul', 'Officer', 103089, 104122);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105490, 'Tanya', 'Credit Analyst', 103090, 104122);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105491, 'Benjamin', 'Loan Closer', 103091, 104122);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105492, 'Willie', 'Manager', 103092, 104123);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105493, 'Charles', 'Officer', 103093, 104123);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105494, 'Mark', 'Credit Analyst', 103094, 104123);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105495, 'Matthew', 'Loan Closer', 103095, 104123);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105496, 'Stephanie', 'Manager', 103096, 104124);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105497, 'Yolanda', 'Officer', 103097, 104124);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105498, 'Megan', 'Credit Analyst', 103098, 104124);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105499, 'Karen', 'Loan Closer', 103099, 104124);
commit;
prompt 500 records committed...
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105500, 'Kevin', 'Manager', 103100, 104125);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105501, 'Chris', 'Officer', 103101, 104125);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105502, 'Mario', 'Credit Analyst', 103102, 104125);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105503, 'James', 'Loan Closer', 103103, 104125);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105504, 'Emily', 'Manager', 103104, 104126);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105505, 'Michael', 'Officer', 103105, 104126);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105506, 'Hunter', 'Credit Analyst', 103106, 104126);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105507, 'Martin', 'Loan Closer', 103107, 104126);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105508, 'Todd', 'Manager', 103108, 104127);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105509, 'Shannon', 'Officer', 103109, 104127);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105510, 'Sarah', 'Credit Analyst', 103110, 104127);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105511, 'Laura', 'Loan Closer', 103111, 104127);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105512, 'Ashley', 'Manager', 103112, 104128);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105513, 'Sherry', 'Officer', 103113, 104128);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105514, 'Michelle', 'Credit Analyst', 103114, 104128);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105515, 'Justin', 'Loan Closer', 103115, 104128);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105516, 'Heather', 'Manager', 103116, 104129);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105517, 'Xavier', 'Officer', 103117, 104129);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105518, 'Cody', 'Credit Analyst', 103118, 104129);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105519, 'Evelyn', 'Loan Closer', 103119, 104129);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105520, 'Trevor', 'Manager', 103120, 104130);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105521, 'Amber', 'Officer', 103121, 104130);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105522, 'Lisa', 'Credit Analyst', 103122, 104130);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105523, 'Virginia', 'Loan Closer', 103123, 104130);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105524, 'Michael', 'Manager', 103124, 104131);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105525, 'Katherine', 'Officer', 103125, 104131);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105526, 'Joseph', 'Credit Analyst', 103126, 104131);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105527, 'Jonathan', 'Loan Closer', 103127, 104131);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105528, 'Drew', 'Manager', 103128, 104132);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105529, 'Adam', 'Officer', 103129, 104132);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105530, 'Kirk', 'Credit Analyst', 103130, 104132);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105531, 'Jessica', 'Loan Closer', 103131, 104132);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105532, 'Samuel', 'Manager', 103132, 104133);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105533, 'Michael', 'Officer', 103133, 104133);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105534, 'Amanda', 'Credit Analyst', 103134, 104133);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105535, 'Roger', 'Loan Closer', 103135, 104133);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105536, 'Dylan', 'Manager', 103136, 104134);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105537, 'Kimberly', 'Officer', 103137, 104134);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105538, 'Mark', 'Credit Analyst', 103138, 104134);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105539, 'Sara', 'Loan Closer', 103139, 104134);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105540, 'Joshua', 'Manager', 103140, 104135);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105541, 'Kevin', 'Officer', 103141, 104135);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105542, 'John', 'Credit Analyst', 103142, 104135);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105543, 'Richard', 'Loan Closer', 103143, 104135);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105544, 'Misty', 'Manager', 103144, 104136);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105545, 'Lisa', 'Officer', 103145, 104136);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105546, 'Thomas', 'Credit Analyst', 103146, 104136);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105547, 'Daniel', 'Loan Closer', 103147, 104136);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105548, 'Amber', 'Manager', 103148, 104137);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105549, 'Erin', 'Officer', 103149, 104137);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105550, 'John', 'Credit Analyst', 103150, 104137);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105551, 'Shawn', 'Loan Closer', 103151, 104137);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105552, 'Thomas', 'Manager', 103152, 104138);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105553, 'Denise', 'Officer', 103153, 104138);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105554, 'Melissa', 'Credit Analyst', 103154, 104138);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105555, 'Bruce', 'Loan Closer', 103155, 104138);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105556, 'Joseph', 'Manager', 103156, 104139);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105557, 'Stephanie', 'Officer', 103157, 104139);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105558, 'Sarah', 'Credit Analyst', 103158, 104139);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105559, 'Pamela', 'Loan Closer', 103159, 104139);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105560, 'Adrian', 'Manager', 103160, 104140);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105561, 'Martin', 'Officer', 103161, 104140);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105562, 'Erik', 'Credit Analyst', 103162, 104140);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105563, 'Lisa', 'Loan Closer', 103163, 104140);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105564, 'Zachary', 'Manager', 103164, 104141);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105565, 'Amanda', 'Officer', 103165, 104141);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105566, 'Amanda', 'Credit Analyst', 103166, 104141);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105567, 'Austin', 'Loan Closer', 103167, 104141);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105568, 'Nicholas', 'Manager', 103168, 104142);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105569, 'Joel', 'Officer', 103169, 104142);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105570, 'Morgan', 'Credit Analyst', 103170, 104142);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105571, 'Gina', 'Loan Closer', 103171, 104142);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105572, 'Danny', 'Manager', 103172, 104143);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105573, 'John', 'Officer', 103173, 104143);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105574, 'Madison', 'Credit Analyst', 103174, 104143);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105575, 'Dustin', 'Loan Closer', 103175, 104143);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105576, 'Melissa', 'Manager', 103176, 104144);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105577, 'Shaun', 'Officer', 103177, 104144);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105578, 'Carrie', 'Credit Analyst', 103178, 104144);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105579, 'Eduardo', 'Loan Closer', 103179, 104144);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105580, 'Dale', 'Manager', 103180, 104145);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105581, 'Karen', 'Officer', 103181, 104145);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105582, 'Jamie', 'Credit Analyst', 103182, 104145);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105583, 'Amanda', 'Loan Closer', 103183, 104145);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105584, 'John', 'Manager', 103184, 104146);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105585, 'Brooke', 'Officer', 103185, 104146);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105586, 'Christopher', 'Credit Analyst', 103186, 104146);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105587, 'Jennifer', 'Loan Closer', 103187, 104146);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105588, 'Grace', 'Manager', 103188, 104147);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105589, 'Devon', 'Officer', 103189, 104147);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105590, 'Jeremiah', 'Credit Analyst', 103190, 104147);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105591, 'Michael', 'Loan Closer', 103191, 104147);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105592, 'Mitchell', 'Manager', 103192, 104148);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105593, 'Carla', 'Officer', 103193, 104148);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105594, 'Jeffrey', 'Credit Analyst', 103194, 104148);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105595, 'Ethan', 'Loan Closer', 103195, 104148);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105596, 'Alexandra', 'Manager', 103196, 104149);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105597, 'Nicole', 'Officer', 103197, 104149);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105598, 'Stephen', 'Credit Analyst', 103198, 104149);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105599, 'Steven', 'Loan Closer', 103199, 104149);
commit;
prompt 600 records committed...
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105600, 'Christina', 'Manager', 103200, 104150);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105601, 'Jason', 'Officer', 103201, 104150);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105602, 'Valerie', 'Credit Analyst', 103202, 104150);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105603, 'Stephanie', 'Loan Closer', 103203, 104150);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105604, 'Jennifer', 'Manager', 103204, 104151);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105605, 'Lori', 'Officer', 103205, 104151);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105606, 'Jeremy', 'Credit Analyst', 103206, 104151);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105607, 'Nathan', 'Loan Closer', 103207, 104151);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105608, 'Joshua', 'Manager', 103208, 104152);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105609, 'Rachel', 'Officer', 103209, 104152);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105610, 'Cheryl', 'Credit Analyst', 103210, 104152);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105611, 'Stacie', 'Loan Closer', 103211, 104152);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105612, 'Emily', 'Manager', 103212, 104153);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105613, 'William', 'Officer', 103213, 104153);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105614, 'Joel', 'Credit Analyst', 103214, 104153);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105615, 'Jennifer', 'Loan Closer', 103215, 104153);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105616, 'Benjamin', 'Manager', 103216, 104154);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105617, 'Shelley', 'Officer', 103217, 104154);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105618, 'Scott', 'Credit Analyst', 103218, 104154);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105619, 'Michelle', 'Loan Closer', 103219, 104154);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105620, 'Joan', 'Manager', 103220, 104155);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105621, 'Ralph', 'Officer', 103221, 104155);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105622, 'Donna', 'Credit Analyst', 103222, 104155);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105623, 'Brandon', 'Loan Closer', 103223, 104155);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105624, 'Tracy', 'Manager', 103224, 104156);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105625, 'Christine', 'Officer', 103225, 104156);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105626, 'Sierra', 'Credit Analyst', 103226, 104156);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105627, 'Alexis', 'Loan Closer', 103227, 104156);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105628, 'Janice', 'Manager', 103228, 104157);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105629, 'Alexander', 'Officer', 103229, 104157);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105630, 'Nicole', 'Credit Analyst', 103230, 104157);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105631, 'Jeffrey', 'Loan Closer', 103231, 104157);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105632, 'Timothy', 'Manager', 103232, 104158);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105633, 'Karl', 'Officer', 103233, 104158);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105634, 'Elizabeth', 'Credit Analyst', 103234, 104158);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105635, 'James', 'Loan Closer', 103235, 104158);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105636, 'Justin', 'Manager', 103236, 104159);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105637, 'Patricia', 'Officer', 103237, 104159);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105638, 'David', 'Credit Analyst', 103238, 104159);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105639, 'Martha', 'Loan Closer', 103239, 104159);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105640, 'John', 'Manager', 103240, 104160);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105641, 'Sandra', 'Officer', 103241, 104160);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105642, 'Timothy', 'Credit Analyst', 103242, 104160);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105643, 'Taylor', 'Loan Closer', 103243, 104160);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105644, 'John', 'Manager', 103244, 104161);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105645, 'Melvin', 'Officer', 103245, 104161);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105646, 'Willie', 'Credit Analyst', 103246, 104161);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105647, 'Vanessa', 'Loan Closer', 103247, 104161);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105648, 'Lori', 'Manager', 103248, 104162);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105649, 'Sara', 'Officer', 103249, 104162);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105650, 'Christine', 'Credit Analyst', 103250, 104162);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105651, 'Frank', 'Loan Closer', 103251, 104162);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105652, 'Raymond', 'Manager', 103252, 104163);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105653, 'Mark', 'Officer', 103253, 104163);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105654, 'David', 'Credit Analyst', 103254, 104163);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105655, 'Briana', 'Loan Closer', 103255, 104163);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105656, 'Christopher', 'Manager', 103256, 104164);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105657, 'Susan', 'Officer', 103257, 104164);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105658, 'April', 'Credit Analyst', 103258, 104164);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105659, 'Victor', 'Loan Closer', 103259, 104164);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105660, 'Sara', 'Manager', 103260, 104165);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105661, 'Cheyenne', 'Officer', 103261, 104165);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105662, 'Edward', 'Credit Analyst', 103262, 104165);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105663, 'Curtis', 'Loan Closer', 103263, 104165);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105664, 'Melanie', 'Manager', 103264, 104166);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105665, 'Michelle', 'Officer', 103265, 104166);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105666, 'Glenda', 'Credit Analyst', 103266, 104166);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105667, 'Brian', 'Loan Closer', 103267, 104166);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105668, 'Connie', 'Manager', 103268, 104167);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105669, 'Brenda', 'Officer', 103269, 104167);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105670, 'Wendy', 'Credit Analyst', 103270, 104167);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105671, 'Ashley', 'Loan Closer', 103271, 104167);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105672, 'Chad', 'Manager', 103272, 104168);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105673, 'Bradley', 'Officer', 103273, 104168);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105674, 'Jesse', 'Credit Analyst', 103274, 104168);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105675, 'Chelsea', 'Loan Closer', 103275, 104168);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105676, 'Thomas', 'Manager', 103276, 104169);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105677, 'Doris', 'Officer', 103277, 104169);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105678, 'Kristen', 'Credit Analyst', 103278, 104169);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105679, 'Jessica', 'Loan Closer', 103279, 104169);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105680, 'Stephanie', 'Manager', 103280, 104170);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105681, 'Theresa', 'Officer', 103281, 104170);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105682, 'Robert', 'Credit Analyst', 103282, 104170);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105683, 'Savannah', 'Loan Closer', 103283, 104170);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105684, 'Thomas', 'Manager', 103284, 104171);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105685, 'Zachary', 'Officer', 103285, 104171);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105686, 'Christopher', 'Credit Analyst', 103286, 104171);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105687, 'Brian', 'Loan Closer', 103287, 104171);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105688, 'Jennifer', 'Manager', 103288, 104172);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105689, 'Ryan', 'Officer', 103289, 104172);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105690, 'Amanda', 'Credit Analyst', 103290, 104172);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105691, 'Mary', 'Loan Closer', 103291, 104172);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105692, 'Cynthia', 'Manager', 103292, 104173);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105693, 'Samantha', 'Officer', 103293, 104173);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105694, 'John', 'Credit Analyst', 103294, 104173);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105695, 'Shane', 'Loan Closer', 103295, 104173);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105696, 'Melanie', 'Manager', 103296, 104174);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105697, 'Ethan', 'Officer', 103297, 104174);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105698, 'Jeffrey', 'Credit Analyst', 103298, 104174);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105699, 'Michael', 'Loan Closer', 103299, 104174);
commit;
prompt 700 records committed...
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105700, 'Jonathan', 'Manager', 103300, 104175);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105701, 'Benjamin', 'Officer', 103301, 104175);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105702, 'Rebecca', 'Credit Analyst', 103302, 104175);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105703, 'Kristina', 'Loan Closer', 103303, 104175);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105704, 'Christopher', 'Manager', 103304, 104176);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105705, 'Jonathan', 'Officer', 103305, 104176);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105706, 'Melanie', 'Credit Analyst', 103306, 104176);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105707, 'Carmen', 'Loan Closer', 103307, 104176);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105708, 'Jonathan', 'Manager', 103308, 104177);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105709, 'Jeffrey', 'Officer', 103309, 104177);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105710, 'Megan', 'Credit Analyst', 103310, 104177);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105711, 'Mary', 'Loan Closer', 103311, 104177);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105712, 'Brandy', 'Manager', 103312, 104178);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105713, 'Richard', 'Officer', 103313, 104178);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105714, 'Charles', 'Credit Analyst', 103314, 104178);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105715, 'Sandra', 'Loan Closer', 103315, 104178);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105716, 'James', 'Manager', 103316, 104179);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105717, 'Drew', 'Officer', 103317, 104179);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105718, 'Andrea', 'Credit Analyst', 103318, 104179);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105719, 'William', 'Loan Closer', 103319, 104179);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105720, 'George', 'Manager', 103320, 104180);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105721, 'Brandon', 'Officer', 103321, 104180);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105722, 'Christine', 'Credit Analyst', 103322, 104180);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105723, 'Benjamin', 'Loan Closer', 103323, 104180);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105724, 'Shelley', 'Manager', 103324, 104181);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105725, 'Heather', 'Officer', 103325, 104181);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105726, 'Matthew', 'Credit Analyst', 103326, 104181);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105727, 'Heather', 'Loan Closer', 103327, 104181);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105728, 'Robert', 'Manager', 103328, 104182);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105729, 'Tina', 'Officer', 103329, 104182);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105730, 'John', 'Credit Analyst', 103330, 104182);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105731, 'Megan', 'Loan Closer', 103331, 104182);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105732, 'Mary', 'Manager', 103332, 104183);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105733, 'Patricia', 'Officer', 103333, 104183);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105734, 'Mackenzie', 'Credit Analyst', 103334, 104183);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105735, 'Kimberly', 'Loan Closer', 103335, 104183);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105736, 'Bruce', 'Manager', 103336, 104184);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105737, 'Eileen', 'Officer', 103337, 104184);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105738, 'Rebecca', 'Credit Analyst', 103338, 104184);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105739, 'Anthony', 'Loan Closer', 103339, 104184);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105740, 'Christina', 'Manager', 103340, 104185);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105741, 'Jeremy', 'Officer', 103341, 104185);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105742, 'Nicole', 'Credit Analyst', 103342, 104185);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105743, 'James', 'Loan Closer', 103343, 104185);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105744, 'Richard', 'Manager', 103344, 104186);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105745, 'Grant', 'Officer', 103345, 104186);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105746, 'Vanessa', 'Credit Analyst', 103346, 104186);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105747, 'Rebecca', 'Loan Closer', 103347, 104186);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105748, 'Christopher', 'Manager', 103348, 104187);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105749, 'Samantha', 'Officer', 103349, 104187);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105750, 'Anthony', 'Credit Analyst', 103350, 104187);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105751, 'Nathan', 'Loan Closer', 103351, 104187);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105752, 'Scott', 'Manager', 103352, 104188);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105753, 'Eric', 'Officer', 103353, 104188);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105754, 'Dennis', 'Credit Analyst', 103354, 104188);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105755, 'Victoria', 'Loan Closer', 103355, 104188);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105756, 'Erica', 'Manager', 103356, 104189);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105757, 'Dustin', 'Officer', 103357, 104189);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105758, 'Louis', 'Credit Analyst', 103358, 104189);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105759, 'Erica', 'Loan Closer', 103359, 104189);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105760, 'David', 'Manager', 103360, 104190);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105761, 'Marvin', 'Officer', 103361, 104190);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105762, 'Lawrence', 'Credit Analyst', 103362, 104190);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105763, 'Teresa', 'Loan Closer', 103363, 104190);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105764, 'Ashley', 'Manager', 103364, 104191);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105765, 'Nathan', 'Officer', 103365, 104191);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105766, 'Erika', 'Credit Analyst', 103366, 104191);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105767, 'Brandon', 'Loan Closer', 103367, 104191);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105768, 'Robert', 'Manager', 103368, 104192);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105769, 'Antonio', 'Officer', 103369, 104192);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105770, 'Jacob', 'Credit Analyst', 103370, 104192);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105771, 'Joseph', 'Loan Closer', 103371, 104192);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105772, 'Kelly', 'Manager', 103372, 104193);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105773, 'Stanley', 'Officer', 103373, 104193);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105774, 'Erin', 'Credit Analyst', 103374, 104193);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105775, 'Lori', 'Loan Closer', 103375, 104193);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105776, 'Adam', 'Manager', 103376, 104194);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105777, 'Christopher', 'Officer', 103377, 104194);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105778, 'Austin', 'Credit Analyst', 103378, 104194);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105779, 'Ryan', 'Loan Closer', 103379, 104194);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105780, 'Shawn', 'Manager', 103380, 104195);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105781, 'Charles', 'Officer', 103381, 104195);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105782, 'Michael', 'Credit Analyst', 103382, 104195);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105783, 'Nicole', 'Loan Closer', 103383, 104195);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105784, 'Jeffrey', 'Manager', 103384, 104196);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105785, 'Kathleen', 'Officer', 103385, 104196);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105786, 'Ashley', 'Credit Analyst', 103386, 104196);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105787, 'Adriana', 'Loan Closer', 103387, 104196);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105788, 'Barbara', 'Manager', 103388, 104197);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105789, 'Vanessa', 'Officer', 103389, 104197);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105790, 'Beth', 'Credit Analyst', 103390, 104197);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105791, 'Erin', 'Loan Closer', 103391, 104197);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105792, 'Tiffany', 'Manager', 103392, 104198);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105793, 'Jennifer', 'Officer', 103393, 104198);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105794, 'Denise', 'Credit Analyst', 103394, 104198);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105795, 'Richard', 'Loan Closer', 103395, 104198);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105796, 'Jennifer', 'Manager', 103396, 104199);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105797, 'David', 'Officer', 103397, 104199);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105798, 'Michael', 'Credit Analyst', 103398, 104199);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105799, 'Michael', 'Loan Closer', 103399, 104199);
commit;
prompt 800 records committed...
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105800, 'Karina', 'Manager', 103000, 104200);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105801, 'Brady', 'Officer', 103001, 104200);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105802, 'Jim', 'Credit Analyst', 103002, 104200);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105803, 'Natalie', 'Loan Closer', 103003, 104200);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105804, 'Justin', 'Manager', 103004, 104201);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105805, 'Ryan', 'Officer', 103005, 104201);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105806, 'Dennis', 'Credit Analyst', 103006, 104201);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105807, 'Catherine', 'Loan Closer', 103007, 104201);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105808, 'Carolyn', 'Manager', 103008, 104202);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105809, 'Deborah', 'Officer', 103009, 104202);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105810, 'Amy', 'Credit Analyst', 103010, 104202);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105811, 'Ricky', 'Loan Closer', 103011, 104202);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105812, 'Crystal', 'Manager', 103012, 104203);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105813, 'Tony', 'Officer', 103013, 104203);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105814, 'Shelly', 'Credit Analyst', 103014, 104203);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105815, 'Lisa', 'Loan Closer', 103015, 104203);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105816, 'Mary', 'Manager', 103016, 104204);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105817, 'Joe', 'Officer', 103017, 104204);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105818, 'Heather', 'Credit Analyst', 103018, 104204);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105819, 'Mary', 'Loan Closer', 103019, 104204);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105820, 'Christie', 'Manager', 103020, 104205);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105821, 'Russell', 'Officer', 103021, 104205);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105822, 'Kristen', 'Credit Analyst', 103022, 104205);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105823, 'Darrell', 'Loan Closer', 103023, 104205);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105824, 'Melinda', 'Manager', 103024, 104206);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105825, 'Ernest', 'Officer', 103025, 104206);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105826, 'Kristin', 'Credit Analyst', 103026, 104206);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105827, 'Christopher', 'Loan Closer', 103027, 104206);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105828, 'Tonya', 'Manager', 103028, 104207);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105829, 'Gregory', 'Officer', 103029, 104207);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105830, 'Tyler', 'Credit Analyst', 103030, 104207);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105831, 'Jackson', 'Loan Closer', 103031, 104207);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105832, 'Morgan', 'Manager', 103032, 104208);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105833, 'John', 'Officer', 103033, 104208);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105834, 'Dustin', 'Credit Analyst', 103034, 104208);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105835, 'Andrew', 'Loan Closer', 103035, 104208);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105836, 'Duane', 'Manager', 103036, 104209);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105837, 'Scott', 'Officer', 103037, 104209);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105838, 'Alejandra', 'Credit Analyst', 103038, 104209);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105839, 'Ashley', 'Loan Closer', 103039, 104209);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105840, 'Lindsey', 'Manager', 103040, 104210);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105841, 'Andrew', 'Officer', 103041, 104210);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105842, 'Erica', 'Credit Analyst', 103042, 104210);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105843, 'Nathan', 'Loan Closer', 103043, 104210);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105844, 'Jamie', 'Manager', 103044, 104211);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105845, 'Brandon', 'Officer', 103045, 104211);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105846, 'Erika', 'Credit Analyst', 103046, 104211);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105847, 'James', 'Loan Closer', 103047, 104211);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105848, 'Paula', 'Manager', 103048, 104212);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105849, 'Shawn', 'Officer', 103049, 104212);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105850, 'Patrick', 'Credit Analyst', 103050, 104212);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105851, 'Richard', 'Loan Closer', 103051, 104212);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105852, 'Patty', 'Manager', 103052, 104213);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105853, 'Gerald', 'Officer', 103053, 104213);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105854, 'Thomas', 'Credit Analyst', 103054, 104213);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105855, 'Beth', 'Loan Closer', 103055, 104213);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105856, 'Matthew', 'Manager', 103056, 104214);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105857, 'Karen', 'Officer', 103057, 104214);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105858, 'Jared', 'Credit Analyst', 103058, 104214);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105859, 'Eric', 'Loan Closer', 103059, 104214);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105860, 'Robert', 'Manager', 103060, 104215);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105861, 'William', 'Officer', 103061, 104215);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105862, 'Alexander', 'Credit Analyst', 103062, 104215);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105863, 'Adam', 'Loan Closer', 103063, 104215);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105864, 'Dawn', 'Manager', 103064, 104216);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105865, 'Randy', 'Officer', 103065, 104216);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105866, 'Jeanette', 'Credit Analyst', 103066, 104216);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105867, 'Andrew', 'Loan Closer', 103067, 104216);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105868, 'Kristie', 'Manager', 103068, 104217);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105869, 'Michael', 'Officer', 103069, 104217);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105870, 'Katherine', 'Credit Analyst', 103070, 104217);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105871, 'Steven', 'Loan Closer', 103071, 104217);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105872, 'Sarah', 'Manager', 103072, 104218);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105873, 'Richard', 'Officer', 103073, 104218);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105874, 'Robert', 'Credit Analyst', 103074, 104218);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105875, 'Nancy', 'Loan Closer', 103075, 104218);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105876, 'Alan', 'Manager', 103076, 104219);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105877, 'Sarah', 'Officer', 103077, 104219);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105878, 'Michelle', 'Credit Analyst', 103078, 104219);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105879, 'Amy', 'Loan Closer', 103079, 104219);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105880, 'Michele', 'Manager', 103080, 104220);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105881, 'Daniel', 'Officer', 103081, 104220);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105882, 'Paul', 'Credit Analyst', 103082, 104220);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105883, 'Kurt', 'Loan Closer', 103083, 104220);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105884, 'Kelsey', 'Manager', 103084, 104221);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105885, 'Dawn', 'Officer', 103085, 104221);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105886, 'Anne', 'Credit Analyst', 103086, 104221);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105887, 'Emily', 'Loan Closer', 103087, 104221);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105888, 'Denise', 'Manager', 103088, 104222);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105889, 'Trevor', 'Officer', 103089, 104222);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105890, 'Julie', 'Credit Analyst', 103090, 104222);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105891, 'David', 'Loan Closer', 103091, 104222);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105892, 'David', 'Manager', 103092, 104223);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105893, 'John', 'Officer', 103093, 104223);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105894, 'Jacqueline', 'Credit Analyst', 103094, 104223);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105895, 'Crystal', 'Loan Closer', 103095, 104223);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105896, 'Michelle', 'Manager', 103096, 104224);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105897, 'Edward', 'Officer', 103097, 104224);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105898, 'David', 'Credit Analyst', 103098, 104224);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105899, 'Randy', 'Loan Closer', 103099, 104224);
commit;
prompt 900 records committed...
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105900, 'Michael', 'Manager', 103100, 104225);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105901, 'Jill', 'Officer', 103101, 104225);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105902, 'Jessica', 'Credit Analyst', 103102, 104225);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105903, 'Crystal', 'Loan Closer', 103103, 104225);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105904, 'Michele', 'Manager', 103104, 104226);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105905, 'Aaron', 'Officer', 103105, 104226);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105906, 'Timothy', 'Credit Analyst', 103106, 104226);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105907, 'Philip', 'Loan Closer', 103107, 104226);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105908, 'Austin', 'Manager', 103108, 104227);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105909, 'Dawn', 'Officer', 103109, 104227);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105910, 'Jesse', 'Credit Analyst', 103110, 104227);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105911, 'Steve', 'Loan Closer', 103111, 104227);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105912, 'Daniel', 'Manager', 103112, 104228);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105913, 'Dillon', 'Officer', 103113, 104228);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105914, 'Rodney', 'Credit Analyst', 103114, 104228);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105915, 'John', 'Loan Closer', 103115, 104228);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105916, 'Matthew', 'Manager', 103116, 104229);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105917, 'Janet', 'Officer', 103117, 104229);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105918, 'Patrick', 'Credit Analyst', 103118, 104229);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105919, 'Robert', 'Loan Closer', 103119, 104229);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105920, 'Bruce', 'Manager', 103120, 104230);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105921, 'Renee', 'Officer', 103121, 104230);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105922, 'Tina', 'Credit Analyst', 103122, 104230);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105923, 'Diana', 'Loan Closer', 103123, 104230);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105924, 'Robert', 'Manager', 103124, 104231);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105925, 'Alyssa', 'Officer', 103125, 104231);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105926, 'Gina', 'Credit Analyst', 103126, 104231);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105927, 'Lisa', 'Loan Closer', 103127, 104231);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105928, 'James', 'Manager', 103128, 104232);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105929, 'Isaac', 'Officer', 103129, 104232);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105930, 'Andrew', 'Credit Analyst', 103130, 104232);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105931, 'Robert', 'Loan Closer', 103131, 104232);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105932, 'Jean', 'Manager', 103132, 104233);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105933, 'Randy', 'Officer', 103133, 104233);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105934, 'David', 'Credit Analyst', 103134, 104233);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105935, 'Adam', 'Loan Closer', 103135, 104233);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105936, 'Douglas', 'Manager', 103136, 104234);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105937, 'Jeffrey', 'Officer', 103137, 104234);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105938, 'Dana', 'Credit Analyst', 103138, 104234);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105939, 'Sara', 'Loan Closer', 103139, 104234);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105940, 'Angela', 'Manager', 103140, 104235);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105941, 'James', 'Officer', 103141, 104235);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105942, 'Pamela', 'Credit Analyst', 103142, 104235);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105943, 'Christopher', 'Loan Closer', 103143, 104235);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105944, 'Christopher', 'Manager', 103144, 104236);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105945, 'Martha', 'Officer', 103145, 104236);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105946, 'Martha', 'Credit Analyst', 103146, 104236);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105947, 'Elizabeth', 'Loan Closer', 103147, 104236);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105948, 'Kelly', 'Manager', 103148, 104237);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105949, 'Kristen', 'Officer', 103149, 104237);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105950, 'Kristin', 'Credit Analyst', 103150, 104237);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105951, 'Mike', 'Loan Closer', 103151, 104237);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105952, 'Tara', 'Manager', 103152, 104238);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105953, 'Jackie', 'Officer', 103153, 104238);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105954, 'Dalton', 'Credit Analyst', 103154, 104238);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105955, 'Eric', 'Loan Closer', 103155, 104238);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105956, 'Kimberly', 'Manager', 103156, 104239);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105957, 'Brandon', 'Officer', 103157, 104239);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105958, 'Jennifer', 'Credit Analyst', 103158, 104239);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105959, 'Eric', 'Loan Closer', 103159, 104239);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105960, 'William', 'Manager', 103160, 104240);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105961, 'David', 'Officer', 103161, 104240);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105962, 'Corey', 'Credit Analyst', 103162, 104240);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105963, 'Michelle', 'Loan Closer', 103163, 104240);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105964, 'Joshua', 'Manager', 103164, 104241);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105965, 'Elizabeth', 'Officer', 103165, 104241);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105966, 'Janice', 'Credit Analyst', 103166, 104241);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105967, 'Steven', 'Loan Closer', 103167, 104241);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105968, 'Tanya', 'Manager', 103168, 104242);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105969, 'John', 'Officer', 103169, 104242);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105970, 'Monica', 'Credit Analyst', 103170, 104242);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105971, 'Jacqueline', 'Loan Closer', 103171, 104242);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105972, 'Michelle', 'Manager', 103172, 104243);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105973, 'Joseph', 'Officer', 103173, 104243);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105974, 'Valerie', 'Credit Analyst', 103174, 104243);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105975, 'Leslie', 'Loan Closer', 103175, 104243);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105976, 'Joe', 'Manager', 103176, 104244);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105977, 'Adam', 'Officer', 103177, 104244);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105978, 'Jeremy', 'Credit Analyst', 103178, 104244);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105979, 'John', 'Loan Closer', 103179, 104244);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105980, 'Craig', 'Manager', 103180, 104245);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105981, 'Steven', 'Officer', 103181, 104245);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105982, 'Mason', 'Credit Analyst', 103182, 104245);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105983, 'Stephanie', 'Loan Closer', 103183, 104245);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105984, 'Timothy', 'Manager', 103184, 104246);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105985, 'Veronica', 'Officer', 103185, 104246);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105986, 'Joann', 'Credit Analyst', 103186, 104246);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105987, 'Rebekah', 'Loan Closer', 103187, 104246);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105988, 'Lisa', 'Manager', 103188, 104247);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105989, 'Brian', 'Officer', 103189, 104247);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105990, 'Sue', 'Credit Analyst', 103190, 104247);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105991, 'Amber', 'Loan Closer', 103191, 104247);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105992, 'Sheri', 'Manager', 103192, 104248);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105993, 'Joseph', 'Officer', 103193, 104248);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105994, 'Austin', 'Credit Analyst', 103194, 104248);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105995, 'David', 'Loan Closer', 103195, 104248);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105996, 'Latoya', 'Manager', 103196, 104249);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105997, 'Jamie', 'Officer', 103197, 104249);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105998, 'James', 'Credit Analyst', 103198, 104249);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105999, 'Elizabeth', 'Loan Closer', 103199, 104249);
commit;
prompt 1000 records committed...
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106000, 'Christopher', 'Manager', 103200, 104250);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106001, 'Katherine', 'Officer', 103201, 104250);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106002, 'Kyle', 'Credit Analyst', 103202, 104250);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106003, 'Michael', 'Loan Closer', 103203, 104250);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106004, 'Jesus', 'Manager', 103204, 104251);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106005, 'Jenna', 'Officer', 103205, 104251);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106006, 'Jennifer', 'Credit Analyst', 103206, 104251);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106007, 'Cassandra', 'Loan Closer', 103207, 104251);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106008, 'Sarah', 'Manager', 103208, 104252);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106009, 'Terry', 'Officer', 103209, 104252);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106010, 'Eric', 'Credit Analyst', 103210, 104252);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106011, 'Christina', 'Loan Closer', 103211, 104252);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106012, 'Marisa', 'Manager', 103212, 104253);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106013, 'John', 'Officer', 103213, 104253);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106014, 'Amy', 'Credit Analyst', 103214, 104253);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106015, 'Robert', 'Loan Closer', 103215, 104253);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106016, 'Melissa', 'Manager', 103216, 104254);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106017, 'David', 'Officer', 103217, 104254);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106018, 'Martin', 'Credit Analyst', 103218, 104254);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106019, 'Michelle', 'Loan Closer', 103219, 104254);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106020, 'Matthew', 'Manager', 103220, 104255);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106021, 'Mark', 'Officer', 103221, 104255);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106022, 'Danny', 'Credit Analyst', 103222, 104255);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106023, 'Christopher', 'Loan Closer', 103223, 104255);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106024, 'Anthony', 'Manager', 103224, 104256);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106025, 'Alexandra', 'Officer', 103225, 104256);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106026, 'Cynthia', 'Credit Analyst', 103226, 104256);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106027, 'Isaac', 'Loan Closer', 103227, 104256);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106028, 'Cynthia', 'Manager', 103228, 104257);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106029, 'Kevin', 'Officer', 103229, 104257);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106030, 'William', 'Credit Analyst', 103230, 104257);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106031, 'Patricia', 'Loan Closer', 103231, 104257);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106032, 'Maurice', 'Manager', 103232, 104258);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106033, 'Rachel', 'Officer', 103233, 104258);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106034, 'William', 'Credit Analyst', 103234, 104258);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106035, 'Mitchell', 'Loan Closer', 103235, 104258);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106036, 'Adam', 'Manager', 103236, 104259);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106037, 'John', 'Officer', 103237, 104259);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106038, 'Felicia', 'Credit Analyst', 103238, 104259);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106039, 'Marvin', 'Loan Closer', 103239, 104259);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106040, 'Natalie', 'Manager', 103240, 104260);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106041, 'Caitlin', 'Officer', 103241, 104260);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106042, 'Tamara', 'Credit Analyst', 103242, 104260);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106043, 'John', 'Loan Closer', 103243, 104260);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106044, 'Penny', 'Manager', 103244, 104261);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106045, 'Richard', 'Officer', 103245, 104261);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106046, 'Kelly', 'Credit Analyst', 103246, 104261);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106047, 'James', 'Loan Closer', 103247, 104261);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106048, 'Manuel', 'Manager', 103248, 104262);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106049, 'Brittany', 'Officer', 103249, 104262);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106050, 'Benjamin', 'Credit Analyst', 103250, 104262);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106051, 'Alisha', 'Loan Closer', 103251, 104262);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106052, 'Andrea', 'Manager', 103252, 104263);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106053, 'David', 'Officer', 103253, 104263);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106054, 'Brian', 'Credit Analyst', 103254, 104263);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106055, 'William', 'Loan Closer', 103255, 104263);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106056, 'Michael', 'Manager', 103256, 104264);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106057, 'Andrew', 'Officer', 103257, 104264);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106058, 'Christopher', 'Credit Analyst', 103258, 104264);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106059, 'Nicholas', 'Loan Closer', 103259, 104264);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106060, 'Sandra', 'Manager', 103260, 104265);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106061, 'Tammy', 'Officer', 103261, 104265);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106062, 'Katie', 'Credit Analyst', 103262, 104265);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106063, 'Crystal', 'Loan Closer', 103263, 104265);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106064, 'Lee', 'Manager', 103264, 104266);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106065, 'Tyler', 'Officer', 103265, 104266);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106066, 'Steven', 'Credit Analyst', 103266, 104266);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106067, 'Nicholas', 'Loan Closer', 103267, 104266);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106068, 'Cole', 'Manager', 103268, 104267);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106069, 'Tina', 'Officer', 103269, 104267);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106070, 'David', 'Credit Analyst', 103270, 104267);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106071, 'Nicole', 'Loan Closer', 103271, 104267);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106072, 'Theresa', 'Manager', 103272, 104268);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106073, 'Emily', 'Officer', 103273, 104268);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106074, 'Eric', 'Credit Analyst', 103274, 104268);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106075, 'Amanda', 'Loan Closer', 103275, 104268);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106076, 'Samuel', 'Manager', 103276, 104269);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106077, 'Joseph', 'Officer', 103277, 104269);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106078, 'Sarah', 'Credit Analyst', 103278, 104269);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106079, 'Michael', 'Loan Closer', 103279, 104269);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106080, 'Ryan', 'Manager', 103280, 104270);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106081, 'Angela', 'Officer', 103281, 104270);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106082, 'Christopher', 'Credit Analyst', 103282, 104270);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106083, 'Miguel', 'Loan Closer', 103283, 104270);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106084, 'Christine', 'Manager', 103284, 104271);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106085, 'Austin', 'Officer', 103285, 104271);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106086, 'Ariana', 'Credit Analyst', 103286, 104271);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106087, 'Christopher', 'Loan Closer', 103287, 104271);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106088, 'Judith', 'Manager', 103288, 104272);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106089, 'Michael', 'Officer', 103289, 104272);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106090, 'Jamie', 'Credit Analyst', 103290, 104272);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106091, 'Manuel', 'Loan Closer', 103291, 104272);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106092, 'Jacob', 'Manager', 103292, 104273);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106093, 'Kelly', 'Officer', 103293, 104273);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106094, 'Linda', 'Credit Analyst', 103294, 104273);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106095, 'Jeremy', 'Loan Closer', 103295, 104273);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106096, 'Chris', 'Manager', 103296, 104274);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106097, 'Marc', 'Officer', 103297, 104274);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106098, 'Alexandra', 'Credit Analyst', 103298, 104274);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106099, 'Lucas', 'Loan Closer', 103299, 104274);
commit;
prompt 1100 records committed...
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106100, 'Abigail', 'Manager', 103300, 104275);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106101, 'Christina', 'Officer', 103301, 104275);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106102, 'Melissa', 'Credit Analyst', 103302, 104275);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106103, 'James', 'Loan Closer', 103303, 104275);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106104, 'Jennifer', 'Manager', 103304, 104276);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106105, 'Elizabeth', 'Officer', 103305, 104276);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106106, 'Jasmine', 'Credit Analyst', 103306, 104276);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106107, 'Michelle', 'Loan Closer', 103307, 104276);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106108, 'Douglas', 'Manager', 103308, 104277);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106109, 'Jason', 'Officer', 103309, 104277);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106110, 'Jason', 'Credit Analyst', 103310, 104277);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106111, 'Taylor', 'Loan Closer', 103311, 104277);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106112, 'Katelyn', 'Manager', 103312, 104278);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106113, 'Jessica', 'Officer', 103313, 104278);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106114, 'Wendy', 'Credit Analyst', 103314, 104278);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106115, 'David', 'Loan Closer', 103315, 104278);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106116, 'Lindsey', 'Manager', 103316, 104279);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106117, 'Aaron', 'Officer', 103317, 104279);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106118, 'Jaime', 'Credit Analyst', 103318, 104279);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106119, 'Mike', 'Loan Closer', 103319, 104279);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106120, 'Dennis', 'Manager', 103320, 104280);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106121, 'Veronica', 'Officer', 103321, 104280);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106122, 'Kevin', 'Credit Analyst', 103322, 104280);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106123, 'Megan', 'Loan Closer', 103323, 104280);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106124, 'Taylor', 'Manager', 103324, 104281);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106125, 'Tammy', 'Officer', 103325, 104281);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106126, 'Sabrina', 'Credit Analyst', 103326, 104281);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106127, 'Alexis', 'Loan Closer', 103327, 104281);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106128, 'Amy', 'Manager', 103328, 104282);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106129, 'Sara', 'Officer', 103329, 104282);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106130, 'Janet', 'Credit Analyst', 103330, 104282);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106131, 'Collin', 'Loan Closer', 103331, 104282);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106132, 'Vincent', 'Manager', 103332, 104283);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106133, 'Sara', 'Officer', 103333, 104283);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106134, 'Carl', 'Credit Analyst', 103334, 104283);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106135, 'Taylor', 'Loan Closer', 103335, 104283);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106136, 'Steven', 'Manager', 103336, 104284);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106137, 'Megan', 'Officer', 103337, 104284);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106138, 'Jason', 'Credit Analyst', 103338, 104284);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106139, 'Megan', 'Loan Closer', 103339, 104284);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106140, 'Amanda', 'Manager', 103340, 104285);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106141, 'Andrea', 'Officer', 103341, 104285);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106142, 'Sheila', 'Credit Analyst', 103342, 104285);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106143, 'Jacob', 'Loan Closer', 103343, 104285);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106144, 'Tracy', 'Manager', 103344, 104286);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106145, 'Julie', 'Officer', 103345, 104286);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106146, 'Jason', 'Credit Analyst', 103346, 104286);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106147, 'Richard', 'Loan Closer', 103347, 104286);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106148, 'Joseph', 'Manager', 103348, 104287);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106149, 'Jimmy', 'Officer', 103349, 104287);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106150, 'Thomas', 'Credit Analyst', 103350, 104287);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106151, 'Nicholas', 'Loan Closer', 103351, 104287);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106152, 'Julie', 'Manager', 103352, 104288);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106153, 'Michael', 'Officer', 103353, 104288);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106154, 'Kristina', 'Credit Analyst', 103354, 104288);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106155, 'Kristina', 'Loan Closer', 103355, 104288);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106156, 'John', 'Manager', 103356, 104289);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106157, 'Chelsea', 'Officer', 103357, 104289);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106158, 'Emily', 'Credit Analyst', 103358, 104289);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106159, 'Taylor', 'Loan Closer', 103359, 104289);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106160, 'Kenneth', 'Manager', 103360, 104290);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106161, 'Rhonda', 'Officer', 103361, 104290);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106162, 'Robert', 'Credit Analyst', 103362, 104290);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106163, 'Larry', 'Loan Closer', 103363, 104290);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106164, 'Jocelyn', 'Manager', 103364, 104291);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106165, 'Sharon', 'Officer', 103365, 104291);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106166, 'Christopher', 'Credit Analyst', 103366, 104291);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106167, 'Lisa', 'Loan Closer', 103367, 104291);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106168, 'Elizabeth', 'Manager', 103368, 104292);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106169, 'Stephen', 'Officer', 103369, 104292);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106170, 'Scott', 'Credit Analyst', 103370, 104292);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106171, 'Gabrielle', 'Loan Closer', 103371, 104292);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106172, 'Pamela', 'Manager', 103372, 104293);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106173, 'Nicole', 'Officer', 103373, 104293);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106174, 'Jay', 'Credit Analyst', 103374, 104293);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106175, 'Elizabeth', 'Loan Closer', 103375, 104293);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106176, 'Nicole', 'Manager', 103376, 104294);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106177, 'Steven', 'Officer', 103377, 104294);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106178, 'Kimberly', 'Credit Analyst', 103378, 104294);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106179, 'Shannon', 'Loan Closer', 103379, 104294);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106180, 'Dustin', 'Manager', 103380, 104295);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106181, 'Amber', 'Officer', 103381, 104295);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106182, 'Billy', 'Credit Analyst', 103382, 104295);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106183, 'Ashley', 'Loan Closer', 103383, 104295);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106184, 'Gregory', 'Manager', 103384, 104296);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106185, 'Meredith', 'Officer', 103385, 104296);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106186, 'Amanda', 'Credit Analyst', 103386, 104296);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106187, 'Paula', 'Loan Closer', 103387, 104296);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106188, 'Thomas', 'Manager', 103388, 104297);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106189, 'Craig', 'Officer', 103389, 104297);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106190, 'Carlos', 'Credit Analyst', 103390, 104297);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106191, 'Cathy', 'Loan Closer', 103391, 104297);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106192, 'Jill', 'Manager', 103392, 104298);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106193, 'Jimmy', 'Officer', 103393, 104298);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106194, 'Ashley', 'Credit Analyst', 103394, 104298);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106195, 'Peter', 'Loan Closer', 103395, 104298);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106196, 'Joshua', 'Manager', 103396, 104299);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106197, 'Jonathan', 'Officer', 103397, 104299);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106198, 'Misty', 'Credit Analyst', 103398, 104299);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106199, 'Jeffrey', 'Loan Closer', 103399, 104299);
commit;
prompt 1200 records committed...
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106200, 'Anthony', 'Manager', 103000, 104300);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106201, 'Erin', 'Officer', 103001, 104300);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106202, 'Jay', 'Credit Analyst', 103002, 104300);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106203, 'Christopher', 'Loan Closer', 103003, 104300);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106204, 'Mary', 'Manager', 103004, 104301);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106205, 'Amy', 'Officer', 103005, 104301);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106206, 'Joseph', 'Credit Analyst', 103006, 104301);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106207, 'Charles', 'Loan Closer', 103007, 104301);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106208, 'Misty', 'Manager', 103008, 104302);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106209, 'Melissa', 'Officer', 103009, 104302);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106210, 'Wendy', 'Credit Analyst', 103010, 104302);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106211, 'Daniel', 'Loan Closer', 103011, 104302);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106212, 'Rebecca', 'Manager', 103012, 104303);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106213, 'Ryan', 'Officer', 103013, 104303);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106214, 'Marcus', 'Credit Analyst', 103014, 104303);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106215, 'Ronnie', 'Loan Closer', 103015, 104303);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106216, 'Jessica', 'Manager', 103016, 104304);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106217, 'Nicholas', 'Officer', 103017, 104304);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106218, 'Misty', 'Credit Analyst', 103018, 104304);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106219, 'Robin', 'Loan Closer', 103019, 104304);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106220, 'Jamie', 'Manager', 103020, 104305);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106221, 'Danielle', 'Officer', 103021, 104305);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106222, 'Joseph', 'Credit Analyst', 103022, 104305);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106223, 'Spencer', 'Loan Closer', 103023, 104305);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106224, 'Melissa', 'Manager', 103024, 104306);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106225, 'Andrew', 'Officer', 103025, 104306);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106226, 'Caleb', 'Credit Analyst', 103026, 104306);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106227, 'Jamie', 'Loan Closer', 103027, 104306);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106228, 'Jay', 'Manager', 103028, 104307);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106229, 'Angie', 'Officer', 103029, 104307);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106230, 'John', 'Credit Analyst', 103030, 104307);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106231, 'Cory', 'Loan Closer', 103031, 104307);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106232, 'Rita', 'Manager', 103032, 104308);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106233, 'Robert', 'Officer', 103033, 104308);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106234, 'Sean', 'Credit Analyst', 103034, 104308);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106235, 'Charles', 'Loan Closer', 103035, 104308);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106236, 'Rebecca', 'Manager', 103036, 104309);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106237, 'Alison', 'Officer', 103037, 104309);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106238, 'David', 'Credit Analyst', 103038, 104309);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106239, 'Patricia', 'Loan Closer', 103039, 104309);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106240, 'Regina', 'Manager', 103040, 104310);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106241, 'Kevin', 'Officer', 103041, 104310);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106242, 'Randall', 'Credit Analyst', 103042, 104310);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106243, 'Patricia', 'Loan Closer', 103043, 104310);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106244, 'Aaron', 'Manager', 103044, 104311);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106245, 'Andrew', 'Officer', 103045, 104311);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106246, 'Brian', 'Credit Analyst', 103046, 104311);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106247, 'Amy', 'Loan Closer', 103047, 104311);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106248, 'Betty', 'Manager', 103048, 104312);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106249, 'Christopher', 'Officer', 103049, 104312);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106250, 'Eric', 'Credit Analyst', 103050, 104312);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106251, 'Felicia', 'Loan Closer', 103051, 104312);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106252, 'Angela', 'Manager', 103052, 104313);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106253, 'Stephen', 'Officer', 103053, 104313);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106254, 'Carrie', 'Credit Analyst', 103054, 104313);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106255, 'Daniel', 'Loan Closer', 103055, 104313);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106256, 'Eric', 'Manager', 103056, 104314);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106257, 'Raymond', 'Officer', 103057, 104314);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106258, 'Summer', 'Credit Analyst', 103058, 104314);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106259, 'Michael', 'Loan Closer', 103059, 104314);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106260, 'Donna', 'Manager', 103060, 104315);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106261, 'Austin', 'Officer', 103061, 104315);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106262, 'Mario', 'Credit Analyst', 103062, 104315);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106263, 'Michael', 'Loan Closer', 103063, 104315);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106264, 'Jennifer', 'Manager', 103064, 104316);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106265, 'Jason', 'Officer', 103065, 104316);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106266, 'Heather', 'Credit Analyst', 103066, 104316);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106267, 'Michael', 'Loan Closer', 103067, 104316);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106268, 'David', 'Manager', 103068, 104317);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106269, 'Robert', 'Officer', 103069, 104317);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106270, 'Brian', 'Credit Analyst', 103070, 104317);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106271, 'Shannon', 'Loan Closer', 103071, 104317);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106272, 'Richard', 'Manager', 103072, 104318);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106273, 'Dana', 'Officer', 103073, 104318);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106274, 'Michelle', 'Credit Analyst', 103074, 104318);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106275, 'Amy', 'Loan Closer', 103075, 104318);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106276, 'Carla', 'Manager', 103076, 104319);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106277, 'Rebecca', 'Officer', 103077, 104319);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106278, 'Brandon', 'Credit Analyst', 103078, 104319);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106279, 'Katie', 'Loan Closer', 103079, 104319);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106280, 'Cassandra', 'Manager', 103080, 104320);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106281, 'Travis', 'Officer', 103081, 104320);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106282, 'Heather', 'Credit Analyst', 103082, 104320);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106283, 'Charles', 'Loan Closer', 103083, 104320);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106284, 'Anna', 'Manager', 103084, 104321);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106285, 'Dustin', 'Officer', 103085, 104321);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106286, 'Kimberly', 'Credit Analyst', 103086, 104321);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106287, 'John', 'Loan Closer', 103087, 104321);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106288, 'Kevin', 'Manager', 103088, 104322);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106289, 'Jonathan', 'Officer', 103089, 104322);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106290, 'Christopher', 'Credit Analyst', 103090, 104322);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106291, 'Tiffany', 'Loan Closer', 103091, 104322);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106292, 'George', 'Manager', 103092, 104323);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106293, 'Sarah', 'Officer', 103093, 104323);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106294, 'Briana', 'Credit Analyst', 103094, 104323);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106295, 'Cynthia', 'Loan Closer', 103095, 104323);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106296, 'Beth', 'Manager', 103096, 104324);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106297, 'Rebecca', 'Officer', 103097, 104324);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106298, 'Dakota', 'Credit Analyst', 103098, 104324);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106299, 'Jill', 'Loan Closer', 103099, 104324);
commit;
prompt 1300 records committed...
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106300, 'Caroline', 'Manager', 103100, 104325);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106301, 'Randall', 'Officer', 103101, 104325);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106302, 'Brandon', 'Credit Analyst', 103102, 104325);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106303, 'Joyce', 'Loan Closer', 103103, 104325);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106304, 'Paul', 'Manager', 103104, 104326);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106305, 'Diane', 'Officer', 103105, 104326);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106306, 'Jason', 'Credit Analyst', 103106, 104326);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106307, 'Rachel', 'Loan Closer', 103107, 104326);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106308, 'Elijah', 'Manager', 103108, 104327);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106309, 'Rachel', 'Officer', 103109, 104327);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106310, 'Vanessa', 'Credit Analyst', 103110, 104327);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106311, 'Rachel', 'Loan Closer', 103111, 104327);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106312, 'Rachel', 'Manager', 103112, 104328);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106313, 'Gregory', 'Officer', 103113, 104328);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106314, 'Desiree', 'Credit Analyst', 103114, 104328);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106315, 'Richard', 'Loan Closer', 103115, 104328);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106316, 'Ashley', 'Manager', 103116, 104329);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106317, 'Jonathan', 'Officer', 103117, 104329);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106318, 'Karen', 'Credit Analyst', 103118, 104329);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106319, 'Courtney', 'Loan Closer', 103119, 104329);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106320, 'Karen', 'Manager', 103120, 104330);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106321, 'Erica', 'Officer', 103121, 104330);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106322, 'Ryan', 'Credit Analyst', 103122, 104330);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106323, 'Kimberly', 'Loan Closer', 103123, 104330);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106324, 'Michelle', 'Manager', 103124, 104331);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106325, 'Stephanie', 'Officer', 103125, 104331);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106326, 'Elizabeth', 'Credit Analyst', 103126, 104331);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106327, 'Robert', 'Loan Closer', 103127, 104331);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106328, 'Ryan', 'Manager', 103128, 104332);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106329, 'Mary', 'Officer', 103129, 104332);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106330, 'Thomas', 'Credit Analyst', 103130, 104332);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106331, 'Kristin', 'Loan Closer', 103131, 104332);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106332, 'Theresa', 'Manager', 103132, 104333);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106333, 'Robin', 'Officer', 103133, 104333);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106334, 'Teresa', 'Credit Analyst', 103134, 104333);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106335, 'Melissa', 'Loan Closer', 103135, 104333);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106336, 'John', 'Manager', 103136, 104334);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106337, 'Christine', 'Officer', 103137, 104334);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106338, 'Trevor', 'Credit Analyst', 103138, 104334);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106339, 'Gary', 'Loan Closer', 103139, 104334);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106340, 'Beth', 'Manager', 103140, 104335);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106341, 'Jessica', 'Officer', 103141, 104335);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106342, 'Johnny', 'Credit Analyst', 103142, 104335);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106343, 'Daniel', 'Loan Closer', 103143, 104335);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106344, 'Natalie', 'Manager', 103144, 104336);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106345, 'Sara', 'Officer', 103145, 104336);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106346, 'Stephen', 'Credit Analyst', 103146, 104336);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106347, 'Marc', 'Loan Closer', 103147, 104336);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106348, 'Julia', 'Manager', 103148, 104337);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106349, 'Nicole', 'Officer', 103149, 104337);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106350, 'Jeffery', 'Credit Analyst', 103150, 104337);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106351, 'Sean', 'Loan Closer', 103151, 104337);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106352, 'Tina', 'Manager', 103152, 104338);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106353, 'Marvin', 'Officer', 103153, 104338);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106354, 'Jordan', 'Credit Analyst', 103154, 104338);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106355, 'Miguel', 'Loan Closer', 103155, 104338);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106356, 'Robert', 'Manager', 103156, 104339);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106357, 'Kimberly', 'Officer', 103157, 104339);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106358, 'Mark', 'Credit Analyst', 103158, 104339);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106359, 'Kathleen', 'Loan Closer', 103159, 104339);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106360, 'Stephanie', 'Manager', 103160, 104340);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106361, 'Amy', 'Officer', 103161, 104340);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106362, 'Elizabeth', 'Credit Analyst', 103162, 104340);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106363, 'Angela', 'Loan Closer', 103163, 104340);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106364, 'Nicholas', 'Manager', 103164, 104341);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106365, 'Michael', 'Officer', 103165, 104341);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106366, 'Christopher', 'Credit Analyst', 103166, 104341);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106367, 'Jeffery', 'Loan Closer', 103167, 104341);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106368, 'Wayne', 'Manager', 103168, 104342);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106369, 'Mary', 'Officer', 103169, 104342);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106370, 'Morgan', 'Credit Analyst', 103170, 104342);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106371, 'Jessica', 'Loan Closer', 103171, 104342);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106372, 'Samantha', 'Manager', 103172, 104343);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106373, 'Cassandra', 'Officer', 103173, 104343);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106374, 'Cassandra', 'Credit Analyst', 103174, 104343);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106375, 'Gregory', 'Loan Closer', 103175, 104343);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106376, 'Larry', 'Manager', 103176, 104344);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106377, 'Bryan', 'Officer', 103177, 104344);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106378, 'Spencer', 'Credit Analyst', 103178, 104344);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106379, 'Ashley', 'Loan Closer', 103179, 104344);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106380, 'Antonio', 'Manager', 103180, 104345);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106381, 'Barbara', 'Officer', 103181, 104345);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106382, 'Patrick', 'Credit Analyst', 103182, 104345);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106383, 'Matthew', 'Loan Closer', 103183, 104345);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106384, 'Michelle', 'Manager', 103184, 104346);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106385, 'Jimmy', 'Officer', 103185, 104346);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106386, 'Robert', 'Credit Analyst', 103186, 104346);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106387, 'Dennis', 'Loan Closer', 103187, 104346);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106388, 'Daniel', 'Manager', 103188, 104347);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106389, 'Craig', 'Officer', 103189, 104347);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106390, 'Tonya', 'Credit Analyst', 103190, 104347);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106391, 'Becky', 'Loan Closer', 103191, 104347);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106392, 'Monica', 'Manager', 103192, 104348);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106393, 'Pamela', 'Officer', 103193, 104348);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106394, 'Jonathan', 'Credit Analyst', 103194, 104348);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106395, 'Logan', 'Loan Closer', 103195, 104348);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106396, 'David', 'Manager', 103196, 104349);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106397, 'Cory', 'Officer', 103197, 104349);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106398, 'Jillian', 'Credit Analyst', 103198, 104349);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106399, 'Beth', 'Loan Closer', 103199, 104349);
commit;
prompt 1400 records committed...
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106400, 'Maria', 'Manager', 103200, 104350);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106401, 'Brian', 'Officer', 103201, 104350);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106402, 'Travis', 'Credit Analyst', 103202, 104350);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106403, 'Susan', 'Loan Closer', 103203, 104350);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106404, 'Ricky', 'Manager', 103204, 104351);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106405, 'Carla', 'Officer', 103205, 104351);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106406, 'Jeremy', 'Credit Analyst', 103206, 104351);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106407, 'Laura', 'Loan Closer', 103207, 104351);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106408, 'Madison', 'Manager', 103208, 104352);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106409, 'Austin', 'Officer', 103209, 104352);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106410, 'Frank', 'Credit Analyst', 103210, 104352);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106411, 'Robin', 'Loan Closer', 103211, 104352);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106412, 'Jill', 'Manager', 103212, 104353);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106413, 'Alexandra', 'Officer', 103213, 104353);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106414, 'Michael', 'Credit Analyst', 103214, 104353);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106415, 'Arthur', 'Loan Closer', 103215, 104353);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106416, 'Victor', 'Manager', 103216, 104354);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106417, 'Andrew', 'Officer', 103217, 104354);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106418, 'Amanda', 'Credit Analyst', 103218, 104354);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106419, 'Mallory', 'Loan Closer', 103219, 104354);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106420, 'Teresa', 'Manager', 103220, 104355);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106421, 'Kenneth', 'Officer', 103221, 104355);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106422, 'Reginald', 'Credit Analyst', 103222, 104355);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106423, 'Ronald', 'Loan Closer', 103223, 104355);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106424, 'Jennifer', 'Manager', 103224, 104356);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106425, 'Melissa', 'Officer', 103225, 104356);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106426, 'Laura', 'Credit Analyst', 103226, 104356);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106427, 'Amanda', 'Loan Closer', 103227, 104356);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106428, 'Amanda', 'Manager', 103228, 104357);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106429, 'Sandra', 'Officer', 103229, 104357);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106430, 'David', 'Credit Analyst', 103230, 104357);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106431, 'Matthew', 'Loan Closer', 103231, 104357);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106432, 'Katherine', 'Manager', 103232, 104358);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106433, 'Kristina', 'Officer', 103233, 104358);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106434, 'Judy', 'Credit Analyst', 103234, 104358);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106435, 'Nicholas', 'Loan Closer', 103235, 104358);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106436, 'Nancy', 'Manager', 103236, 104359);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106437, 'Vanessa', 'Officer', 103237, 104359);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106438, 'Tracey', 'Credit Analyst', 103238, 104359);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106439, 'Rebecca', 'Loan Closer', 103239, 104359);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106440, 'Sarah', 'Manager', 103240, 104360);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106441, 'Danielle', 'Officer', 103241, 104360);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106442, 'Louis', 'Credit Analyst', 103242, 104360);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106443, 'Jordan', 'Loan Closer', 103243, 104360);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106444, 'Jamie', 'Manager', 103244, 104361);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106445, 'Barbara', 'Officer', 103245, 104361);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106446, 'Robert', 'Credit Analyst', 103246, 104361);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106447, 'Eric', 'Loan Closer', 103247, 104361);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106448, 'Paul', 'Manager', 103248, 104362);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106449, 'Amanda', 'Officer', 103249, 104362);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106450, 'Elizabeth', 'Credit Analyst', 103250, 104362);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106451, 'Jason', 'Loan Closer', 103251, 104362);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106452, 'Christine', 'Manager', 103252, 104363);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106453, 'Emma', 'Officer', 103253, 104363);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106454, 'Jonathan', 'Credit Analyst', 103254, 104363);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106455, 'Jennifer', 'Loan Closer', 103255, 104363);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106456, 'Christopher', 'Manager', 103256, 104364);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106457, 'Joseph', 'Officer', 103257, 104364);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106458, 'Mitchell', 'Credit Analyst', 103258, 104364);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106459, 'Michelle', 'Loan Closer', 103259, 104364);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106460, 'Nicole', 'Manager', 103260, 104365);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106461, 'Jaclyn', 'Officer', 103261, 104365);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106462, 'Christopher', 'Credit Analyst', 103262, 104365);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106463, 'Darin', 'Loan Closer', 103263, 104365);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106464, 'John', 'Manager', 103264, 104366);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106465, 'Timothy', 'Officer', 103265, 104366);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106466, 'Kelly', 'Credit Analyst', 103266, 104366);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106467, 'Monica', 'Loan Closer', 103267, 104366);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106468, 'Elizabeth', 'Manager', 103268, 104367);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106469, 'Nathan', 'Officer', 103269, 104367);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106470, 'James', 'Credit Analyst', 103270, 104367);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106471, 'Diane', 'Loan Closer', 103271, 104367);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106472, 'Marco', 'Manager', 103272, 104368);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106473, 'Michael', 'Officer', 103273, 104368);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106474, 'James', 'Credit Analyst', 103274, 104368);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106475, 'Catherine', 'Loan Closer', 103275, 104368);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106476, 'Julia', 'Manager', 103276, 104369);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106477, 'James', 'Officer', 103277, 104369);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106478, 'Bryan', 'Credit Analyst', 103278, 104369);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106479, 'Kristy', 'Loan Closer', 103279, 104369);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106480, 'Sharon', 'Manager', 103280, 104370);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106481, 'Cody', 'Officer', 103281, 104370);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106482, 'John', 'Credit Analyst', 103282, 104370);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106483, 'Kimberly', 'Loan Closer', 103283, 104370);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106484, 'Kim', 'Manager', 103284, 104371);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106485, 'James', 'Officer', 103285, 104371);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106486, 'Nancy', 'Credit Analyst', 103286, 104371);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106487, 'Kent', 'Loan Closer', 103287, 104371);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106488, 'Cody', 'Manager', 103288, 104372);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106489, 'Kathy', 'Officer', 103289, 104372);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106490, 'Jennifer', 'Credit Analyst', 103290, 104372);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106491, 'Diana', 'Loan Closer', 103291, 104372);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106492, 'Jennifer', 'Manager', 103292, 104373);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106493, 'Shannon', 'Officer', 103293, 104373);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106494, 'Willie', 'Credit Analyst', 103294, 104373);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106495, 'Paul', 'Loan Closer', 103295, 104373);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106496, 'Ryan', 'Manager', 103296, 104374);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106497, 'Rhonda', 'Officer', 103297, 104374);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106498, 'Tracey', 'Credit Analyst', 103298, 104374);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106499, 'Mark', 'Loan Closer', 103299, 104374);
commit;
prompt 1500 records committed...
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106500, 'James', 'Manager', 103300, 104375);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106501, 'Elizabeth', 'Officer', 103301, 104375);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106502, 'Makayla', 'Credit Analyst', 103302, 104375);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106503, 'Michael', 'Loan Closer', 103303, 104375);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106504, 'Ronald', 'Manager', 103304, 104376);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106505, 'Michael', 'Officer', 103305, 104376);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106506, 'Andrew', 'Credit Analyst', 103306, 104376);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106507, 'Melissa', 'Loan Closer', 103307, 104376);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106508, 'Kimberly', 'Manager', 103308, 104377);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106509, 'Paul', 'Officer', 103309, 104377);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106510, 'George', 'Credit Analyst', 103310, 104377);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106511, 'Stephanie', 'Loan Closer', 103311, 104377);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106512, 'Jillian', 'Manager', 103312, 104378);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106513, 'Chad', 'Officer', 103313, 104378);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106514, 'James', 'Credit Analyst', 103314, 104378);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106515, 'Thomas', 'Loan Closer', 103315, 104378);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106516, 'Andre', 'Manager', 103316, 104379);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106517, 'David', 'Officer', 103317, 104379);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106518, 'Joseph', 'Credit Analyst', 103318, 104379);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106519, 'William', 'Loan Closer', 103319, 104379);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106520, 'Edgar', 'Manager', 103320, 104380);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106521, 'Taylor', 'Officer', 103321, 104380);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106522, 'Felicia', 'Credit Analyst', 103322, 104380);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106523, 'James', 'Loan Closer', 103323, 104380);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106524, 'Anna', 'Manager', 103324, 104381);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106525, 'Victoria', 'Officer', 103325, 104381);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106526, 'Brianna', 'Credit Analyst', 103326, 104381);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106527, 'Kimberly', 'Loan Closer', 103327, 104381);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106528, 'Christy', 'Manager', 103328, 104382);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106529, 'Christopher', 'Officer', 103329, 104382);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106530, 'Steven', 'Credit Analyst', 103330, 104382);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106531, 'Joseph', 'Loan Closer', 103331, 104382);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106532, 'Rachel', 'Manager', 103332, 104383);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106533, 'Sarah', 'Officer', 103333, 104383);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106534, 'Scott', 'Credit Analyst', 103334, 104383);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106535, 'Miranda', 'Loan Closer', 103335, 104383);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106536, 'Alexis', 'Manager', 103336, 104384);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106537, 'Ivan', 'Officer', 103337, 104384);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106538, 'John', 'Credit Analyst', 103338, 104384);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106539, 'Patricia', 'Loan Closer', 103339, 104384);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106540, 'Dustin', 'Manager', 103340, 104385);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106541, 'Robert', 'Officer', 103341, 104385);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106542, 'Howard', 'Credit Analyst', 103342, 104385);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106543, 'Barbara', 'Loan Closer', 103343, 104385);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106544, 'Whitney', 'Manager', 103344, 104386);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106545, 'Jessica', 'Officer', 103345, 104386);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106546, 'Deborah', 'Credit Analyst', 103346, 104386);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106547, 'Heather', 'Loan Closer', 103347, 104386);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106548, 'Matthew', 'Manager', 103348, 104387);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106549, 'Joseph', 'Officer', 103349, 104387);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106550, 'Theresa', 'Credit Analyst', 103350, 104387);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106551, 'Taylor', 'Loan Closer', 103351, 104387);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106552, 'Brian', 'Manager', 103352, 104388);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106553, 'Aaron', 'Officer', 103353, 104388);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106554, 'Lauren', 'Credit Analyst', 103354, 104388);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106555, 'Michaela', 'Loan Closer', 103355, 104388);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106556, 'Micheal', 'Manager', 103356, 104389);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106557, 'Eddie', 'Officer', 103357, 104389);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106558, 'John', 'Credit Analyst', 103358, 104389);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106559, 'Daniel', 'Loan Closer', 103359, 104389);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106560, 'Tracy', 'Manager', 103360, 104390);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106561, 'Benjamin', 'Officer', 103361, 104390);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106562, 'Stephanie', 'Credit Analyst', 103362, 104390);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106563, 'Benjamin', 'Loan Closer', 103363, 104390);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106564, 'Julia', 'Manager', 103364, 104391);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106565, 'Rachel', 'Officer', 103365, 104391);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106566, 'Michael', 'Credit Analyst', 103366, 104391);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106567, 'Gina', 'Loan Closer', 103367, 104391);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106568, 'James', 'Manager', 103368, 104392);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106569, 'Cynthia', 'Officer', 103369, 104392);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106570, 'Elizabeth', 'Credit Analyst', 103370, 104392);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106571, 'Kenneth', 'Loan Closer', 103371, 104392);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106572, 'Darrell', 'Manager', 103372, 104393);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106573, 'Michelle', 'Officer', 103373, 104393);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106574, 'Todd', 'Credit Analyst', 103374, 104393);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106575, 'Scott', 'Loan Closer', 103375, 104393);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106576, 'Amanda', 'Manager', 103376, 104394);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106577, 'Linda', 'Officer', 103377, 104394);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106578, 'David', 'Credit Analyst', 103378, 104394);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106579, 'David', 'Loan Closer', 103379, 104394);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106580, 'Michael', 'Manager', 103380, 104395);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106581, 'Lance', 'Officer', 103381, 104395);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106582, 'Gary', 'Credit Analyst', 103382, 104395);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106583, 'Eric', 'Loan Closer', 103383, 104395);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106584, 'Keith', 'Manager', 103384, 104396);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106585, 'Sharon', 'Officer', 103385, 104396);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106586, 'Jennifer', 'Credit Analyst', 103386, 104396);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106587, 'Stephanie', 'Loan Closer', 103387, 104396);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106588, 'Jacob', 'Manager', 103388, 104397);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106589, 'Cynthia', 'Officer', 103389, 104397);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106590, 'Johnny', 'Credit Analyst', 103390, 104397);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106591, 'Christopher', 'Loan Closer', 103391, 104397);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106592, 'Kristin', 'Manager', 103392, 104398);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106593, 'Jamie', 'Officer', 103393, 104398);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106594, 'John', 'Credit Analyst', 103394, 104398);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106595, 'Anthony', 'Loan Closer', 103395, 104398);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106596, 'Kyle', 'Manager', 103396, 104399);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106597, 'Michael', 'Officer', 103397, 104399);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106598, 'Lauren', 'Credit Analyst', 103398, 104399);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106599, 'David', 'Loan Closer', 103399, 104399);
commit;
prompt 1600 records loaded
prompt Enabling foreign key constraints for BRANCHE...
alter table BRANCHE enable constraint SYS_C008788;
prompt Enabling foreign key constraints for CUSTOMERS...
alter table CUSTOMERS enable constraint SYS_C008795;
prompt Enabling foreign key constraints for LOANS...
alter table LOANS enable constraint SYS_C008801;
prompt Enabling foreign key constraints for WORKERS...
alter table WORKERS enable constraint SYS_C008808;
alter table WORKERS enable constraint SYS_C008809;
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

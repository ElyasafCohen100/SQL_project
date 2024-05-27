prompt PL/SQL Developer Export Tables for user SYS@XE
prompt Created by tsuri on Monday, May 27, 2024
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
  customerid INTEGER not null
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
alter table BRANCHE disable constraint SYS_C008662;
prompt Disabling foreign key constraints for CUSTOMERS...
alter table CUSTOMERS disable constraint SYS_C008669;
prompt Disabling foreign key constraints for LOANS...
alter table LOANS disable constraint SYS_C008674;
prompt Disabling foreign key constraints for WORKERS...
alter table WORKERS disable constraint SYS_C008681;
alter table WORKERS disable constraint SYS_C008682;
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
values (102718, 'Michael');
insert into REPORTERS (reporterid, reportername)
values (102901, 'tsuriya');
insert into REPORTERS (reporterid, reportername)
values (102733, 'Phil');
insert into REPORTERS (reporterid, reportername)
values (102850, 'Harry');
insert into REPORTERS (reporterid, reportername)
values (102000, 'Robert');
insert into REPORTERS (reporterid, reportername)
values (102001, 'Phillip');
insert into REPORTERS (reporterid, reportername)
values (102002, 'Jorge');
insert into REPORTERS (reporterid, reportername)
values (102003, 'Joseph');
insert into REPORTERS (reporterid, reportername)
values (102004, 'Ann');
insert into REPORTERS (reporterid, reportername)
values (102005, 'Maria');
insert into REPORTERS (reporterid, reportername)
values (102006, 'Virginia');
insert into REPORTERS (reporterid, reportername)
values (102007, 'James');
insert into REPORTERS (reporterid, reportername)
values (102008, 'Robert');
insert into REPORTERS (reporterid, reportername)
values (102009, 'Amber');
insert into REPORTERS (reporterid, reportername)
values (102010, 'Daniel');
insert into REPORTERS (reporterid, reportername)
values (102011, 'Deanna');
insert into REPORTERS (reporterid, reportername)
values (102012, 'Elijah');
insert into REPORTERS (reporterid, reportername)
values (102013, 'Pamela');
insert into REPORTERS (reporterid, reportername)
values (102014, 'Timothy');
insert into REPORTERS (reporterid, reportername)
values (102015, 'Sheila');
insert into REPORTERS (reporterid, reportername)
values (102016, 'Laura');
insert into REPORTERS (reporterid, reportername)
values (102017, 'Jessica');
insert into REPORTERS (reporterid, reportername)
values (102018, 'Christina');
insert into REPORTERS (reporterid, reportername)
values (102019, 'Crystal');
insert into REPORTERS (reporterid, reportername)
values (102020, 'Erica');
insert into REPORTERS (reporterid, reportername)
values (102021, 'Jay');
insert into REPORTERS (reporterid, reportername)
values (102022, 'Henry');
insert into REPORTERS (reporterid, reportername)
values (102023, 'Henry');
insert into REPORTERS (reporterid, reportername)
values (102024, 'David');
insert into REPORTERS (reporterid, reportername)
values (102025, 'Timothy');
insert into REPORTERS (reporterid, reportername)
values (102026, 'Melissa');
insert into REPORTERS (reporterid, reportername)
values (102027, 'Jessica');
insert into REPORTERS (reporterid, reportername)
values (102028, 'Daniel');
insert into REPORTERS (reporterid, reportername)
values (102029, 'Laura');
insert into REPORTERS (reporterid, reportername)
values (102030, 'Deborah');
insert into REPORTERS (reporterid, reportername)
values (102031, 'Christopher');
insert into REPORTERS (reporterid, reportername)
values (102032, 'Juan');
insert into REPORTERS (reporterid, reportername)
values (102033, 'Angela');
insert into REPORTERS (reporterid, reportername)
values (102034, 'Crystal');
insert into REPORTERS (reporterid, reportername)
values (102035, 'Matthew');
insert into REPORTERS (reporterid, reportername)
values (102036, 'Mark');
insert into REPORTERS (reporterid, reportername)
values (102037, 'Thomas');
insert into REPORTERS (reporterid, reportername)
values (102038, 'Samuel');
insert into REPORTERS (reporterid, reportername)
values (102039, 'Shelia');
insert into REPORTERS (reporterid, reportername)
values (102040, 'Kenneth');
insert into REPORTERS (reporterid, reportername)
values (102041, 'Mary');
insert into REPORTERS (reporterid, reportername)
values (102042, 'David');
insert into REPORTERS (reporterid, reportername)
values (102043, 'Andrew');
insert into REPORTERS (reporterid, reportername)
values (102044, 'Laura');
insert into REPORTERS (reporterid, reportername)
values (102045, 'Rachel');
insert into REPORTERS (reporterid, reportername)
values (102046, 'Tyler');
insert into REPORTERS (reporterid, reportername)
values (102047, 'Joan');
insert into REPORTERS (reporterid, reportername)
values (102048, 'Jose');
insert into REPORTERS (reporterid, reportername)
values (102049, 'Krista');
insert into REPORTERS (reporterid, reportername)
values (102050, 'Michael');
insert into REPORTERS (reporterid, reportername)
values (102051, 'Henry');
insert into REPORTERS (reporterid, reportername)
values (102052, 'Betty');
insert into REPORTERS (reporterid, reportername)
values (102053, 'Jason');
insert into REPORTERS (reporterid, reportername)
values (102054, 'Tara');
insert into REPORTERS (reporterid, reportername)
values (102055, 'Robert');
insert into REPORTERS (reporterid, reportername)
values (102056, 'Mary');
insert into REPORTERS (reporterid, reportername)
values (102057, 'Richard');
insert into REPORTERS (reporterid, reportername)
values (102058, 'Heidi');
insert into REPORTERS (reporterid, reportername)
values (102059, 'Linda');
insert into REPORTERS (reporterid, reportername)
values (102060, 'Luis');
insert into REPORTERS (reporterid, reportername)
values (102061, 'Chloe');
insert into REPORTERS (reporterid, reportername)
values (102062, 'Jasmine');
insert into REPORTERS (reporterid, reportername)
values (102063, 'Savannah');
insert into REPORTERS (reporterid, reportername)
values (102064, 'Gina');
insert into REPORTERS (reporterid, reportername)
values (102065, 'Jill');
insert into REPORTERS (reporterid, reportername)
values (102066, 'Anne');
insert into REPORTERS (reporterid, reportername)
values (102067, 'Calvin');
insert into REPORTERS (reporterid, reportername)
values (102068, 'Erik');
insert into REPORTERS (reporterid, reportername)
values (102069, 'Steven');
insert into REPORTERS (reporterid, reportername)
values (102070, 'Kim');
insert into REPORTERS (reporterid, reportername)
values (102071, 'Nicole');
insert into REPORTERS (reporterid, reportername)
values (102072, 'Kyle');
insert into REPORTERS (reporterid, reportername)
values (102073, 'Marc');
insert into REPORTERS (reporterid, reportername)
values (102074, 'Sharon');
insert into REPORTERS (reporterid, reportername)
values (102075, 'Adrian');
insert into REPORTERS (reporterid, reportername)
values (102076, 'Leonard');
insert into REPORTERS (reporterid, reportername)
values (102077, 'Robert');
insert into REPORTERS (reporterid, reportername)
values (102078, 'Sylvia');
insert into REPORTERS (reporterid, reportername)
values (102079, 'Tiffany');
insert into REPORTERS (reporterid, reportername)
values (102080, 'Alexis');
insert into REPORTERS (reporterid, reportername)
values (102081, 'Michael');
insert into REPORTERS (reporterid, reportername)
values (102082, 'Megan');
insert into REPORTERS (reporterid, reportername)
values (102083, 'Michael');
insert into REPORTERS (reporterid, reportername)
values (102084, 'Cheryl');
insert into REPORTERS (reporterid, reportername)
values (102085, 'William');
insert into REPORTERS (reporterid, reportername)
values (102086, 'Christina');
insert into REPORTERS (reporterid, reportername)
values (102087, 'Samantha');
insert into REPORTERS (reporterid, reportername)
values (102088, 'Sean');
insert into REPORTERS (reporterid, reportername)
values (102089, 'Whitney');
insert into REPORTERS (reporterid, reportername)
values (102090, 'Ashley');
insert into REPORTERS (reporterid, reportername)
values (102091, 'Shelby');
insert into REPORTERS (reporterid, reportername)
values (102092, 'Kathryn');
insert into REPORTERS (reporterid, reportername)
values (102093, 'Chris');
insert into REPORTERS (reporterid, reportername)
values (102094, 'Chad');
insert into REPORTERS (reporterid, reportername)
values (102095, 'James');
commit;
prompt 100 records committed...
insert into REPORTERS (reporterid, reportername)
values (102096, 'Tyrone');
insert into REPORTERS (reporterid, reportername)
values (102097, 'Edwin');
insert into REPORTERS (reporterid, reportername)
values (102098, 'Douglas');
insert into REPORTERS (reporterid, reportername)
values (102099, 'William');
insert into REPORTERS (reporterid, reportername)
values (102100, 'Richard');
insert into REPORTERS (reporterid, reportername)
values (102101, 'Cody');
insert into REPORTERS (reporterid, reportername)
values (102102, 'April');
insert into REPORTERS (reporterid, reportername)
values (102103, 'Kyle');
insert into REPORTERS (reporterid, reportername)
values (102104, 'David');
insert into REPORTERS (reporterid, reportername)
values (102105, 'Stefanie');
insert into REPORTERS (reporterid, reportername)
values (102106, 'Tanya');
insert into REPORTERS (reporterid, reportername)
values (102107, 'Justin');
insert into REPORTERS (reporterid, reportername)
values (102108, 'Tiffany');
insert into REPORTERS (reporterid, reportername)
values (102109, 'April');
insert into REPORTERS (reporterid, reportername)
values (102110, 'Melinda');
insert into REPORTERS (reporterid, reportername)
values (102111, 'Megan');
insert into REPORTERS (reporterid, reportername)
values (102112, 'Joe');
insert into REPORTERS (reporterid, reportername)
values (102113, 'Rebecca');
insert into REPORTERS (reporterid, reportername)
values (102114, 'Zachary');
insert into REPORTERS (reporterid, reportername)
values (102115, 'Paula');
insert into REPORTERS (reporterid, reportername)
values (102116, 'Emily');
insert into REPORTERS (reporterid, reportername)
values (102117, 'Jacob');
insert into REPORTERS (reporterid, reportername)
values (102118, 'Carlos');
insert into REPORTERS (reporterid, reportername)
values (102119, 'Shelia');
insert into REPORTERS (reporterid, reportername)
values (102120, 'Dustin');
insert into REPORTERS (reporterid, reportername)
values (102121, 'William');
insert into REPORTERS (reporterid, reportername)
values (102122, 'Madison');
insert into REPORTERS (reporterid, reportername)
values (102123, 'Lindsey');
insert into REPORTERS (reporterid, reportername)
values (102124, 'Colleen');
insert into REPORTERS (reporterid, reportername)
values (102125, 'Chad');
insert into REPORTERS (reporterid, reportername)
values (102126, 'Hannah');
insert into REPORTERS (reporterid, reportername)
values (102127, 'Richard');
insert into REPORTERS (reporterid, reportername)
values (102128, 'Robert');
insert into REPORTERS (reporterid, reportername)
values (102129, 'Jordan');
insert into REPORTERS (reporterid, reportername)
values (102130, 'Hailey');
insert into REPORTERS (reporterid, reportername)
values (102131, 'Amanda');
insert into REPORTERS (reporterid, reportername)
values (102132, 'Lisa');
insert into REPORTERS (reporterid, reportername)
values (102133, 'Rodney');
insert into REPORTERS (reporterid, reportername)
values (102134, 'Michele');
insert into REPORTERS (reporterid, reportername)
values (102135, 'Benjamin');
insert into REPORTERS (reporterid, reportername)
values (102136, 'Steven');
insert into REPORTERS (reporterid, reportername)
values (102137, 'Alexandra');
insert into REPORTERS (reporterid, reportername)
values (102138, 'Paul');
insert into REPORTERS (reporterid, reportername)
values (102139, 'Amber');
insert into REPORTERS (reporterid, reportername)
values (102140, 'Steven');
insert into REPORTERS (reporterid, reportername)
values (102141, 'Emily');
insert into REPORTERS (reporterid, reportername)
values (102142, 'Jennifer');
insert into REPORTERS (reporterid, reportername)
values (102143, 'Michelle');
insert into REPORTERS (reporterid, reportername)
values (102144, 'William');
insert into REPORTERS (reporterid, reportername)
values (102145, 'John');
insert into REPORTERS (reporterid, reportername)
values (102146, 'Steven');
insert into REPORTERS (reporterid, reportername)
values (102147, 'Jennifer');
insert into REPORTERS (reporterid, reportername)
values (102148, 'Melissa');
insert into REPORTERS (reporterid, reportername)
values (102149, 'Denise');
insert into REPORTERS (reporterid, reportername)
values (102150, 'Thomas');
insert into REPORTERS (reporterid, reportername)
values (102151, 'William');
insert into REPORTERS (reporterid, reportername)
values (102152, 'Amber');
insert into REPORTERS (reporterid, reportername)
values (102153, 'Christopher');
insert into REPORTERS (reporterid, reportername)
values (102154, 'David');
insert into REPORTERS (reporterid, reportername)
values (102155, 'Jennifer');
insert into REPORTERS (reporterid, reportername)
values (102156, 'John');
insert into REPORTERS (reporterid, reportername)
values (102157, 'Cody');
insert into REPORTERS (reporterid, reportername)
values (102158, 'Kathryn');
insert into REPORTERS (reporterid, reportername)
values (102159, 'Brian');
insert into REPORTERS (reporterid, reportername)
values (102160, 'Peter');
insert into REPORTERS (reporterid, reportername)
values (102161, 'Bruce');
insert into REPORTERS (reporterid, reportername)
values (102162, 'Jeremy');
insert into REPORTERS (reporterid, reportername)
values (102163, 'Sandra');
insert into REPORTERS (reporterid, reportername)
values (102164, 'Jacqueline');
insert into REPORTERS (reporterid, reportername)
values (102165, 'Elizabeth');
insert into REPORTERS (reporterid, reportername)
values (102166, 'Gregory');
insert into REPORTERS (reporterid, reportername)
values (102167, 'Teresa');
insert into REPORTERS (reporterid, reportername)
values (102168, 'Michael');
insert into REPORTERS (reporterid, reportername)
values (102169, 'Frederick');
insert into REPORTERS (reporterid, reportername)
values (102170, 'Cynthia');
insert into REPORTERS (reporterid, reportername)
values (102171, 'Lorraine');
insert into REPORTERS (reporterid, reportername)
values (102172, 'Marcia');
insert into REPORTERS (reporterid, reportername)
values (102173, 'Barry');
insert into REPORTERS (reporterid, reportername)
values (102174, 'Melissa');
insert into REPORTERS (reporterid, reportername)
values (102175, 'Jennifer');
insert into REPORTERS (reporterid, reportername)
values (102176, 'Gregory');
insert into REPORTERS (reporterid, reportername)
values (102177, 'Christine');
insert into REPORTERS (reporterid, reportername)
values (102178, 'Ricky');
insert into REPORTERS (reporterid, reportername)
values (102179, 'Thomas');
insert into REPORTERS (reporterid, reportername)
values (102180, 'Daniel');
insert into REPORTERS (reporterid, reportername)
values (102181, 'Christopher');
insert into REPORTERS (reporterid, reportername)
values (102182, 'Bryan');
insert into REPORTERS (reporterid, reportername)
values (102183, 'Michele');
insert into REPORTERS (reporterid, reportername)
values (102184, 'Hayden');
insert into REPORTERS (reporterid, reportername)
values (102185, 'John');
insert into REPORTERS (reporterid, reportername)
values (102186, 'Robin');
insert into REPORTERS (reporterid, reportername)
values (102187, 'John');
insert into REPORTERS (reporterid, reportername)
values (102188, 'Stacey');
insert into REPORTERS (reporterid, reportername)
values (102189, 'Michael');
insert into REPORTERS (reporterid, reportername)
values (102190, 'Jennifer');
insert into REPORTERS (reporterid, reportername)
values (102191, 'Ashley');
insert into REPORTERS (reporterid, reportername)
values (102192, 'Tami');
insert into REPORTERS (reporterid, reportername)
values (102193, 'Wayne');
insert into REPORTERS (reporterid, reportername)
values (102194, 'Kevin');
insert into REPORTERS (reporterid, reportername)
values (102195, 'Cory');
commit;
prompt 200 records committed...
insert into REPORTERS (reporterid, reportername)
values (102196, 'Thomas');
insert into REPORTERS (reporterid, reportername)
values (102197, 'Brian');
insert into REPORTERS (reporterid, reportername)
values (102198, 'Lori');
insert into REPORTERS (reporterid, reportername)
values (102199, 'Chase');
insert into REPORTERS (reporterid, reportername)
values (102200, 'Alyssa');
insert into REPORTERS (reporterid, reportername)
values (102201, 'Ruth');
insert into REPORTERS (reporterid, reportername)
values (102202, 'Amanda');
insert into REPORTERS (reporterid, reportername)
values (102203, 'Alyssa');
insert into REPORTERS (reporterid, reportername)
values (102204, 'Omar');
insert into REPORTERS (reporterid, reportername)
values (102205, 'Joanne');
insert into REPORTERS (reporterid, reportername)
values (102206, 'Jaclyn');
insert into REPORTERS (reporterid, reportername)
values (102207, 'Samuel');
insert into REPORTERS (reporterid, reportername)
values (102208, 'Steven');
insert into REPORTERS (reporterid, reportername)
values (102209, 'Mark');
insert into REPORTERS (reporterid, reportername)
values (102210, 'Charlotte');
insert into REPORTERS (reporterid, reportername)
values (102211, 'James');
insert into REPORTERS (reporterid, reportername)
values (102212, 'Stacy');
insert into REPORTERS (reporterid, reportername)
values (102213, 'Steven');
insert into REPORTERS (reporterid, reportername)
values (102214, 'Jennifer');
insert into REPORTERS (reporterid, reportername)
values (102215, 'Jason');
insert into REPORTERS (reporterid, reportername)
values (102216, 'Justin');
insert into REPORTERS (reporterid, reportername)
values (102217, 'Rose');
insert into REPORTERS (reporterid, reportername)
values (102218, 'Gina');
insert into REPORTERS (reporterid, reportername)
values (102219, 'Rachel');
insert into REPORTERS (reporterid, reportername)
values (102220, 'William');
insert into REPORTERS (reporterid, reportername)
values (102221, 'Stefanie');
insert into REPORTERS (reporterid, reportername)
values (102222, 'Michael');
insert into REPORTERS (reporterid, reportername)
values (102223, 'Henry');
insert into REPORTERS (reporterid, reportername)
values (102224, 'Ronald');
insert into REPORTERS (reporterid, reportername)
values (102225, 'Christopher');
insert into REPORTERS (reporterid, reportername)
values (102226, 'David');
insert into REPORTERS (reporterid, reportername)
values (102227, 'Samuel');
insert into REPORTERS (reporterid, reportername)
values (102228, 'Laura');
insert into REPORTERS (reporterid, reportername)
values (102229, 'James');
insert into REPORTERS (reporterid, reportername)
values (102230, 'James');
insert into REPORTERS (reporterid, reportername)
values (102231, 'Steven');
insert into REPORTERS (reporterid, reportername)
values (102232, 'Matthew');
insert into REPORTERS (reporterid, reportername)
values (102233, 'Brianna');
insert into REPORTERS (reporterid, reportername)
values (102234, 'Wesley');
insert into REPORTERS (reporterid, reportername)
values (102235, 'Kurt');
insert into REPORTERS (reporterid, reportername)
values (102236, 'Roberta');
insert into REPORTERS (reporterid, reportername)
values (102237, 'Anita');
insert into REPORTERS (reporterid, reportername)
values (102238, 'Matthew');
insert into REPORTERS (reporterid, reportername)
values (102239, 'Kelly');
insert into REPORTERS (reporterid, reportername)
values (102240, 'Dylan');
insert into REPORTERS (reporterid, reportername)
values (102241, 'Dennis');
insert into REPORTERS (reporterid, reportername)
values (102242, 'Eric');
insert into REPORTERS (reporterid, reportername)
values (102243, 'Amy');
insert into REPORTERS (reporterid, reportername)
values (102244, 'Jorge');
insert into REPORTERS (reporterid, reportername)
values (102245, 'Thomas');
insert into REPORTERS (reporterid, reportername)
values (102246, 'Kathleen');
insert into REPORTERS (reporterid, reportername)
values (102247, 'Lisa');
insert into REPORTERS (reporterid, reportername)
values (102248, 'Victoria');
insert into REPORTERS (reporterid, reportername)
values (102249, 'Thomas');
insert into REPORTERS (reporterid, reportername)
values (102250, 'Harry');
insert into REPORTERS (reporterid, reportername)
values (102251, 'Nathan');
insert into REPORTERS (reporterid, reportername)
values (102252, 'Jennifer');
insert into REPORTERS (reporterid, reportername)
values (102253, 'Kim');
insert into REPORTERS (reporterid, reportername)
values (102254, 'Robert');
insert into REPORTERS (reporterid, reportername)
values (102255, 'Kim');
insert into REPORTERS (reporterid, reportername)
values (102256, 'Paula');
insert into REPORTERS (reporterid, reportername)
values (102257, 'Russell');
insert into REPORTERS (reporterid, reportername)
values (102258, 'William');
insert into REPORTERS (reporterid, reportername)
values (102259, 'Lisa');
insert into REPORTERS (reporterid, reportername)
values (102260, 'Doris');
insert into REPORTERS (reporterid, reportername)
values (102261, 'James');
insert into REPORTERS (reporterid, reportername)
values (102262, 'Steven');
insert into REPORTERS (reporterid, reportername)
values (102263, 'Linda');
insert into REPORTERS (reporterid, reportername)
values (102264, 'Chelsea');
insert into REPORTERS (reporterid, reportername)
values (102265, 'Carlos');
insert into REPORTERS (reporterid, reportername)
values (102266, 'Shannon');
insert into REPORTERS (reporterid, reportername)
values (102267, 'Jose');
insert into REPORTERS (reporterid, reportername)
values (102268, 'Kelsey');
insert into REPORTERS (reporterid, reportername)
values (102269, 'Melissa');
insert into REPORTERS (reporterid, reportername)
values (102270, 'Brittney');
insert into REPORTERS (reporterid, reportername)
values (102271, 'Melanie');
insert into REPORTERS (reporterid, reportername)
values (102272, 'Natasha');
insert into REPORTERS (reporterid, reportername)
values (102273, 'Dustin');
insert into REPORTERS (reporterid, reportername)
values (102274, 'Cassie');
insert into REPORTERS (reporterid, reportername)
values (102275, 'Victor');
insert into REPORTERS (reporterid, reportername)
values (102276, 'Stacy');
insert into REPORTERS (reporterid, reportername)
values (102277, 'Robert');
insert into REPORTERS (reporterid, reportername)
values (102278, 'Amy');
insert into REPORTERS (reporterid, reportername)
values (102279, 'Trevor');
insert into REPORTERS (reporterid, reportername)
values (102280, 'Veronica');
insert into REPORTERS (reporterid, reportername)
values (102281, 'Amy');
insert into REPORTERS (reporterid, reportername)
values (102282, 'Aimee');
insert into REPORTERS (reporterid, reportername)
values (102283, 'Michelle');
insert into REPORTERS (reporterid, reportername)
values (102284, 'Melissa');
insert into REPORTERS (reporterid, reportername)
values (102285, 'Michele');
insert into REPORTERS (reporterid, reportername)
values (102286, 'Jared');
insert into REPORTERS (reporterid, reportername)
values (102287, 'Ray');
insert into REPORTERS (reporterid, reportername)
values (102288, 'Daniel');
insert into REPORTERS (reporterid, reportername)
values (102289, 'Jake');
insert into REPORTERS (reporterid, reportername)
values (102290, 'Bradley');
insert into REPORTERS (reporterid, reportername)
values (102291, 'Sherry');
insert into REPORTERS (reporterid, reportername)
values (102292, 'Michael');
insert into REPORTERS (reporterid, reportername)
values (102293, 'Diane');
insert into REPORTERS (reporterid, reportername)
values (102294, 'Tina');
insert into REPORTERS (reporterid, reportername)
values (102295, 'Kimberly');
commit;
prompt 300 records committed...
insert into REPORTERS (reporterid, reportername)
values (102296, 'Andrew');
insert into REPORTERS (reporterid, reportername)
values (102297, 'Michael');
insert into REPORTERS (reporterid, reportername)
values (102298, 'Anne');
insert into REPORTERS (reporterid, reportername)
values (102299, 'Stefanie');
insert into REPORTERS (reporterid, reportername)
values (102300, 'Sabrina');
insert into REPORTERS (reporterid, reportername)
values (102301, 'Brian');
insert into REPORTERS (reporterid, reportername)
values (102302, 'Tammy');
insert into REPORTERS (reporterid, reportername)
values (102303, 'Kevin');
insert into REPORTERS (reporterid, reportername)
values (102304, 'Tonya');
insert into REPORTERS (reporterid, reportername)
values (102305, 'Kimberly');
insert into REPORTERS (reporterid, reportername)
values (102306, 'Thomas');
insert into REPORTERS (reporterid, reportername)
values (102307, 'Mary');
insert into REPORTERS (reporterid, reportername)
values (102308, 'Christine');
insert into REPORTERS (reporterid, reportername)
values (102309, 'Brenda');
insert into REPORTERS (reporterid, reportername)
values (102310, 'Elizabeth');
insert into REPORTERS (reporterid, reportername)
values (102311, 'Tristan');
insert into REPORTERS (reporterid, reportername)
values (102312, 'Erika');
insert into REPORTERS (reporterid, reportername)
values (102313, 'Tyler');
insert into REPORTERS (reporterid, reportername)
values (102314, 'James');
insert into REPORTERS (reporterid, reportername)
values (102315, 'Michelle');
insert into REPORTERS (reporterid, reportername)
values (102316, 'Michelle');
insert into REPORTERS (reporterid, reportername)
values (102317, 'George');
insert into REPORTERS (reporterid, reportername)
values (102318, 'Scott');
insert into REPORTERS (reporterid, reportername)
values (102319, 'Phillip');
insert into REPORTERS (reporterid, reportername)
values (102320, 'Deborah');
insert into REPORTERS (reporterid, reportername)
values (102321, 'Stephanie');
insert into REPORTERS (reporterid, reportername)
values (102322, 'Jodi');
insert into REPORTERS (reporterid, reportername)
values (102323, 'Michael');
insert into REPORTERS (reporterid, reportername)
values (102324, 'William');
insert into REPORTERS (reporterid, reportername)
values (102325, 'James');
insert into REPORTERS (reporterid, reportername)
values (102326, 'Ryan');
insert into REPORTERS (reporterid, reportername)
values (102327, 'Brianna');
insert into REPORTERS (reporterid, reportername)
values (102328, 'William');
insert into REPORTERS (reporterid, reportername)
values (102329, 'Brandon');
insert into REPORTERS (reporterid, reportername)
values (102330, 'Sandra');
insert into REPORTERS (reporterid, reportername)
values (102331, 'William');
insert into REPORTERS (reporterid, reportername)
values (102332, 'Debbie');
insert into REPORTERS (reporterid, reportername)
values (102333, 'Brian');
insert into REPORTERS (reporterid, reportername)
values (102334, 'Abigail');
insert into REPORTERS (reporterid, reportername)
values (102335, 'Kristin');
insert into REPORTERS (reporterid, reportername)
values (102336, 'Rita');
insert into REPORTERS (reporterid, reportername)
values (102337, 'Brian');
insert into REPORTERS (reporterid, reportername)
values (102338, 'Patrick');
insert into REPORTERS (reporterid, reportername)
values (102339, 'Jonathan');
insert into REPORTERS (reporterid, reportername)
values (102340, 'Troy');
insert into REPORTERS (reporterid, reportername)
values (102341, 'Jared');
insert into REPORTERS (reporterid, reportername)
values (102342, 'Beth');
insert into REPORTERS (reporterid, reportername)
values (102343, 'Jennifer');
insert into REPORTERS (reporterid, reportername)
values (102344, 'Samuel');
insert into REPORTERS (reporterid, reportername)
values (102345, 'Heather');
insert into REPORTERS (reporterid, reportername)
values (102346, 'Dennis');
insert into REPORTERS (reporterid, reportername)
values (102347, 'Jeremy');
insert into REPORTERS (reporterid, reportername)
values (102348, 'Michael');
insert into REPORTERS (reporterid, reportername)
values (102349, 'Christopher');
insert into REPORTERS (reporterid, reportername)
values (102350, 'Aaron');
insert into REPORTERS (reporterid, reportername)
values (102351, 'Melissa');
insert into REPORTERS (reporterid, reportername)
values (102352, 'Carol');
insert into REPORTERS (reporterid, reportername)
values (102353, 'Angela');
insert into REPORTERS (reporterid, reportername)
values (102354, 'Seth');
insert into REPORTERS (reporterid, reportername)
values (102355, 'Andrea');
insert into REPORTERS (reporterid, reportername)
values (102356, 'David');
insert into REPORTERS (reporterid, reportername)
values (102357, 'Jose');
insert into REPORTERS (reporterid, reportername)
values (102358, 'Benjamin');
insert into REPORTERS (reporterid, reportername)
values (102359, 'Cory');
insert into REPORTERS (reporterid, reportername)
values (102360, 'Jacob');
insert into REPORTERS (reporterid, reportername)
values (102361, 'Jacqueline');
insert into REPORTERS (reporterid, reportername)
values (102362, 'Samantha');
insert into REPORTERS (reporterid, reportername)
values (102363, 'Linda');
insert into REPORTERS (reporterid, reportername)
values (102364, 'Catherine');
insert into REPORTERS (reporterid, reportername)
values (102365, 'Megan');
insert into REPORTERS (reporterid, reportername)
values (102366, 'Zachary');
insert into REPORTERS (reporterid, reportername)
values (102367, 'Joanna');
insert into REPORTERS (reporterid, reportername)
values (102368, 'Tammy');
insert into REPORTERS (reporterid, reportername)
values (102369, 'Crystal');
insert into REPORTERS (reporterid, reportername)
values (102370, 'Sarah');
insert into REPORTERS (reporterid, reportername)
values (102371, 'Jacob');
insert into REPORTERS (reporterid, reportername)
values (102372, 'Nicholas');
insert into REPORTERS (reporterid, reportername)
values (102373, 'Barbara');
insert into REPORTERS (reporterid, reportername)
values (102374, 'Steven');
insert into REPORTERS (reporterid, reportername)
values (102375, 'Mason');
insert into REPORTERS (reporterid, reportername)
values (102376, 'Luke');
insert into REPORTERS (reporterid, reportername)
values (102377, 'Dominique');
insert into REPORTERS (reporterid, reportername)
values (102378, 'Jamie');
insert into REPORTERS (reporterid, reportername)
values (102379, 'Jose');
insert into REPORTERS (reporterid, reportername)
values (102380, 'Cassandra');
insert into REPORTERS (reporterid, reportername)
values (102381, 'Christine');
insert into REPORTERS (reporterid, reportername)
values (102382, 'Kim');
insert into REPORTERS (reporterid, reportername)
values (102383, 'Susan');
insert into REPORTERS (reporterid, reportername)
values (102384, 'Stephen');
insert into REPORTERS (reporterid, reportername)
values (102385, 'Angel');
insert into REPORTERS (reporterid, reportername)
values (102386, 'Brittany');
insert into REPORTERS (reporterid, reportername)
values (102387, 'Andrew');
insert into REPORTERS (reporterid, reportername)
values (102388, 'Amanda');
insert into REPORTERS (reporterid, reportername)
values (102389, 'Brandy');
insert into REPORTERS (reporterid, reportername)
values (102390, 'Benjamin');
insert into REPORTERS (reporterid, reportername)
values (102391, 'Daniel');
insert into REPORTERS (reporterid, reportername)
values (102392, 'Jonathan');
insert into REPORTERS (reporterid, reportername)
values (102393, 'Donna');
insert into REPORTERS (reporterid, reportername)
values (102394, 'Gary');
insert into REPORTERS (reporterid, reportername)
values (102395, 'Michael');
commit;
prompt 400 records committed...
insert into REPORTERS (reporterid, reportername)
values (102396, 'Michael');
insert into REPORTERS (reporterid, reportername)
values (102397, 'Patrick');
insert into REPORTERS (reporterid, reportername)
values (102398, 'Hunter');
insert into REPORTERS (reporterid, reportername)
values (102399, 'Samantha');
commit;
prompt 404 records loaded
prompt Loading BRANCHE...
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103401, 'Jacksonville', 102718, to_date('24-07-2006', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103000, 'Port Angelahaven', 102000, to_date('05-11-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103001, 'Port Kara', 102001, to_date('04-07-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103002, 'Simonland', 102002, to_date('02-03-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103003, 'Sharonland', 102003, to_date('14-05-2024', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103004, 'Haroldton', 102004, to_date('15-05-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103005, 'Lake Emily', 102005, to_date('12-05-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103006, 'New Bryan', 102006, to_date('28-11-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103007, 'East Scott', 102007, to_date('18-05-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103008, 'Marciamouth', 102008, to_date('08-02-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103009, 'North Teresa', 102009, to_date('20-05-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103010, 'West Robert', 102010, to_date('18-10-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103011, 'Lake Candice', 102011, to_date('19-08-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103012, 'East Steventon', 102012, to_date('15-04-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103013, 'Frankfort', 102013, to_date('28-03-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103014, 'Larsenstad', 102014, to_date('16-05-2024', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103015, 'North Kristenchester', 102015, to_date('18-06-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103016, 'Mclaughlinberg', 102016, to_date('12-03-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103017, 'North Matthew', 102017, to_date('12-09-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103018, 'Collinmouth', 102018, to_date('04-02-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103019, 'Port Amandaberg', 102019, to_date('27-06-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103020, 'Hamptonview', 102020, to_date('28-05-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103021, 'Sanchezstad', 102021, to_date('09-07-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103022, 'South Luis', 102022, to_date('13-10-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103023, 'Alexiston', 102023, to_date('24-09-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103024, 'Lake Daniel', 102024, to_date('31-03-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103025, 'New David', 102025, to_date('22-06-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103026, 'North Arielfurt', 102026, to_date('18-04-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103027, 'Leahland', 102027, to_date('22-01-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103028, 'East Jonathanmouth', 102028, to_date('08-02-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103029, 'Wilsonmouth', 102029, to_date('19-10-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103030, 'New Erica', 102030, to_date('01-07-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103031, 'New Patricia', 102031, to_date('19-09-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103032, 'Cobbport', 102032, to_date('07-02-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103033, 'New Victorshire', 102033, to_date('17-12-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103034, 'West Josemouth', 102034, to_date('15-11-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103035, 'South Reginald', 102035, to_date('07-02-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103036, 'Lake Beverly', 102036, to_date('03-06-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103037, 'North Christy', 102037, to_date('07-06-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103038, 'Sandraberg', 102038, to_date('07-12-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103039, 'Josephstad', 102039, to_date('09-12-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103040, 'New Kevin', 102040, to_date('15-07-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103041, 'Port Jessicaton', 102041, to_date('03-03-2024', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103042, 'West Luisfort', 102042, to_date('01-11-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103043, 'East Patricialand', 102043, to_date('02-04-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103044, 'Jacobsbury', 102044, to_date('21-07-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103045, 'Romerobury', 102045, to_date('16-12-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103046, 'New Monica', 102046, to_date('21-09-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103047, 'West Stuart', 102047, to_date('25-03-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103048, 'Butlermouth', 102048, to_date('30-05-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103049, 'West Sherry', 102049, to_date('28-04-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103050, 'Lake Sharonville', 102050, to_date('12-11-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103051, 'Rodriguezchester', 102051, to_date('01-08-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103052, 'North Amanda', 102052, to_date('20-03-2024', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103053, 'Wongbury', 102053, to_date('01-10-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103054, 'West Angela', 102054, to_date('20-07-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103055, 'Vickiside', 102055, to_date('22-07-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103056, 'Walkerville', 102056, to_date('01-01-2024', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103057, 'Mullinsstad', 102057, to_date('20-02-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103058, 'Padillaborough', 102058, to_date('03-04-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103059, 'Port Jaredshire', 102059, to_date('25-06-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103060, 'South Kylefurt', 102060, to_date('28-06-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103061, 'Wilkersonhaven', 102061, to_date('17-10-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103062, 'West Kaylachester', 102062, to_date('21-01-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103063, 'Matthewmouth', 102063, to_date('23-04-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103064, 'Joannaville', 102064, to_date('03-02-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103065, 'Ryanborough', 102065, to_date('08-05-2024', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103066, 'Thompsonbury', 102066, to_date('28-05-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103067, 'Morrisonside', 102067, to_date('12-08-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103068, 'Josephport', 102068, to_date('07-12-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103069, 'Taraview', 102069, to_date('20-03-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103070, 'East Jocelyn', 102070, to_date('22-02-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103071, 'South Randall', 102071, to_date('24-04-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103072, 'Perkinschester', 102072, to_date('23-05-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103073, 'South Bethany', 102073, to_date('04-06-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103074, 'Dennisshire', 102074, to_date('03-08-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103075, 'Port Paul', 102075, to_date('04-11-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103076, 'Jonesville', 102076, to_date('26-07-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103077, 'Shawside', 102077, to_date('26-02-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103078, 'New Sethfurt', 102078, to_date('20-05-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103079, 'Gallaghershire', 102079, to_date('22-06-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103080, 'West Katelyn', 102080, to_date('26-12-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103081, 'Juliaside', 102081, to_date('15-06-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103082, 'Port Bryanfurt', 102082, to_date('01-04-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103083, 'North Cassandrabury', 102083, to_date('06-01-2024', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103084, 'West Christinamouth', 102084, to_date('14-11-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103085, 'South Leehaven', 102085, to_date('25-07-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103086, 'East Erinchester', 102086, to_date('30-06-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103087, 'Gregoryfurt', 102087, to_date('29-06-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103088, 'North Michaelside', 102088, to_date('03-02-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103089, 'Jocelynchester', 102089, to_date('26-05-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103090, 'West Sarahaven', 102090, to_date('23-03-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103091, 'East Tammyburgh', 102091, to_date('10-09-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103092, 'Isaiahville', 102092, to_date('03-01-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103093, 'North Sergioberg', 102093, to_date('14-01-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103094, 'Maryborough', 102094, to_date('27-10-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103095, 'Bakerburgh', 102095, to_date('23-09-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103096, 'Ruizmouth', 102096, to_date('14-03-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103097, 'Heatherberg', 102097, to_date('09-06-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103098, 'North Morganland', 102098, to_date('06-09-2020', 'dd-mm-yyyy'));
commit;
prompt 100 records committed...
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103099, 'New Craig', 102099, to_date('12-01-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103100, 'Castilloland', 102100, to_date('31-03-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103101, 'Manningberg', 102101, to_date('29-04-2024', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103102, 'New Harry', 102102, to_date('24-01-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103103, 'Lake Rebecca', 102103, to_date('07-07-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103104, 'South Carrieview', 102104, to_date('22-05-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103105, 'Port Wesley', 102105, to_date('17-05-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103106, 'South Kathrynport', 102106, to_date('03-12-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103107, 'East Michellemouth', 102107, to_date('04-05-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103108, 'Bruceberg', 102108, to_date('10-01-2024', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103109, 'Fostermouth', 102109, to_date('25-07-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103110, 'West Sarahfort', 102110, to_date('16-04-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103111, 'North Shawnside', 102111, to_date('18-10-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103112, 'Nancyfort', 102112, to_date('09-10-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103113, 'Christieland', 102113, to_date('18-03-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103114, 'Cherylstad', 102114, to_date('20-02-2024', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103115, 'New Danielle', 102115, to_date('18-05-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103116, 'North Andreastad', 102116, to_date('07-05-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103117, 'Emilymouth', 102117, to_date('02-01-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103118, 'East Tracy', 102118, to_date('07-01-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103119, 'Lake Lindseyside', 102119, to_date('20-03-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103120, 'Larryborough', 102120, to_date('13-03-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103121, 'Port Elizabethberg', 102121, to_date('24-02-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103122, 'Kristophermouth', 102122, to_date('25-12-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103123, 'Jeffreymouth', 102123, to_date('20-01-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103124, 'Gainestown', 102124, to_date('21-09-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103125, 'Port Dennis', 102125, to_date('04-08-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103126, 'Mcgeetown', 102126, to_date('25-05-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103127, 'Port Angela', 102127, to_date('12-11-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103128, 'Ricardoborough', 102128, to_date('04-09-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103129, 'Port Debbiestad', 102129, to_date('30-07-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103130, 'Evelynmouth', 102130, to_date('04-06-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103131, 'Christopherland', 102131, to_date('17-02-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103132, 'Aprilmouth', 102132, to_date('03-10-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103133, 'Brittneyshire', 102133, to_date('30-07-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103134, 'New Jonfurt', 102134, to_date('07-02-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103135, 'North Williamside', 102135, to_date('10-10-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103136, 'Brownmouth', 102136, to_date('12-11-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103137, 'Michaelland', 102137, to_date('02-10-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103138, 'Leonmouth', 102138, to_date('12-02-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103139, 'North Ronald', 102139, to_date('07-01-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103140, 'Carrieport', 102140, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103141, 'Lake Paulshire', 102141, to_date('14-02-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103142, 'South Kimberlyport', 102142, to_date('15-11-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103143, 'East Ginamouth', 102143, to_date('08-03-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103144, 'Brandyshire', 102144, to_date('15-11-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103145, 'New Adam', 102145, to_date('26-03-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103146, 'Rhondamouth', 102146, to_date('18-05-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103147, 'Boydmouth', 102147, to_date('04-12-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103148, 'Larahaven', 102148, to_date('17-06-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103149, 'Debbieshire', 102149, to_date('08-08-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103150, 'Port Thomas', 102150, to_date('17-03-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103151, 'Morenoton', 102151, to_date('22-01-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103152, 'Port Darrylberg', 102152, to_date('22-04-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103153, 'Matthewsport', 102153, to_date('21-07-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103154, 'Jacksonland', 102154, to_date('16-05-2024', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103155, 'Meganland', 102155, to_date('24-04-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103156, 'West Steventon', 102156, to_date('15-03-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103157, 'Jamesport', 102157, to_date('17-05-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103158, 'Port Markfurt', 102158, to_date('16-01-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103159, 'New Derrickborough', 102159, to_date('21-04-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103160, 'Brooksberg', 102160, to_date('09-05-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103161, 'Port Julie', 102161, to_date('01-12-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103162, 'South Benjaminport', 102162, to_date('30-09-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103163, 'Faulknershire', 102163, to_date('13-06-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103164, 'Beckerborough', 102164, to_date('18-11-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103165, 'Tylerberg', 102165, to_date('25-08-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103166, 'Port Richardfurt', 102166, to_date('02-04-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103167, 'Port Donna', 102167, to_date('07-09-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103168, 'North Ryanburgh', 102168, to_date('24-12-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103169, 'New Kristinville', 102169, to_date('28-06-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103170, 'West Michaelshire', 102170, to_date('09-03-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103171, 'East Cheryl', 102171, to_date('20-03-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103172, 'North Amyburgh', 102172, to_date('02-09-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103173, 'New John', 102173, to_date('08-07-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103174, 'Jefferyfurt', 102174, to_date('30-04-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103175, 'Anitaton', 102175, to_date('16-02-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103176, 'Evansmouth', 102176, to_date('29-01-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103177, 'New Amandaton', 102177, to_date('27-11-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103178, 'Lake Jameschester', 102178, to_date('23-06-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103179, 'Fullerstad', 102179, to_date('23-03-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103180, 'Lake Krista', 102180, to_date('20-07-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103181, 'Peterschester', 102181, to_date('18-10-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103182, 'Danielchester', 102182, to_date('12-10-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103183, 'Lake Jasonville', 102183, to_date('24-05-2024', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103184, 'East Jillview', 102184, to_date('15-04-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103185, 'West Joanna', 102185, to_date('18-10-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103186, 'East Ricardoton', 102186, to_date('05-07-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103187, 'Seanborough', 102187, to_date('12-02-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103188, 'Rickyfurt', 102188, to_date('17-07-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103189, 'North James', 102189, to_date('14-08-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103190, 'West Williamberg', 102190, to_date('15-06-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103191, 'West Jennifer', 102191, to_date('11-07-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103192, 'Ericburgh', 102192, to_date('21-12-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103193, 'Lake Dylanbury', 102193, to_date('04-05-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103194, 'West Joeborough', 102194, to_date('11-05-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103195, 'Perrymouth', 102195, to_date('19-02-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103196, 'Lake Christine', 102196, to_date('19-07-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103197, 'West Valeriestad', 102197, to_date('05-06-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103198, 'West Michelefort', 102198, to_date('28-01-2020', 'dd-mm-yyyy'));
commit;
prompt 200 records committed...
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103199, 'South Garymouth', 102199, to_date('04-12-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103200, 'Mccarthyfurt', 102200, to_date('04-07-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103201, 'Wendyburgh', 102201, to_date('29-09-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103202, 'Port John', 102202, to_date('22-08-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103203, 'Port Amy', 102203, to_date('29-09-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103204, 'East Brianmouth', 102204, to_date('22-08-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103205, 'Port Anthony', 102205, to_date('03-05-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103206, 'Port Travisstad', 102206, to_date('19-09-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103207, 'South Rogerport', 102207, to_date('09-02-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103208, 'Mcknightside', 102208, to_date('03-05-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103209, 'Jillianshire', 102209, to_date('18-12-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103210, 'East Stephen', 102210, to_date('03-10-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103211, 'Clarkshire', 102211, to_date('03-09-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103212, 'Parkerfort', 102212, to_date('02-12-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103213, 'West Daniel', 102213, to_date('11-06-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103214, 'Zacharyport', 102214, to_date('28-03-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103215, 'Richardmouth', 102215, to_date('24-02-2024', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103216, 'North Christopher', 102216, to_date('01-12-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103217, 'Port Brittanyville', 102217, to_date('11-06-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103218, 'Lake Nathan', 102218, to_date('13-01-2024', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103219, 'West Donald', 102219, to_date('11-05-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103220, 'Lake Sarahborough', 102220, to_date('14-12-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103221, 'Lake Kimberlyfort', 102221, to_date('23-01-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103222, 'West Jonathan', 102222, to_date('05-01-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103223, 'South James', 102223, to_date('16-02-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103224, 'New Andres', 102224, to_date('18-05-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103225, 'East Michael', 102225, to_date('09-02-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103226, 'West Robertbury', 102226, to_date('26-09-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103227, 'Osbornestad', 102227, to_date('15-01-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103228, 'West Richardfort', 102228, to_date('10-12-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103229, 'Brandonton', 102229, to_date('14-10-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103230, 'New Samuelport', 102230, to_date('20-08-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103231, 'Sarastad', 102231, to_date('15-01-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103232, 'Johnland', 102232, to_date('27-02-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103233, 'West Mitchellburgh', 102233, to_date('30-04-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103234, 'South Robin', 102234, to_date('20-02-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103235, 'West Mitchellshire', 102235, to_date('06-08-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103236, 'South Kimberly', 102236, to_date('23-03-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103237, 'South Tony', 102237, to_date('20-12-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103238, 'West Johnborough', 102238, to_date('28-10-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103239, 'Lake Donnamouth', 102239, to_date('09-04-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103240, 'Petersonfurt', 102240, to_date('07-09-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103241, 'Lake Andrea', 102241, to_date('01-12-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103242, 'Robinsonside', 102242, to_date('26-07-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103243, 'Lake Miashire', 102243, to_date('23-09-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103244, 'Lake Melissa', 102244, to_date('21-06-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103245, 'West Karen', 102245, to_date('25-05-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103246, 'New Mark', 102246, to_date('03-10-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103247, 'Nicholasside', 102247, to_date('29-06-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103248, 'Smithburgh', 102248, to_date('26-03-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103249, 'Port Jenniferchester', 102249, to_date('17-10-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103250, 'South Angelabury', 102250, to_date('08-12-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103251, 'Port Tammy', 102251, to_date('28-07-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103252, 'Whitehaven', 102252, to_date('01-05-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103253, 'Nicholasstad', 102253, to_date('16-12-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103254, 'New Nicole', 102254, to_date('03-06-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103255, 'Elliottfurt', 102255, to_date('29-12-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103256, 'New Audreyshire', 102256, to_date('11-07-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103257, 'South Michaelhaven', 102257, to_date('08-11-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103258, 'East Samuel', 102258, to_date('08-04-2024', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103259, 'New Dustinmouth', 102259, to_date('27-04-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103260, 'Gonzalesview', 102260, to_date('22-01-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103261, 'West Kristen', 102261, to_date('28-09-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103262, 'North Joshua', 102262, to_date('31-12-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103263, 'Taylorshire', 102263, to_date('27-03-2024', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103264, 'East Gary', 102264, to_date('10-03-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103265, 'Aliciaburgh', 102265, to_date('25-01-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103266, 'East Samuelside', 102266, to_date('06-03-2024', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103267, 'North Chadhaven', 102267, to_date('24-11-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103268, 'Millershire', 102268, to_date('04-01-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103269, 'Garrettside', 102269, to_date('01-08-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103270, 'Elizabethchester', 102270, to_date('04-03-2024', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103271, 'New Kathryn', 102271, to_date('13-02-2024', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103272, 'Williammouth', 102272, to_date('20-12-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103273, 'Port Victor', 102273, to_date('18-05-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103274, 'Lauriemouth', 102274, to_date('11-02-2024', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103275, 'North John', 102275, to_date('31-08-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103276, 'Courtneyborough', 102276, to_date('26-01-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103277, 'Braunfurt', 102277, to_date('16-10-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103278, 'Oconnellborough', 102278, to_date('06-03-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103279, 'North Aaron', 102279, to_date('04-12-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103280, 'Davidside', 102280, to_date('30-08-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103281, 'Michellefurt', 102281, to_date('16-03-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103282, 'Lake Julie', 102282, to_date('11-07-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103283, 'North Monicabury', 102283, to_date('09-02-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103284, 'West Leslieview', 102284, to_date('11-08-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103285, 'Weavershire', 102285, to_date('23-07-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103286, 'South Royfurt', 102286, to_date('21-05-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103287, 'Port Judy', 102287, to_date('22-11-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103288, 'Webermouth', 102288, to_date('24-05-2024', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103289, 'Sandersfort', 102289, to_date('06-03-2024', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103290, 'North Michaelton', 102290, to_date('26-05-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103291, 'West Alyssa', 102291, to_date('26-11-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103292, 'South Elizabethfort', 102292, to_date('19-04-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103293, 'North Sarahview', 102293, to_date('12-02-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103294, 'Brownstad', 102294, to_date('25-12-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103295, 'Port Daniel', 102295, to_date('15-02-2024', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103296, 'New Dannyfurt', 102296, to_date('13-02-2024', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103297, 'West Deborah', 102297, to_date('16-03-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103298, 'East Robertbury', 102298, to_date('05-02-2021', 'dd-mm-yyyy'));
commit;
prompt 300 records committed...
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103299, 'Marshallview', 102299, to_date('29-11-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103300, 'Port Rhondafort', 102300, to_date('04-02-2024', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103301, 'Smithland', 102301, to_date('24-04-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103302, 'West Jennifer', 102302, to_date('07-04-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103303, 'Mendozashire', 102303, to_date('15-09-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103304, 'New Lisachester', 102304, to_date('11-07-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103305, 'North Josephville', 102305, to_date('29-08-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103306, 'Holmesmouth', 102306, to_date('01-08-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103307, 'Reneechester', 102307, to_date('21-02-2024', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103308, 'Bennettmouth', 102308, to_date('14-04-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103309, 'Port Jasonville', 102309, to_date('09-12-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103310, 'West Timothyberg', 102310, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103311, 'Mcdonaldview', 102311, to_date('29-03-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103312, 'New Jeffreytown', 102312, to_date('01-12-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103313, 'Port Alexander', 102313, to_date('13-08-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103314, 'Jenkinsland', 102314, to_date('22-11-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103315, 'Wardview', 102315, to_date('25-03-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103316, 'Veronicashire', 102316, to_date('04-05-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103317, 'Jenniferfort', 102317, to_date('08-06-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103318, 'Erikbury', 102318, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103319, 'New Juanborough', 102319, to_date('14-07-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103320, 'North Teresa', 102320, to_date('02-10-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103321, 'Lake Veronica', 102321, to_date('25-12-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103322, 'New Pamelastad', 102322, to_date('03-06-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103323, 'Lopezview', 102323, to_date('01-08-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103324, 'New Michelle', 102324, to_date('11-03-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103325, 'South Kathleenfurt', 102325, to_date('25-02-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103326, 'North Stephaniemouth', 102326, to_date('04-04-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103327, 'Smithland', 102327, to_date('29-04-2024', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103328, 'New Brandon', 102328, to_date('29-04-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103329, 'Marialand', 102329, to_date('20-12-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103330, 'Burtontown', 102330, to_date('19-08-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103331, 'New Amanda', 102331, to_date('11-09-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103332, 'Lopezside', 102332, to_date('01-02-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103333, 'Larsonfort', 102333, to_date('01-04-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103334, 'East Martha', 102334, to_date('17-04-2024', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103335, 'North Michael', 102335, to_date('16-01-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103336, 'Victorburgh', 102336, to_date('13-01-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103337, 'Port Danielmouth', 102337, to_date('04-01-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103338, 'Melindatown', 102338, to_date('22-07-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103339, 'South Jamie', 102339, to_date('14-02-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103340, 'Lancechester', 102340, to_date('19-09-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103341, 'Birdhaven', 102341, to_date('19-05-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103342, 'Jessicafurt', 102342, to_date('25-01-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103343, 'Port Kimberly', 102343, to_date('12-12-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103344, 'North Jeremy', 102344, to_date('20-02-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103345, 'Carrieborough', 102345, to_date('25-09-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103346, 'Matthewland', 102346, to_date('12-02-2024', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103347, 'Howardtown', 102347, to_date('05-08-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103348, 'New Karenbury', 102348, to_date('05-12-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103349, 'Lynnborough', 102349, to_date('10-06-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103350, 'Reyesville', 102350, to_date('31-07-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103351, 'Mooreberg', 102351, to_date('10-02-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103352, 'Lake Erica', 102352, to_date('19-12-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103353, 'North Ashleymouth', 102353, to_date('22-12-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103354, 'Hensleyborough', 102354, to_date('19-03-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103355, 'New Tonyahaven', 102355, to_date('07-01-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103356, 'North Michael', 102356, to_date('10-03-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103357, 'Jenkinsstad', 102357, to_date('18-05-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103358, 'Port Preston', 102358, to_date('09-08-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103359, 'Burtonfurt', 102359, to_date('18-08-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103360, 'Christophershire', 102360, to_date('05-01-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103361, 'Baxterport', 102361, to_date('27-01-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103362, 'South Jamesborough', 102362, to_date('21-12-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103363, 'Walkerhaven', 102363, to_date('15-03-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103364, 'Douglaston', 102364, to_date('10-10-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103365, 'West Amandaberg', 102365, to_date('17-02-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103366, 'Port Wesley', 102366, to_date('11-09-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103367, 'South Katrinaberg', 102367, to_date('20-02-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103368, 'Anntown', 102368, to_date('07-04-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103369, 'Walkerport', 102369, to_date('14-12-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103370, 'Kathyton', 102370, to_date('18-09-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103371, 'East John', 102371, to_date('07-07-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103372, 'Lake Pamelamouth', 102372, to_date('20-02-2024', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103373, 'Watsontown', 102373, to_date('06-02-2024', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103374, 'Priceville', 102374, to_date('16-03-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103375, 'East Nicoleland', 102375, to_date('05-06-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103376, 'Carrillofort', 102376, to_date('25-12-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103377, 'North Alexander', 102377, to_date('09-07-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103378, 'New Joseport', 102378, to_date('07-04-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103379, 'Lake Michael', 102379, to_date('23-09-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103380, 'Torrestown', 102380, to_date('04-06-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103381, 'Johnsonborough', 102381, to_date('03-06-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103382, 'Port Charlotteside', 102382, to_date('26-05-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103383, 'East Kimberly', 102383, to_date('19-05-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103384, 'Kathystad', 102384, to_date('24-12-2020', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103385, 'New Kevin', 102385, to_date('24-12-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103386, 'Watersborough', 102386, to_date('18-03-2024', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103387, 'East Abigail', 102387, to_date('06-02-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103388, 'Jacksonhaven', 102388, to_date('29-11-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103389, 'Port Nancy', 102389, to_date('17-04-2024', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103390, 'East Nicole', 102390, to_date('01-07-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103391, 'Littleshire', 102391, to_date('08-06-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103392, 'Millerside', 102392, to_date('12-03-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103393, 'West Jasonfurt', 102393, to_date('15-07-2022', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103394, 'Jenniferville', 102394, to_date('10-09-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103395, 'East Corey', 102395, to_date('26-03-2024', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103396, 'New Thomas', 102396, to_date('11-04-2021', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103397, 'Thomasbury', 102397, to_date('12-03-2023', 'dd-mm-yyyy'));
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103398, 'Nathanmouth', 102398, to_date('07-11-2021', 'dd-mm-yyyy'));
commit;
prompt 400 records committed...
insert into BRANCHE (brancheid, branchelocation, reporterid, openeddate)
values (103399, 'Kimberlychester', 102399, to_date('07-01-2023', 'dd-mm-yyyy'));
commit;
prompt 401 records loaded
prompt Loading CUSTOMERS...
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100401, 'Juliette', 108401, to_date('24-07-2006', 'dd-mm-yyyy'), 103401);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100000, 'Ashley', 108000, to_date('29-05-2020', 'dd-mm-yyyy'), 103000);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100001, 'Jeremy', 108001, to_date('24-12-2020', 'dd-mm-yyyy'), 103001);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100002, 'Sarah', 108002, to_date('26-01-2022', 'dd-mm-yyyy'), 103002);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100003, 'Sandra', 108003, to_date('03-01-2021', 'dd-mm-yyyy'), 103003);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100004, 'Kayla', 108004, to_date('01-11-2023', 'dd-mm-yyyy'), 103004);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100005, 'Jennifer', 108005, to_date('23-11-2023', 'dd-mm-yyyy'), 103005);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100006, 'Tammy', 108006, to_date('28-04-2023', 'dd-mm-yyyy'), 103006);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100007, 'Amanda', 108007, to_date('02-02-2023', 'dd-mm-yyyy'), 103007);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100008, 'Aaron', 108008, to_date('22-11-2021', 'dd-mm-yyyy'), 103008);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100009, 'Debra', 108009, to_date('15-08-2020', 'dd-mm-yyyy'), 103009);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100010, 'Travis', 108010, to_date('12-02-2023', 'dd-mm-yyyy'), 103010);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100011, 'Larry', 108011, to_date('07-09-2022', 'dd-mm-yyyy'), 103011);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100012, 'Tara', 108012, to_date('13-07-2022', 'dd-mm-yyyy'), 103012);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100013, 'Eric', 108013, to_date('11-01-2023', 'dd-mm-yyyy'), 103013);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100014, 'Kyle', 108014, to_date('03-09-2020', 'dd-mm-yyyy'), 103014);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100015, 'Tracey', 108015, to_date('12-04-2022', 'dd-mm-yyyy'), 103015);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100016, 'Timothy', 108016, to_date('06-05-2023', 'dd-mm-yyyy'), 103016);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100017, 'Jasmine', 108017, to_date('11-02-2024', 'dd-mm-yyyy'), 103017);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100018, 'Michelle', 108018, to_date('12-05-2020', 'dd-mm-yyyy'), 103018);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100019, 'Chelsea', 108019, to_date('27-09-2020', 'dd-mm-yyyy'), 103019);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100020, 'Alexandra', 108020, to_date('21-06-2022', 'dd-mm-yyyy'), 103020);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100021, 'Beth', 108021, to_date('26-04-2024', 'dd-mm-yyyy'), 103021);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100022, 'Tiffany', 108022, to_date('24-04-2024', 'dd-mm-yyyy'), 103022);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100023, 'Matthew', 108023, to_date('22-02-2021', 'dd-mm-yyyy'), 103023);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100024, 'Michael', 108024, to_date('27-11-2020', 'dd-mm-yyyy'), 103024);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100025, 'Christopher', 108025, to_date('10-05-2021', 'dd-mm-yyyy'), 103025);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100026, 'Christina', 108026, to_date('28-01-2023', 'dd-mm-yyyy'), 103026);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100027, 'Julie', 108027, to_date('26-11-2022', 'dd-mm-yyyy'), 103027);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100028, 'Brian', 108028, to_date('05-04-2020', 'dd-mm-yyyy'), 103028);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100029, 'Erica', 108029, to_date('19-08-2021', 'dd-mm-yyyy'), 103029);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100030, 'Anthony', 108030, to_date('10-08-2021', 'dd-mm-yyyy'), 103030);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100031, 'Kristin', 108031, to_date('25-05-2021', 'dd-mm-yyyy'), 103031);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100032, 'Michael', 108032, to_date('16-09-2021', 'dd-mm-yyyy'), 103032);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100033, 'Samantha', 108033, to_date('10-01-2024', 'dd-mm-yyyy'), 103033);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100034, 'Jason', 108034, to_date('26-02-2024', 'dd-mm-yyyy'), 103034);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100035, 'Nicole', 108035, to_date('28-08-2020', 'dd-mm-yyyy'), 103035);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100036, 'Cynthia', 108036, to_date('03-05-2024', 'dd-mm-yyyy'), 103036);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100037, 'Cory', 108037, to_date('14-05-2023', 'dd-mm-yyyy'), 103037);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100038, 'Erica', 108038, to_date('06-11-2021', 'dd-mm-yyyy'), 103038);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100039, 'Adam', 108039, to_date('10-01-2021', 'dd-mm-yyyy'), 103039);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100040, 'John', 108040, to_date('25-11-2021', 'dd-mm-yyyy'), 103040);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100041, 'Elizabeth', 108041, to_date('08-11-2022', 'dd-mm-yyyy'), 103041);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100042, 'Christian', 108042, to_date('30-07-2023', 'dd-mm-yyyy'), 103042);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100043, 'Kevin', 108043, to_date('03-09-2023', 'dd-mm-yyyy'), 103043);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100044, 'Julie', 108044, to_date('09-02-2020', 'dd-mm-yyyy'), 103044);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100045, 'Nicole', 108045, to_date('25-07-2020', 'dd-mm-yyyy'), 103045);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100046, 'Brett', 108046, to_date('08-02-2022', 'dd-mm-yyyy'), 103046);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100047, 'Anthony', 108047, to_date('13-11-2023', 'dd-mm-yyyy'), 103047);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100048, 'Jimmy', 108048, to_date('26-05-2021', 'dd-mm-yyyy'), 103048);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100049, 'Ashley', 108049, to_date('05-01-2021', 'dd-mm-yyyy'), 103049);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100050, 'Chelsea', 108050, to_date('10-07-2020', 'dd-mm-yyyy'), 103050);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100051, 'Jack', 108051, to_date('10-05-2022', 'dd-mm-yyyy'), 103051);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100052, 'Jose', 108052, to_date('29-12-2022', 'dd-mm-yyyy'), 103052);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100053, 'Kathy', 108053, to_date('27-04-2022', 'dd-mm-yyyy'), 103053);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100054, 'Mario', 108054, to_date('25-12-2023', 'dd-mm-yyyy'), 103054);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100055, 'Michael', 108055, to_date('24-11-2020', 'dd-mm-yyyy'), 103055);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100056, 'Glen', 108056, to_date('13-06-2020', 'dd-mm-yyyy'), 103056);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100057, 'Joshua', 108057, to_date('07-03-2021', 'dd-mm-yyyy'), 103057);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100058, 'Laura', 108058, to_date('29-01-2020', 'dd-mm-yyyy'), 103058);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100059, 'Leslie', 108059, to_date('17-02-2024', 'dd-mm-yyyy'), 103059);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100060, 'Catherine', 108060, to_date('05-09-2022', 'dd-mm-yyyy'), 103060);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100061, 'Kimberly', 108061, to_date('17-10-2023', 'dd-mm-yyyy'), 103061);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100062, 'Brittany', 108062, to_date('14-09-2022', 'dd-mm-yyyy'), 103062);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100063, 'Valerie', 108063, to_date('07-12-2020', 'dd-mm-yyyy'), 103063);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100064, 'Lori', 108064, to_date('30-08-2022', 'dd-mm-yyyy'), 103064);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100065, 'Eric', 108065, to_date('21-01-2024', 'dd-mm-yyyy'), 103065);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100066, 'Bryan', 108066, to_date('06-01-2020', 'dd-mm-yyyy'), 103066);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100067, 'Julie', 108067, to_date('09-03-2023', 'dd-mm-yyyy'), 103067);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100068, 'Todd', 108068, to_date('03-04-2021', 'dd-mm-yyyy'), 103068);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100069, 'Kimberly', 108069, to_date('08-01-2021', 'dd-mm-yyyy'), 103069);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100070, 'Justin', 108070, to_date('26-09-2022', 'dd-mm-yyyy'), 103070);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100071, 'Samantha', 108071, to_date('09-09-2023', 'dd-mm-yyyy'), 103071);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100072, 'Shawn', 108072, to_date('12-09-2023', 'dd-mm-yyyy'), 103072);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100073, 'Dave', 108073, to_date('26-09-2022', 'dd-mm-yyyy'), 103073);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100074, 'Joseph', 108074, to_date('14-08-2021', 'dd-mm-yyyy'), 103074);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100075, 'Donna', 108075, to_date('09-06-2022', 'dd-mm-yyyy'), 103075);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100076, 'Mark', 108076, to_date('30-07-2020', 'dd-mm-yyyy'), 103076);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100077, 'Lisa', 108077, to_date('21-12-2020', 'dd-mm-yyyy'), 103077);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100078, 'Brad', 108078, to_date('30-06-2022', 'dd-mm-yyyy'), 103078);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100079, 'Danny', 108079, to_date('18-05-2020', 'dd-mm-yyyy'), 103079);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100080, 'Mary', 108080, to_date('04-01-2023', 'dd-mm-yyyy'), 103080);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100081, 'Todd', 108081, to_date('19-06-2023', 'dd-mm-yyyy'), 103081);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100082, 'Raymond', 108082, to_date('09-03-2024', 'dd-mm-yyyy'), 103082);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100083, 'Catherine', 108083, to_date('17-04-2022', 'dd-mm-yyyy'), 103083);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100084, 'Kevin', 108084, to_date('30-01-2021', 'dd-mm-yyyy'), 103084);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100085, 'Hayley', 108085, to_date('06-04-2021', 'dd-mm-yyyy'), 103085);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100086, 'Stacey', 108086, to_date('27-03-2024', 'dd-mm-yyyy'), 103086);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100087, 'Jason', 108087, to_date('28-12-2021', 'dd-mm-yyyy'), 103087);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100088, 'John', 108088, to_date('13-07-2023', 'dd-mm-yyyy'), 103088);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100089, 'Kristopher', 108089, to_date('08-12-2021', 'dd-mm-yyyy'), 103089);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100090, 'Natasha', 108090, to_date('11-06-2021', 'dd-mm-yyyy'), 103090);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100091, 'Shelby', 108091, to_date('27-12-2020', 'dd-mm-yyyy'), 103091);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100092, 'Tiffany', 108092, to_date('27-06-2021', 'dd-mm-yyyy'), 103092);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100093, 'Jennifer', 108093, to_date('02-10-2022', 'dd-mm-yyyy'), 103093);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100094, 'Alec', 108094, to_date('07-02-2021', 'dd-mm-yyyy'), 103094);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100095, 'James', 108095, to_date('30-05-2020', 'dd-mm-yyyy'), 103095);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100096, 'Timothy', 108096, to_date('17-01-2022', 'dd-mm-yyyy'), 103096);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100097, 'Mark', 108097, to_date('16-08-2021', 'dd-mm-yyyy'), 103097);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100098, 'Laura', 108098, to_date('05-07-2023', 'dd-mm-yyyy'), 103098);
commit;
prompt 100 records committed...
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100099, 'Timothy', 108099, to_date('10-01-2021', 'dd-mm-yyyy'), 103099);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100100, 'Jason', 108100, to_date('06-06-2021', 'dd-mm-yyyy'), 103100);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100101, 'Jessica', 108101, to_date('27-06-2020', 'dd-mm-yyyy'), 103101);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100102, 'Brandon', 108102, to_date('12-07-2022', 'dd-mm-yyyy'), 103102);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100103, 'Tiffany', 108103, to_date('29-03-2023', 'dd-mm-yyyy'), 103103);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100104, 'Andrea', 108104, to_date('05-08-2021', 'dd-mm-yyyy'), 103104);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100105, 'Jacob', 108105, to_date('31-10-2021', 'dd-mm-yyyy'), 103105);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100106, 'Lynn', 108106, to_date('24-02-2021', 'dd-mm-yyyy'), 103106);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100107, 'David', 108107, to_date('11-12-2021', 'dd-mm-yyyy'), 103107);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100108, 'Jesse', 108108, to_date('21-02-2020', 'dd-mm-yyyy'), 103108);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100109, 'Anthony', 108109, to_date('22-01-2024', 'dd-mm-yyyy'), 103109);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100110, 'Craig', 108110, to_date('17-02-2022', 'dd-mm-yyyy'), 103110);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100111, 'William', 108111, to_date('12-04-2020', 'dd-mm-yyyy'), 103111);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100112, 'Regina', 108112, to_date('26-11-2023', 'dd-mm-yyyy'), 103112);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100113, 'Glenn', 108113, to_date('26-02-2023', 'dd-mm-yyyy'), 103113);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100114, 'Daniel', 108114, to_date('07-10-2021', 'dd-mm-yyyy'), 103114);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100115, 'Michael', 108115, to_date('30-11-2023', 'dd-mm-yyyy'), 103115);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100116, 'Richard', 108116, to_date('17-03-2023', 'dd-mm-yyyy'), 103116);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100117, 'Cassandra', 108117, to_date('19-08-2021', 'dd-mm-yyyy'), 103117);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100118, 'Mark', 108118, to_date('19-11-2021', 'dd-mm-yyyy'), 103118);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100119, 'Brittany', 108119, to_date('15-08-2021', 'dd-mm-yyyy'), 103119);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100120, 'Jennifer', 108120, to_date('07-05-2022', 'dd-mm-yyyy'), 103120);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100121, 'Marissa', 108121, to_date('17-07-2020', 'dd-mm-yyyy'), 103121);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100122, 'Jeffery', 108122, to_date('17-02-2024', 'dd-mm-yyyy'), 103122);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100123, 'Daniel', 108123, to_date('22-06-2023', 'dd-mm-yyyy'), 103123);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100124, 'Aaron', 108124, to_date('10-05-2023', 'dd-mm-yyyy'), 103124);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100125, 'Devin', 108125, to_date('27-07-2020', 'dd-mm-yyyy'), 103125);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100126, 'Casey', 108126, to_date('10-11-2021', 'dd-mm-yyyy'), 103126);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100127, 'Christian', 108127, to_date('22-02-2021', 'dd-mm-yyyy'), 103127);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100128, 'Leslie', 108128, to_date('08-08-2021', 'dd-mm-yyyy'), 103128);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100129, 'Kerry', 108129, to_date('22-02-2022', 'dd-mm-yyyy'), 103129);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100130, 'Andrea', 108130, to_date('26-05-2022', 'dd-mm-yyyy'), 103130);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100131, 'Natasha', 108131, to_date('21-08-2020', 'dd-mm-yyyy'), 103131);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100132, 'Kyle', 108132, to_date('25-09-2022', 'dd-mm-yyyy'), 103132);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100133, 'Jennifer', 108133, to_date('02-12-2022', 'dd-mm-yyyy'), 103133);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100134, 'Walter', 108134, to_date('16-02-2021', 'dd-mm-yyyy'), 103134);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100135, 'Melanie', 108135, to_date('01-02-2023', 'dd-mm-yyyy'), 103135);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100136, 'Hannah', 108136, to_date('21-02-2023', 'dd-mm-yyyy'), 103136);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100137, 'Jennifer', 108137, to_date('02-10-2023', 'dd-mm-yyyy'), 103137);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100138, 'Philip', 108138, to_date('15-11-2020', 'dd-mm-yyyy'), 103138);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100139, 'Anthony', 108139, to_date('28-12-2023', 'dd-mm-yyyy'), 103139);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100140, 'Katelyn', 108140, to_date('16-06-2022', 'dd-mm-yyyy'), 103140);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100141, 'Nicholas', 108141, to_date('09-07-2023', 'dd-mm-yyyy'), 103141);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100142, 'Jonathan', 108142, to_date('16-12-2022', 'dd-mm-yyyy'), 103142);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100143, 'Debra', 108143, to_date('11-06-2022', 'dd-mm-yyyy'), 103143);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100144, 'Jessica', 108144, to_date('12-05-2022', 'dd-mm-yyyy'), 103144);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100145, 'Ashley', 108145, to_date('16-10-2021', 'dd-mm-yyyy'), 103145);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100146, 'Michelle', 108146, to_date('10-04-2022', 'dd-mm-yyyy'), 103146);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100147, 'Deborah', 108147, to_date('11-01-2023', 'dd-mm-yyyy'), 103147);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100148, 'Tricia', 108148, to_date('23-03-2020', 'dd-mm-yyyy'), 103148);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100149, 'David', 108149, to_date('17-11-2021', 'dd-mm-yyyy'), 103149);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100150, 'Samantha', 108150, to_date('24-04-2023', 'dd-mm-yyyy'), 103150);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100151, 'Jesse', 108151, to_date('24-12-2021', 'dd-mm-yyyy'), 103151);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100152, 'Tracy', 108152, to_date('24-12-2022', 'dd-mm-yyyy'), 103152);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100153, 'Jessica', 108153, to_date('24-03-2022', 'dd-mm-yyyy'), 103153);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100154, 'Samuel', 108154, to_date('12-02-2023', 'dd-mm-yyyy'), 103154);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100155, 'Brandi', 108155, to_date('25-02-2021', 'dd-mm-yyyy'), 103155);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100156, 'Erica', 108156, to_date('07-08-2021', 'dd-mm-yyyy'), 103156);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100157, 'Kylie', 108157, to_date('19-11-2021', 'dd-mm-yyyy'), 103157);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100158, 'Rebekah', 108158, to_date('30-04-2021', 'dd-mm-yyyy'), 103158);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100159, 'Maria', 108159, to_date('23-05-2022', 'dd-mm-yyyy'), 103159);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100160, 'Joshua', 108160, to_date('14-11-2022', 'dd-mm-yyyy'), 103160);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100161, 'Michael', 108161, to_date('12-04-2021', 'dd-mm-yyyy'), 103161);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100162, 'Timothy', 108162, to_date('27-01-2022', 'dd-mm-yyyy'), 103162);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100163, 'Cody', 108163, to_date('04-10-2021', 'dd-mm-yyyy'), 103163);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100164, 'Jacob', 108164, to_date('12-10-2021', 'dd-mm-yyyy'), 103164);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100165, 'Tanner', 108165, to_date('29-06-2021', 'dd-mm-yyyy'), 103165);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100166, 'Tamara', 108166, to_date('16-01-2021', 'dd-mm-yyyy'), 103166);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100167, 'Michaela', 108167, to_date('05-04-2024', 'dd-mm-yyyy'), 103167);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100168, 'Rachel', 108168, to_date('16-10-2023', 'dd-mm-yyyy'), 103168);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100169, 'Michele', 108169, to_date('10-06-2021', 'dd-mm-yyyy'), 103169);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100170, 'Douglas', 108170, to_date('28-11-2021', 'dd-mm-yyyy'), 103170);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100171, 'Matthew', 108171, to_date('03-02-2022', 'dd-mm-yyyy'), 103171);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100172, 'Tiffany', 108172, to_date('29-11-2020', 'dd-mm-yyyy'), 103172);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100173, 'Michelle', 108173, to_date('17-03-2023', 'dd-mm-yyyy'), 103173);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100174, 'Aaron', 108174, to_date('15-11-2020', 'dd-mm-yyyy'), 103174);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100175, 'Deanna', 108175, to_date('06-07-2022', 'dd-mm-yyyy'), 103175);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100176, 'Maria', 108176, to_date('12-08-2022', 'dd-mm-yyyy'), 103176);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100177, 'Juan', 108177, to_date('27-02-2021', 'dd-mm-yyyy'), 103177);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100178, 'Heather', 108178, to_date('06-04-2021', 'dd-mm-yyyy'), 103178);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100179, 'Jennifer', 108179, to_date('24-03-2024', 'dd-mm-yyyy'), 103179);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100180, 'Mark', 108180, to_date('20-10-2021', 'dd-mm-yyyy'), 103180);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100181, 'Monica', 108181, to_date('28-10-2020', 'dd-mm-yyyy'), 103181);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100182, 'Brett', 108182, to_date('25-06-2020', 'dd-mm-yyyy'), 103182);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100183, 'Angela', 108183, to_date('28-01-2024', 'dd-mm-yyyy'), 103183);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100184, 'Douglas', 108184, to_date('18-07-2023', 'dd-mm-yyyy'), 103184);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100185, 'Jennifer', 108185, to_date('03-05-2021', 'dd-mm-yyyy'), 103185);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100186, 'Andrew', 108186, to_date('02-07-2022', 'dd-mm-yyyy'), 103186);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100187, 'Cody', 108187, to_date('02-07-2021', 'dd-mm-yyyy'), 103187);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100188, 'Eduardo', 108188, to_date('05-02-2022', 'dd-mm-yyyy'), 103188);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100189, 'John', 108189, to_date('14-02-2024', 'dd-mm-yyyy'), 103189);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100190, 'Paul', 108190, to_date('25-03-2022', 'dd-mm-yyyy'), 103190);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100191, 'Jenny', 108191, to_date('13-08-2020', 'dd-mm-yyyy'), 103191);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100192, 'Elizabeth', 108192, to_date('07-10-2022', 'dd-mm-yyyy'), 103192);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100193, 'Kyle', 108193, to_date('22-03-2021', 'dd-mm-yyyy'), 103193);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100194, 'Steven', 108194, to_date('08-04-2020', 'dd-mm-yyyy'), 103194);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100195, 'Joshua', 108195, to_date('26-01-2021', 'dd-mm-yyyy'), 103195);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100196, 'Christian', 108196, to_date('27-01-2023', 'dd-mm-yyyy'), 103196);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100197, 'Eric', 108197, to_date('29-10-2023', 'dd-mm-yyyy'), 103197);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100198, 'Chelsea', 108198, to_date('26-02-2024', 'dd-mm-yyyy'), 103198);
commit;
prompt 200 records committed...
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100199, 'Michael', 108199, to_date('13-07-2022', 'dd-mm-yyyy'), 103199);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100200, 'Andrew', 108200, to_date('28-09-2020', 'dd-mm-yyyy'), 103200);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100201, 'Richard', 108201, to_date('25-08-2020', 'dd-mm-yyyy'), 103201);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100202, 'Cameron', 108202, to_date('29-12-2023', 'dd-mm-yyyy'), 103202);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100203, 'Jennifer', 108203, to_date('07-06-2023', 'dd-mm-yyyy'), 103203);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100204, 'Betty', 108204, to_date('22-06-2023', 'dd-mm-yyyy'), 103204);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100205, 'Robert', 108205, to_date('13-02-2022', 'dd-mm-yyyy'), 103205);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100206, 'Daniel', 108206, to_date('30-06-2020', 'dd-mm-yyyy'), 103206);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100207, 'Brandy', 108207, to_date('02-02-2021', 'dd-mm-yyyy'), 103207);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100208, 'Jerry', 108208, to_date('13-05-2020', 'dd-mm-yyyy'), 103208);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100209, 'Dustin', 108209, to_date('27-01-2020', 'dd-mm-yyyy'), 103209);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100210, 'Theresa', 108210, to_date('16-01-2022', 'dd-mm-yyyy'), 103210);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100211, 'Jeffrey', 108211, to_date('13-02-2024', 'dd-mm-yyyy'), 103211);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100212, 'Crystal', 108212, to_date('09-06-2021', 'dd-mm-yyyy'), 103212);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100213, 'Tanya', 108213, to_date('07-09-2020', 'dd-mm-yyyy'), 103213);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100214, 'Sarah', 108214, to_date('02-02-2024', 'dd-mm-yyyy'), 103214);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100215, 'Kenneth', 108215, to_date('01-03-2023', 'dd-mm-yyyy'), 103215);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100216, 'Lucas', 108216, to_date('24-11-2020', 'dd-mm-yyyy'), 103216);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100217, 'Aaron', 108217, to_date('02-04-2021', 'dd-mm-yyyy'), 103217);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100218, 'Terry', 108218, to_date('08-05-2020', 'dd-mm-yyyy'), 103218);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100219, 'Kimberly', 108219, to_date('30-05-2021', 'dd-mm-yyyy'), 103219);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100220, 'Molly', 108220, to_date('01-08-2022', 'dd-mm-yyyy'), 103220);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100221, 'Alicia', 108221, to_date('06-02-2023', 'dd-mm-yyyy'), 103221);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100222, 'Kristie', 108222, to_date('16-02-2024', 'dd-mm-yyyy'), 103222);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100223, 'Brooke', 108223, to_date('29-07-2021', 'dd-mm-yyyy'), 103223);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100224, 'Nicole', 108224, to_date('19-11-2021', 'dd-mm-yyyy'), 103224);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100225, 'Lynn', 108225, to_date('06-03-2021', 'dd-mm-yyyy'), 103225);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100226, 'Amber', 108226, to_date('08-11-2022', 'dd-mm-yyyy'), 103226);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100227, 'Sierra', 108227, to_date('28-09-2021', 'dd-mm-yyyy'), 103227);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100228, 'Caleb', 108228, to_date('19-09-2021', 'dd-mm-yyyy'), 103228);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100229, 'Linda', 108229, to_date('29-11-2022', 'dd-mm-yyyy'), 103229);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100230, 'Jason', 108230, to_date('11-02-2020', 'dd-mm-yyyy'), 103230);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100231, 'John', 108231, to_date('08-05-2022', 'dd-mm-yyyy'), 103231);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100232, 'Barbara', 108232, to_date('09-10-2022', 'dd-mm-yyyy'), 103232);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100233, 'Jessica', 108233, to_date('09-01-2023', 'dd-mm-yyyy'), 103233);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100234, 'James', 108234, to_date('13-09-2022', 'dd-mm-yyyy'), 103234);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100235, 'John', 108235, to_date('17-05-2023', 'dd-mm-yyyy'), 103235);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100236, 'Michael', 108236, to_date('09-03-2024', 'dd-mm-yyyy'), 103236);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100237, 'Michelle', 108237, to_date('04-05-2020', 'dd-mm-yyyy'), 103237);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100238, 'Walter', 108238, to_date('20-05-2022', 'dd-mm-yyyy'), 103238);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100239, 'Jessica', 108239, to_date('20-01-2022', 'dd-mm-yyyy'), 103239);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100240, 'Mark', 108240, to_date('14-03-2020', 'dd-mm-yyyy'), 103240);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100241, 'Tammy', 108241, to_date('19-01-2021', 'dd-mm-yyyy'), 103241);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100242, 'James', 108242, to_date('25-09-2021', 'dd-mm-yyyy'), 103242);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100243, 'Angelica', 108243, to_date('10-06-2022', 'dd-mm-yyyy'), 103243);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100244, 'Samantha', 108244, to_date('12-03-2022', 'dd-mm-yyyy'), 103244);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100245, 'Donna', 108245, to_date('15-04-2022', 'dd-mm-yyyy'), 103245);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100246, 'Adrian', 108246, to_date('31-10-2022', 'dd-mm-yyyy'), 103246);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100247, 'Dean', 108247, to_date('28-06-2021', 'dd-mm-yyyy'), 103247);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100248, 'Daniel', 108248, to_date('16-11-2021', 'dd-mm-yyyy'), 103248);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100249, 'James', 108249, to_date('24-10-2020', 'dd-mm-yyyy'), 103249);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100250, 'Jason', 108250, to_date('22-03-2021', 'dd-mm-yyyy'), 103250);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100251, 'Richard', 108251, to_date('25-03-2024', 'dd-mm-yyyy'), 103251);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100252, 'Edward', 108252, to_date('30-10-2022', 'dd-mm-yyyy'), 103252);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100253, 'Ashley', 108253, to_date('27-03-2023', 'dd-mm-yyyy'), 103253);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100254, 'Tracey', 108254, to_date('27-09-2022', 'dd-mm-yyyy'), 103254);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100255, 'Tiffany', 108255, to_date('01-02-2024', 'dd-mm-yyyy'), 103255);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100256, 'Heather', 108256, to_date('04-02-2021', 'dd-mm-yyyy'), 103256);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100257, 'Ryan', 108257, to_date('14-01-2023', 'dd-mm-yyyy'), 103257);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100258, 'John', 108258, to_date('18-08-2020', 'dd-mm-yyyy'), 103258);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100259, 'Karen', 108259, to_date('04-09-2023', 'dd-mm-yyyy'), 103259);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100260, 'Raymond', 108260, to_date('14-09-2021', 'dd-mm-yyyy'), 103260);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100261, 'Michelle', 108261, to_date('14-08-2022', 'dd-mm-yyyy'), 103261);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100262, 'Laurie', 108262, to_date('06-02-2021', 'dd-mm-yyyy'), 103262);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100263, 'Sean', 108263, to_date('18-09-2021', 'dd-mm-yyyy'), 103263);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100264, 'Veronica', 108264, to_date('11-09-2023', 'dd-mm-yyyy'), 103264);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100265, 'Beth', 108265, to_date('07-05-2021', 'dd-mm-yyyy'), 103265);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100266, 'Kimberly', 108266, to_date('28-05-2022', 'dd-mm-yyyy'), 103266);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100267, 'Heather', 108267, to_date('13-02-2020', 'dd-mm-yyyy'), 103267);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100268, 'David', 108268, to_date('14-12-2023', 'dd-mm-yyyy'), 103268);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100269, 'Tracy', 108269, to_date('06-03-2021', 'dd-mm-yyyy'), 103269);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100270, 'Melissa', 108270, to_date('21-03-2024', 'dd-mm-yyyy'), 103270);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100271, 'Jessica', 108271, to_date('25-12-2022', 'dd-mm-yyyy'), 103271);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100272, 'Gregory', 108272, to_date('18-05-2022', 'dd-mm-yyyy'), 103272);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100273, 'Erik', 108273, to_date('02-11-2020', 'dd-mm-yyyy'), 103273);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100274, 'Michelle', 108274, to_date('14-11-2022', 'dd-mm-yyyy'), 103274);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100275, 'John', 108275, to_date('15-04-2022', 'dd-mm-yyyy'), 103275);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100276, 'Lisa', 108276, to_date('20-03-2024', 'dd-mm-yyyy'), 103276);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100277, 'Joshua', 108277, to_date('24-03-2021', 'dd-mm-yyyy'), 103277);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100278, 'Chad', 108278, to_date('15-02-2024', 'dd-mm-yyyy'), 103278);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100279, 'Frank', 108279, to_date('14-03-2022', 'dd-mm-yyyy'), 103279);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100280, 'Amanda', 108280, to_date('28-03-2024', 'dd-mm-yyyy'), 103280);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100281, 'John', 108281, to_date('18-08-2021', 'dd-mm-yyyy'), 103281);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100282, 'Devin', 108282, to_date('15-05-2022', 'dd-mm-yyyy'), 103282);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100283, 'Gabriel', 108283, to_date('30-07-2022', 'dd-mm-yyyy'), 103283);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100284, 'George', 108284, to_date('02-09-2020', 'dd-mm-yyyy'), 103284);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100285, 'Kara', 108285, to_date('31-05-2020', 'dd-mm-yyyy'), 103285);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100286, 'Diana', 108286, to_date('20-11-2022', 'dd-mm-yyyy'), 103286);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100287, 'Renee', 108287, to_date('16-01-2020', 'dd-mm-yyyy'), 103287);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100288, 'Randy', 108288, to_date('01-08-2020', 'dd-mm-yyyy'), 103288);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100289, 'Ricky', 108289, to_date('29-03-2021', 'dd-mm-yyyy'), 103289);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100290, 'Michael', 108290, to_date('29-01-2021', 'dd-mm-yyyy'), 103290);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100291, 'Andrew', 108291, to_date('29-01-2022', 'dd-mm-yyyy'), 103291);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100292, 'Devon', 108292, to_date('09-04-2021', 'dd-mm-yyyy'), 103292);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100293, 'Sierra', 108293, to_date('09-09-2020', 'dd-mm-yyyy'), 103293);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100294, 'Barbara', 108294, to_date('25-01-2020', 'dd-mm-yyyy'), 103294);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100295, 'Crystal', 108295, to_date('07-06-2022', 'dd-mm-yyyy'), 103295);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100296, 'Matthew', 108296, to_date('01-04-2023', 'dd-mm-yyyy'), 103296);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100297, 'Joseph', 108297, to_date('03-12-2021', 'dd-mm-yyyy'), 103297);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100298, 'Kimberly', 108298, to_date('13-02-2023', 'dd-mm-yyyy'), 103298);
commit;
prompt 300 records committed...
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100299, 'Lindsay', 108299, to_date('01-10-2023', 'dd-mm-yyyy'), 103299);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100300, 'Tracy', 108300, to_date('19-08-2022', 'dd-mm-yyyy'), 103300);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100301, 'Michael', 108301, to_date('14-02-2023', 'dd-mm-yyyy'), 103301);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100302, 'Whitney', 108302, to_date('31-12-2021', 'dd-mm-yyyy'), 103302);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100303, 'Kathleen', 108303, to_date('20-08-2021', 'dd-mm-yyyy'), 103303);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100304, 'Megan', 108304, to_date('27-03-2024', 'dd-mm-yyyy'), 103304);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100305, 'Mark', 108305, to_date('01-09-2022', 'dd-mm-yyyy'), 103305);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100306, 'Alfred', 108306, to_date('20-08-2022', 'dd-mm-yyyy'), 103306);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100307, 'Juan', 108307, to_date('01-06-2022', 'dd-mm-yyyy'), 103307);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100308, 'Susan', 108308, to_date('09-04-2021', 'dd-mm-yyyy'), 103308);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100309, 'Jared', 108309, to_date('18-07-2022', 'dd-mm-yyyy'), 103309);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100310, 'Connie', 108310, to_date('09-02-2023', 'dd-mm-yyyy'), 103310);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100311, 'Jodi', 108311, to_date('14-01-2022', 'dd-mm-yyyy'), 103311);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100312, 'Jessica', 108312, to_date('10-02-2024', 'dd-mm-yyyy'), 103312);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100313, 'Amy', 108313, to_date('25-02-2021', 'dd-mm-yyyy'), 103313);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100314, 'Joan', 108314, to_date('17-05-2020', 'dd-mm-yyyy'), 103314);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100315, 'Christopher', 108315, to_date('27-07-2020', 'dd-mm-yyyy'), 103315);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100316, 'Mary', 108316, to_date('03-03-2023', 'dd-mm-yyyy'), 103316);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100317, 'Krista', 108317, to_date('16-11-2020', 'dd-mm-yyyy'), 103317);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100318, 'Dylan', 108318, to_date('26-02-2021', 'dd-mm-yyyy'), 103318);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100319, 'Jason', 108319, to_date('13-12-2023', 'dd-mm-yyyy'), 103319);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100320, 'James', 108320, to_date('18-12-2022', 'dd-mm-yyyy'), 103320);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100321, 'Linda', 108321, to_date('29-11-2021', 'dd-mm-yyyy'), 103321);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100322, 'Amber', 108322, to_date('26-05-2020', 'dd-mm-yyyy'), 103322);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100323, 'Gabrielle', 108323, to_date('20-10-2021', 'dd-mm-yyyy'), 103323);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100324, 'Angela', 108324, to_date('02-05-2022', 'dd-mm-yyyy'), 103324);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100325, 'Douglas', 108325, to_date('08-06-2022', 'dd-mm-yyyy'), 103325);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100326, 'Rebecca', 108326, to_date('10-03-2020', 'dd-mm-yyyy'), 103326);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100327, 'Douglas', 108327, to_date('19-05-2022', 'dd-mm-yyyy'), 103327);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100328, 'Allen', 108328, to_date('26-07-2020', 'dd-mm-yyyy'), 103328);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100329, 'Michael', 108329, to_date('25-02-2022', 'dd-mm-yyyy'), 103329);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100330, 'Kimberly', 108330, to_date('07-04-2020', 'dd-mm-yyyy'), 103330);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100331, 'Cynthia', 108331, to_date('06-10-2020', 'dd-mm-yyyy'), 103331);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100332, 'Maria', 108332, to_date('09-10-2020', 'dd-mm-yyyy'), 103332);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100333, 'Courtney', 108333, to_date('02-04-2024', 'dd-mm-yyyy'), 103333);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100334, 'William', 108334, to_date('12-09-2021', 'dd-mm-yyyy'), 103334);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100335, 'Peter', 108335, to_date('30-01-2021', 'dd-mm-yyyy'), 103335);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100336, 'Jeffery', 108336, to_date('23-06-2020', 'dd-mm-yyyy'), 103336);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100337, 'Mary', 108337, to_date('19-09-2023', 'dd-mm-yyyy'), 103337);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100338, 'Kevin', 108338, to_date('07-02-2020', 'dd-mm-yyyy'), 103338);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100339, 'Mark', 108339, to_date('27-07-2021', 'dd-mm-yyyy'), 103339);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100340, 'Rachel', 108340, to_date('18-08-2023', 'dd-mm-yyyy'), 103340);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100341, 'Kyle', 108341, to_date('09-08-2023', 'dd-mm-yyyy'), 103341);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100342, 'Danny', 108342, to_date('30-06-2020', 'dd-mm-yyyy'), 103342);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100343, 'James', 108343, to_date('15-09-2021', 'dd-mm-yyyy'), 103343);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100344, 'Steven', 108344, to_date('16-07-2021', 'dd-mm-yyyy'), 103344);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100345, 'Mary', 108345, to_date('16-05-2023', 'dd-mm-yyyy'), 103345);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100346, 'Maureen', 108346, to_date('18-07-2022', 'dd-mm-yyyy'), 103346);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100347, 'Tiffany', 108347, to_date('09-03-2023', 'dd-mm-yyyy'), 103347);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100348, 'Daniel', 108348, to_date('05-08-2022', 'dd-mm-yyyy'), 103348);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100349, 'Preston', 108349, to_date('10-04-2024', 'dd-mm-yyyy'), 103349);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100350, 'Jacob', 108350, to_date('02-10-2023', 'dd-mm-yyyy'), 103350);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100351, 'Maria', 108351, to_date('07-12-2022', 'dd-mm-yyyy'), 103351);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100352, 'Caitlin', 108352, to_date('05-06-2020', 'dd-mm-yyyy'), 103352);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100353, 'Rodney', 108353, to_date('17-07-2020', 'dd-mm-yyyy'), 103353);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100354, 'Benjamin', 108354, to_date('14-09-2020', 'dd-mm-yyyy'), 103354);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100355, 'John', 108355, to_date('11-11-2023', 'dd-mm-yyyy'), 103355);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100356, 'Karen', 108356, to_date('09-03-2021', 'dd-mm-yyyy'), 103356);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100357, 'Samuel', 108357, to_date('23-02-2021', 'dd-mm-yyyy'), 103357);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100358, 'Jeff', 108358, to_date('15-08-2022', 'dd-mm-yyyy'), 103358);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100359, 'Denise', 108359, to_date('24-10-2021', 'dd-mm-yyyy'), 103359);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100360, 'Megan', 108360, to_date('26-09-2021', 'dd-mm-yyyy'), 103360);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100361, 'Bryan', 108361, to_date('20-06-2020', 'dd-mm-yyyy'), 103361);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100362, 'Matthew', 108362, to_date('06-01-2023', 'dd-mm-yyyy'), 103362);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100363, 'Michael', 108363, to_date('03-02-2023', 'dd-mm-yyyy'), 103363);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100364, 'Michael', 108364, to_date('22-07-2020', 'dd-mm-yyyy'), 103364);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100365, 'James', 108365, to_date('31-03-2023', 'dd-mm-yyyy'), 103365);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100366, 'Bryan', 108366, to_date('08-01-2021', 'dd-mm-yyyy'), 103366);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100367, 'Scott', 108367, to_date('07-07-2022', 'dd-mm-yyyy'), 103367);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100368, 'Bruce', 108368, to_date('16-11-2023', 'dd-mm-yyyy'), 103368);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100369, 'Tony', 108369, to_date('07-02-2023', 'dd-mm-yyyy'), 103369);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100370, 'James', 108370, to_date('22-03-2023', 'dd-mm-yyyy'), 103370);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100371, 'John', 108371, to_date('08-06-2021', 'dd-mm-yyyy'), 103371);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100372, 'Gregory', 108372, to_date('18-08-2020', 'dd-mm-yyyy'), 103372);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100373, 'Justin', 108373, to_date('23-12-2020', 'dd-mm-yyyy'), 103373);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100374, 'Madison', 108374, to_date('10-07-2022', 'dd-mm-yyyy'), 103374);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100375, 'Kimberly', 108375, to_date('06-09-2022', 'dd-mm-yyyy'), 103375);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100376, 'Daniel', 108376, to_date('02-12-2022', 'dd-mm-yyyy'), 103376);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100377, 'Kayla', 108377, to_date('11-02-2021', 'dd-mm-yyyy'), 103377);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100378, 'Vanessa', 108378, to_date('30-05-2020', 'dd-mm-yyyy'), 103378);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100379, 'Joel', 108379, to_date('18-09-2021', 'dd-mm-yyyy'), 103379);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100380, 'Laurie', 108380, to_date('12-02-2023', 'dd-mm-yyyy'), 103380);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100381, 'Shannon', 108381, to_date('08-04-2020', 'dd-mm-yyyy'), 103381);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100382, 'George', 108382, to_date('25-11-2020', 'dd-mm-yyyy'), 103382);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100383, 'David', 108383, to_date('25-09-2021', 'dd-mm-yyyy'), 103383);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100384, 'Michael', 108384, to_date('20-02-2023', 'dd-mm-yyyy'), 103384);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100385, 'Veronica', 108385, to_date('05-06-2023', 'dd-mm-yyyy'), 103385);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100386, 'Maria', 108386, to_date('17-03-2022', 'dd-mm-yyyy'), 103386);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100387, 'Laura', 108387, to_date('29-03-2020', 'dd-mm-yyyy'), 103387);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100388, 'Robert', 108388, to_date('06-05-2023', 'dd-mm-yyyy'), 103388);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100389, 'Stephanie', 108389, to_date('07-04-2022', 'dd-mm-yyyy'), 103389);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100390, 'Kevin', 108390, to_date('04-10-2020', 'dd-mm-yyyy'), 103390);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100391, 'Thomas', 108391, to_date('03-05-2023', 'dd-mm-yyyy'), 103391);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100392, 'Nicholas', 108392, to_date('19-12-2021', 'dd-mm-yyyy'), 103392);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100393, 'Kimberly', 108393, to_date('25-11-2021', 'dd-mm-yyyy'), 103393);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100394, 'Phillip', 108394, to_date('06-04-2024', 'dd-mm-yyyy'), 103394);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100395, 'Regina', 108395, to_date('25-07-2020', 'dd-mm-yyyy'), 103395);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100396, 'Lee', 108396, to_date('28-01-2022', 'dd-mm-yyyy'), 103396);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100397, 'Melissa', 108397, to_date('12-01-2022', 'dd-mm-yyyy'), 103397);
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100398, 'Jose', 108398, to_date('14-02-2021', 'dd-mm-yyyy'), 103398);
commit;
prompt 400 records committed...
insert into CUSTOMERS (customerid, customername, accountid, joindate, brancheid)
values (100399, 'Brittany', 108399, to_date('30-03-2023', 'dd-mm-yyyy'), 103399);
commit;
prompt 401 records loaded
prompt Loading LOANS...
insert into LOANS (loanid, loanamount, customerid)
values (101401, 10000, 100401);
insert into LOANS (loanid, loanamount, customerid)
values (101000, 28536, 100000);
insert into LOANS (loanid, loanamount, customerid)
values (101001, 72662, 100001);
insert into LOANS (loanid, loanamount, customerid)
values (101002, 68833, 100002);
insert into LOANS (loanid, loanamount, customerid)
values (101003, 68957, 100003);
insert into LOANS (loanid, loanamount, customerid)
values (101004, 60637, 100004);
insert into LOANS (loanid, loanamount, customerid)
values (101005, 15084, 100005);
insert into LOANS (loanid, loanamount, customerid)
values (101006, 17406, 100006);
insert into LOANS (loanid, loanamount, customerid)
values (101007, 6640, 100007);
insert into LOANS (loanid, loanamount, customerid)
values (101008, 34958, 100008);
insert into LOANS (loanid, loanamount, customerid)
values (101009, 96409, 100009);
insert into LOANS (loanid, loanamount, customerid)
values (101010, 22019, 100010);
insert into LOANS (loanid, loanamount, customerid)
values (101011, 61776, 100011);
insert into LOANS (loanid, loanamount, customerid)
values (101012, 92809, 100012);
insert into LOANS (loanid, loanamount, customerid)
values (101013, 91947, 100013);
insert into LOANS (loanid, loanamount, customerid)
values (101014, 70762, 100014);
insert into LOANS (loanid, loanamount, customerid)
values (101015, 20006, 100015);
insert into LOANS (loanid, loanamount, customerid)
values (101016, 64209, 100016);
insert into LOANS (loanid, loanamount, customerid)
values (101017, 21970, 100017);
insert into LOANS (loanid, loanamount, customerid)
values (101018, 64398, 100018);
insert into LOANS (loanid, loanamount, customerid)
values (101019, 69329, 100019);
insert into LOANS (loanid, loanamount, customerid)
values (101020, 11182, 100020);
insert into LOANS (loanid, loanamount, customerid)
values (101021, 70425, 100021);
insert into LOANS (loanid, loanamount, customerid)
values (101022, 76820, 100022);
insert into LOANS (loanid, loanamount, customerid)
values (101023, 21550, 100023);
insert into LOANS (loanid, loanamount, customerid)
values (101024, 25557, 100024);
insert into LOANS (loanid, loanamount, customerid)
values (101025, 59437, 100025);
insert into LOANS (loanid, loanamount, customerid)
values (101026, 62197, 100026);
insert into LOANS (loanid, loanamount, customerid)
values (101027, 28848, 100027);
insert into LOANS (loanid, loanamount, customerid)
values (101028, 23502, 100028);
insert into LOANS (loanid, loanamount, customerid)
values (101029, 81656, 100029);
insert into LOANS (loanid, loanamount, customerid)
values (101030, 35118, 100030);
insert into LOANS (loanid, loanamount, customerid)
values (101031, 53272, 100031);
insert into LOANS (loanid, loanamount, customerid)
values (101032, 30059, 100032);
insert into LOANS (loanid, loanamount, customerid)
values (101033, 43967, 100033);
insert into LOANS (loanid, loanamount, customerid)
values (101034, 26799, 100034);
insert into LOANS (loanid, loanamount, customerid)
values (101035, 92810, 100035);
insert into LOANS (loanid, loanamount, customerid)
values (101036, 87636, 100036);
insert into LOANS (loanid, loanamount, customerid)
values (101037, 54701, 100037);
insert into LOANS (loanid, loanamount, customerid)
values (101038, 61897, 100038);
insert into LOANS (loanid, loanamount, customerid)
values (101039, 87786, 100039);
insert into LOANS (loanid, loanamount, customerid)
values (101040, 69551, 100040);
insert into LOANS (loanid, loanamount, customerid)
values (101041, 89306, 100041);
insert into LOANS (loanid, loanamount, customerid)
values (101042, 94277, 100042);
insert into LOANS (loanid, loanamount, customerid)
values (101043, 12463, 100043);
insert into LOANS (loanid, loanamount, customerid)
values (101044, 36630, 100044);
insert into LOANS (loanid, loanamount, customerid)
values (101045, 42092, 100045);
insert into LOANS (loanid, loanamount, customerid)
values (101046, 10812, 100046);
insert into LOANS (loanid, loanamount, customerid)
values (101047, 26367, 100047);
insert into LOANS (loanid, loanamount, customerid)
values (101048, 43546, 100048);
insert into LOANS (loanid, loanamount, customerid)
values (101049, 26095, 100049);
insert into LOANS (loanid, loanamount, customerid)
values (101050, 14402, 100050);
insert into LOANS (loanid, loanamount, customerid)
values (101051, 92645, 100051);
insert into LOANS (loanid, loanamount, customerid)
values (101052, 12973, 100052);
insert into LOANS (loanid, loanamount, customerid)
values (101053, 88255, 100053);
insert into LOANS (loanid, loanamount, customerid)
values (101054, 58792, 100054);
insert into LOANS (loanid, loanamount, customerid)
values (101055, 28361, 100055);
insert into LOANS (loanid, loanamount, customerid)
values (101056, 67807, 100056);
insert into LOANS (loanid, loanamount, customerid)
values (101057, 25852, 100057);
insert into LOANS (loanid, loanamount, customerid)
values (101058, 18471, 100058);
insert into LOANS (loanid, loanamount, customerid)
values (101059, 12582, 100059);
insert into LOANS (loanid, loanamount, customerid)
values (101060, 78744, 100060);
insert into LOANS (loanid, loanamount, customerid)
values (101061, 33842, 100061);
insert into LOANS (loanid, loanamount, customerid)
values (101062, 34122, 100062);
insert into LOANS (loanid, loanamount, customerid)
values (101063, 33297, 100063);
insert into LOANS (loanid, loanamount, customerid)
values (101064, 37318, 100064);
insert into LOANS (loanid, loanamount, customerid)
values (101065, 54722, 100065);
insert into LOANS (loanid, loanamount, customerid)
values (101066, 58003, 100066);
insert into LOANS (loanid, loanamount, customerid)
values (101067, 79575, 100067);
insert into LOANS (loanid, loanamount, customerid)
values (101068, 67885, 100068);
insert into LOANS (loanid, loanamount, customerid)
values (101069, 95960, 100069);
insert into LOANS (loanid, loanamount, customerid)
values (101070, 62650, 100070);
insert into LOANS (loanid, loanamount, customerid)
values (101071, 95406, 100071);
insert into LOANS (loanid, loanamount, customerid)
values (101072, 82104, 100072);
insert into LOANS (loanid, loanamount, customerid)
values (101073, 81106, 100073);
insert into LOANS (loanid, loanamount, customerid)
values (101074, 88957, 100074);
insert into LOANS (loanid, loanamount, customerid)
values (101075, 27084, 100075);
insert into LOANS (loanid, loanamount, customerid)
values (101076, 89040, 100076);
insert into LOANS (loanid, loanamount, customerid)
values (101077, 40268, 100077);
insert into LOANS (loanid, loanamount, customerid)
values (101078, 98289, 100078);
insert into LOANS (loanid, loanamount, customerid)
values (101079, 40970, 100079);
insert into LOANS (loanid, loanamount, customerid)
values (101080, 61305, 100080);
insert into LOANS (loanid, loanamount, customerid)
values (101081, 86216, 100081);
insert into LOANS (loanid, loanamount, customerid)
values (101082, 59784, 100082);
insert into LOANS (loanid, loanamount, customerid)
values (101083, 23461, 100083);
insert into LOANS (loanid, loanamount, customerid)
values (101084, 48572, 100084);
insert into LOANS (loanid, loanamount, customerid)
values (101085, 79543, 100085);
insert into LOANS (loanid, loanamount, customerid)
values (101086, 31930, 100086);
insert into LOANS (loanid, loanamount, customerid)
values (101087, 68140, 100087);
insert into LOANS (loanid, loanamount, customerid)
values (101088, 4292, 100088);
insert into LOANS (loanid, loanamount, customerid)
values (101089, 79048, 100089);
insert into LOANS (loanid, loanamount, customerid)
values (101090, 41308, 100090);
insert into LOANS (loanid, loanamount, customerid)
values (101091, 62243, 100091);
insert into LOANS (loanid, loanamount, customerid)
values (101092, 68136, 100092);
insert into LOANS (loanid, loanamount, customerid)
values (101093, 7310, 100093);
insert into LOANS (loanid, loanamount, customerid)
values (101094, 87275, 100094);
insert into LOANS (loanid, loanamount, customerid)
values (101095, 91956, 100095);
insert into LOANS (loanid, loanamount, customerid)
values (101096, 49851, 100096);
insert into LOANS (loanid, loanamount, customerid)
values (101097, 20522, 100097);
insert into LOANS (loanid, loanamount, customerid)
values (101098, 13134, 100098);
commit;
prompt 100 records committed...
insert into LOANS (loanid, loanamount, customerid)
values (101099, 78280, 100099);
insert into LOANS (loanid, loanamount, customerid)
values (101100, 35087, 100100);
insert into LOANS (loanid, loanamount, customerid)
values (101101, 66167, 100101);
insert into LOANS (loanid, loanamount, customerid)
values (101102, 7466, 100102);
insert into LOANS (loanid, loanamount, customerid)
values (101103, 87931, 100103);
insert into LOANS (loanid, loanamount, customerid)
values (101104, 96456, 100104);
insert into LOANS (loanid, loanamount, customerid)
values (101105, 93716, 100105);
insert into LOANS (loanid, loanamount, customerid)
values (101106, 49474, 100106);
insert into LOANS (loanid, loanamount, customerid)
values (101107, 78979, 100107);
insert into LOANS (loanid, loanamount, customerid)
values (101108, 51056, 100108);
insert into LOANS (loanid, loanamount, customerid)
values (101109, 19282, 100109);
insert into LOANS (loanid, loanamount, customerid)
values (101110, 30223, 100110);
insert into LOANS (loanid, loanamount, customerid)
values (101111, 29007, 100111);
insert into LOANS (loanid, loanamount, customerid)
values (101112, 22802, 100112);
insert into LOANS (loanid, loanamount, customerid)
values (101113, 24945, 100113);
insert into LOANS (loanid, loanamount, customerid)
values (101114, 17871, 100114);
insert into LOANS (loanid, loanamount, customerid)
values (101115, 37751, 100115);
insert into LOANS (loanid, loanamount, customerid)
values (101116, 90003, 100116);
insert into LOANS (loanid, loanamount, customerid)
values (101117, 43799, 100117);
insert into LOANS (loanid, loanamount, customerid)
values (101118, 96003, 100118);
insert into LOANS (loanid, loanamount, customerid)
values (101119, 85785, 100119);
insert into LOANS (loanid, loanamount, customerid)
values (101120, 63369, 100120);
insert into LOANS (loanid, loanamount, customerid)
values (101121, 96095, 100121);
insert into LOANS (loanid, loanamount, customerid)
values (101122, 78909, 100122);
insert into LOANS (loanid, loanamount, customerid)
values (101123, 56477, 100123);
insert into LOANS (loanid, loanamount, customerid)
values (101124, 30897, 100124);
insert into LOANS (loanid, loanamount, customerid)
values (101125, 8974, 100125);
insert into LOANS (loanid, loanamount, customerid)
values (101126, 39002, 100126);
insert into LOANS (loanid, loanamount, customerid)
values (101127, 52524, 100127);
insert into LOANS (loanid, loanamount, customerid)
values (101128, 61811, 100128);
insert into LOANS (loanid, loanamount, customerid)
values (101129, 78509, 100129);
insert into LOANS (loanid, loanamount, customerid)
values (101130, 37599, 100130);
insert into LOANS (loanid, loanamount, customerid)
values (101131, 71726, 100131);
insert into LOANS (loanid, loanamount, customerid)
values (101132, 56469, 100132);
insert into LOANS (loanid, loanamount, customerid)
values (101133, 72224, 100133);
insert into LOANS (loanid, loanamount, customerid)
values (101134, 66150, 100134);
insert into LOANS (loanid, loanamount, customerid)
values (101135, 58299, 100135);
insert into LOANS (loanid, loanamount, customerid)
values (101136, 33492, 100136);
insert into LOANS (loanid, loanamount, customerid)
values (101137, 72868, 100137);
insert into LOANS (loanid, loanamount, customerid)
values (101138, 81273, 100138);
insert into LOANS (loanid, loanamount, customerid)
values (101139, 11589, 100139);
insert into LOANS (loanid, loanamount, customerid)
values (101140, 6965, 100140);
insert into LOANS (loanid, loanamount, customerid)
values (101141, 64164, 100141);
insert into LOANS (loanid, loanamount, customerid)
values (101142, 80467, 100142);
insert into LOANS (loanid, loanamount, customerid)
values (101143, 87952, 100143);
insert into LOANS (loanid, loanamount, customerid)
values (101144, 55741, 100144);
insert into LOANS (loanid, loanamount, customerid)
values (101145, 37424, 100145);
insert into LOANS (loanid, loanamount, customerid)
values (101146, 8054, 100146);
insert into LOANS (loanid, loanamount, customerid)
values (101147, 45653, 100147);
insert into LOANS (loanid, loanamount, customerid)
values (101148, 71219, 100148);
insert into LOANS (loanid, loanamount, customerid)
values (101149, 34899, 100149);
insert into LOANS (loanid, loanamount, customerid)
values (101150, 57320, 100150);
insert into LOANS (loanid, loanamount, customerid)
values (101151, 96268, 100151);
insert into LOANS (loanid, loanamount, customerid)
values (101152, 7345, 100152);
insert into LOANS (loanid, loanamount, customerid)
values (101153, 53079, 100153);
insert into LOANS (loanid, loanamount, customerid)
values (101154, 88448, 100154);
insert into LOANS (loanid, loanamount, customerid)
values (101155, 66221, 100155);
insert into LOANS (loanid, loanamount, customerid)
values (101156, 7662, 100156);
insert into LOANS (loanid, loanamount, customerid)
values (101157, 74433, 100157);
insert into LOANS (loanid, loanamount, customerid)
values (101158, 61061, 100158);
insert into LOANS (loanid, loanamount, customerid)
values (101159, 79995, 100159);
insert into LOANS (loanid, loanamount, customerid)
values (101160, 83493, 100160);
insert into LOANS (loanid, loanamount, customerid)
values (101161, 79568, 100161);
insert into LOANS (loanid, loanamount, customerid)
values (101162, 60367, 100162);
insert into LOANS (loanid, loanamount, customerid)
values (101163, 3231, 100163);
insert into LOANS (loanid, loanamount, customerid)
values (101164, 92643, 100164);
insert into LOANS (loanid, loanamount, customerid)
values (101165, 13107, 100165);
insert into LOANS (loanid, loanamount, customerid)
values (101166, 30809, 100166);
insert into LOANS (loanid, loanamount, customerid)
values (101167, 11126, 100167);
insert into LOANS (loanid, loanamount, customerid)
values (101168, 98490, 100168);
insert into LOANS (loanid, loanamount, customerid)
values (101169, 14967, 100169);
insert into LOANS (loanid, loanamount, customerid)
values (101170, 62304, 100170);
insert into LOANS (loanid, loanamount, customerid)
values (101171, 73262, 100171);
insert into LOANS (loanid, loanamount, customerid)
values (101172, 48186, 100172);
insert into LOANS (loanid, loanamount, customerid)
values (101173, 94547, 100173);
insert into LOANS (loanid, loanamount, customerid)
values (101174, 59475, 100174);
insert into LOANS (loanid, loanamount, customerid)
values (101175, 64843, 100175);
insert into LOANS (loanid, loanamount, customerid)
values (101176, 83827, 100176);
insert into LOANS (loanid, loanamount, customerid)
values (101177, 28782, 100177);
insert into LOANS (loanid, loanamount, customerid)
values (101178, 23618, 100178);
insert into LOANS (loanid, loanamount, customerid)
values (101179, 66427, 100179);
insert into LOANS (loanid, loanamount, customerid)
values (101180, 63520, 100180);
insert into LOANS (loanid, loanamount, customerid)
values (101181, 26818, 100181);
insert into LOANS (loanid, loanamount, customerid)
values (101182, 60094, 100182);
insert into LOANS (loanid, loanamount, customerid)
values (101183, 35881, 100183);
insert into LOANS (loanid, loanamount, customerid)
values (101184, 61567, 100184);
insert into LOANS (loanid, loanamount, customerid)
values (101185, 31554, 100185);
insert into LOANS (loanid, loanamount, customerid)
values (101186, 21657, 100186);
insert into LOANS (loanid, loanamount, customerid)
values (101187, 63948, 100187);
insert into LOANS (loanid, loanamount, customerid)
values (101188, 31278, 100188);
insert into LOANS (loanid, loanamount, customerid)
values (101189, 46822, 100189);
insert into LOANS (loanid, loanamount, customerid)
values (101190, 40173, 100190);
insert into LOANS (loanid, loanamount, customerid)
values (101191, 37254, 100191);
insert into LOANS (loanid, loanamount, customerid)
values (101192, 41274, 100192);
insert into LOANS (loanid, loanamount, customerid)
values (101193, 55440, 100193);
insert into LOANS (loanid, loanamount, customerid)
values (101194, 86863, 100194);
insert into LOANS (loanid, loanamount, customerid)
values (101195, 4889, 100195);
insert into LOANS (loanid, loanamount, customerid)
values (101196, 95586, 100196);
insert into LOANS (loanid, loanamount, customerid)
values (101197, 33087, 100197);
insert into LOANS (loanid, loanamount, customerid)
values (101198, 33735, 100198);
commit;
prompt 200 records committed...
insert into LOANS (loanid, loanamount, customerid)
values (101199, 36189, 100199);
insert into LOANS (loanid, loanamount, customerid)
values (101200, 63986, 100200);
insert into LOANS (loanid, loanamount, customerid)
values (101201, 95727, 100201);
insert into LOANS (loanid, loanamount, customerid)
values (101202, 76664, 100202);
insert into LOANS (loanid, loanamount, customerid)
values (101203, 81851, 100203);
insert into LOANS (loanid, loanamount, customerid)
values (101204, 74830, 100204);
insert into LOANS (loanid, loanamount, customerid)
values (101205, 17611, 100205);
insert into LOANS (loanid, loanamount, customerid)
values (101206, 49703, 100206);
insert into LOANS (loanid, loanamount, customerid)
values (101207, 6332, 100207);
insert into LOANS (loanid, loanamount, customerid)
values (101208, 81907, 100208);
insert into LOANS (loanid, loanamount, customerid)
values (101209, 34655, 100209);
insert into LOANS (loanid, loanamount, customerid)
values (101210, 25161, 100210);
insert into LOANS (loanid, loanamount, customerid)
values (101211, 61330, 100211);
insert into LOANS (loanid, loanamount, customerid)
values (101212, 18428, 100212);
insert into LOANS (loanid, loanamount, customerid)
values (101213, 6225, 100213);
insert into LOANS (loanid, loanamount, customerid)
values (101214, 1069, 100214);
insert into LOANS (loanid, loanamount, customerid)
values (101215, 74092, 100215);
insert into LOANS (loanid, loanamount, customerid)
values (101216, 26452, 100216);
insert into LOANS (loanid, loanamount, customerid)
values (101217, 22805, 100217);
insert into LOANS (loanid, loanamount, customerid)
values (101218, 76791, 100218);
insert into LOANS (loanid, loanamount, customerid)
values (101219, 76743, 100219);
insert into LOANS (loanid, loanamount, customerid)
values (101220, 75710, 100220);
insert into LOANS (loanid, loanamount, customerid)
values (101221, 40052, 100221);
insert into LOANS (loanid, loanamount, customerid)
values (101222, 29292, 100222);
insert into LOANS (loanid, loanamount, customerid)
values (101223, 58260, 100223);
insert into LOANS (loanid, loanamount, customerid)
values (101224, 1481, 100224);
insert into LOANS (loanid, loanamount, customerid)
values (101225, 64763, 100225);
insert into LOANS (loanid, loanamount, customerid)
values (101226, 13470, 100226);
insert into LOANS (loanid, loanamount, customerid)
values (101227, 85658, 100227);
insert into LOANS (loanid, loanamount, customerid)
values (101228, 32883, 100228);
insert into LOANS (loanid, loanamount, customerid)
values (101229, 85791, 100229);
insert into LOANS (loanid, loanamount, customerid)
values (101230, 75234, 100230);
insert into LOANS (loanid, loanamount, customerid)
values (101231, 31571, 100231);
insert into LOANS (loanid, loanamount, customerid)
values (101232, 17124, 100232);
insert into LOANS (loanid, loanamount, customerid)
values (101233, 79969, 100233);
insert into LOANS (loanid, loanamount, customerid)
values (101234, 96762, 100234);
insert into LOANS (loanid, loanamount, customerid)
values (101235, 53853, 100235);
insert into LOANS (loanid, loanamount, customerid)
values (101236, 98913, 100236);
insert into LOANS (loanid, loanamount, customerid)
values (101237, 68053, 100237);
insert into LOANS (loanid, loanamount, customerid)
values (101238, 54388, 100238);
insert into LOANS (loanid, loanamount, customerid)
values (101239, 29315, 100239);
insert into LOANS (loanid, loanamount, customerid)
values (101240, 64387, 100240);
insert into LOANS (loanid, loanamount, customerid)
values (101241, 24736, 100241);
insert into LOANS (loanid, loanamount, customerid)
values (101242, 76148, 100242);
insert into LOANS (loanid, loanamount, customerid)
values (101243, 29098, 100243);
insert into LOANS (loanid, loanamount, customerid)
values (101244, 27006, 100244);
insert into LOANS (loanid, loanamount, customerid)
values (101245, 23116, 100245);
insert into LOANS (loanid, loanamount, customerid)
values (101246, 2050, 100246);
insert into LOANS (loanid, loanamount, customerid)
values (101247, 62490, 100247);
insert into LOANS (loanid, loanamount, customerid)
values (101248, 8452, 100248);
insert into LOANS (loanid, loanamount, customerid)
values (101249, 78706, 100249);
insert into LOANS (loanid, loanamount, customerid)
values (101250, 32142, 100250);
insert into LOANS (loanid, loanamount, customerid)
values (101251, 26831, 100251);
insert into LOANS (loanid, loanamount, customerid)
values (101252, 89370, 100252);
insert into LOANS (loanid, loanamount, customerid)
values (101253, 44289, 100253);
insert into LOANS (loanid, loanamount, customerid)
values (101254, 72036, 100254);
insert into LOANS (loanid, loanamount, customerid)
values (101255, 73787, 100255);
insert into LOANS (loanid, loanamount, customerid)
values (101256, 80116, 100256);
insert into LOANS (loanid, loanamount, customerid)
values (101257, 79025, 100257);
insert into LOANS (loanid, loanamount, customerid)
values (101258, 60544, 100258);
insert into LOANS (loanid, loanamount, customerid)
values (101259, 28245, 100259);
insert into LOANS (loanid, loanamount, customerid)
values (101260, 95964, 100260);
insert into LOANS (loanid, loanamount, customerid)
values (101261, 24052, 100261);
insert into LOANS (loanid, loanamount, customerid)
values (101262, 71021, 100262);
insert into LOANS (loanid, loanamount, customerid)
values (101263, 20468, 100263);
insert into LOANS (loanid, loanamount, customerid)
values (101264, 73610, 100264);
insert into LOANS (loanid, loanamount, customerid)
values (101265, 21168, 100265);
insert into LOANS (loanid, loanamount, customerid)
values (101266, 96458, 100266);
insert into LOANS (loanid, loanamount, customerid)
values (101267, 64873, 100267);
insert into LOANS (loanid, loanamount, customerid)
values (101268, 28945, 100268);
insert into LOANS (loanid, loanamount, customerid)
values (101269, 67018, 100269);
insert into LOANS (loanid, loanamount, customerid)
values (101270, 63499, 100270);
insert into LOANS (loanid, loanamount, customerid)
values (101271, 5419, 100271);
insert into LOANS (loanid, loanamount, customerid)
values (101272, 91094, 100272);
insert into LOANS (loanid, loanamount, customerid)
values (101273, 33534, 100273);
insert into LOANS (loanid, loanamount, customerid)
values (101274, 23794, 100274);
insert into LOANS (loanid, loanamount, customerid)
values (101275, 57769, 100275);
insert into LOANS (loanid, loanamount, customerid)
values (101276, 22349, 100276);
insert into LOANS (loanid, loanamount, customerid)
values (101277, 61973, 100277);
insert into LOANS (loanid, loanamount, customerid)
values (101278, 50788, 100278);
insert into LOANS (loanid, loanamount, customerid)
values (101279, 55448, 100279);
insert into LOANS (loanid, loanamount, customerid)
values (101280, 64167, 100280);
insert into LOANS (loanid, loanamount, customerid)
values (101281, 70439, 100281);
insert into LOANS (loanid, loanamount, customerid)
values (101282, 12555, 100282);
insert into LOANS (loanid, loanamount, customerid)
values (101283, 13140, 100283);
insert into LOANS (loanid, loanamount, customerid)
values (101284, 18791, 100284);
insert into LOANS (loanid, loanamount, customerid)
values (101285, 59691, 100285);
insert into LOANS (loanid, loanamount, customerid)
values (101286, 25351, 100286);
insert into LOANS (loanid, loanamount, customerid)
values (101287, 52200, 100287);
insert into LOANS (loanid, loanamount, customerid)
values (101288, 9345, 100288);
insert into LOANS (loanid, loanamount, customerid)
values (101289, 3143, 100289);
insert into LOANS (loanid, loanamount, customerid)
values (101290, 91696, 100290);
insert into LOANS (loanid, loanamount, customerid)
values (101291, 44458, 100291);
insert into LOANS (loanid, loanamount, customerid)
values (101292, 3127, 100292);
insert into LOANS (loanid, loanamount, customerid)
values (101293, 23128, 100293);
insert into LOANS (loanid, loanamount, customerid)
values (101294, 67790, 100294);
insert into LOANS (loanid, loanamount, customerid)
values (101295, 10401, 100295);
insert into LOANS (loanid, loanamount, customerid)
values (101296, 12388, 100296);
insert into LOANS (loanid, loanamount, customerid)
values (101297, 22667, 100297);
insert into LOANS (loanid, loanamount, customerid)
values (101298, 43749, 100298);
commit;
prompt 300 records committed...
insert into LOANS (loanid, loanamount, customerid)
values (101299, 40521, 100299);
insert into LOANS (loanid, loanamount, customerid)
values (101300, 13008, 100300);
insert into LOANS (loanid, loanamount, customerid)
values (101301, 77653, 100301);
insert into LOANS (loanid, loanamount, customerid)
values (101302, 59361, 100302);
insert into LOANS (loanid, loanamount, customerid)
values (101303, 68270, 100303);
insert into LOANS (loanid, loanamount, customerid)
values (101304, 85616, 100304);
insert into LOANS (loanid, loanamount, customerid)
values (101305, 55129, 100305);
insert into LOANS (loanid, loanamount, customerid)
values (101306, 13365, 100306);
insert into LOANS (loanid, loanamount, customerid)
values (101307, 43175, 100307);
insert into LOANS (loanid, loanamount, customerid)
values (101308, 50880, 100308);
insert into LOANS (loanid, loanamount, customerid)
values (101309, 10936, 100309);
insert into LOANS (loanid, loanamount, customerid)
values (101310, 4311, 100310);
insert into LOANS (loanid, loanamount, customerid)
values (101311, 78308, 100311);
insert into LOANS (loanid, loanamount, customerid)
values (101312, 48167, 100312);
insert into LOANS (loanid, loanamount, customerid)
values (101313, 75292, 100313);
insert into LOANS (loanid, loanamount, customerid)
values (101314, 15697, 100314);
insert into LOANS (loanid, loanamount, customerid)
values (101315, 97019, 100315);
insert into LOANS (loanid, loanamount, customerid)
values (101316, 22275, 100316);
insert into LOANS (loanid, loanamount, customerid)
values (101317, 96059, 100317);
insert into LOANS (loanid, loanamount, customerid)
values (101318, 31979, 100318);
insert into LOANS (loanid, loanamount, customerid)
values (101319, 23304, 100319);
insert into LOANS (loanid, loanamount, customerid)
values (101320, 27294, 100320);
insert into LOANS (loanid, loanamount, customerid)
values (101321, 75260, 100321);
insert into LOANS (loanid, loanamount, customerid)
values (101322, 91161, 100322);
insert into LOANS (loanid, loanamount, customerid)
values (101323, 65870, 100323);
insert into LOANS (loanid, loanamount, customerid)
values (101324, 33775, 100324);
insert into LOANS (loanid, loanamount, customerid)
values (101325, 45354, 100325);
insert into LOANS (loanid, loanamount, customerid)
values (101326, 29762, 100326);
insert into LOANS (loanid, loanamount, customerid)
values (101327, 20605, 100327);
insert into LOANS (loanid, loanamount, customerid)
values (101328, 23395, 100328);
insert into LOANS (loanid, loanamount, customerid)
values (101329, 76090, 100329);
insert into LOANS (loanid, loanamount, customerid)
values (101330, 43605, 100330);
insert into LOANS (loanid, loanamount, customerid)
values (101331, 2016, 100331);
insert into LOANS (loanid, loanamount, customerid)
values (101332, 22536, 100332);
insert into LOANS (loanid, loanamount, customerid)
values (101333, 63560, 100333);
insert into LOANS (loanid, loanamount, customerid)
values (101334, 5216, 100334);
insert into LOANS (loanid, loanamount, customerid)
values (101335, 34253, 100335);
insert into LOANS (loanid, loanamount, customerid)
values (101336, 20543, 100336);
insert into LOANS (loanid, loanamount, customerid)
values (101337, 49483, 100337);
insert into LOANS (loanid, loanamount, customerid)
values (101338, 61801, 100338);
insert into LOANS (loanid, loanamount, customerid)
values (101339, 20618, 100339);
insert into LOANS (loanid, loanamount, customerid)
values (101340, 9389, 100340);
insert into LOANS (loanid, loanamount, customerid)
values (101341, 53622, 100341);
insert into LOANS (loanid, loanamount, customerid)
values (101342, 86327, 100342);
insert into LOANS (loanid, loanamount, customerid)
values (101343, 17697, 100343);
insert into LOANS (loanid, loanamount, customerid)
values (101344, 69240, 100344);
insert into LOANS (loanid, loanamount, customerid)
values (101345, 3073, 100345);
insert into LOANS (loanid, loanamount, customerid)
values (101346, 61727, 100346);
insert into LOANS (loanid, loanamount, customerid)
values (101347, 96006, 100347);
insert into LOANS (loanid, loanamount, customerid)
values (101348, 89542, 100348);
insert into LOANS (loanid, loanamount, customerid)
values (101349, 38630, 100349);
insert into LOANS (loanid, loanamount, customerid)
values (101350, 97289, 100350);
insert into LOANS (loanid, loanamount, customerid)
values (101351, 87302, 100351);
insert into LOANS (loanid, loanamount, customerid)
values (101352, 48455, 100352);
insert into LOANS (loanid, loanamount, customerid)
values (101353, 22295, 100353);
insert into LOANS (loanid, loanamount, customerid)
values (101354, 47788, 100354);
insert into LOANS (loanid, loanamount, customerid)
values (101355, 42344, 100355);
insert into LOANS (loanid, loanamount, customerid)
values (101356, 80331, 100356);
insert into LOANS (loanid, loanamount, customerid)
values (101357, 30238, 100357);
insert into LOANS (loanid, loanamount, customerid)
values (101358, 59952, 100358);
insert into LOANS (loanid, loanamount, customerid)
values (101359, 96531, 100359);
insert into LOANS (loanid, loanamount, customerid)
values (101360, 91722, 100360);
insert into LOANS (loanid, loanamount, customerid)
values (101361, 63115, 100361);
insert into LOANS (loanid, loanamount, customerid)
values (101362, 63345, 100362);
insert into LOANS (loanid, loanamount, customerid)
values (101363, 77629, 100363);
insert into LOANS (loanid, loanamount, customerid)
values (101364, 9954, 100364);
insert into LOANS (loanid, loanamount, customerid)
values (101365, 9796, 100365);
insert into LOANS (loanid, loanamount, customerid)
values (101366, 55659, 100366);
insert into LOANS (loanid, loanamount, customerid)
values (101367, 86072, 100367);
insert into LOANS (loanid, loanamount, customerid)
values (101368, 23233, 100368);
insert into LOANS (loanid, loanamount, customerid)
values (101369, 92484, 100369);
insert into LOANS (loanid, loanamount, customerid)
values (101370, 1023, 100370);
insert into LOANS (loanid, loanamount, customerid)
values (101371, 53327, 100371);
insert into LOANS (loanid, loanamount, customerid)
values (101372, 64550, 100372);
insert into LOANS (loanid, loanamount, customerid)
values (101373, 10726, 100373);
insert into LOANS (loanid, loanamount, customerid)
values (101374, 35203, 100374);
insert into LOANS (loanid, loanamount, customerid)
values (101375, 61697, 100375);
insert into LOANS (loanid, loanamount, customerid)
values (101376, 53339, 100376);
insert into LOANS (loanid, loanamount, customerid)
values (101377, 95591, 100377);
insert into LOANS (loanid, loanamount, customerid)
values (101378, 92814, 100378);
insert into LOANS (loanid, loanamount, customerid)
values (101379, 85471, 100379);
insert into LOANS (loanid, loanamount, customerid)
values (101380, 10433, 100380);
insert into LOANS (loanid, loanamount, customerid)
values (101381, 16664, 100381);
insert into LOANS (loanid, loanamount, customerid)
values (101382, 54784, 100382);
insert into LOANS (loanid, loanamount, customerid)
values (101383, 27644, 100383);
insert into LOANS (loanid, loanamount, customerid)
values (101384, 41297, 100384);
insert into LOANS (loanid, loanamount, customerid)
values (101385, 78459, 100385);
insert into LOANS (loanid, loanamount, customerid)
values (101386, 4900, 100386);
insert into LOANS (loanid, loanamount, customerid)
values (101387, 2717, 100387);
insert into LOANS (loanid, loanamount, customerid)
values (101388, 16034, 100388);
insert into LOANS (loanid, loanamount, customerid)
values (101389, 86182, 100389);
insert into LOANS (loanid, loanamount, customerid)
values (101390, 13399, 100390);
insert into LOANS (loanid, loanamount, customerid)
values (101391, 5618, 100391);
insert into LOANS (loanid, loanamount, customerid)
values (101392, 92762, 100392);
insert into LOANS (loanid, loanamount, customerid)
values (101393, 56286, 100393);
insert into LOANS (loanid, loanamount, customerid)
values (101394, 70858, 100394);
insert into LOANS (loanid, loanamount, customerid)
values (101395, 67354, 100395);
insert into LOANS (loanid, loanamount, customerid)
values (101396, 83612, 100396);
insert into LOANS (loanid, loanamount, customerid)
values (101397, 6346, 100397);
insert into LOANS (loanid, loanamount, customerid)
values (101398, 55605, 100398);
commit;
prompt 400 records committed...
insert into LOANS (loanid, loanamount, customerid)
values (101399, 32909, 100399);
commit;
prompt 401 records loaded
prompt Loading TEAMS...
insert into TEAMS (teamid, workday)
values (104996, 'sunday');
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
commit;
prompt 100 records committed...
insert into TEAMS (teamid, workday)
values (104099, 'Tuesday');
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
commit;
prompt 200 records committed...
insert into TEAMS (teamid, workday)
values (104199, 'Thursday');
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
commit;
prompt 300 records committed...
insert into TEAMS (teamid, workday)
values (104299, 'Saturday');
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
commit;
prompt 400 records committed...
insert into TEAMS (teamid, workday)
values (104399, 'Monday');
commit;
prompt 401 records loaded
prompt Loading WORKERS...
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (107001, 'Taryn', 'Manager', 103401, 104996);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105000, 'Michael', 'Manager', 103000, 104000);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105001, 'Tara', 'Officer', 103001, 104000);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105002, 'Omar', 'Credit Analyst', 103002, 104000);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105003, 'Eric', 'Loan Closer', 103003, 104000);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105004, 'Danielle', 'Manager', 103004, 104001);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105005, 'Shawna', 'Officer', 103005, 104001);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105006, 'Christopher', 'Credit Analyst', 103006, 104001);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105007, 'Mark', 'Loan Closer', 103007, 104001);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105008, 'Matthew', 'Manager', 103008, 104002);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105009, 'Diana', 'Officer', 103009, 104002);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105010, 'Jerry', 'Credit Analyst', 103010, 104002);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105011, 'Christian', 'Loan Closer', 103011, 104002);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105012, 'Mark', 'Manager', 103012, 104003);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105013, 'Dominique', 'Officer', 103013, 104003);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105014, 'Timothy', 'Credit Analyst', 103014, 104003);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105015, 'Nicholas', 'Loan Closer', 103015, 104003);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105016, 'Brittany', 'Manager', 103016, 104004);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105017, 'Ross', 'Officer', 103017, 104004);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105018, 'Robert', 'Credit Analyst', 103018, 104004);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105019, 'Victor', 'Loan Closer', 103019, 104004);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105020, 'Matthew', 'Manager', 103020, 104005);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105021, 'Jose', 'Officer', 103021, 104005);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105022, 'James', 'Credit Analyst', 103022, 104005);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105023, 'Christina', 'Loan Closer', 103023, 104005);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105024, 'Kevin', 'Manager', 103024, 104006);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105025, 'Melissa', 'Officer', 103025, 104006);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105026, 'Courtney', 'Credit Analyst', 103026, 104006);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105027, 'Jessica', 'Loan Closer', 103027, 104006);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105028, 'Nicole', 'Manager', 103028, 104007);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105029, 'Gail', 'Officer', 103029, 104007);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105030, 'Gloria', 'Credit Analyst', 103030, 104007);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105031, 'Jeffrey', 'Loan Closer', 103031, 104007);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105032, 'Carl', 'Manager', 103032, 104008);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105033, 'Kenneth', 'Officer', 103033, 104008);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105034, 'Brittany', 'Credit Analyst', 103034, 104008);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105035, 'Matthew', 'Loan Closer', 103035, 104008);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105036, 'Jennifer', 'Manager', 103036, 104009);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105037, 'Rhonda', 'Officer', 103037, 104009);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105038, 'Tracy', 'Credit Analyst', 103038, 104009);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105039, 'Emily', 'Loan Closer', 103039, 104009);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105040, 'Robert', 'Manager', 103040, 104010);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105041, 'Anna', 'Officer', 103041, 104010);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105042, 'Samantha', 'Credit Analyst', 103042, 104010);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105043, 'Austin', 'Loan Closer', 103043, 104010);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105044, 'Lori', 'Manager', 103044, 104011);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105045, 'Troy', 'Officer', 103045, 104011);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105046, 'Brian', 'Credit Analyst', 103046, 104011);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105047, 'Karen', 'Loan Closer', 103047, 104011);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105048, 'Jennifer', 'Manager', 103048, 104012);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105049, 'Tina', 'Officer', 103049, 104012);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105050, 'Robert', 'Credit Analyst', 103050, 104012);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105051, 'Joshua', 'Loan Closer', 103051, 104012);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105052, 'Benjamin', 'Manager', 103052, 104013);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105053, 'Charles', 'Officer', 103053, 104013);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105054, 'Scott', 'Credit Analyst', 103054, 104013);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105055, 'Michael', 'Loan Closer', 103055, 104013);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105056, 'Andrew', 'Manager', 103056, 104014);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105057, 'Michael', 'Officer', 103057, 104014);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105058, 'Amanda', 'Credit Analyst', 103058, 104014);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105059, 'Jerry', 'Loan Closer', 103059, 104014);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105060, 'Amanda', 'Manager', 103060, 104015);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105061, 'Linda', 'Officer', 103061, 104015);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105062, 'Joseph', 'Credit Analyst', 103062, 104015);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105063, 'Michael', 'Loan Closer', 103063, 104015);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105064, 'John', 'Manager', 103064, 104016);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105065, 'Andrea', 'Officer', 103065, 104016);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105066, 'Amy', 'Credit Analyst', 103066, 104016);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105067, 'Zachary', 'Loan Closer', 103067, 104016);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105068, 'Briana', 'Manager', 103068, 104017);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105069, 'Alexandra', 'Officer', 103069, 104017);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105070, 'Oscar', 'Credit Analyst', 103070, 104017);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105071, 'Tyler', 'Loan Closer', 103071, 104017);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105072, 'Angela', 'Manager', 103072, 104018);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105073, 'Angela', 'Officer', 103073, 104018);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105074, 'Zachary', 'Credit Analyst', 103074, 104018);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105075, 'Michelle', 'Loan Closer', 103075, 104018);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105076, 'Luis', 'Manager', 103076, 104019);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105077, 'Tammy', 'Officer', 103077, 104019);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105078, 'Leslie', 'Credit Analyst', 103078, 104019);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105079, 'Andrew', 'Loan Closer', 103079, 104019);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105080, 'Charles', 'Manager', 103080, 104020);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105081, 'Michele', 'Officer', 103081, 104020);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105082, 'Kristine', 'Credit Analyst', 103082, 104020);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105083, 'Matthew', 'Loan Closer', 103083, 104020);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105084, 'Jeremy', 'Manager', 103084, 104021);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105085, 'Bryce', 'Officer', 103085, 104021);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105086, 'Lisa', 'Credit Analyst', 103086, 104021);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105087, 'Antonio', 'Loan Closer', 103087, 104021);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105088, 'George', 'Manager', 103088, 104022);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105089, 'Christopher', 'Officer', 103089, 104022);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105090, 'Destiny', 'Credit Analyst', 103090, 104022);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105091, 'Emily', 'Loan Closer', 103091, 104022);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105092, 'Melissa', 'Manager', 103092, 104023);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105093, 'Kara', 'Officer', 103093, 104023);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105094, 'Matthew', 'Credit Analyst', 103094, 104023);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105095, 'Brian', 'Loan Closer', 103095, 104023);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105096, 'Robert', 'Manager', 103096, 104024);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105097, 'Madison', 'Officer', 103097, 104024);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105098, 'Adam', 'Credit Analyst', 103098, 104024);
commit;
prompt 100 records committed...
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105099, 'Joshua', 'Loan Closer', 103099, 104024);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105100, 'Dylan', 'Manager', 103100, 104025);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105101, 'Nathaniel', 'Officer', 103101, 104025);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105102, 'Corey', 'Credit Analyst', 103102, 104025);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105103, 'Emily', 'Loan Closer', 103103, 104025);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105104, 'Stephanie', 'Manager', 103104, 104026);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105105, 'Kevin', 'Officer', 103105, 104026);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105106, 'Lisa', 'Credit Analyst', 103106, 104026);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105107, 'Christopher', 'Loan Closer', 103107, 104026);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105108, 'Ashley', 'Manager', 103108, 104027);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105109, 'Carl', 'Officer', 103109, 104027);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105110, 'Ashley', 'Credit Analyst', 103110, 104027);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105111, 'Joseph', 'Loan Closer', 103111, 104027);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105112, 'Stacey', 'Manager', 103112, 104028);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105113, 'Derek', 'Officer', 103113, 104028);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105114, 'Michael', 'Credit Analyst', 103114, 104028);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105115, 'Amy', 'Loan Closer', 103115, 104028);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105116, 'Tammy', 'Manager', 103116, 104029);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105117, 'Paul', 'Officer', 103117, 104029);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105118, 'Andrew', 'Credit Analyst', 103118, 104029);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105119, 'Rodney', 'Loan Closer', 103119, 104029);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105120, 'Kevin', 'Manager', 103120, 104030);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105121, 'Nicholas', 'Officer', 103121, 104030);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105122, 'Kimberly', 'Credit Analyst', 103122, 104030);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105123, 'Chloe', 'Loan Closer', 103123, 104030);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105124, 'Cynthia', 'Manager', 103124, 104031);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105125, 'Michael', 'Officer', 103125, 104031);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105126, 'Sarah', 'Credit Analyst', 103126, 104031);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105127, 'Sabrina', 'Loan Closer', 103127, 104031);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105128, 'Robert', 'Manager', 103128, 104032);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105129, 'Emily', 'Officer', 103129, 104032);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105130, 'Hailey', 'Credit Analyst', 103130, 104032);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105131, 'Regina', 'Loan Closer', 103131, 104032);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105132, 'Sonya', 'Manager', 103132, 104033);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105133, 'Matthew', 'Officer', 103133, 104033);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105134, 'Todd', 'Credit Analyst', 103134, 104033);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105135, 'Michael', 'Loan Closer', 103135, 104033);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105136, 'Sharon', 'Manager', 103136, 104034);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105137, 'Michelle', 'Officer', 103137, 104034);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105138, 'Heather', 'Credit Analyst', 103138, 104034);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105139, 'Matthew', 'Loan Closer', 103139, 104034);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105140, 'Levi', 'Manager', 103140, 104035);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105141, 'Tracy', 'Officer', 103141, 104035);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105142, 'Stephanie', 'Credit Analyst', 103142, 104035);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105143, 'James', 'Loan Closer', 103143, 104035);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105144, 'Tammy', 'Manager', 103144, 104036);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105145, 'Cynthia', 'Officer', 103145, 104036);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105146, 'Andrew', 'Credit Analyst', 103146, 104036);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105147, 'Mike', 'Loan Closer', 103147, 104036);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105148, 'Kimberly', 'Manager', 103148, 104037);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105149, 'Amy', 'Officer', 103149, 104037);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105150, 'Jennifer', 'Credit Analyst', 103150, 104037);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105151, 'Jamie', 'Loan Closer', 103151, 104037);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105152, 'Rebekah', 'Manager', 103152, 104038);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105153, 'Shaun', 'Officer', 103153, 104038);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105154, 'Pamela', 'Credit Analyst', 103154, 104038);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105155, 'Robin', 'Loan Closer', 103155, 104038);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105156, 'Christopher', 'Manager', 103156, 104039);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105157, 'Larry', 'Officer', 103157, 104039);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105158, 'Jessica', 'Credit Analyst', 103158, 104039);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105159, 'Ricky', 'Loan Closer', 103159, 104039);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105160, 'Joshua', 'Manager', 103160, 104040);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105161, 'Emily', 'Officer', 103161, 104040);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105162, 'Brent', 'Credit Analyst', 103162, 104040);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105163, 'Cynthia', 'Loan Closer', 103163, 104040);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105164, 'Karen', 'Manager', 103164, 104041);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105165, 'Ross', 'Officer', 103165, 104041);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105166, 'Kimberly', 'Credit Analyst', 103166, 104041);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105167, 'Rebecca', 'Loan Closer', 103167, 104041);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105168, 'Rachel', 'Manager', 103168, 104042);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105169, 'Deborah', 'Officer', 103169, 104042);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105170, 'Cheyenne', 'Credit Analyst', 103170, 104042);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105171, 'Mary', 'Loan Closer', 103171, 104042);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105172, 'James', 'Manager', 103172, 104043);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105173, 'Christopher', 'Officer', 103173, 104043);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105174, 'Bryan', 'Credit Analyst', 103174, 104043);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105175, 'Traci', 'Loan Closer', 103175, 104043);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105176, 'Tiffany', 'Manager', 103176, 104044);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105177, 'Jessica', 'Officer', 103177, 104044);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105178, 'Michelle', 'Credit Analyst', 103178, 104044);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105179, 'Nathan', 'Loan Closer', 103179, 104044);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105180, 'Carolyn', 'Manager', 103180, 104045);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105181, 'Shawn', 'Officer', 103181, 104045);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105182, 'Tina', 'Credit Analyst', 103182, 104045);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105183, 'Amy', 'Loan Closer', 103183, 104045);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105184, 'Andrea', 'Manager', 103184, 104046);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105185, 'Kimberly', 'Officer', 103185, 104046);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105186, 'Joseph', 'Credit Analyst', 103186, 104046);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105187, 'Heather', 'Loan Closer', 103187, 104046);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105188, 'Lori', 'Manager', 103188, 104047);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105189, 'Kelly', 'Officer', 103189, 104047);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105190, 'Olivia', 'Credit Analyst', 103190, 104047);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105191, 'Michael', 'Loan Closer', 103191, 104047);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105192, 'Natasha', 'Manager', 103192, 104048);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105193, 'Courtney', 'Officer', 103193, 104048);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105194, 'Scott', 'Credit Analyst', 103194, 104048);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105195, 'Betty', 'Loan Closer', 103195, 104048);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105196, 'Tiffany', 'Manager', 103196, 104049);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105197, 'Kelly', 'Officer', 103197, 104049);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105198, 'Jody', 'Credit Analyst', 103198, 104049);
commit;
prompt 200 records committed...
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105199, 'Michael', 'Loan Closer', 103199, 104049);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105200, 'Robin', 'Manager', 103200, 104050);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105201, 'Mary', 'Officer', 103201, 104050);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105202, 'Joseph', 'Credit Analyst', 103202, 104050);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105203, 'Kristine', 'Loan Closer', 103203, 104050);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105204, 'Jennifer', 'Manager', 103204, 104051);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105205, 'Joseph', 'Officer', 103205, 104051);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105206, 'Jessica', 'Credit Analyst', 103206, 104051);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105207, 'Kelly', 'Loan Closer', 103207, 104051);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105208, 'Ashley', 'Manager', 103208, 104052);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105209, 'Alexander', 'Officer', 103209, 104052);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105210, 'Melinda', 'Credit Analyst', 103210, 104052);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105211, 'Shaun', 'Loan Closer', 103211, 104052);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105212, 'Dustin', 'Manager', 103212, 104053);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105213, 'Brooke', 'Officer', 103213, 104053);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105214, 'Julie', 'Credit Analyst', 103214, 104053);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105215, 'Joshua', 'Loan Closer', 103215, 104053);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105216, 'Mark', 'Manager', 103216, 104054);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105217, 'Edward', 'Officer', 103217, 104054);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105218, 'Michael', 'Credit Analyst', 103218, 104054);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105219, 'Erin', 'Loan Closer', 103219, 104054);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105220, 'Dwayne', 'Manager', 103220, 104055);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105221, 'Joseph', 'Officer', 103221, 104055);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105222, 'Janice', 'Credit Analyst', 103222, 104055);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105223, 'James', 'Loan Closer', 103223, 104055);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105224, 'William', 'Manager', 103224, 104056);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105225, 'Dustin', 'Officer', 103225, 104056);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105226, 'Shawn', 'Credit Analyst', 103226, 104056);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105227, 'Ricky', 'Loan Closer', 103227, 104056);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105228, 'Dustin', 'Manager', 103228, 104057);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105229, 'Robert', 'Officer', 103229, 104057);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105230, 'Brenda', 'Credit Analyst', 103230, 104057);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105231, 'Megan', 'Loan Closer', 103231, 104057);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105232, 'Rachel', 'Manager', 103232, 104058);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105233, 'Charlotte', 'Officer', 103233, 104058);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105234, 'Timothy', 'Credit Analyst', 103234, 104058);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105235, 'Marissa', 'Loan Closer', 103235, 104058);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105236, 'Laura', 'Manager', 103236, 104059);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105237, 'Sarah', 'Officer', 103237, 104059);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105238, 'Kaitlyn', 'Credit Analyst', 103238, 104059);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105239, 'Theresa', 'Loan Closer', 103239, 104059);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105240, 'Jade', 'Manager', 103240, 104060);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105241, 'Mark', 'Officer', 103241, 104060);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105242, 'Sarah', 'Credit Analyst', 103242, 104060);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105243, 'Alexandra', 'Loan Closer', 103243, 104060);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105244, 'Tyler', 'Manager', 103244, 104061);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105245, 'Spencer', 'Officer', 103245, 104061);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105246, 'Brian', 'Credit Analyst', 103246, 104061);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105247, 'Cory', 'Loan Closer', 103247, 104061);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105248, 'Kevin', 'Manager', 103248, 104062);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105249, 'Kathleen', 'Officer', 103249, 104062);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105250, 'Kathleen', 'Credit Analyst', 103250, 104062);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105251, 'Susan', 'Loan Closer', 103251, 104062);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105252, 'James', 'Manager', 103252, 104063);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105253, 'David', 'Officer', 103253, 104063);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105254, 'Kevin', 'Credit Analyst', 103254, 104063);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105255, 'Anna', 'Loan Closer', 103255, 104063);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105256, 'David', 'Manager', 103256, 104064);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105257, 'Bryan', 'Officer', 103257, 104064);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105258, 'Rhonda', 'Credit Analyst', 103258, 104064);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105259, 'David', 'Loan Closer', 103259, 104064);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105260, 'Robert', 'Manager', 103260, 104065);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105261, 'Nancy', 'Officer', 103261, 104065);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105262, 'Joseph', 'Credit Analyst', 103262, 104065);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105263, 'Christopher', 'Loan Closer', 103263, 104065);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105264, 'Karen', 'Manager', 103264, 104066);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105265, 'Sheryl', 'Officer', 103265, 104066);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105266, 'Mary', 'Credit Analyst', 103266, 104066);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105267, 'Mario', 'Loan Closer', 103267, 104066);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105268, 'Melissa', 'Manager', 103268, 104067);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105269, 'Matthew', 'Officer', 103269, 104067);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105270, 'Jasmine', 'Credit Analyst', 103270, 104067);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105271, 'Tammy', 'Loan Closer', 103271, 104067);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105272, 'Melissa', 'Manager', 103272, 104068);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105273, 'Amy', 'Officer', 103273, 104068);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105274, 'Lee', 'Credit Analyst', 103274, 104068);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105275, 'Nancy', 'Loan Closer', 103275, 104068);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105276, 'Janet', 'Manager', 103276, 104069);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105277, 'Keith', 'Officer', 103277, 104069);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105278, 'Elizabeth', 'Credit Analyst', 103278, 104069);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105279, 'Maria', 'Loan Closer', 103279, 104069);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105280, 'Susan', 'Manager', 103280, 104070);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105281, 'Bradley', 'Officer', 103281, 104070);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105282, 'Martha', 'Credit Analyst', 103282, 104070);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105283, 'Caleb', 'Loan Closer', 103283, 104070);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105284, 'Lucas', 'Manager', 103284, 104071);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105285, 'Tina', 'Officer', 103285, 104071);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105286, 'Wendy', 'Credit Analyst', 103286, 104071);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105287, 'Jennifer', 'Loan Closer', 103287, 104071);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105288, 'Joseph', 'Manager', 103288, 104072);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105289, 'Kathleen', 'Officer', 103289, 104072);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105290, 'Luis', 'Credit Analyst', 103290, 104072);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105291, 'Jorge', 'Loan Closer', 103291, 104072);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105292, 'Nicholas', 'Manager', 103292, 104073);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105293, 'Joshua', 'Officer', 103293, 104073);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105294, 'Denise', 'Credit Analyst', 103294, 104073);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105295, 'Daniel', 'Loan Closer', 103295, 104073);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105296, 'Larry', 'Manager', 103296, 104074);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105297, 'Rebekah', 'Officer', 103297, 104074);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105298, 'Perry', 'Credit Analyst', 103298, 104074);
commit;
prompt 300 records committed...
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105299, 'Christopher', 'Loan Closer', 103299, 104074);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105300, 'Michael', 'Manager', 103300, 104075);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105301, 'Brian', 'Officer', 103301, 104075);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105302, 'Heather', 'Credit Analyst', 103302, 104075);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105303, 'Philip', 'Loan Closer', 103303, 104075);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105304, 'Natasha', 'Manager', 103304, 104076);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105305, 'William', 'Officer', 103305, 104076);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105306, 'Ronald', 'Credit Analyst', 103306, 104076);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105307, 'Christine', 'Loan Closer', 103307, 104076);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105308, 'Frederick', 'Manager', 103308, 104077);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105309, 'Amanda', 'Officer', 103309, 104077);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105310, 'Haley', 'Credit Analyst', 103310, 104077);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105311, 'Mitchell', 'Loan Closer', 103311, 104077);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105312, 'John', 'Manager', 103312, 104078);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105313, 'Christopher', 'Officer', 103313, 104078);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105314, 'Shawn', 'Credit Analyst', 103314, 104078);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105315, 'John', 'Loan Closer', 103315, 104078);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105316, 'Eileen', 'Manager', 103316, 104079);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105317, 'Johnny', 'Officer', 103317, 104079);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105318, 'Samantha', 'Credit Analyst', 103318, 104079);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105319, 'Michael', 'Loan Closer', 103319, 104079);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105320, 'Erica', 'Manager', 103320, 104080);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105321, 'Craig', 'Officer', 103321, 104080);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105322, 'Steven', 'Credit Analyst', 103322, 104080);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105323, 'Timothy', 'Loan Closer', 103323, 104080);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105324, 'Whitney', 'Manager', 103324, 104081);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105325, 'Gabriel', 'Officer', 103325, 104081);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105326, 'Cody', 'Credit Analyst', 103326, 104081);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105327, 'Kevin', 'Loan Closer', 103327, 104081);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105328, 'Laura', 'Manager', 103328, 104082);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105329, 'Michael', 'Officer', 103329, 104082);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105330, 'Crystal', 'Credit Analyst', 103330, 104082);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105331, 'Nathaniel', 'Loan Closer', 103331, 104082);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105332, 'Anna', 'Manager', 103332, 104083);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105333, 'Jason', 'Officer', 103333, 104083);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105334, 'Cynthia', 'Credit Analyst', 103334, 104083);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105335, 'Stephanie', 'Loan Closer', 103335, 104083);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105336, 'Jimmy', 'Manager', 103336, 104084);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105337, 'Theresa', 'Officer', 103337, 104084);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105338, 'Joshua', 'Credit Analyst', 103338, 104084);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105339, 'Gregory', 'Loan Closer', 103339, 104084);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105340, 'Sean', 'Manager', 103340, 104085);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105341, 'Ryan', 'Officer', 103341, 104085);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105342, 'Tom', 'Credit Analyst', 103342, 104085);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105343, 'Janet', 'Loan Closer', 103343, 104085);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105344, 'Wanda', 'Manager', 103344, 104086);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105345, 'Kiara', 'Officer', 103345, 104086);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105346, 'David', 'Credit Analyst', 103346, 104086);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105347, 'Allison', 'Loan Closer', 103347, 104086);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105348, 'Cheryl', 'Manager', 103348, 104087);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105349, 'Samantha', 'Officer', 103349, 104087);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105350, 'Phillip', 'Credit Analyst', 103350, 104087);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105351, 'Tammy', 'Loan Closer', 103351, 104087);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105352, 'Latoya', 'Manager', 103352, 104088);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105353, 'Jesse', 'Officer', 103353, 104088);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105354, 'Nicholas', 'Credit Analyst', 103354, 104088);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105355, 'Antonio', 'Loan Closer', 103355, 104088);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105356, 'Jamie', 'Manager', 103356, 104089);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105357, 'Diana', 'Officer', 103357, 104089);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105358, 'Brittany', 'Credit Analyst', 103358, 104089);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105359, 'Christopher', 'Loan Closer', 103359, 104089);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105360, 'Michael', 'Manager', 103360, 104090);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105361, 'Alex', 'Officer', 103361, 104090);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105362, 'Melissa', 'Credit Analyst', 103362, 104090);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105363, 'Timothy', 'Loan Closer', 103363, 104090);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105364, 'Debra', 'Manager', 103364, 104091);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105365, 'Mark', 'Officer', 103365, 104091);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105366, 'Haley', 'Credit Analyst', 103366, 104091);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105367, 'Alicia', 'Loan Closer', 103367, 104091);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105368, 'Alyssa', 'Manager', 103368, 104092);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105369, 'Matthew', 'Officer', 103369, 104092);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105370, 'Jo', 'Credit Analyst', 103370, 104092);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105371, 'Cody', 'Loan Closer', 103371, 104092);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105372, 'Richard', 'Manager', 103372, 104093);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105373, 'Jonathan', 'Officer', 103373, 104093);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105374, 'Thomas', 'Credit Analyst', 103374, 104093);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105375, 'Aaron', 'Loan Closer', 103375, 104093);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105376, 'Jill', 'Manager', 103376, 104094);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105377, 'Christopher', 'Officer', 103377, 104094);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105378, 'Cameron', 'Credit Analyst', 103378, 104094);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105379, 'Danielle', 'Loan Closer', 103379, 104094);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105380, 'Sharon', 'Manager', 103380, 104095);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105381, 'Diana', 'Officer', 103381, 104095);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105382, 'Brandi', 'Credit Analyst', 103382, 104095);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105383, 'Keith', 'Loan Closer', 103383, 104095);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105384, 'Michael', 'Manager', 103384, 104096);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105385, 'James', 'Officer', 103385, 104096);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105386, 'Leslie', 'Credit Analyst', 103386, 104096);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105387, 'Austin', 'Loan Closer', 103387, 104096);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105388, 'Brian', 'Manager', 103388, 104097);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105389, 'Tony', 'Officer', 103389, 104097);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105390, 'James', 'Credit Analyst', 103390, 104097);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105391, 'Meghan', 'Loan Closer', 103391, 104097);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105392, 'Kimberly', 'Manager', 103392, 104098);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105393, 'Lisa', 'Officer', 103393, 104098);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105394, 'Nicholas', 'Credit Analyst', 103394, 104098);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105395, 'Dan', 'Loan Closer', 103395, 104098);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105396, 'Patrick', 'Manager', 103396, 104099);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105397, 'David', 'Officer', 103397, 104099);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105398, 'Kelly', 'Credit Analyst', 103398, 104099);
commit;
prompt 400 records committed...
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105399, 'Misty', 'Loan Closer', 103399, 104099);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105400, 'Tina', 'Manager', 103000, 104100);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105401, 'Megan', 'Officer', 103001, 104100);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105402, 'Joanna', 'Credit Analyst', 103002, 104100);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105403, 'Kurt', 'Loan Closer', 103003, 104100);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105404, 'Megan', 'Manager', 103004, 104101);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105405, 'William', 'Officer', 103005, 104101);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105406, 'Christine', 'Credit Analyst', 103006, 104101);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105407, 'Jack', 'Loan Closer', 103007, 104101);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105408, 'Karen', 'Manager', 103008, 104102);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105409, 'Paula', 'Officer', 103009, 104102);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105410, 'Jennifer', 'Credit Analyst', 103010, 104102);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105411, 'Joe', 'Loan Closer', 103011, 104102);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105412, 'James', 'Manager', 103012, 104103);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105413, 'Justin', 'Officer', 103013, 104103);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105414, 'Sean', 'Credit Analyst', 103014, 104103);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105415, 'Amy', 'Loan Closer', 103015, 104103);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105416, 'Christian', 'Manager', 103016, 104104);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105417, 'Chad', 'Officer', 103017, 104104);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105418, 'Chris', 'Credit Analyst', 103018, 104104);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105419, 'Joseph', 'Loan Closer', 103019, 104104);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105420, 'Joseph', 'Manager', 103020, 104105);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105421, 'Zachary', 'Officer', 103021, 104105);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105422, 'Nathan', 'Credit Analyst', 103022, 104105);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105423, 'Joshua', 'Loan Closer', 103023, 104105);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105424, 'Anthony', 'Manager', 103024, 104106);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105425, 'Tina', 'Officer', 103025, 104106);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105426, 'Nicole', 'Credit Analyst', 103026, 104106);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105427, 'Susan', 'Loan Closer', 103027, 104106);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105428, 'Amy', 'Manager', 103028, 104107);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105429, 'James', 'Officer', 103029, 104107);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105430, 'William', 'Credit Analyst', 103030, 104107);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105431, 'Jason', 'Loan Closer', 103031, 104107);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105432, 'Keith', 'Manager', 103032, 104108);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105433, 'Alexa', 'Officer', 103033, 104108);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105434, 'Patrick', 'Credit Analyst', 103034, 104108);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105435, 'Mark', 'Loan Closer', 103035, 104108);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105436, 'Alicia', 'Manager', 103036, 104109);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105437, 'James', 'Officer', 103037, 104109);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105438, 'Brandon', 'Credit Analyst', 103038, 104109);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105439, 'Abigail', 'Loan Closer', 103039, 104109);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105440, 'Oscar', 'Manager', 103040, 104110);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105441, 'Michael', 'Officer', 103041, 104110);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105442, 'Katherine', 'Credit Analyst', 103042, 104110);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105443, 'Nicholas', 'Loan Closer', 103043, 104110);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105444, 'Donald', 'Manager', 103044, 104111);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105445, 'Jacob', 'Officer', 103045, 104111);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105446, 'Tommy', 'Credit Analyst', 103046, 104111);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105447, 'Karen', 'Loan Closer', 103047, 104111);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105448, 'Anna', 'Manager', 103048, 104112);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105449, 'Amanda', 'Officer', 103049, 104112);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105450, 'Jose', 'Credit Analyst', 103050, 104112);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105451, 'John', 'Loan Closer', 103051, 104112);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105452, 'Daniel', 'Manager', 103052, 104113);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105453, 'Lauren', 'Officer', 103053, 104113);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105454, 'Andrew', 'Credit Analyst', 103054, 104113);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105455, 'Seth', 'Loan Closer', 103055, 104113);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105456, 'Elizabeth', 'Manager', 103056, 104114);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105457, 'Jesse', 'Officer', 103057, 104114);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105458, 'Tony', 'Credit Analyst', 103058, 104114);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105459, 'Aaron', 'Loan Closer', 103059, 104114);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105460, 'Amanda', 'Manager', 103060, 104115);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105461, 'Renee', 'Officer', 103061, 104115);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105462, 'Rebecca', 'Credit Analyst', 103062, 104115);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105463, 'Crystal', 'Loan Closer', 103063, 104115);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105464, 'Alan', 'Manager', 103064, 104116);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105465, 'Edward', 'Officer', 103065, 104116);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105466, 'Mark', 'Credit Analyst', 103066, 104116);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105467, 'Hayden', 'Loan Closer', 103067, 104116);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105468, 'Julie', 'Manager', 103068, 104117);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105469, 'Connie', 'Officer', 103069, 104117);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105470, 'Amber', 'Credit Analyst', 103070, 104117);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105471, 'Margaret', 'Loan Closer', 103071, 104117);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105472, 'Sara', 'Manager', 103072, 104118);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105473, 'Linda', 'Officer', 103073, 104118);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105474, 'Jacob', 'Credit Analyst', 103074, 104118);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105475, 'Christy', 'Loan Closer', 103075, 104118);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105476, 'Brandon', 'Manager', 103076, 104119);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105477, 'Rachel', 'Officer', 103077, 104119);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105478, 'Manuel', 'Credit Analyst', 103078, 104119);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105479, 'Joshua', 'Loan Closer', 103079, 104119);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105480, 'Michael', 'Manager', 103080, 104120);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105481, 'John', 'Officer', 103081, 104120);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105482, 'Taylor', 'Credit Analyst', 103082, 104120);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105483, 'Lisa', 'Loan Closer', 103083, 104120);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105484, 'Thomas', 'Manager', 103084, 104121);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105485, 'Connie', 'Officer', 103085, 104121);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105486, 'Thomas', 'Credit Analyst', 103086, 104121);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105487, 'Justin', 'Loan Closer', 103087, 104121);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105488, 'Stacy', 'Manager', 103088, 104122);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105489, 'Steven', 'Officer', 103089, 104122);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105490, 'Jesus', 'Credit Analyst', 103090, 104122);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105491, 'Anna', 'Loan Closer', 103091, 104122);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105492, 'Sandra', 'Manager', 103092, 104123);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105493, 'Jacob', 'Officer', 103093, 104123);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105494, 'Richard', 'Credit Analyst', 103094, 104123);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105495, 'Hannah', 'Loan Closer', 103095, 104123);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105496, 'Stephen', 'Manager', 103096, 104124);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105497, 'Jerome', 'Officer', 103097, 104124);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105498, 'Elizabeth', 'Credit Analyst', 103098, 104124);
commit;
prompt 500 records committed...
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105499, 'Christopher', 'Loan Closer', 103099, 104124);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105500, 'Abigail', 'Manager', 103100, 104125);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105501, 'Alexander', 'Officer', 103101, 104125);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105502, 'Matthew', 'Credit Analyst', 103102, 104125);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105503, 'David', 'Loan Closer', 103103, 104125);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105504, 'William', 'Manager', 103104, 104126);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105505, 'Timothy', 'Officer', 103105, 104126);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105506, 'Arthur', 'Credit Analyst', 103106, 104126);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105507, 'Tyler', 'Loan Closer', 103107, 104126);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105508, 'William', 'Manager', 103108, 104127);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105509, 'Holly', 'Officer', 103109, 104127);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105510, 'Alexander', 'Credit Analyst', 103110, 104127);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105511, 'Hannah', 'Loan Closer', 103111, 104127);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105512, 'John', 'Manager', 103112, 104128);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105513, 'Phillip', 'Officer', 103113, 104128);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105514, 'Leslie', 'Credit Analyst', 103114, 104128);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105515, 'Michael', 'Loan Closer', 103115, 104128);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105516, 'Anthony', 'Manager', 103116, 104129);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105517, 'Robert', 'Officer', 103117, 104129);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105518, 'Luis', 'Credit Analyst', 103118, 104129);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105519, 'Shannon', 'Loan Closer', 103119, 104129);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105520, 'Trevor', 'Manager', 103120, 104130);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105521, 'Shirley', 'Officer', 103121, 104130);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105522, 'Kayla', 'Credit Analyst', 103122, 104130);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105523, 'Adrian', 'Loan Closer', 103123, 104130);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105524, 'Ashley', 'Manager', 103124, 104131);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105525, 'Tina', 'Officer', 103125, 104131);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105526, 'Jeffrey', 'Credit Analyst', 103126, 104131);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105527, 'Christopher', 'Loan Closer', 103127, 104131);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105528, 'Larry', 'Manager', 103128, 104132);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105529, 'Nicholas', 'Officer', 103129, 104132);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105530, 'Evan', 'Credit Analyst', 103130, 104132);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105531, 'Paul', 'Loan Closer', 103131, 104132);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105532, 'Linda', 'Manager', 103132, 104133);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105533, 'Ronald', 'Officer', 103133, 104133);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105534, 'Kevin', 'Credit Analyst', 103134, 104133);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105535, 'Mindy', 'Loan Closer', 103135, 104133);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105536, 'Daniel', 'Manager', 103136, 104134);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105537, 'Valerie', 'Officer', 103137, 104134);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105538, 'Megan', 'Credit Analyst', 103138, 104134);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105539, 'Tammy', 'Loan Closer', 103139, 104134);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105540, 'Marcus', 'Manager', 103140, 104135);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105541, 'Kelly', 'Officer', 103141, 104135);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105542, 'Scott', 'Credit Analyst', 103142, 104135);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105543, 'Jennifer', 'Loan Closer', 103143, 104135);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105544, 'Brandy', 'Manager', 103144, 104136);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105545, 'Aaron', 'Officer', 103145, 104136);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105546, 'Kelly', 'Credit Analyst', 103146, 104136);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105547, 'Scott', 'Loan Closer', 103147, 104136);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105548, 'Barbara', 'Manager', 103148, 104137);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105549, 'Tyler', 'Officer', 103149, 104137);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105550, 'Anita', 'Credit Analyst', 103150, 104137);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105551, 'Kristine', 'Loan Closer', 103151, 104137);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105552, 'Paul', 'Manager', 103152, 104138);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105553, 'Amanda', 'Officer', 103153, 104138);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105554, 'Jason', 'Credit Analyst', 103154, 104138);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105555, 'Henry', 'Loan Closer', 103155, 104138);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105556, 'Steven', 'Manager', 103156, 104139);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105557, 'Theresa', 'Officer', 103157, 104139);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105558, 'Michael', 'Credit Analyst', 103158, 104139);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105559, 'Linda', 'Loan Closer', 103159, 104139);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105560, 'Stephen', 'Manager', 103160, 104140);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105561, 'Wayne', 'Officer', 103161, 104140);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105562, 'David', 'Credit Analyst', 103162, 104140);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105563, 'Erin', 'Loan Closer', 103163, 104140);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105564, 'Jeffrey', 'Manager', 103164, 104141);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105565, 'Adam', 'Officer', 103165, 104141);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105566, 'Teresa', 'Credit Analyst', 103166, 104141);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105567, 'Alyssa', 'Loan Closer', 103167, 104141);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105568, 'Chase', 'Manager', 103168, 104142);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105569, 'Kaitlin', 'Officer', 103169, 104142);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105570, 'Howard', 'Credit Analyst', 103170, 104142);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105571, 'Stephanie', 'Loan Closer', 103171, 104142);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105572, 'Julia', 'Manager', 103172, 104143);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105573, 'Kyle', 'Officer', 103173, 104143);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105574, 'Barbara', 'Credit Analyst', 103174, 104143);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105575, 'Joel', 'Loan Closer', 103175, 104143);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105576, 'Ashley', 'Manager', 103176, 104144);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105577, 'Ethan', 'Officer', 103177, 104144);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105578, 'Linda', 'Credit Analyst', 103178, 104144);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105579, 'Jerry', 'Loan Closer', 103179, 104144);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105580, 'Jeremy', 'Manager', 103180, 104145);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105581, 'Eric', 'Officer', 103181, 104145);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105582, 'Lori', 'Credit Analyst', 103182, 104145);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105583, 'Marie', 'Loan Closer', 103183, 104145);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105584, 'Mark', 'Manager', 103184, 104146);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105585, 'Emma', 'Officer', 103185, 104146);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105586, 'Lisa', 'Credit Analyst', 103186, 104146);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105587, 'Shannon', 'Loan Closer', 103187, 104146);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105588, 'Alicia', 'Manager', 103188, 104147);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105589, 'Casey', 'Officer', 103189, 104147);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105590, 'Katherine', 'Credit Analyst', 103190, 104147);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105591, 'Charles', 'Loan Closer', 103191, 104147);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105592, 'Monica', 'Manager', 103192, 104148);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105593, 'Alison', 'Officer', 103193, 104148);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105594, 'Jessica', 'Credit Analyst', 103194, 104148);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105595, 'Jennifer', 'Loan Closer', 103195, 104148);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105596, 'Robert', 'Manager', 103196, 104149);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105597, 'Jonathan', 'Officer', 103197, 104149);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105598, 'Dylan', 'Credit Analyst', 103198, 104149);
commit;
prompt 600 records committed...
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105599, 'Chase', 'Loan Closer', 103199, 104149);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105600, 'Mary', 'Manager', 103200, 104150);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105601, 'James', 'Officer', 103201, 104150);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105602, 'Wendy', 'Credit Analyst', 103202, 104150);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105603, 'Elizabeth', 'Loan Closer', 103203, 104150);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105604, 'Rodney', 'Manager', 103204, 104151);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105605, 'Vanessa', 'Officer', 103205, 104151);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105606, 'Alexander', 'Credit Analyst', 103206, 104151);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105607, 'Julia', 'Loan Closer', 103207, 104151);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105608, 'Karen', 'Manager', 103208, 104152);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105609, 'Wendy', 'Officer', 103209, 104152);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105610, 'Jeffrey', 'Credit Analyst', 103210, 104152);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105611, 'Zachary', 'Loan Closer', 103211, 104152);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105612, 'Jesse', 'Manager', 103212, 104153);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105613, 'Lori', 'Officer', 103213, 104153);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105614, 'David', 'Credit Analyst', 103214, 104153);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105615, 'Travis', 'Loan Closer', 103215, 104153);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105616, 'Ryan', 'Manager', 103216, 104154);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105617, 'Kayla', 'Officer', 103217, 104154);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105618, 'David', 'Credit Analyst', 103218, 104154);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105619, 'Allen', 'Loan Closer', 103219, 104154);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105620, 'Kimberly', 'Manager', 103220, 104155);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105621, 'Kim', 'Officer', 103221, 104155);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105622, 'James', 'Credit Analyst', 103222, 104155);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105623, 'Gina', 'Loan Closer', 103223, 104155);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105624, 'Sandra', 'Manager', 103224, 104156);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105625, 'Alyssa', 'Officer', 103225, 104156);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105626, 'Desiree', 'Credit Analyst', 103226, 104156);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105627, 'Ian', 'Loan Closer', 103227, 104156);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105628, 'Gerald', 'Manager', 103228, 104157);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105629, 'Amber', 'Officer', 103229, 104157);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105630, 'Sarah', 'Credit Analyst', 103230, 104157);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105631, 'Robert', 'Loan Closer', 103231, 104157);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105632, 'Kristina', 'Manager', 103232, 104158);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105633, 'Timothy', 'Officer', 103233, 104158);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105634, 'Dylan', 'Credit Analyst', 103234, 104158);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105635, 'Derek', 'Loan Closer', 103235, 104158);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105636, 'Johnny', 'Manager', 103236, 104159);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105637, 'Richard', 'Officer', 103237, 104159);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105638, 'James', 'Credit Analyst', 103238, 104159);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105639, 'Grant', 'Loan Closer', 103239, 104159);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105640, 'Jim', 'Manager', 103240, 104160);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105641, 'Raven', 'Officer', 103241, 104160);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105642, 'Devin', 'Credit Analyst', 103242, 104160);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105643, 'Jill', 'Loan Closer', 103243, 104160);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105644, 'Kristen', 'Manager', 103244, 104161);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105645, 'Daniel', 'Officer', 103245, 104161);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105646, 'Michael', 'Credit Analyst', 103246, 104161);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105647, 'Anna', 'Loan Closer', 103247, 104161);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105648, 'Tiffany', 'Manager', 103248, 104162);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105649, 'Jennifer', 'Officer', 103249, 104162);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105650, 'Brianna', 'Credit Analyst', 103250, 104162);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105651, 'Michael', 'Loan Closer', 103251, 104162);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105652, 'Jason', 'Manager', 103252, 104163);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105653, 'Lisa', 'Officer', 103253, 104163);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105654, 'Anthony', 'Credit Analyst', 103254, 104163);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105655, 'David', 'Loan Closer', 103255, 104163);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105656, 'Anne', 'Manager', 103256, 104164);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105657, 'Victor', 'Officer', 103257, 104164);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105658, 'Steven', 'Credit Analyst', 103258, 104164);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105659, 'Mario', 'Loan Closer', 103259, 104164);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105660, 'Tammy', 'Manager', 103260, 104165);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105661, 'Dominique', 'Officer', 103261, 104165);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105662, 'Jennifer', 'Credit Analyst', 103262, 104165);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105663, 'William', 'Loan Closer', 103263, 104165);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105664, 'Todd', 'Manager', 103264, 104166);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105665, 'Kayla', 'Officer', 103265, 104166);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105666, 'Derek', 'Credit Analyst', 103266, 104166);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105667, 'Joshua', 'Loan Closer', 103267, 104166);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105668, 'Amy', 'Manager', 103268, 104167);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105669, 'Katherine', 'Officer', 103269, 104167);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105670, 'Diane', 'Credit Analyst', 103270, 104167);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105671, 'Kristy', 'Loan Closer', 103271, 104167);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105672, 'Amanda', 'Manager', 103272, 104168);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105673, 'Philip', 'Officer', 103273, 104168);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105674, 'Andrew', 'Credit Analyst', 103274, 104168);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105675, 'Jennifer', 'Loan Closer', 103275, 104168);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105676, 'Taylor', 'Manager', 103276, 104169);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105677, 'Harold', 'Officer', 103277, 104169);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105678, 'Ryan', 'Credit Analyst', 103278, 104169);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105679, 'Colin', 'Loan Closer', 103279, 104169);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105680, 'Bill', 'Manager', 103280, 104170);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105681, 'Austin', 'Officer', 103281, 104170);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105682, 'Ricky', 'Credit Analyst', 103282, 104170);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105683, 'Jacob', 'Loan Closer', 103283, 104170);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105684, 'Dwayne', 'Manager', 103284, 104171);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105685, 'Samuel', 'Officer', 103285, 104171);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105686, 'Shawna', 'Credit Analyst', 103286, 104171);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105687, 'Patricia', 'Loan Closer', 103287, 104171);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105688, 'Karen', 'Manager', 103288, 104172);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105689, 'Cynthia', 'Officer', 103289, 104172);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105690, 'Ryan', 'Credit Analyst', 103290, 104172);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105691, 'Tyler', 'Loan Closer', 103291, 104172);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105692, 'Christopher', 'Manager', 103292, 104173);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105693, 'Troy', 'Officer', 103293, 104173);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105694, 'Daniel', 'Credit Analyst', 103294, 104173);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105695, 'Veronica', 'Loan Closer', 103295, 104173);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105696, 'Charles', 'Manager', 103296, 104174);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105697, 'Jennifer', 'Officer', 103297, 104174);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105698, 'Robert', 'Credit Analyst', 103298, 104174);
commit;
prompt 700 records committed...
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105699, 'Andrew', 'Loan Closer', 103299, 104174);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105700, 'Kenneth', 'Manager', 103300, 104175);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105701, 'Taylor', 'Officer', 103301, 104175);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105702, 'Kathleen', 'Credit Analyst', 103302, 104175);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105703, 'Benjamin', 'Loan Closer', 103303, 104175);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105704, 'Anthony', 'Manager', 103304, 104176);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105705, 'Vickie', 'Officer', 103305, 104176);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105706, 'Lindsey', 'Credit Analyst', 103306, 104176);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105707, 'Rachel', 'Loan Closer', 103307, 104176);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105708, 'Shannon', 'Manager', 103308, 104177);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105709, 'Kenneth', 'Officer', 103309, 104177);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105710, 'Emily', 'Credit Analyst', 103310, 104177);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105711, 'Shannon', 'Loan Closer', 103311, 104177);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105712, 'Theresa', 'Manager', 103312, 104178);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105713, 'Julie', 'Officer', 103313, 104178);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105714, 'Cory', 'Credit Analyst', 103314, 104178);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105715, 'Debra', 'Loan Closer', 103315, 104178);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105716, 'Angela', 'Manager', 103316, 104179);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105717, 'Stephanie', 'Officer', 103317, 104179);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105718, 'Kristen', 'Credit Analyst', 103318, 104179);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105719, 'Laura', 'Loan Closer', 103319, 104179);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105720, 'Joseph', 'Manager', 103320, 104180);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105721, 'Tina', 'Officer', 103321, 104180);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105722, 'Mary', 'Credit Analyst', 103322, 104180);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105723, 'Amy', 'Loan Closer', 103323, 104180);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105724, 'Marissa', 'Manager', 103324, 104181);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105725, 'Troy', 'Officer', 103325, 104181);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105726, 'Rodney', 'Credit Analyst', 103326, 104181);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105727, 'Julie', 'Loan Closer', 103327, 104181);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105728, 'Mikayla', 'Manager', 103328, 104182);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105729, 'Gary', 'Officer', 103329, 104182);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105730, 'Brenda', 'Credit Analyst', 103330, 104182);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105731, 'Melissa', 'Loan Closer', 103331, 104182);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105732, 'Michelle', 'Manager', 103332, 104183);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105733, 'Stephanie', 'Officer', 103333, 104183);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105734, 'Daniel', 'Credit Analyst', 103334, 104183);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105735, 'James', 'Loan Closer', 103335, 104183);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105736, 'Joshua', 'Manager', 103336, 104184);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105737, 'Jimmy', 'Officer', 103337, 104184);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105738, 'Kelly', 'Credit Analyst', 103338, 104184);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105739, 'Michael', 'Loan Closer', 103339, 104184);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105740, 'Gary', 'Manager', 103340, 104185);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105741, 'Sherry', 'Officer', 103341, 104185);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105742, 'Alicia', 'Credit Analyst', 103342, 104185);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105743, 'Lisa', 'Loan Closer', 103343, 104185);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105744, 'Ryan', 'Manager', 103344, 104186);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105745, 'Jeff', 'Officer', 103345, 104186);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105746, 'Stephen', 'Credit Analyst', 103346, 104186);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105747, 'Mackenzie', 'Loan Closer', 103347, 104186);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105748, 'Barry', 'Manager', 103348, 104187);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105749, 'Harold', 'Officer', 103349, 104187);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105750, 'Brian', 'Credit Analyst', 103350, 104187);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105751, 'David', 'Loan Closer', 103351, 104187);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105752, 'Andrea', 'Manager', 103352, 104188);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105753, 'Thomas', 'Officer', 103353, 104188);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105754, 'Justin', 'Credit Analyst', 103354, 104188);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105755, 'Cameron', 'Loan Closer', 103355, 104188);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105756, 'Jesse', 'Manager', 103356, 104189);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105757, 'Samuel', 'Officer', 103357, 104189);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105758, 'Caroline', 'Credit Analyst', 103358, 104189);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105759, 'Audrey', 'Loan Closer', 103359, 104189);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105760, 'Patricia', 'Manager', 103360, 104190);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105761, 'Amanda', 'Officer', 103361, 104190);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105762, 'Robert', 'Credit Analyst', 103362, 104190);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105763, 'Devin', 'Loan Closer', 103363, 104190);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105764, 'James', 'Manager', 103364, 104191);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105765, 'Michael', 'Officer', 103365, 104191);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105766, 'Amber', 'Credit Analyst', 103366, 104191);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105767, 'Randall', 'Loan Closer', 103367, 104191);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105768, 'Isaac', 'Manager', 103368, 104192);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105769, 'James', 'Officer', 103369, 104192);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105770, 'Jessica', 'Credit Analyst', 103370, 104192);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105771, 'Holly', 'Loan Closer', 103371, 104192);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105772, 'John', 'Manager', 103372, 104193);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105773, 'Lynn', 'Officer', 103373, 104193);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105774, 'Adam', 'Credit Analyst', 103374, 104193);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105775, 'Kristen', 'Loan Closer', 103375, 104193);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105776, 'Nicholas', 'Manager', 103376, 104194);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105777, 'Larry', 'Officer', 103377, 104194);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105778, 'Stephen', 'Credit Analyst', 103378, 104194);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105779, 'Hector', 'Loan Closer', 103379, 104194);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105780, 'Kevin', 'Manager', 103380, 104195);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105781, 'Kevin', 'Officer', 103381, 104195);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105782, 'Sean', 'Credit Analyst', 103382, 104195);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105783, 'Luis', 'Loan Closer', 103383, 104195);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105784, 'Scott', 'Manager', 103384, 104196);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105785, 'David', 'Officer', 103385, 104196);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105786, 'Alicia', 'Credit Analyst', 103386, 104196);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105787, 'David', 'Loan Closer', 103387, 104196);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105788, 'Jeffrey', 'Manager', 103388, 104197);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105789, 'Krista', 'Officer', 103389, 104197);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105790, 'Peggy', 'Credit Analyst', 103390, 104197);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105791, 'Brian', 'Loan Closer', 103391, 104197);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105792, 'Joel', 'Manager', 103392, 104198);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105793, 'James', 'Officer', 103393, 104198);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105794, 'Anita', 'Credit Analyst', 103394, 104198);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105795, 'Taylor', 'Loan Closer', 103395, 104198);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105796, 'Lisa', 'Manager', 103396, 104199);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105797, 'Angela', 'Officer', 103397, 104199);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105798, 'James', 'Credit Analyst', 103398, 104199);
commit;
prompt 800 records committed...
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105799, 'Michael', 'Loan Closer', 103399, 104199);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105800, 'Roger', 'Manager', 103000, 104200);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105801, 'Judith', 'Officer', 103001, 104200);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105802, 'Kevin', 'Credit Analyst', 103002, 104200);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105803, 'Erica', 'Loan Closer', 103003, 104200);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105804, 'David', 'Manager', 103004, 104201);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105805, 'Angelica', 'Officer', 103005, 104201);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105806, 'Joseph', 'Credit Analyst', 103006, 104201);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105807, 'Kenneth', 'Loan Closer', 103007, 104201);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105808, 'Christopher', 'Manager', 103008, 104202);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105809, 'Tyler', 'Officer', 103009, 104202);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105810, 'David', 'Credit Analyst', 103010, 104202);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105811, 'John', 'Loan Closer', 103011, 104202);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105812, 'Judy', 'Manager', 103012, 104203);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105813, 'Sierra', 'Officer', 103013, 104203);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105814, 'Erin', 'Credit Analyst', 103014, 104203);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105815, 'John', 'Loan Closer', 103015, 104203);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105816, 'Brenda', 'Manager', 103016, 104204);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105817, 'Michelle', 'Officer', 103017, 104204);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105818, 'John', 'Credit Analyst', 103018, 104204);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105819, 'Wesley', 'Loan Closer', 103019, 104204);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105820, 'Elizabeth', 'Manager', 103020, 104205);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105821, 'Matthew', 'Officer', 103021, 104205);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105822, 'Joshua', 'Credit Analyst', 103022, 104205);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105823, 'Patrick', 'Loan Closer', 103023, 104205);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105824, 'Kevin', 'Manager', 103024, 104206);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105825, 'Deborah', 'Officer', 103025, 104206);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105826, 'Nicole', 'Credit Analyst', 103026, 104206);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105827, 'Norman', 'Loan Closer', 103027, 104206);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105828, 'Jason', 'Manager', 103028, 104207);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105829, 'Jose', 'Officer', 103029, 104207);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105830, 'Katherine', 'Credit Analyst', 103030, 104207);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105831, 'Brandi', 'Loan Closer', 103031, 104207);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105832, 'Frank', 'Manager', 103032, 104208);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105833, 'Brianna', 'Officer', 103033, 104208);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105834, 'Derrick', 'Credit Analyst', 103034, 104208);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105835, 'Kathryn', 'Loan Closer', 103035, 104208);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105836, 'Ronald', 'Manager', 103036, 104209);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105837, 'Ryan', 'Officer', 103037, 104209);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105838, 'Betty', 'Credit Analyst', 103038, 104209);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105839, 'Shelby', 'Loan Closer', 103039, 104209);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105840, 'Micheal', 'Manager', 103040, 104210);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105841, 'Kyle', 'Officer', 103041, 104210);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105842, 'Jacob', 'Credit Analyst', 103042, 104210);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105843, 'Christopher', 'Loan Closer', 103043, 104210);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105844, 'Heather', 'Manager', 103044, 104211);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105845, 'Kristen', 'Officer', 103045, 104211);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105846, 'James', 'Credit Analyst', 103046, 104211);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105847, 'Victor', 'Loan Closer', 103047, 104211);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105848, 'Joshua', 'Manager', 103048, 104212);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105849, 'Jill', 'Officer', 103049, 104212);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105850, 'Carol', 'Credit Analyst', 103050, 104212);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105851, 'Bradley', 'Loan Closer', 103051, 104212);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105852, 'Diana', 'Manager', 103052, 104213);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105853, 'David', 'Officer', 103053, 104213);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105854, 'Kristen', 'Credit Analyst', 103054, 104213);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105855, 'Jennifer', 'Loan Closer', 103055, 104213);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105856, 'Julie', 'Manager', 103056, 104214);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105857, 'Lori', 'Officer', 103057, 104214);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105858, 'Stacy', 'Credit Analyst', 103058, 104214);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105859, 'Kenneth', 'Loan Closer', 103059, 104214);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105860, 'Charles', 'Manager', 103060, 104215);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105861, 'Carrie', 'Officer', 103061, 104215);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105862, 'Leroy', 'Credit Analyst', 103062, 104215);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105863, 'Lisa', 'Loan Closer', 103063, 104215);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105864, 'Samantha', 'Manager', 103064, 104216);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105865, 'Sandy', 'Officer', 103065, 104216);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105866, 'Denise', 'Credit Analyst', 103066, 104216);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105867, 'Mary', 'Loan Closer', 103067, 104216);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105868, 'Scott', 'Manager', 103068, 104217);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105869, 'Veronica', 'Officer', 103069, 104217);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105870, 'Lindsay', 'Credit Analyst', 103070, 104217);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105871, 'Brandon', 'Loan Closer', 103071, 104217);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105872, 'Jessica', 'Manager', 103072, 104218);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105873, 'Yvette', 'Officer', 103073, 104218);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105874, 'Steven', 'Credit Analyst', 103074, 104218);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105875, 'Stephen', 'Loan Closer', 103075, 104218);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105876, 'David', 'Manager', 103076, 104219);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105877, 'Jason', 'Officer', 103077, 104219);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105878, 'Joseph', 'Credit Analyst', 103078, 104219);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105879, 'Ryan', 'Loan Closer', 103079, 104219);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105880, 'April', 'Manager', 103080, 104220);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105881, 'Danny', 'Officer', 103081, 104220);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105882, 'Vincent', 'Credit Analyst', 103082, 104220);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105883, 'Amber', 'Loan Closer', 103083, 104220);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105884, 'Michael', 'Manager', 103084, 104221);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105885, 'Annette', 'Officer', 103085, 104221);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105886, 'Derrick', 'Credit Analyst', 103086, 104221);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105887, 'Brittney', 'Loan Closer', 103087, 104221);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105888, 'Bianca', 'Manager', 103088, 104222);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105889, 'William', 'Officer', 103089, 104222);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105890, 'Amanda', 'Credit Analyst', 103090, 104222);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105891, 'Christina', 'Loan Closer', 103091, 104222);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105892, 'Leslie', 'Manager', 103092, 104223);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105893, 'Christopher', 'Officer', 103093, 104223);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105894, 'Glen', 'Credit Analyst', 103094, 104223);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105895, 'Jamie', 'Loan Closer', 103095, 104223);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105896, 'Patricia', 'Manager', 103096, 104224);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105897, 'Holly', 'Officer', 103097, 104224);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105898, 'Shannon', 'Credit Analyst', 103098, 104224);
commit;
prompt 900 records committed...
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105899, 'Mary', 'Loan Closer', 103099, 104224);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105900, 'Nicole', 'Manager', 103100, 104225);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105901, 'Tonya', 'Officer', 103101, 104225);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105902, 'Rebecca', 'Credit Analyst', 103102, 104225);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105903, 'Devin', 'Loan Closer', 103103, 104225);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105904, 'Heather', 'Manager', 103104, 104226);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105905, 'Margaret', 'Officer', 103105, 104226);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105906, 'Amanda', 'Credit Analyst', 103106, 104226);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105907, 'David', 'Loan Closer', 103107, 104226);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105908, 'Brittany', 'Manager', 103108, 104227);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105909, 'Carolyn', 'Officer', 103109, 104227);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105910, 'Jessica', 'Credit Analyst', 103110, 104227);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105911, 'Heidi', 'Loan Closer', 103111, 104227);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105912, 'Debbie', 'Manager', 103112, 104228);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105913, 'Jessica', 'Officer', 103113, 104228);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105914, 'Isaiah', 'Credit Analyst', 103114, 104228);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105915, 'Robin', 'Loan Closer', 103115, 104228);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105916, 'David', 'Manager', 103116, 104229);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105917, 'Kelsey', 'Officer', 103117, 104229);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105918, 'Kelly', 'Credit Analyst', 103118, 104229);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105919, 'Martha', 'Loan Closer', 103119, 104229);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105920, 'Michelle', 'Manager', 103120, 104230);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105921, 'Amanda', 'Officer', 103121, 104230);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105922, 'Amy', 'Credit Analyst', 103122, 104230);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105923, 'Kyle', 'Loan Closer', 103123, 104230);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105924, 'Cody', 'Manager', 103124, 104231);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105925, 'Alexa', 'Officer', 103125, 104231);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105926, 'Kelly', 'Credit Analyst', 103126, 104231);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105927, 'Cameron', 'Loan Closer', 103127, 104231);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105928, 'Bradley', 'Manager', 103128, 104232);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105929, 'Hannah', 'Officer', 103129, 104232);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105930, 'Heather', 'Credit Analyst', 103130, 104232);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105931, 'Brittney', 'Loan Closer', 103131, 104232);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105932, 'Suzanne', 'Manager', 103132, 104233);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105933, 'Margaret', 'Officer', 103133, 104233);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105934, 'Alexander', 'Credit Analyst', 103134, 104233);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105935, 'Nathan', 'Loan Closer', 103135, 104233);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105936, 'Megan', 'Manager', 103136, 104234);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105937, 'Amanda', 'Officer', 103137, 104234);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105938, 'Adam', 'Credit Analyst', 103138, 104234);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105939, 'Kevin', 'Loan Closer', 103139, 104234);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105940, 'Ivan', 'Manager', 103140, 104235);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105941, 'Vickie', 'Officer', 103141, 104235);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105942, 'Derek', 'Credit Analyst', 103142, 104235);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105943, 'Edward', 'Loan Closer', 103143, 104235);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105944, 'Janice', 'Manager', 103144, 104236);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105945, 'Tami', 'Officer', 103145, 104236);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105946, 'Charles', 'Credit Analyst', 103146, 104236);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105947, 'Teresa', 'Loan Closer', 103147, 104236);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105948, 'Paul', 'Manager', 103148, 104237);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105949, 'Melissa', 'Officer', 103149, 104237);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105950, 'Justin', 'Credit Analyst', 103150, 104237);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105951, 'Kelly', 'Loan Closer', 103151, 104237);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105952, 'Katherine', 'Manager', 103152, 104238);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105953, 'Jason', 'Officer', 103153, 104238);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105954, 'Angel', 'Credit Analyst', 103154, 104238);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105955, 'Samuel', 'Loan Closer', 103155, 104238);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105956, 'Courtney', 'Manager', 103156, 104239);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105957, 'Keith', 'Officer', 103157, 104239);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105958, 'Bryan', 'Credit Analyst', 103158, 104239);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105959, 'Mary', 'Loan Closer', 103159, 104239);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105960, 'Julie', 'Manager', 103160, 104240);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105961, 'Jennifer', 'Officer', 103161, 104240);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105962, 'Jonathon', 'Credit Analyst', 103162, 104240);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105963, 'Kevin', 'Loan Closer', 103163, 104240);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105964, 'Eric', 'Manager', 103164, 104241);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105965, 'Tammy', 'Officer', 103165, 104241);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105966, 'Nicole', 'Credit Analyst', 103166, 104241);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105967, 'Jerry', 'Loan Closer', 103167, 104241);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105968, 'Susan', 'Manager', 103168, 104242);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105969, 'Hunter', 'Officer', 103169, 104242);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105970, 'Timothy', 'Credit Analyst', 103170, 104242);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105971, 'George', 'Loan Closer', 103171, 104242);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105972, 'Barbara', 'Manager', 103172, 104243);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105973, 'Amanda', 'Officer', 103173, 104243);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105974, 'Jason', 'Credit Analyst', 103174, 104243);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105975, 'Michael', 'Loan Closer', 103175, 104243);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105976, 'Karen', 'Manager', 103176, 104244);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105977, 'Kyle', 'Officer', 103177, 104244);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105978, 'Michele', 'Credit Analyst', 103178, 104244);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105979, 'Shelley', 'Loan Closer', 103179, 104244);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105980, 'Kristy', 'Manager', 103180, 104245);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105981, 'Valerie', 'Officer', 103181, 104245);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105982, 'Diana', 'Credit Analyst', 103182, 104245);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105983, 'Jennifer', 'Loan Closer', 103183, 104245);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105984, 'Jamie', 'Manager', 103184, 104246);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105985, 'Matthew', 'Officer', 103185, 104246);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105986, 'Todd', 'Credit Analyst', 103186, 104246);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105987, 'Ryan', 'Loan Closer', 103187, 104246);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105988, 'Megan', 'Manager', 103188, 104247);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105989, 'Allison', 'Officer', 103189, 104247);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105990, 'Mark', 'Credit Analyst', 103190, 104247);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105991, 'Joan', 'Loan Closer', 103191, 104247);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105992, 'Michael', 'Manager', 103192, 104248);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105993, 'Kristin', 'Officer', 103193, 104248);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105994, 'Susan', 'Credit Analyst', 103194, 104248);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105995, 'Amber', 'Loan Closer', 103195, 104248);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105996, 'Gregory', 'Manager', 103196, 104249);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105997, 'Holly', 'Officer', 103197, 104249);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105998, 'Bethany', 'Credit Analyst', 103198, 104249);
commit;
prompt 1000 records committed...
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (105999, 'Matthew', 'Loan Closer', 103199, 104249);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106000, 'Robert', 'Manager', 103200, 104250);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106001, 'Micheal', 'Officer', 103201, 104250);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106002, 'Jay', 'Credit Analyst', 103202, 104250);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106003, 'Lacey', 'Loan Closer', 103203, 104250);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106004, 'Christopher', 'Manager', 103204, 104251);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106005, 'John', 'Officer', 103205, 104251);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106006, 'Troy', 'Credit Analyst', 103206, 104251);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106007, 'Kari', 'Loan Closer', 103207, 104251);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106008, 'Jacqueline', 'Manager', 103208, 104252);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106009, 'Matthew', 'Officer', 103209, 104252);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106010, 'Blake', 'Credit Analyst', 103210, 104252);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106011, 'John', 'Loan Closer', 103211, 104252);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106012, 'Amanda', 'Manager', 103212, 104253);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106013, 'Sarah', 'Officer', 103213, 104253);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106014, 'Angela', 'Credit Analyst', 103214, 104253);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106015, 'Scott', 'Loan Closer', 103215, 104253);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106016, 'Diana', 'Manager', 103216, 104254);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106017, 'Brian', 'Officer', 103217, 104254);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106018, 'Stanley', 'Credit Analyst', 103218, 104254);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106019, 'David', 'Loan Closer', 103219, 104254);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106020, 'James', 'Manager', 103220, 104255);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106021, 'Rachel', 'Officer', 103221, 104255);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106022, 'Tyler', 'Credit Analyst', 103222, 104255);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106023, 'Penny', 'Loan Closer', 103223, 104255);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106024, 'Vanessa', 'Manager', 103224, 104256);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106025, 'Adam', 'Officer', 103225, 104256);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106026, 'James', 'Credit Analyst', 103226, 104256);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106027, 'Elizabeth', 'Loan Closer', 103227, 104256);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106028, 'Cindy', 'Manager', 103228, 104257);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106029, 'Suzanne', 'Officer', 103229, 104257);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106030, 'Paul', 'Credit Analyst', 103230, 104257);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106031, 'Jonathan', 'Loan Closer', 103231, 104257);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106032, 'Michelle', 'Manager', 103232, 104258);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106033, 'Caroline', 'Officer', 103233, 104258);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106034, 'Jennifer', 'Credit Analyst', 103234, 104258);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106035, 'Juan', 'Loan Closer', 103235, 104258);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106036, 'Luke', 'Manager', 103236, 104259);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106037, 'Natalie', 'Officer', 103237, 104259);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106038, 'Richard', 'Credit Analyst', 103238, 104259);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106039, 'Dawn', 'Loan Closer', 103239, 104259);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106040, 'Lauren', 'Manager', 103240, 104260);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106041, 'Patricia', 'Officer', 103241, 104260);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106042, 'Barbara', 'Credit Analyst', 103242, 104260);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106043, 'Keith', 'Loan Closer', 103243, 104260);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106044, 'Alicia', 'Manager', 103244, 104261);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106045, 'Andrew', 'Officer', 103245, 104261);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106046, 'Claudia', 'Credit Analyst', 103246, 104261);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106047, 'Kevin', 'Loan Closer', 103247, 104261);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106048, 'Donna', 'Manager', 103248, 104262);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106049, 'Erin', 'Officer', 103249, 104262);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106050, 'Jenna', 'Credit Analyst', 103250, 104262);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106051, 'Donna', 'Loan Closer', 103251, 104262);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106052, 'Kevin', 'Manager', 103252, 104263);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106053, 'Linda', 'Officer', 103253, 104263);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106054, 'Brian', 'Credit Analyst', 103254, 104263);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106055, 'Tyler', 'Loan Closer', 103255, 104263);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106056, 'Alexandra', 'Manager', 103256, 104264);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106057, 'Chad', 'Officer', 103257, 104264);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106058, 'James', 'Credit Analyst', 103258, 104264);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106059, 'Shannon', 'Loan Closer', 103259, 104264);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106060, 'Ashley', 'Manager', 103260, 104265);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106061, 'Vincent', 'Officer', 103261, 104265);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106062, 'Michael', 'Credit Analyst', 103262, 104265);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106063, 'Judith', 'Loan Closer', 103263, 104265);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106064, 'Nicole', 'Manager', 103264, 104266);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106065, 'Teresa', 'Officer', 103265, 104266);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106066, 'Sara', 'Credit Analyst', 103266, 104266);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106067, 'Lisa', 'Loan Closer', 103267, 104266);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106068, 'Linda', 'Manager', 103268, 104267);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106069, 'Jay', 'Officer', 103269, 104267);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106070, 'Mia', 'Credit Analyst', 103270, 104267);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106071, 'Daniel', 'Loan Closer', 103271, 104267);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106072, 'Roberto', 'Manager', 103272, 104268);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106073, 'Brian', 'Officer', 103273, 104268);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106074, 'Robert', 'Credit Analyst', 103274, 104268);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106075, 'Mary', 'Loan Closer', 103275, 104268);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106076, 'Susan', 'Manager', 103276, 104269);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106077, 'Kimberly', 'Officer', 103277, 104269);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106078, 'Christine', 'Credit Analyst', 103278, 104269);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106079, 'Lauren', 'Loan Closer', 103279, 104269);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106080, 'Bridget', 'Manager', 103280, 104270);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106081, 'Shannon', 'Officer', 103281, 104270);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106082, 'Jeffrey', 'Credit Analyst', 103282, 104270);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106083, 'Steven', 'Loan Closer', 103283, 104270);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106084, 'David', 'Manager', 103284, 104271);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106085, 'Kevin', 'Officer', 103285, 104271);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106086, 'Carla', 'Credit Analyst', 103286, 104271);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106087, 'Sarah', 'Loan Closer', 103287, 104271);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106088, 'Steven', 'Manager', 103288, 104272);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106089, 'Samuel', 'Officer', 103289, 104272);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106090, 'Nathan', 'Credit Analyst', 103290, 104272);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106091, 'Deborah', 'Loan Closer', 103291, 104272);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106092, 'Steven', 'Manager', 103292, 104273);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106093, 'Elizabeth', 'Officer', 103293, 104273);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106094, 'Ryan', 'Credit Analyst', 103294, 104273);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106095, 'Diana', 'Loan Closer', 103295, 104273);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106096, 'Alexis', 'Manager', 103296, 104274);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106097, 'Garrett', 'Officer', 103297, 104274);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106098, 'Jessica', 'Credit Analyst', 103298, 104274);
commit;
prompt 1100 records committed...
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106099, 'Jason', 'Loan Closer', 103299, 104274);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106100, 'Kayla', 'Manager', 103300, 104275);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106101, 'Tony', 'Officer', 103301, 104275);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106102, 'Andrew', 'Credit Analyst', 103302, 104275);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106103, 'Michael', 'Loan Closer', 103303, 104275);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106104, 'Matthew', 'Manager', 103304, 104276);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106105, 'Stacey', 'Officer', 103305, 104276);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106106, 'Patrick', 'Credit Analyst', 103306, 104276);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106107, 'Jackie', 'Loan Closer', 103307, 104276);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106108, 'Charles', 'Manager', 103308, 104277);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106109, 'Darin', 'Officer', 103309, 104277);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106110, 'Joshua', 'Credit Analyst', 103310, 104277);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106111, 'James', 'Loan Closer', 103311, 104277);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106112, 'Nicholas', 'Manager', 103312, 104278);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106113, 'Dawn', 'Officer', 103313, 104278);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106114, 'Johnathan', 'Credit Analyst', 103314, 104278);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106115, 'Timothy', 'Loan Closer', 103315, 104278);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106116, 'Robert', 'Manager', 103316, 104279);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106117, 'Ana', 'Officer', 103317, 104279);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106118, 'William', 'Credit Analyst', 103318, 104279);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106119, 'Ronald', 'Loan Closer', 103319, 104279);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106120, 'Jason', 'Manager', 103320, 104280);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106121, 'Tina', 'Officer', 103321, 104280);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106122, 'Christopher', 'Credit Analyst', 103322, 104280);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106123, 'Stephanie', 'Loan Closer', 103323, 104280);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106124, 'Alan', 'Manager', 103324, 104281);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106125, 'Joyce', 'Officer', 103325, 104281);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106126, 'Isaiah', 'Credit Analyst', 103326, 104281);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106127, 'Justin', 'Loan Closer', 103327, 104281);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106128, 'James', 'Manager', 103328, 104282);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106129, 'Brandi', 'Officer', 103329, 104282);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106130, 'Joann', 'Credit Analyst', 103330, 104282);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106131, 'Martha', 'Loan Closer', 103331, 104282);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106132, 'John', 'Manager', 103332, 104283);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106133, 'Mandy', 'Officer', 103333, 104283);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106134, 'Laura', 'Credit Analyst', 103334, 104283);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106135, 'Lisa', 'Loan Closer', 103335, 104283);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106136, 'Stephanie', 'Manager', 103336, 104284);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106137, 'Courtney', 'Officer', 103337, 104284);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106138, 'Samuel', 'Credit Analyst', 103338, 104284);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106139, 'Tracey', 'Loan Closer', 103339, 104284);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106140, 'Justin', 'Manager', 103340, 104285);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106141, 'Anita', 'Officer', 103341, 104285);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106142, 'Peter', 'Credit Analyst', 103342, 104285);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106143, 'Brett', 'Loan Closer', 103343, 104285);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106144, 'Mitchell', 'Manager', 103344, 104286);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106145, 'Ryan', 'Officer', 103345, 104286);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106146, 'Alexis', 'Credit Analyst', 103346, 104286);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106147, 'Derek', 'Loan Closer', 103347, 104286);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106148, 'Marissa', 'Manager', 103348, 104287);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106149, 'Charles', 'Officer', 103349, 104287);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106150, 'Michael', 'Credit Analyst', 103350, 104287);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106151, 'Kathryn', 'Loan Closer', 103351, 104287);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106152, 'James', 'Manager', 103352, 104288);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106153, 'Maria', 'Officer', 103353, 104288);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106154, 'Jennifer', 'Credit Analyst', 103354, 104288);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106155, 'Sarah', 'Loan Closer', 103355, 104288);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106156, 'Joseph', 'Manager', 103356, 104289);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106157, 'Brittany', 'Officer', 103357, 104289);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106158, 'Haley', 'Credit Analyst', 103358, 104289);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106159, 'Paul', 'Loan Closer', 103359, 104289);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106160, 'Sergio', 'Manager', 103360, 104290);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106161, 'Lindsey', 'Officer', 103361, 104290);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106162, 'Mary', 'Credit Analyst', 103362, 104290);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106163, 'David', 'Loan Closer', 103363, 104290);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106164, 'Derek', 'Manager', 103364, 104291);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106165, 'Bruce', 'Officer', 103365, 104291);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106166, 'Patricia', 'Credit Analyst', 103366, 104291);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106167, 'Melvin', 'Loan Closer', 103367, 104291);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106168, 'Andrew', 'Manager', 103368, 104292);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106169, 'Christina', 'Officer', 103369, 104292);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106170, 'Denise', 'Credit Analyst', 103370, 104292);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106171, 'Danielle', 'Loan Closer', 103371, 104292);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106172, 'Bradley', 'Manager', 103372, 104293);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106173, 'Ashley', 'Officer', 103373, 104293);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106174, 'Ashley', 'Credit Analyst', 103374, 104293);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106175, 'David', 'Loan Closer', 103375, 104293);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106176, 'William', 'Manager', 103376, 104294);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106177, 'Michael', 'Officer', 103377, 104294);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106178, 'Jeremy', 'Credit Analyst', 103378, 104294);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106179, 'Shawn', 'Loan Closer', 103379, 104294);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106180, 'Christopher', 'Manager', 103380, 104295);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106181, 'Jonathan', 'Officer', 103381, 104295);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106182, 'Shelly', 'Credit Analyst', 103382, 104295);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106183, 'Donna', 'Loan Closer', 103383, 104295);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106184, 'Diana', 'Manager', 103384, 104296);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106185, 'Chase', 'Officer', 103385, 104296);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106186, 'Jacob', 'Credit Analyst', 103386, 104296);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106187, 'Justin', 'Loan Closer', 103387, 104296);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106188, 'Heidi', 'Manager', 103388, 104297);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106189, 'Jacob', 'Officer', 103389, 104297);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106190, 'Eric', 'Credit Analyst', 103390, 104297);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106191, 'Kevin', 'Loan Closer', 103391, 104297);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106192, 'Ashley', 'Manager', 103392, 104298);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106193, 'Alison', 'Officer', 103393, 104298);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106194, 'Martha', 'Credit Analyst', 103394, 104298);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106195, 'Alison', 'Loan Closer', 103395, 104298);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106196, 'Melissa', 'Manager', 103396, 104299);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106197, 'Sheila', 'Officer', 103397, 104299);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106198, 'Nichole', 'Credit Analyst', 103398, 104299);
commit;
prompt 1200 records committed...
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106199, 'Jillian', 'Loan Closer', 103399, 104299);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106200, 'Amanda', 'Manager', 103000, 104300);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106201, 'Kevin', 'Officer', 103001, 104300);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106202, 'Gregory', 'Credit Analyst', 103002, 104300);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106203, 'Jose', 'Loan Closer', 103003, 104300);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106204, 'Erik', 'Manager', 103004, 104301);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106205, 'Wendy', 'Officer', 103005, 104301);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106206, 'Katherine', 'Credit Analyst', 103006, 104301);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106207, 'Mark', 'Loan Closer', 103007, 104301);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106208, 'Cynthia', 'Manager', 103008, 104302);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106209, 'Brian', 'Officer', 103009, 104302);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106210, 'Anna', 'Credit Analyst', 103010, 104302);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106211, 'Donna', 'Loan Closer', 103011, 104302);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106212, 'Heidi', 'Manager', 103012, 104303);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106213, 'Rebecca', 'Officer', 103013, 104303);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106214, 'John', 'Credit Analyst', 103014, 104303);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106215, 'Shane', 'Loan Closer', 103015, 104303);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106216, 'Deanna', 'Manager', 103016, 104304);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106217, 'Melanie', 'Officer', 103017, 104304);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106218, 'Scott', 'Credit Analyst', 103018, 104304);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106219, 'Alyssa', 'Loan Closer', 103019, 104304);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106220, 'Kelly', 'Manager', 103020, 104305);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106221, 'Dustin', 'Officer', 103021, 104305);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106222, 'Kathryn', 'Credit Analyst', 103022, 104305);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106223, 'Charles', 'Loan Closer', 103023, 104305);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106224, 'Laura', 'Manager', 103024, 104306);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106225, 'Annette', 'Officer', 103025, 104306);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106226, 'Kathryn', 'Credit Analyst', 103026, 104306);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106227, 'Charles', 'Loan Closer', 103027, 104306);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106228, 'Jose', 'Manager', 103028, 104307);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106229, 'Tara', 'Officer', 103029, 104307);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106230, 'Sherry', 'Credit Analyst', 103030, 104307);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106231, 'James', 'Loan Closer', 103031, 104307);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106232, 'Stephen', 'Manager', 103032, 104308);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106233, 'Priscilla', 'Officer', 103033, 104308);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106234, 'Nicole', 'Credit Analyst', 103034, 104308);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106235, 'Karen', 'Loan Closer', 103035, 104308);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106236, 'Natalie', 'Manager', 103036, 104309);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106237, 'Kelly', 'Officer', 103037, 104309);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106238, 'Adam', 'Credit Analyst', 103038, 104309);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106239, 'Mary', 'Loan Closer', 103039, 104309);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106240, 'Gabriel', 'Manager', 103040, 104310);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106241, 'William', 'Officer', 103041, 104310);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106242, 'Shannon', 'Credit Analyst', 103042, 104310);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106243, 'Joyce', 'Loan Closer', 103043, 104310);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106244, 'Dana', 'Manager', 103044, 104311);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106245, 'Christopher', 'Officer', 103045, 104311);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106246, 'Dana', 'Credit Analyst', 103046, 104311);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106247, 'Joseph', 'Loan Closer', 103047, 104311);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106248, 'James', 'Manager', 103048, 104312);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106249, 'Robert', 'Officer', 103049, 104312);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106250, 'Emily', 'Credit Analyst', 103050, 104312);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106251, 'Dan', 'Loan Closer', 103051, 104312);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106252, 'William', 'Manager', 103052, 104313);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106253, 'Lauren', 'Officer', 103053, 104313);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106254, 'Rebecca', 'Credit Analyst', 103054, 104313);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106255, 'Jamie', 'Loan Closer', 103055, 104313);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106256, 'Christopher', 'Manager', 103056, 104314);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106257, 'Nathan', 'Officer', 103057, 104314);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106258, 'Brandon', 'Credit Analyst', 103058, 104314);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106259, 'Eric', 'Loan Closer', 103059, 104314);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106260, 'Zachary', 'Manager', 103060, 104315);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106261, 'Christina', 'Officer', 103061, 104315);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106262, 'William', 'Credit Analyst', 103062, 104315);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106263, 'Lisa', 'Loan Closer', 103063, 104315);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106264, 'Zachary', 'Manager', 103064, 104316);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106265, 'Nancy', 'Officer', 103065, 104316);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106266, 'Chelsea', 'Credit Analyst', 103066, 104316);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106267, 'Kenneth', 'Loan Closer', 103067, 104316);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106268, 'James', 'Manager', 103068, 104317);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106269, 'Allison', 'Officer', 103069, 104317);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106270, 'Nicholas', 'Credit Analyst', 103070, 104317);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106271, 'Anthony', 'Loan Closer', 103071, 104317);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106272, 'Elizabeth', 'Manager', 103072, 104318);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106273, 'Roger', 'Officer', 103073, 104318);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106274, 'Paul', 'Credit Analyst', 103074, 104318);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106275, 'Nicole', 'Loan Closer', 103075, 104318);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106276, 'Jose', 'Manager', 103076, 104319);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106277, 'Adam', 'Officer', 103077, 104319);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106278, 'James', 'Credit Analyst', 103078, 104319);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106279, 'Jo', 'Loan Closer', 103079, 104319);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106280, 'Micheal', 'Manager', 103080, 104320);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106281, 'Jessica', 'Officer', 103081, 104320);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106282, 'Robert', 'Credit Analyst', 103082, 104320);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106283, 'Joy', 'Loan Closer', 103083, 104320);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106284, 'Jessica', 'Manager', 103084, 104321);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106285, 'Melissa', 'Officer', 103085, 104321);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106286, 'Rachel', 'Credit Analyst', 103086, 104321);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106287, 'Allison', 'Loan Closer', 103087, 104321);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106288, 'Theresa', 'Manager', 103088, 104322);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106289, 'Christopher', 'Officer', 103089, 104322);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106290, 'Andrew', 'Credit Analyst', 103090, 104322);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106291, 'Oscar', 'Loan Closer', 103091, 104322);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106292, 'Mary', 'Manager', 103092, 104323);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106293, 'Kathleen', 'Officer', 103093, 104323);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106294, 'Thomas', 'Credit Analyst', 103094, 104323);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106295, 'Jared', 'Loan Closer', 103095, 104323);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106296, 'Shelby', 'Manager', 103096, 104324);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106297, 'Tina', 'Officer', 103097, 104324);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106298, 'Micheal', 'Credit Analyst', 103098, 104324);
commit;
prompt 1300 records committed...
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106299, 'Kayla', 'Loan Closer', 103099, 104324);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106300, 'Benjamin', 'Manager', 103100, 104325);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106301, 'Brian', 'Officer', 103101, 104325);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106302, 'Erica', 'Credit Analyst', 103102, 104325);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106303, 'Carlos', 'Loan Closer', 103103, 104325);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106304, 'Sarah', 'Manager', 103104, 104326);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106305, 'Sarah', 'Officer', 103105, 104326);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106306, 'Carla', 'Credit Analyst', 103106, 104326);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106307, 'Samuel', 'Loan Closer', 103107, 104326);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106308, 'Ebony', 'Manager', 103108, 104327);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106309, 'Jessica', 'Officer', 103109, 104327);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106310, 'Michele', 'Credit Analyst', 103110, 104327);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106311, 'Gail', 'Loan Closer', 103111, 104327);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106312, 'Veronica', 'Manager', 103112, 104328);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106313, 'Kyle', 'Officer', 103113, 104328);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106314, 'Bradley', 'Credit Analyst', 103114, 104328);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106315, 'Gina', 'Loan Closer', 103115, 104328);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106316, 'Carla', 'Manager', 103116, 104329);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106317, 'Douglas', 'Officer', 103117, 104329);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106318, 'Tanya', 'Credit Analyst', 103118, 104329);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106319, 'Gabriel', 'Loan Closer', 103119, 104329);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106320, 'Heather', 'Manager', 103120, 104330);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106321, 'Christopher', 'Officer', 103121, 104330);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106322, 'Robert', 'Credit Analyst', 103122, 104330);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106323, 'Donna', 'Loan Closer', 103123, 104330);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106324, 'Dominic', 'Manager', 103124, 104331);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106325, 'Angela', 'Officer', 103125, 104331);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106326, 'Ashley', 'Credit Analyst', 103126, 104331);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106327, 'Thomas', 'Loan Closer', 103127, 104331);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106328, 'Robert', 'Manager', 103128, 104332);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106329, 'Nicole', 'Officer', 103129, 104332);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106330, 'Kenneth', 'Credit Analyst', 103130, 104332);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106331, 'Joshua', 'Loan Closer', 103131, 104332);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106332, 'Amanda', 'Manager', 103132, 104333);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106333, 'Monica', 'Officer', 103133, 104333);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106334, 'Lawrence', 'Credit Analyst', 103134, 104333);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106335, 'Danielle', 'Loan Closer', 103135, 104333);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106336, 'Donna', 'Manager', 103136, 104334);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106337, 'Adam', 'Officer', 103137, 104334);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106338, 'Justin', 'Credit Analyst', 103138, 104334);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106339, 'Julia', 'Loan Closer', 103139, 104334);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106340, 'Wendy', 'Manager', 103140, 104335);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106341, 'Erika', 'Officer', 103141, 104335);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106342, 'John', 'Credit Analyst', 103142, 104335);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106343, 'Rose', 'Loan Closer', 103143, 104335);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106344, 'Melissa', 'Manager', 103144, 104336);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106345, 'Jerry', 'Officer', 103145, 104336);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106346, 'Michael', 'Credit Analyst', 103146, 104336);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106347, 'William', 'Loan Closer', 103147, 104336);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106348, 'Danielle', 'Manager', 103148, 104337);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106349, 'Richard', 'Officer', 103149, 104337);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106350, 'Ronald', 'Credit Analyst', 103150, 104337);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106351, 'James', 'Loan Closer', 103151, 104337);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106352, 'Michael', 'Manager', 103152, 104338);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106353, 'Adam', 'Officer', 103153, 104338);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106354, 'Matthew', 'Credit Analyst', 103154, 104338);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106355, 'Heather', 'Loan Closer', 103155, 104338);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106356, 'Justin', 'Manager', 103156, 104339);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106357, 'Anna', 'Officer', 103157, 104339);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106358, 'Marie', 'Credit Analyst', 103158, 104339);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106359, 'Peggy', 'Loan Closer', 103159, 104339);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106360, 'Edward', 'Manager', 103160, 104340);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106361, 'Tammy', 'Officer', 103161, 104340);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106362, 'Jennifer', 'Credit Analyst', 103162, 104340);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106363, 'Lisa', 'Loan Closer', 103163, 104340);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106364, 'Kelly', 'Manager', 103164, 104341);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106365, 'Ricardo', 'Officer', 103165, 104341);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106366, 'Wesley', 'Credit Analyst', 103166, 104341);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106367, 'Amanda', 'Loan Closer', 103167, 104341);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106368, 'Kristen', 'Manager', 103168, 104342);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106369, 'Walter', 'Officer', 103169, 104342);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106370, 'Nicholas', 'Credit Analyst', 103170, 104342);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106371, 'Jacob', 'Loan Closer', 103171, 104342);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106372, 'Laura', 'Manager', 103172, 104343);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106373, 'Diane', 'Officer', 103173, 104343);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106374, 'Dana', 'Credit Analyst', 103174, 104343);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106375, 'Jamie', 'Loan Closer', 103175, 104343);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106376, 'Joseph', 'Manager', 103176, 104344);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106377, 'James', 'Officer', 103177, 104344);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106378, 'Victor', 'Credit Analyst', 103178, 104344);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106379, 'David', 'Loan Closer', 103179, 104344);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106380, 'Samantha', 'Manager', 103180, 104345);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106381, 'Traci', 'Officer', 103181, 104345);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106382, 'Mitchell', 'Credit Analyst', 103182, 104345);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106383, 'John', 'Loan Closer', 103183, 104345);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106384, 'Dennis', 'Manager', 103184, 104346);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106385, 'Kevin', 'Officer', 103185, 104346);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106386, 'Jill', 'Credit Analyst', 103186, 104346);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106387, 'Denise', 'Loan Closer', 103187, 104346);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106388, 'Mary', 'Manager', 103188, 104347);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106389, 'Elizabeth', 'Officer', 103189, 104347);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106390, 'Barbara', 'Credit Analyst', 103190, 104347);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106391, 'Latasha', 'Loan Closer', 103191, 104347);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106392, 'James', 'Manager', 103192, 104348);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106393, 'Steven', 'Officer', 103193, 104348);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106394, 'Mark', 'Credit Analyst', 103194, 104348);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106395, 'Connie', 'Loan Closer', 103195, 104348);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106396, 'Katherine', 'Manager', 103196, 104349);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106397, 'Judith', 'Officer', 103197, 104349);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106398, 'Ryan', 'Credit Analyst', 103198, 104349);
commit;
prompt 1400 records committed...
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106399, 'George', 'Loan Closer', 103199, 104349);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106400, 'Joseph', 'Manager', 103200, 104350);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106401, 'Wendy', 'Officer', 103201, 104350);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106402, 'Eric', 'Credit Analyst', 103202, 104350);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106403, 'Jennifer', 'Loan Closer', 103203, 104350);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106404, 'Clayton', 'Manager', 103204, 104351);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106405, 'Ashley', 'Officer', 103205, 104351);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106406, 'Kenneth', 'Credit Analyst', 103206, 104351);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106407, 'Suzanne', 'Loan Closer', 103207, 104351);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106408, 'Michelle', 'Manager', 103208, 104352);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106409, 'Daniel', 'Officer', 103209, 104352);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106410, 'Stefanie', 'Credit Analyst', 103210, 104352);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106411, 'Mark', 'Loan Closer', 103211, 104352);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106412, 'Melissa', 'Manager', 103212, 104353);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106413, 'Robert', 'Officer', 103213, 104353);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106414, 'Jeffrey', 'Credit Analyst', 103214, 104353);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106415, 'Andrea', 'Loan Closer', 103215, 104353);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106416, 'Candace', 'Manager', 103216, 104354);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106417, 'Nancy', 'Officer', 103217, 104354);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106418, 'David', 'Credit Analyst', 103218, 104354);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106419, 'Todd', 'Loan Closer', 103219, 104354);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106420, 'Crystal', 'Manager', 103220, 104355);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106421, 'Roger', 'Officer', 103221, 104355);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106422, 'Chelsea', 'Credit Analyst', 103222, 104355);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106423, 'Michael', 'Loan Closer', 103223, 104355);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106424, 'Bethany', 'Manager', 103224, 104356);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106425, 'Courtney', 'Officer', 103225, 104356);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106426, 'Brandon', 'Credit Analyst', 103226, 104356);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106427, 'Larry', 'Loan Closer', 103227, 104356);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106428, 'Hannah', 'Manager', 103228, 104357);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106429, 'Gina', 'Officer', 103229, 104357);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106430, 'Shane', 'Credit Analyst', 103230, 104357);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106431, 'Michael', 'Loan Closer', 103231, 104357);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106432, 'Amber', 'Manager', 103232, 104358);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106433, 'Rose', 'Officer', 103233, 104358);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106434, 'Chloe', 'Credit Analyst', 103234, 104358);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106435, 'Amy', 'Loan Closer', 103235, 104358);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106436, 'Nicole', 'Manager', 103236, 104359);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106437, 'Nathaniel', 'Officer', 103237, 104359);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106438, 'Veronica', 'Credit Analyst', 103238, 104359);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106439, 'Pamela', 'Loan Closer', 103239, 104359);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106440, 'Nancy', 'Manager', 103240, 104360);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106441, 'Jillian', 'Officer', 103241, 104360);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106442, 'Martha', 'Credit Analyst', 103242, 104360);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106443, 'Donna', 'Loan Closer', 103243, 104360);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106444, 'Caleb', 'Manager', 103244, 104361);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106445, 'John', 'Officer', 103245, 104361);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106446, 'Keith', 'Credit Analyst', 103246, 104361);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106447, 'Heather', 'Loan Closer', 103247, 104361);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106448, 'Laura', 'Manager', 103248, 104362);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106449, 'Sandra', 'Officer', 103249, 104362);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106450, 'Albert', 'Credit Analyst', 103250, 104362);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106451, 'Larry', 'Loan Closer', 103251, 104362);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106452, 'Tracy', 'Manager', 103252, 104363);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106453, 'Olivia', 'Officer', 103253, 104363);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106454, 'Emily', 'Credit Analyst', 103254, 104363);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106455, 'Lori', 'Loan Closer', 103255, 104363);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106456, 'Sharon', 'Manager', 103256, 104364);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106457, 'John', 'Officer', 103257, 104364);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106458, 'Sean', 'Credit Analyst', 103258, 104364);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106459, 'Jim', 'Loan Closer', 103259, 104364);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106460, 'Dale', 'Manager', 103260, 104365);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106461, 'Amanda', 'Officer', 103261, 104365);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106462, 'James', 'Credit Analyst', 103262, 104365);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106463, 'Craig', 'Loan Closer', 103263, 104365);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106464, 'Teresa', 'Manager', 103264, 104366);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106465, 'Lisa', 'Officer', 103265, 104366);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106466, 'Victoria', 'Credit Analyst', 103266, 104366);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106467, 'Andrea', 'Loan Closer', 103267, 104366);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106468, 'Dennis', 'Manager', 103268, 104367);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106469, 'Joseph', 'Officer', 103269, 104367);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106470, 'Donna', 'Credit Analyst', 103270, 104367);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106471, 'Michael', 'Loan Closer', 103271, 104367);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106472, 'Noah', 'Manager', 103272, 104368);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106473, 'Samantha', 'Officer', 103273, 104368);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106474, 'Anthony', 'Credit Analyst', 103274, 104368);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106475, 'Brenda', 'Loan Closer', 103275, 104368);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106476, 'Gary', 'Manager', 103276, 104369);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106477, 'Samuel', 'Officer', 103277, 104369);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106478, 'Jennifer', 'Credit Analyst', 103278, 104369);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106479, 'Joshua', 'Loan Closer', 103279, 104369);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106480, 'Tamara', 'Manager', 103280, 104370);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106481, 'Joe', 'Officer', 103281, 104370);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106482, 'Stephen', 'Credit Analyst', 103282, 104370);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106483, 'Alicia', 'Loan Closer', 103283, 104370);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106484, 'Frances', 'Manager', 103284, 104371);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106485, 'Tommy', 'Officer', 103285, 104371);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106486, 'Kyle', 'Credit Analyst', 103286, 104371);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106487, 'Melissa', 'Loan Closer', 103287, 104371);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106488, 'Tracy', 'Manager', 103288, 104372);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106489, 'Craig', 'Officer', 103289, 104372);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106490, 'Heather', 'Credit Analyst', 103290, 104372);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106491, 'Emily', 'Loan Closer', 103291, 104372);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106492, 'Kevin', 'Manager', 103292, 104373);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106493, 'Lisa', 'Officer', 103293, 104373);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106494, 'Michael', 'Credit Analyst', 103294, 104373);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106495, 'Anna', 'Loan Closer', 103295, 104373);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106496, 'Paul', 'Manager', 103296, 104374);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106497, 'Alyssa', 'Officer', 103297, 104374);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106498, 'Marie', 'Credit Analyst', 103298, 104374);
commit;
prompt 1500 records committed...
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106499, 'Yolanda', 'Loan Closer', 103299, 104374);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106500, 'Robert', 'Manager', 103300, 104375);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106501, 'Karen', 'Officer', 103301, 104375);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106502, 'Michelle', 'Credit Analyst', 103302, 104375);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106503, 'Chelsea', 'Loan Closer', 103303, 104375);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106504, 'Steven', 'Manager', 103304, 104376);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106505, 'Stephanie', 'Officer', 103305, 104376);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106506, 'Carrie', 'Credit Analyst', 103306, 104376);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106507, 'Christina', 'Loan Closer', 103307, 104376);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106508, 'Jimmy', 'Manager', 103308, 104377);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106509, 'Rebecca', 'Officer', 103309, 104377);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106510, 'John', 'Credit Analyst', 103310, 104377);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106511, 'Jennifer', 'Loan Closer', 103311, 104377);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106512, 'Jocelyn', 'Manager', 103312, 104378);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106513, 'Jacob', 'Officer', 103313, 104378);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106514, 'Mark', 'Credit Analyst', 103314, 104378);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106515, 'Margaret', 'Loan Closer', 103315, 104378);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106516, 'Paige', 'Manager', 103316, 104379);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106517, 'Melvin', 'Officer', 103317, 104379);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106518, 'William', 'Credit Analyst', 103318, 104379);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106519, 'Sharon', 'Loan Closer', 103319, 104379);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106520, 'Paula', 'Manager', 103320, 104380);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106521, 'Nicholas', 'Officer', 103321, 104380);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106522, 'Heather', 'Credit Analyst', 103322, 104380);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106523, 'Gavin', 'Loan Closer', 103323, 104380);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106524, 'Briana', 'Manager', 103324, 104381);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106525, 'Alex', 'Officer', 103325, 104381);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106526, 'Christina', 'Credit Analyst', 103326, 104381);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106527, 'Steven', 'Loan Closer', 103327, 104381);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106528, 'Erica', 'Manager', 103328, 104382);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106529, 'Regina', 'Officer', 103329, 104382);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106530, 'Natalie', 'Credit Analyst', 103330, 104382);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106531, 'Tracy', 'Loan Closer', 103331, 104382);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106532, 'Donald', 'Manager', 103332, 104383);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106533, 'Kimberly', 'Officer', 103333, 104383);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106534, 'Tiffany', 'Credit Analyst', 103334, 104383);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106535, 'Corey', 'Loan Closer', 103335, 104383);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106536, 'Brooke', 'Manager', 103336, 104384);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106537, 'Mark', 'Officer', 103337, 104384);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106538, 'Laura', 'Credit Analyst', 103338, 104384);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106539, 'Kevin', 'Loan Closer', 103339, 104384);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106540, 'Kelly', 'Manager', 103340, 104385);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106541, 'Richard', 'Officer', 103341, 104385);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106542, 'Alexa', 'Credit Analyst', 103342, 104385);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106543, 'Tammy', 'Loan Closer', 103343, 104385);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106544, 'Tamara', 'Manager', 103344, 104386);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106545, 'Jeffery', 'Officer', 103345, 104386);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106546, 'Kathy', 'Credit Analyst', 103346, 104386);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106547, 'Ricardo', 'Loan Closer', 103347, 104386);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106548, 'Barbara', 'Manager', 103348, 104387);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106549, 'Paul', 'Officer', 103349, 104387);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106550, 'Rita', 'Credit Analyst', 103350, 104387);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106551, 'Jonathan', 'Loan Closer', 103351, 104387);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106552, 'Michael', 'Manager', 103352, 104388);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106553, 'Brittany', 'Officer', 103353, 104388);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106554, 'Natalie', 'Credit Analyst', 103354, 104388);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106555, 'Joy', 'Loan Closer', 103355, 104388);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106556, 'Michael', 'Manager', 103356, 104389);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106557, 'Marc', 'Officer', 103357, 104389);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106558, 'Xavier', 'Credit Analyst', 103358, 104389);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106559, 'Stacey', 'Loan Closer', 103359, 104389);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106560, 'Ryan', 'Manager', 103360, 104390);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106561, 'Catherine', 'Officer', 103361, 104390);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106562, 'Cynthia', 'Credit Analyst', 103362, 104390);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106563, 'Jacob', 'Loan Closer', 103363, 104390);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106564, 'Derek', 'Manager', 103364, 104391);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106565, 'Timothy', 'Officer', 103365, 104391);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106566, 'Charles', 'Credit Analyst', 103366, 104391);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106567, 'Donald', 'Loan Closer', 103367, 104391);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106568, 'Dennis', 'Manager', 103368, 104392);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106569, 'Patricia', 'Officer', 103369, 104392);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106570, 'Gavin', 'Credit Analyst', 103370, 104392);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106571, 'Katherine', 'Loan Closer', 103371, 104392);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106572, 'Suzanne', 'Manager', 103372, 104393);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106573, 'Christian', 'Officer', 103373, 104393);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106574, 'Jennifer', 'Credit Analyst', 103374, 104393);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106575, 'Kimberly', 'Loan Closer', 103375, 104393);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106576, 'Mary', 'Manager', 103376, 104394);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106577, 'Keith', 'Officer', 103377, 104394);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106578, 'Tony', 'Credit Analyst', 103378, 104394);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106579, 'Crystal', 'Loan Closer', 103379, 104394);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106580, 'Erik', 'Manager', 103380, 104395);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106581, 'David', 'Officer', 103381, 104395);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106582, 'Catherine', 'Credit Analyst', 103382, 104395);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106583, 'Elizabeth', 'Loan Closer', 103383, 104395);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106584, 'Leslie', 'Manager', 103384, 104396);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106585, 'Savannah', 'Officer', 103385, 104396);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106586, 'Stephen', 'Credit Analyst', 103386, 104396);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106587, 'Michael', 'Loan Closer', 103387, 104396);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106588, 'Christopher', 'Manager', 103388, 104397);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106589, 'Cody', 'Officer', 103389, 104397);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106590, 'Scott', 'Credit Analyst', 103390, 104397);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106591, 'James', 'Loan Closer', 103391, 104397);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106592, 'Isaiah', 'Manager', 103392, 104398);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106593, 'Jeffrey', 'Officer', 103393, 104398);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106594, 'Brian', 'Credit Analyst', 103394, 104398);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106595, 'Nicholas', 'Loan Closer', 103395, 104398);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106596, 'Julie', 'Manager', 103396, 104399);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106597, 'Micheal', 'Officer', 103397, 104399);
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106598, 'Jennifer', 'Credit Analyst', 103398, 104399);
commit;
prompt 1600 records committed...
insert into WORKERS (workerid, workername, workerrole, brancheid, teamid)
values (106599, 'Kristin', 'Loan Closer', 103399, 104399);
commit;
prompt 1601 records loaded
prompt Enabling foreign key constraints for BRANCHE...
alter table BRANCHE enable constraint SYS_C008662;
prompt Enabling foreign key constraints for CUSTOMERS...
alter table CUSTOMERS enable constraint SYS_C008669;
prompt Enabling foreign key constraints for LOANS...
alter table LOANS enable constraint SYS_C008674;
prompt Enabling foreign key constraints for WORKERS...
alter table WORKERS enable constraint SYS_C008681;
alter table WORKERS enable constraint SYS_C008682;
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

commit;
select * from account;
select * from client;
select * from customers;
select * from department;
select * from employee;
select * from workers;
select * from reporters;
select * from transaction;
select * from service;

commit;
ALTER TABLE customers
ADD (DateOfBirth DATE,
     Email VARCHAR2(255),
     PhoneNumber VARCHAR2(20));
     
ALTER TABLE customers
MODIFY customerName VARCHAR2(40);


INSERT INTO CUSTOMERS (CUSTOMERID, DATEOFBIRTH, EMAIL, PHONENUMBER, CUSTOMERNAME, ACCOUNTID, JOINDATE, BRANCHEID)
SELECT c.ClientID, c.DateOfBirth, c.Email, c.PhoneNumber, c.FirstName || ' ' || c.LastName AS customerName, a.AccountID, c.RegistrationDate, 103000 AS BRANCHEID
FROM CLIENT c
JOIN (
    SELECT ClientID, AccountID
    FROM (
        SELECT ClientID, AccountID, ROW_NUMBER() OVER (PARTITION BY ClientID ORDER BY OpeningDate DESC) AS rn
        FROM ACCOUNT
    )
    WHERE rn = 1
) a ON c.ClientID = a.ClientID;


ALTER TABLE workers
ADD (DateOfBirth DATE,
     HireDate DATE,
     DepartmentID NUMBER,
     ManagedByDepartmentID NUMBER);
ALTER TABLE workers
MODIFY WorkerRole VARCHAR2(100);

ALTER TABLE workers
MODIFY WorkerName VARCHAR2(100);

insert into SYS.BRANCHE (BRANCHEID, BRANCHELOCATION, REPORTERID, OPENEDDATE)
values (103402, 'tel-aviv-main-branch', 102000, to_date('24-07-2006', 'dd-mm-yyyy'));    
insert into SYS.TEAMS (TEAMID, WORKDAY)
values (0, '');
INSERT INTO workers (WorkerID, DateOfBirth, HireDate, DepartmentID, ManagedByDepartmentID, WorkerName, WorkerRole, TeamID, BRANCHEID)
SELECT e.EmployeeID, e.DateOfBirth, e.HireDate, e.DepartmentID, e.MANAGEDBYID, e.FirstName || ' ' || e.LastName AS WorkerName,POSITION, 0 AS TeamID, 103402 AS BRANCHEID
FROM EMPLOYEE e;

ALTER TABLE ACCOUNT
ADD CONSTRAINT fk_account_customerid FOREIGN KEY (ClientID) REFERENCES CUSTOMERS(CustomerID);

ALTER TABLE TRANSACTION DROP CONSTRAINT FK_TRANSACTION_CLIENT;
 -- Drop the existing foreign key constraint

DELETE FROM TRANSACTION
WHERE ClientID IN (
    SELECT DISTINCT t.ClientID
    FROM TRANSACTION t
    LEFT JOIN CUSTOMERS c ON t.ClientID = c.CustomerID
    WHERE c.CustomerID IS NULL
);

ALTER TABLE TRANSACTION
ADD CONSTRAINT fk_transaction_customerid FOREIGN KEY (ClientID) REFERENCES CUSTOMERS(CustomerID);

ALTER TABLE ACCOUNT DROP CONSTRAINT FK_ACCOUNT_CUSTOMERID;

ALTER TABLE ACCOUNT
ADD CONSTRAINT fk_account_customerid FOREIGN KEY (ClientID) REFERENCES CUSTOMERS(CustomerID);

ALTER TABLE SERVICE DROP CONSTRAINT FK_SERVICE_CLIENT;

DELETE FROM SERVICE
WHERE ClientID IN (
    SELECT DISTINCT s.ClientID
    FROM SERVICE s
    LEFT JOIN CUSTOMERS c ON s.ClientID = c.CustomerID
    WHERE c.CustomerID IS NULL
);

ALTER TABLE SERVICE
ADD CONSTRAINT fk_service_customerid FOREIGN KEY (ClientID) REFERENCES CUSTOMERS(CustomerID);

ALTER TABLE WORKSON
ADD CONSTRAINT fk_workson_workerid FOREIGN KEY (EmployeeID) REFERENCES WORKERS(WorkerID);

ALTER TABLE SERVICE DROP CONSTRAINT FK_SERVICE_CUSTOMERID;

ALTER TABLE SERVICE
ADD CONSTRAINT fk_service_workerid FOREIGN KEY (EmployeeID) REFERENCES WORKERS(WorkerID);


DROP TABLE CLIENT CASCADE CONSTRAINTS;
DROP TABLE EMPLOYEE CASCADE CONSTRAINTS;



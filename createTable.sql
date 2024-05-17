-- table 1
CREATE TABLE Loans(

  LoanId NUMBER(5) PRIMARY KEY,
  clientId NUMBER(9),
  accountId NUMBER,
  
  clientName VARCHAR(20),
  phone NUMBER(10),
  loanAmount NUMBER,
  returnAmount NUMBER,
  
  leftAmount NUMBER,
  accountBalance NUMBER,
  workerId NUMBER(9),
  workerName VARCHAR(20),
  
  loanDate DATE,
  repayment DATE
);

-- table 2 
CREATE TABLE LoanDepartment(
  LoanId NUMBER(5) PRIMARY KEY,
  workerId NUMBER(9),
  workerName VARCHAR(20),
  accountId NUMBER(9),
  clientName VARCHAR(20),
  openToNewClient VARCHAR(5) -- Decide if its BOOLEAN or VARCHAR, here VARCHAR(5) is just an example
);

-- table 3
CREATE TABLE clients(
  accountId NUMBER(9) PRIMARY KEY,
  clientName VARCHAR(20)
);

-- table 4
CREATE TABLE workers(
  workerId NUMBER(9),
  workerName VARCHAR(20),
  workerPosition VARCHAR(20),
  numberOfClients VARCHAR(20),
  workerEmail VARCHAR(50)
);

-- table 5
CREATE TABLE LoanRequests(
  LoanId NUMBER(5) PRIMARY KEY,
  accountId NUMBER(9),
  clientName VARCHAR(20),
  requestAmount NUMBER,
  accountBalance NUMBER,
  repaymentDate DATE
);

-- table 6
CREATE TABLE ClosedLoans(
  LoanId NUMBER(5) PRIMARY KEY,
  accountId NUMBER(9),
  clientName VARCHAR(20),
  repaymentDate DATE,
  repaymentInTime VARCHAR(5) -- Decide if its BOOLEAN or VARCHAR, here VARCHAR(5) is just an example
);

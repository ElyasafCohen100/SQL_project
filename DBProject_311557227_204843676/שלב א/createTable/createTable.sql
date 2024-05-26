CREATE TABLE Loans (
    loanID INT NOT NULL,
    loanAmount INT NOT NULL,
    PRIMARY KEY (loanID)
);

CREATE TABLE Reporters (
    reporterID INT NOT NULL,
    reporterName VARCHAR(15) NOT NULL,
    auditDate DATE NOT NULL,
    PRIMARY KEY (reporterID)
);

CREATE TABLE Branche (
    brancheID INT NOT NULL,
    brancheLocation VARCHAR(15) NOT NULL,
    reporterID INT NOT NULL,
    PRIMARY KEY (brancheID),
    FOREIGN KEY (reporterID) REFERENCES Reporters(reporterID)
);

CREATE TABLE Workers (
    workerID INT NOT NULL,
    workerName VARCHAR(15) NOT NULL,
    workerRole VARCHAR(15) NOT NULL,
    brancheID INT NOT NULL,
    PRIMARY KEY (workerID),
    FOREIGN KEY (brancheID) REFERENCES Branche(brancheID)
);

CREATE TABLE Customers (
    customerID INT NOT NULL,
    customerName VARCHAR(15) NOT NULL,
    accountID INT NOT NULL,
    joinDate DATE NOT NULL,
    loanID INT NOT NULL,
    PRIMARY KEY (customerID),
    FOREIGN KEY (loanID) REFERENCES Loans(loanID)
);

CREATE TABLE Teams (
    teamID INT NOT NULL,
    workerID INT NOT NULL,
    loanID INT NOT NULL,
    PRIMARY KEY (teamID),
    FOREIGN KEY (workerID) REFERENCES Workers(workerID),
    FOREIGN KEY (loanID) REFERENCES Loans(loanID)
);

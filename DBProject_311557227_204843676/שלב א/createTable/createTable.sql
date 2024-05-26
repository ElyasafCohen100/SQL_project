CREATE TABLE Loans (
    loanID INT NOT NULL,
    loanAmount INT NOT NULL,   
    customerID INT NOT NULL,
    PRIMARY KEY (loanID)
);

CREATE TABLE Reporters (
    reporterID INT NOT NULL,
    reporterName VARCHAR(15) NOT NULL,
    PRIMARY KEY (reporterID)
);

CREATE TABLE Branche (
    brancheID INT NOT NULL,
    brancheLocation VARCHAR(20) NOT NULL,
    reporterID INT NOT NULL,
    openedDate DATE NOT NULL,
    PRIMARY KEY (brancheID),
    FOREIGN KEY (reporterID) REFERENCES Reporters(reporterID)
);

CREATE TABLE Workers (
    workerID INT NOT NULL,
    workerName VARCHAR(15) NOT NULL,
    workerRole VARCHAR(15) NOT NULL,
    brancheID INT NOT NULL,
    teamID INT NOT NULL,
    PRIMARY KEY (workerID),
    FOREIGN KEY (brancheID) REFERENCES Branche(brancheID),
    FOREIGN KEY (teamID) REFERENCES Teams(teamID)
);

CREATE TABLE Customers (
    customerID INT NOT NULL,
    customerName VARCHAR(15) NOT NULL,
    accountID INT NOT NULL,
    joinDate DATE NOT NULL,
    brancheID INT NOT NULL,
    FOREIGN KEY (brancheID) REFERENCES Branche(brancheID),
    PRIMARY KEY (customerID)
);

CREATE TABLE Teams (
    teamID INT NOT NULL,
    workDay VARCHAR(10),
    PRIMARY KEY (teamID)
);

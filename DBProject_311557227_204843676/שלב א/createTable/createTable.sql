CREATE TABLE Teams (
    teamID INT NOT NULL,
    workDay VARCHAR2(10),
    PRIMARY KEY (teamID)
);
CREATE TABLE Reporters (
    reporterID INT NOT NULL,
    reporterName VARCHAR2(15) NOT NULL,
    PRIMARY KEY (reporterID)
);
CREATE TABLE Branche (
    brancheID INT NOT NULL,
    brancheLocation VARCHAR2(20) ,
    reporterID INT NOT NULL,
    openedDate DATE NOT NULL,
    PRIMARY KEY (brancheID),
    FOREIGN KEY (reporterID) REFERENCES Reporters(reporterID)
);
CREATE TABLE Customers (
    customerID INT NOT NULL,
    customerName VARCHAR2(15) NOT NULL,
    accountID INT NOT NULL,
    joinDate DATE NOT NULL,
    brancheID INT NOT NULL,
    FOREIGN KEY (brancheID) REFERENCES Branche(brancheID),
    PRIMARY KEY (customerID)
);

CREATE TABLE Loans (
    loanID INT NOT NULL,
    loanAmount INT NOT NULL,   
    customerID INT NOT NULL,
    loanDate DATE NOT NULL,
    FOREIGN KEY (customerID) REFERENCES Customers(customerID),
    PRIMARY KEY (loanID)
);



CREATE TABLE Workers (
    workerID INT NOT NULL,
    workerName VARCHAR2(15) NOT NULL,
    workerRole VARCHAR2(15) NOT NULL,
    brancheID INT NOT NULL,
    teamID INT NOT NULL,
    PRIMARY KEY (workerID),
    FOREIGN KEY (brancheID) REFERENCES Branche(brancheID),
    FOREIGN KEY (teamID) REFERENCES Teams(teamID),
    workerAge int 
);





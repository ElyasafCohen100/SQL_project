-- first view

CREATE VIEW CustomerAccountsView AS
SELECT
c.CustomerID,
c.customername,
c.Email,
c.PhoneNumber,
a.AccountID,
a.AccountNumber,
a.AccountType,
a.Balance,
a.OpeningDate,
a.ClosingDate
FROM
Customers c
JOIN
Account a ON c.CustomerID = a.ClientID;

-- first query

SELECT c.CustomerID, c.customername, COUNT(a.AccountID) AS ActiveAccountsCount, SUM(a.Balance) AS TotalBalance 
FROM CustomerAccountsView c JOIN Account a ON c.CustomerID = a.clientid WHERE a.Balance > 10000 AND a.ClosingDate IS NULL 
GROUP BY c.CustomerID, c.customername ORDER BY TotalBalance DESC;

--second query

SELECT c.CustomerID, c.customername, COUNT(DISTINCT a.AccountType) AS DifferentAccountTypesCount, MIN(a.OpeningDate) AS FirstAccountOpeningDate 
FROM CustomerAccountsView c JOIN Account a ON c.CustomerID = a.clientid 
WHERE a.OpeningDate > DATE '2020-01-01' GROUP BY c.CustomerID, c.customername HAVING COUNT(DISTINCT a.AccountType) > 1 ORDER BY FirstAccountOpeningDate ASC;


-- second view


CREATE VIEW OriginalDepartmentView AS
SELECT 
    c.customerID,
    c.customerName,
    c.accountID,
    c.joinDate,
    c.brancheID,
    b.brancheLocation,
    b.openedDate AS brancheOpenedDate,
    l.loanID,
    l.loanAmount,
    l.loanDate,
    w.workerID,
    w.workerName,
    w.workerRole,
    w.workerAge,
    w.departmentID,
    w.hireDate
FROM 
    customers c
JOIN 
    branche b ON c.brancheID = b.brancheID
LEFT JOIN 
    loans l ON c.customerID = l.customerID
LEFT JOIN 
    worker w ON w.brancheID = c.brancheID

-- first query

SELECT 
    b.brancheLocation,
    COUNT(c.customerID) AS numberOfCustomers
FROM 
    OriginalDepartmentView c
JOIN 
    branche b ON c.brancheID = b.brancheID
GROUP BY 
    b.brancheLocation;


--second query
 
SELECT 
    customerName,
    loanAmount,
    loanDate
FROM 
    OriginalDepartmentView
WHERE
BrancheLocation = 'tel aviv'


-- Retrieve workers in specified roles
SELECT workerID, workerName, workerRole, brancheID, teamID
FROM Workers
WHERE workerRole IN (:role1, :role2);

-- Hint parameter: Optimize query performance
SELECT customerID, customerName, accountID, joinDate, brancheID
FROM Customers
WHERE joinDate > TO_DATE(:join_date, 'YYYY-MM-DD');

-- Named parameter: Minimum loan amount
SELECT loanID, loanAmount, customerID, loanDate
FROM Loans
WHERE loanAmount > :min_loan_amount
ORDER BY loanAmount DESC;

-- Date parameter: Start and end date for opened branches
SELECT brancheID, brancheLocation, reporterID, openedDate
FROM Branche
WHERE openedDate BETWEEN TO_DATE(:start_date, 'YYYY-MM-DD') AND TO_DATE(:end_date, 'YYYY-MM-DD')
ORDER BY openedDate;

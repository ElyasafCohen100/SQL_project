-- Delete customers with the lowest loan amounts in each branch

DELETE FROM Loans
WHERE customerID IN (
    SELECT customerID
    FROM (
        SELECT 
            c.customerID,
            c.brancheID,
            SUM(l.loanAmount) AS total_loan_amount,
            ROW_NUMBER() OVER (PARTITION BY c.brancheID ORDER BY SUM(l.loanAmount)) AS rn
        FROM 
            Customers c
        JOIN 
            Loans l ON c.customerID = l.customerID
        GROUP BY 
            c.customerID, c.brancheID
    )
    WHERE rn = 1
);

DELETE FROM Customers
WHERE customerID IN (
    SELECT customerID
    FROM (
        SELECT 
            c.customerID,
            c.brancheID,
            SUM(l.loanAmount) AS total_loan_amount,
            ROW_NUMBER() OVER (PARTITION BY c.brancheID ORDER BY SUM(l.loanAmount)) AS rn
        FROM 
            Customers c
        JOIN 
            Loans l ON c.customerID = l.customerID
        GROUP BY 
            c.customerID, c.brancheID
    )
    WHERE rn = 1
);

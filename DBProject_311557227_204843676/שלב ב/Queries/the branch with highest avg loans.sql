SELECT 
    brancheID,
    brancheLocation,
    avg_loan_amount,
    num_loans,
    opened_date
FROM (
    SELECT 
        brancheID,
        brancheLocation,
        avg_loan_amount,
        num_loans,
        opened_date
    FROM (
        SELECT 
            c.brancheID AS brancheID,
            b.brancheLocation AS brancheLocation,
            AVG(l.loanAmount) OVER (PARTITION BY c.brancheID) AS avg_loan_amount,
            COUNT(l.loanID) OVER (PARTITION BY c.brancheID) AS num_loans,
            TO_CHAR(b.openedDate, 'YYYY-MM-DD') AS opened_date,
            ROW_NUMBER() OVER (PARTITION BY c.brancheID ORDER BY NULL) AS rn
        FROM 
            Customers c
        JOIN 
            Loans l ON c.customerID = l.customerID
        JOIN 
            Branche b ON c.brancheID = b.brancheID
    )
    WHERE rn = 1
)
ORDER BY 
    avg_loan_amount DESC;

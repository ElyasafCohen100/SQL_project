--  Find the average loan amount per customer in each branch, ordered by the highest average loan amount per branch.

SELECT 
    c.brancheID,
    b.brancheLocation,
    AVG(l.loanAmount) AS avg_loan_amount,
    COUNT(l.loanID) AS num_loans,
    TO_CHAR(b.openedDate, 'YYYY-MM-DD') AS opened_date
FROM 
    Customers c
JOIN 
    Loans l ON c.customerID = l.customerID
JOIN 
    Branche b ON c.brancheID = b.brancheID
GROUP BY 
    c.brancheID, b.brancheLocation, b.openedDate
ORDER BY 
    avg_loan_amount DESC;

--  Find the total number of loans per month in 2012 for the cranches in denver

SELECT 
    TO_CHAR(l.loanDate, 'YYYY-MM') AS loan_month,
    COUNT(l.loanID) AS num_loans,
    b.brancheLocation
FROM 
    Loans l
JOIN 
    Customers c ON l.customerID = c.customerID
JOIN 
    Branche b ON c.brancheID = b.brancheID
WHERE 
    TO_CHAR(l.loanDate, 'YYYY') = '2012' AND b.brancheLocation = 'denver'
GROUP BY 
    TO_CHAR(l.loanDate, 'YYYY-MM'), b.brancheLocation
ORDER BY 
    loan_month;

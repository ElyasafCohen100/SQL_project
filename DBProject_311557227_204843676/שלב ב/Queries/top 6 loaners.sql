-- list the top 6 loaners (top means it has he most high amout for a loan

SELECT 
    c.customerName,
    SUM(l.loanAmount) AS total_loan_amount,
    b.brancheID,
    b.brancheLocation
FROM 
    Loans l
JOIN 
    Customers c ON l.customerID = c.customerID
JOIN 
    Branche b ON c.brancheID = b.brancheID
GROUP BY 
    c.customerID, c.customerName, b.brancheID, b.brancheLocation
ORDER BY 
    total_loan_amount DESC
FETCH FIRST 6 ROWS ONLY;

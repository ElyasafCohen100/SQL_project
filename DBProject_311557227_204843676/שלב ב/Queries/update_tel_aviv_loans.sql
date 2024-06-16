-- Update loan amount for loans in a specific branch
DECLARE
    branch_name VARCHAR2(100) := 'tel aviv';
    new_loan_amount NUMBER := 15000; -- New loan amount to set
BEGIN
    UPDATE Loans
    SET loanAmount = new_loan_amount
    WHERE customerID IN (
        SELECT c.customerID
        FROM Customers c
        JOIN Branche b ON c.brancheID = b.brancheID
        WHERE b.brancheLocation = branch_name
    );

    COMMIT;
END;
/

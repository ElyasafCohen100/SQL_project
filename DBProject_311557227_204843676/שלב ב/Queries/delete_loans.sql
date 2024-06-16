-- Delete loans for customers in a specific branch and year
DECLARE
    city_name VARCHAR2(100) := 'tel aviv';
    target_year VARCHAR2(4) := '2012';
BEGIN
    DELETE FROM Loans
    WHERE customerID IN (
        SELECT c.customerID
        FROM Customers c
        JOIN Branche b ON c.brancheID = b.brancheID
        WHERE TO_CHAR(c.joinDate, 'YYYY') = target_year
        AND b.brancheLocation = city_name
    );

    COMMIT;
END;
/

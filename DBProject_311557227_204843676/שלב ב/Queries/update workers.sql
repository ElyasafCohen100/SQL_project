-- increas the lons by 10% for all customers who joined befor 2022
UPDATE Loans
SET loanAmount = loanAmount * 1.1  -- Increase loan amount by 10%
WHERE customerID IN (
    SELECT customerID
    FROM Customers
    WHERE joinDate < TO_DATE('2022-01-01', 'YYYY-MM-DD')  
);

COMMIT;

UPDATE Workers
SET workerRole = 'Senior Officer'
WHERE workerID IN (
    SELECT workerID
    FROM Workers
    WHERE workerRole = 'Officer'
    AND brancheID = 103001
);

COMMIT;

select *
from workers
WHERE workerID IN (
    SELECT workerID
    FROM Workers
    WHERE workerRole = 'Senior Officer'
    AND brancheID = 103001  
);

COMMIT;

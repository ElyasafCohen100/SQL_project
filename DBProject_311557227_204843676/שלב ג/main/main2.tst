PL/SQL Developer Test script 3.0
18
-- Main Program 2
DECLARE
    branch_id INT := 103009;  
    old_role VARCHAR2(20) := 'master Officer';
    promotion_role VARCHAR2(20) := 'Officer'; 
    total_loan_amount NUMBER;

BEGIN

    -- Call procedure to promote workers
    promote_workers_by_branch(branch_id,old_role, promotion_role);

    -- Call function to get total loan amount for a branch
    total_loan_amount := get_total_loan_amount(100003);

    -- Display the total loan amount
    DBMS_OUTPUT.PUT_LINE('Total loan amount for branch ' || branch_id || ': ' || total_loan_amount);
END;
0
0

create or replace function get_total_loan_amount(customer_id IN INT) return NUMBER  is
  v_total_amount NUMBER := 0;
    v_loan_amount NUMBER;
    CURSOR loan_cursor IS
        SELECT loanAmount FROM Loans WHERE customerID = customer_id; 
BEGIN
    OPEN loan_cursor;
    LOOP
        FETCH loan_cursor INTO v_loan_amount;
        EXIT WHEN loan_cursor%NOTFOUND;
        IF v_loan_amount < 0 THEN
            DBMS_OUTPUT.PUT_LINE('Negative loan amount found: ' || v_loan_amount);
        ELSE
            v_total_amount := v_total_amount + v_loan_amount;
        END IF;
    END LOOP;
    CLOSE loan_cursor;
    RETURN v_total_amount;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        RETURN 0;
END get_total_loan_amount;
/

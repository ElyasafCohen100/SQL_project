CREATE OR REPLACE PROCEDURE promote_workers_by_branch(p_branch_id IN INT, old_role IN VARCHAR2, p_new_role IN VARCHAR2) IS
    CURSOR c_workers IS
        SELECT workerID, workerName, workerRole
        FROM Workers
        WHERE brancheID = p_branch_id;

    v_workerID Workers.workerID%TYPE;
    v_workerName Workers.workerName%TYPE;
    v_workerRole Workers.workerRole%TYPE;

BEGIN
    OPEN c_workers;
    LOOP
        FETCH c_workers INTO v_workerID, v_workerName, v_workerRole;
        EXIT WHEN c_workers%NOTFOUND;

        -- IF-ELSE condition to check the current role
        IF v_workerRole = old_role THEN
            -- Update the worker's role
            UPDATE Workers
            SET workerRole = p_new_role
            WHERE workerID = v_workerID;

            -- Output the change
            DBMS_OUTPUT.PUT_LINE('Promoted ' || v_workerName || ' (ID: ' || v_workerID || ') to ' || p_new_role);
        ELSE
            -- Output message if no change is needed
            DBMS_OUTPUT.PUT_LINE('No change needed for ' || v_workerName || ' (ID: ' || v_workerID || '), is a ' || old_role);
        END IF;
    END LOOP;
    CLOSE c_workers;
    COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        ROLLBACK;
END promote_workers_by_branch;
/

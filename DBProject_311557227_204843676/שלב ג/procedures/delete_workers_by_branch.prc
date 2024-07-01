CREATE OR REPLACE PROCEDURE delete_workers_by_branch(
    branch_id IN INT,
    role_to_delete IN VARCHAR2 DEFAULT 'Credit Analyst',
    max_age_to_delete IN INT DEFAULT 70
) IS
    CURSOR worker_cursor IS
        SELECT workerID, workerRole, workerAge
        FROM Workers
        WHERE brancheID = branch_id
          AND (workerRole = role_to_delete OR workerAge > max_age_to_delete);  -- Include role and age conditions
    v_worker_id Workers.workerID%TYPE;
    v_worker_role Workers.workerRole%TYPE;
    v_worker_age Workers.workerAge%TYPE;
BEGIN
    OPEN worker_cursor;
    LOOP
        FETCH worker_cursor INTO v_worker_id, v_worker_role, v_worker_age;
        EXIT WHEN worker_cursor%NOTFOUND;
        
        -- Check if worker's role matches the role to delete or age is over max_age_to_delete
        IF v_worker_role = role_to_delete AND v_worker_age > max_age_to_delete THEN
            DELETE FROM Workers WHERE workerID = v_worker_id;
            DBMS_OUTPUT.PUT_LINE('Worker ' || v_worker_id || ' deleted due to role or age condition.');
        END IF;
    END LOOP;
    CLOSE worker_cursor;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Workers deleted successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        ROLLBACK;
END delete_workers_by_branch;
/

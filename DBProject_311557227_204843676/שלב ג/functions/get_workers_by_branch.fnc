CREATE OR REPLACE FUNCTION get_workers_by_branch(branch_id IN INT) RETURN SYS_REFCURSOR IS
    worker_cursor SYS_REFCURSOR;
BEGIN
    OPEN worker_cursor FOR
        SELECT workerID, workerName, workerRole FROM Workers WHERE brancheID = branch_id AND workerRole = 'Manager';
    RETURN worker_cursor;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        RETURN NULL;
END get_workers_by_branch;
/

PL/SQL Developer Test script 3.0
39
-- Main Program 1
DECLARE
    branch_id INT := 103008;  -- Example branch ID
    role_to_delete VARCHAR2(20) := 'Manager';  -- Example role to delete
    max_age_to_delete INT := 70;  -- Example maximum age to delete

    TYPE worker_rec_type IS RECORD (
        workerID Workers.workerID%TYPE,
        workerName Workers.workerName%TYPE,
        workerRole Workers.workerRole%TYPE
    );
    worker_rec worker_rec_type;
    workers_cursor SYS_REFCURSOR;
BEGIN
    workers_cursor := get_workers_by_branch(branch_id);

    -- Fetch and display the workers
    DBMS_OUTPUT.PUT_LINE('Workers in branch ' || branch_id || ':');
    LOOP
        FETCH workers_cursor INTO worker_rec;
        EXIT WHEN workers_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(worker_rec.workerID || ' - ' || worker_rec.workerName || ' - ' || worker_rec.workerRole);
    END LOOP;
    CLOSE workers_cursor;
    -- Call procedure to delete workers
    delete_workers_by_branch(branch_id, role_to_delete, max_age_to_delete);

    -- Call function to get workers by branch
    workers_cursor := get_workers_by_branch(branch_id);

    -- Fetch and display the workers
    DBMS_OUTPUT.PUT_LINE('Workers in branch ' || branch_id || ':');
    LOOP
        FETCH workers_cursor INTO worker_rec;
        EXIT WHEN workers_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(worker_rec.workerID || ' - ' || worker_rec.workerName || ' - ' || worker_rec.workerRole);
    END LOOP;
    CLOSE workers_cursor;
END;
0
0

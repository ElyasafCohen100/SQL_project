ALTER TABLE Branche
MODIFY brancheLocation DEFAULT 'Modiin';


ALTER TABLE Workers
ADD CHECK (workerAge>=18);


ALTER TABLE Teams
MODIFY workDay VARCHAR2(10) NOT NULL;

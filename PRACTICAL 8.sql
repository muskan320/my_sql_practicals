-- PRACTICAL 8
-- Perform the queries fro triggers.


DROP DATABASE IF EXISTS College;
-- Step 1: Create Database

CREATE DATABASE College;
USE College;


-- Step 2: Create Tables


-- Student Table
CREATE TABLE Student(
    S_ID INT AUTO_INCREMENT PRIMARY KEY,
    FIRSTNAME VARCHAR(100),
    LASTNAME VARCHAR(100),
    EMAIL VARCHAR(50),
    AGE INT
);

-- Audit Table (to store logs)
CREATE TABLE Student_Audit(
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ACTION VARCHAR(50),
    STUDENT_ID INT,
    ACTION_TIME TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Step 3: BEFORE INSERT Trigger
-- Prevent AGE < 18
---------------------------------------------------
DELIMITER //

CREATE TRIGGER before_insert_student
BEFORE INSERT ON Student
FOR EACH ROW
BEGIN
    IF NEW.AGE < 18 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Age must be >= 18';
    END IF;
END;
//

DELIMITER ;

---------------------------------------------------
-- Step 4: AFTER INSERT Trigger
-- Log insert action
---------------------------------------------------
DELIMITER //

CREATE TRIGGER after_insert_student
AFTER INSERT ON Student
FOR EACH ROW
BEGIN
    INSERT INTO Student_Audit(ACTION, STUDENT_ID)
    VALUES ('INSERT', NEW.S_ID);
END;
//

DELIMITER ;

-- Step 5: BEFORE DELETE Trigger
-- Log delete action before deleting

DELIMITER //

CREATE TRIGGER before_delete_student
BEFORE DELETE ON Student
FOR EACH ROW
BEGIN
    INSERT INTO Student_Audit(ACTION, STUDENT_ID)
    VALUES ('DELETE', OLD.S_ID);
END;
//

DELIMITER ;


-- Step 6: AFTER UPDATE Trigger
-- Log update action

DELIMITER //

CREATE TRIGGER after_update_student
AFTER UPDATE ON Student
FOR EACH ROW
BEGIN
    INSERT INTO Student_Audit(ACTION, STUDENT_ID)
    VALUES ('UPDATE', NEW.S_ID);
END;
//

DELIMITER ;

-- Step 7: Test the Triggers

-- Valid Insert
INSERT INTO Student(FIRSTNAME,LASTNAME,EMAIL,AGE)
VALUES ('ROHAN','THAKUR','rohan@gmail.com',20);

-- Invalid Insert (will fail)
-- INSERT INTO Student VALUES ('TEST','USER','test@gmail.com',15);

-- Update
UPDATE Student SET AGE = 22 WHERE S_ID = 1;

-- Delete
DELETE FROM Student WHERE S_ID = 1;


-- Step 8: Display Tables


SELECT * FROM Student;
SELECT * FROM Student_Audit;
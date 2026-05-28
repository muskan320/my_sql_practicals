-- PRACTICAL 9
-- Perform the following operations for demonstrating the insertion,updation and deletion using the referential integrity constraints.

CREATE DATABASE ri_demo;
USE ri_demo;
CREATE TABLE Department (
 dept_id INT PRIMARY KEY,
 dept_name VARCHAR(50)
);
CREATE TABLE Student (
 id INT PRIMARY KEY,
 name VARCHAR(50),
 dept_id INT,
 FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);
INSERT INTO Department VALUES (1, 'CSE'), (2, 'IT');
INSERT INTO Student VALUES (101, 'Aman', 1);
INSERT INTO Student VALUES (102, 'Riya', 3);
UPDATE Student SET dept_id = 5 WHERE id = 101;
DELETE FROM Department WHERE dept_id = 1;
SELECT * FROM Department;
SELECT * FROM Student;



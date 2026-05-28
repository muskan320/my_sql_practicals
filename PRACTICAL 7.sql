-- PRACTICAL 7
-- Write the query to create the views.


DROP DATABASE IF EXISTS College;
CREATE DATABASE College;
USE College;



-- Department Table
CREATE TABLE Department(
DeptID INT PRIMARY KEY,
DeptName VARCHAR(50) NOT NULL,
DeptLoc VARCHAR(20)
);

-- Student Table
CREATE TABLE Student(
S_ID INT AUTO_INCREMENT PRIMARY KEY,
FIRSTNAME VARCHAR(100) NOT NULL,
LASTNAME VARCHAR(100) NOT NULL,
EMAIL VARCHAR(50) UNIQUE
);

-- Course Table
CREATE TABLE Course(
CourseID INT PRIMARY KEY,
CourseName VARCHAR(100) NOT NULL,
DeptID INT,
FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

---------------------------------------------------
-- Insert Data
---------------------------------------------------

INSERT INTO Department VALUES
(1,'CSE','BLOCK A'),
(2,'EE','BLOCK B'),
(3,'CIVIL','BLOCK C');

INSERT INTO Student(FIRSTNAME,LASTNAME,EMAIL) VALUES
('ROHAN','THAKUR','rohan@gmail.com'),
('MOHAN','THAKUR','mohan@gmail.com'),
('RYAN','THAKUR','ryan@gmail.com');

INSERT INTO Course VALUES
(301,'MACHINE LEARNING',1),
(302,'OPERATING SYSTEM',1),
(303,'DIGITAL ELECTRONICS',2);

---------------------------------------------------
-- CREATE VIEWS
---------------------------------------------------

-- 1. Simple View
CREATE VIEW Student_View AS
SELECT S_ID, FIRSTNAME, LASTNAME, EMAIL
FROM Student;

-- 2. Department View
CREATE VIEW Department_View AS
SELECT DeptID, DeptName
FROM Department;

-- 3. Conditional View
CREATE VIEW Gmail_Students AS
SELECT FIRSTNAME, LASTNAME, EMAIL
FROM Student
WHERE EMAIL LIKE '%@gmail.com';

-- 4. JOIN View
CREATE VIEW Course_Department_View AS
SELECT C.CourseID, C.CourseName, D.DeptName
FROM Course C
JOIN Department D
ON C.DeptID = D.DeptID;

-- 5. Aggregate View
CREATE VIEW Student_Count_View AS
SELECT LASTNAME, COUNT(*) AS Total_Students
FROM Student
GROUP BY LASTNAME;

---------------------------------------------------
-- DISPLAY VIEWS
---------------------------------------------------

SELECT * FROM Student_View;
SELECT * FROM Department_View;
SELECT * FROM Gmail_Students;
SELECT * FROM Course_Department_View;
SELECT * FROM Student_Count_View;
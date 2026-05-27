-- PRACTICAL 5
-- Write the query for implementing the following functions:MAX(),MIN(),AVG(),COUNT()


DROP DATABASE IF EXISTS College;
-- Create Database
CREATE DATABASE College;
USE College;

-- Create Faculty Table
CREATE TABLE Faculty(
ID INT AUTO_INCREMENT PRIMARY KEY,
FIRSTNAME VARCHAR(100) NOT NULL,
LASTNAME VARCHAR(100) NOT NULL,
EMAIL VARCHAR(30) UNIQUE
);

-- Create Department Table
CREATE TABLE DEPARTMENT(
DeptID INT PRIMARY KEY,
DeptName VARCHAR(50) NOT NULL,
DeptLoc VARCHAR(12) NOT NULL
);

-- Create Student Table
CREATE TABLE Student(
S_ID INT AUTO_INCREMENT PRIMARY KEY,
FIRSTNAME VARCHAR(100) NOT NULL,
LASTNAME VARCHAR(100) NOT NULL,
EMAIL VARCHAR(30) UNIQUE
);

-- Create Course Table
CREATE TABLE COURSE(
CourseID INT PRIMARY KEY,
CourseName VARCHAR(100) NOT NULL,
DeptID INT,
FOREIGN KEY (DeptID) REFERENCES DEPARTMENT(DeptID)
);

-- Insert Data into Student
INSERT INTO STUDENT VALUES
(101,"ROHAN","THAKUR","rohan@gmail.com"),
(102,"MOHAN","THAKUR","mohan@gmail.com"),
(103,"RYAN","THAKUR","ryan@gmail.com"),
(104,"HEMAN","THAKUR","heman@gmail.com"),
(105,"HARMAN","THAKUR","harman@gmail.com");

-- Insert Data into Department
INSERT INTO DEPARTMENT VALUES
(1,"CSE","BLOCK A"),
(2,"EE","BLOCK B"),
(3,"CIVIL","BLOCK C"),
(4,"MECHANICAL","BLOCK D");

-- Insert Data into Course
INSERT INTO COURSE VALUES
(301,"MACHINE LEARNING",1),
(302,"OPERATING SYSTEM",1),
(303,"DIGITAL ELECTRONICS",2),
(304,"MATHEMATICS",2);

---------------------------------------------------
-- 🔹 AGGREGATE FUNCTIONS
---------------------------------------------------

-- MAX()
SELECT MAX(S_ID) AS Max_Student_ID FROM Student;
SELECT MAX(CourseID) AS Max_Course_ID FROM Course;

-- MIN()
SELECT MIN(S_ID) AS Min_Student_ID FROM Student;
SELECT MIN(CourseID) AS Min_Course_ID FROM Course;

-- AVG()
SELECT AVG(S_ID) AS Avg_Student_ID FROM Student;

-- COUNT()
SELECT COUNT(*) AS Total_Students FROM Student;
SELECT COUNT(*) AS Total_Departments FROM Department;

-- COUNT with condition
SELECT COUNT(*) AS Gmail_Users
FROM Student
WHERE EMAIL LIKE '%@gmail.com';

-- GROUP BY with COUNT (important)
SELECT LASTNAME, COUNT(*) AS Total
FROM Student
GROUP BY LASTNAME;
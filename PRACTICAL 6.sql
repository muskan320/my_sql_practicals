-- PRACTICAL 6
-- Write the query to implement the concept of integrity constraints.

DROP DATABASE IF EXISTS College;
-- Create Database
CREATE DATABASE College;
USE College;

---------------------------------------------------
-- Department Table (PRIMARY KEY, NOT NULL)
---------------------------------------------------
CREATE TABLE Department(
DeptID INT PRIMARY KEY,
DeptName VARCHAR(50) NOT NULL,
DeptLoc VARCHAR(20) DEFAULT 'BLOCK A'
);

---------------------------------------------------
-- Faculty Table (PRIMARY KEY, NOT NULL, UNIQUE)
---------------------------------------------------
CREATE TABLE Faculty(
ID INT AUTO_INCREMENT PRIMARY KEY,
FIRSTNAME VARCHAR(100) NOT NULL,
LASTNAME VARCHAR(100) NOT NULL,
EMAIL VARCHAR(50) UNIQUE
);

---------------------------------------------------
-- Student Table (PRIMARY KEY, NOT NULL, UNIQUE, CHECK)
---------------------------------------------------
CREATE TABLE Student(
S_ID INT AUTO_INCREMENT PRIMARY KEY,
FIRSTNAME VARCHAR(100) NOT NULL,
LASTNAME VARCHAR(100) NOT NULL,
EMAIL VARCHAR(50) UNIQUE,
AGE INT CHECK (AGE >= 18)   -- CHECK Constraint
);

---------------------------------------------------
-- Course Table (PRIMARY KEY, FOREIGN KEY)
---------------------------------------------------
CREATE TABLE Course(
CourseID INT PRIMARY KEY,
CourseName VARCHAR(100) NOT NULL,
DeptID INT,
FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
ON DELETE CASCADE
ON UPDATE CASCADE
);

---------------------------------------------------
-- Insert Data
---------------------------------------------------

-- Department
INSERT INTO Department VALUES
(1,'CSE','BLOCK A'),
(2,'EE','BLOCK B');

-- Faculty
INSERT INTO Faculty(FIRSTNAME,LASTNAME,EMAIL) VALUES
('AMAN','SHARMA','aman@gmail.com'),
('RAHUL','VERMA','rahul@gmail.com');

-- Student (CHECK constraint applied)
INSERT INTO Student(FIRSTNAME,LASTNAME,EMAIL,AGE) VALUES
('ROHAN','THAKUR','rohan@gmail.com',20),
('MOHAN','THAKUR','mohan@gmail.com',19);

-- Course (FOREIGN KEY used)
INSERT INTO Course VALUES
(301,'ML',1),
(302,'OS',1);

SELECT * FROM Department;
SELECT * FROM Faculty;
SELECT * FROM Student;
SELECT * FROM Course;
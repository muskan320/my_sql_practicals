-- PRACTICAL 2
-- Apply the constraints lik eprimary key,Foreign key,NOT NULL to the table.

CREATE DATABASE college_info;
USE college_info;

-- 1. Create table departments
CREATE TABLE Departments ( 
DepartmentID INT PRIMARY KEY, 
DepartmentName VARCHAR(100) NOT NULL, 
Location VARCHAR(100) 
); 


-- 2. Create the Students table 
CREATE TABLE Students ( 
StudentID INT PRIMARY KEY, 
FirstName VARCHAR(50) NOT NULL, 
LastName VARCHAR(50) NOT NULL, 
Gender CHAR(1), 
DOB DATE, 
Email VARCHAR(100), 
Phone VARCHAR(15), 
Address VARCHAR(255), 
DepartmentID INT, 
FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID) 
); 
 
-- 3. Create the Faculty table 
CREATE TABLE Faculty ( 
    FacultyID INT PRIMARY KEY, 
    FirstName VARCHAR(50) NOT NULL, 
    LastName VARCHAR(50) NOT NULL, 
    Email VARCHAR(100) UNIQUE, 
    Phone VARCHAR(15), 
    DepartmentID INT NOT NULL, 
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
); 
 
-- 4. Create the Courses table 
CREATE TABLE Courses ( 
    CourseID INT PRIMARY KEY, 
    CourseName VARCHAR(100) NOT NULL, 
    Credits INT NOT NULL, 
    DepartmentID INT NOT NULL, 
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID), 
    UNIQUE (CourseName, DepartmentID) 
); 
 
 
-- 5. Create the Enrollments table 
CREATE TABLE Enrollments ( 
    StudentID INT, 
    CourseID INT, 
    Semester VARCHAR(10), 
    Year INT, 
    Grade CHAR(2), 
    PRIMARY KEY (StudentID, CourseID), 
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID), 
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) 
); 
 
-- 6. Create the Classrooms table 
CREATE TABLE Classrooms ( 
    ClassroomID INT PRIMARY KEY, 
    CourseID INT, 
    Semester VARCHAR(10), Year INT, 
    RoomNumber VARCHAR(10), FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) 
); 


CREATE TABLE TEACH ( 
FacultyID INT, 
CourseID INT, 
PRIMARY KEY (FacultyID, CourseID), 
FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID), 
FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) 
); 

SHOW TABLES;

SELECT*
FROM departments;

INSERT INTO departments(DepartmentID,DepartmentName,Location)
VALUES(101,"CSE","Bilaspur");
INSERT INTO departments(DepartmentID,DepartmentName,Location)
VALUES(102,"Civil","Bilaspur");
INSERT INTO departments(DepartmentID,DepartmentName,Location)
VALUES(103,"Electrical","Bilaspur");


SELECT *
FROM classrooms;

INSERT INTO classrooms(ClassroomID,CourseID,Semester,Year,RoomNumber)
VALUES(1,"10001","4th","2","321");
INSERT INTO classrooms(ClassroomID,CourseID,Semester,Year,RoomNumber)
VALUES(2,"10002","5th","3","322");
INSERT INTO classrooms(ClassroomID,CourseID,Semester,Year,RoomNumber)
VALUES(3,"10003","2nd","4","323");

Select * 
FROM classrooms;





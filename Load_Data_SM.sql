# Loading all data into MySQL Workbench
DROP SCHEMA IF EXISTS schooldatabase;
CREATE SCHEMA schooldatabase;
USE schooldatabase;

# Create marks table
DROP TABLE IF EXISTS marks;
CREATE TABLE marks (
	MarkID INTEGER PRIMARY KEY,
	StudentID INTEGER,
	SubjectID INTEGER,
	TeacherID INTEGER,
	MarkObtained INTEGER,
	ExamDate DATE
);

# Create students table
DROP TABLE IF EXISTS students;
CREATE TABLE students (
	StudentID INTEGER PRIMARY KEY,
	FirstName VARCHAR(30),
	LastName VARCHAR(30),
	DateOfBirth DATE,
	Address VARCHAR(50),
	ContactNumber VARCHAR(20),
	Email VARCHAR(50)
);

# Create subjects table
DROP TABLE IF EXISTS subjects;
CREATE TABLE subjects (
	SubjectID INTEGER PRIMARY KEY,
	SubjectName VARCHAR(30)
);

# Create teachers table
DROP TABLE IF EXISTS teachers;
CREATE TABLE teachers (
	TeacherID INTEGER PRIMARY KEY,
	FirstName VARCHAR(30),
	LastName VARCHAR(30),
	DateOfBirth DATE,
	Address VARCHAR(50),
	ContactNumber VARCHAR(20),
	Email VARCHAR(50)
);

# Load data into tables
SHOW VARIABLES LIKE "secure_file_priv";
SHOW VARIABLES LIKE "local_infile";

# Marks table
SET GLOBAL local_infile=1;
LOAD DATA INFILE '/Users/senecamiller/Downloads/
				School_Database_MySQL_Term_Project_01/Marks.csv'
INTO TABLE marks
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY'\n'
IGNORE 1 ROWS;

# Students table
LOAD DATA INFILE '/Users/senecamiller/Downloads/
				School_Database_MySQL_Term_Project_01/Students.csv'
INTO TABLE students
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY'\n'
IGNORE 1 ROWS;

# Subjects table
LOAD DATA INFILE '/Users/senecamiller/Downloads/
				School_Database_MySQL_Term_Project_01/Subjects.csv'
INTO TABLE subjects
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY'\n'
IGNORE 1 ROWS;

# Teachers table
LOAD DATA INFILE '/Users/senecamiller/Downloads/
				School_Database_MySQL_Term_Project_01/Teachers.csv'
INTO TABLE teachers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY'\n'
IGNORE 1 ROWS;

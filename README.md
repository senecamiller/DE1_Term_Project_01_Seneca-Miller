# DE1_Term_Project_01_Seneca-Miller

School Database: Comprehensive Educational Data — Data Engineering 1 SQL

The data for this term project was chosen with the goal of creating a comprehensive snapshot of an educational institution’s ecosystem to identify relationships between the following categories: teachers, students, marks, and subjects. The interconnectivity of the four tables can reveal correlations between students and the marks they receive, teachers and the marks they give, marks for each subject, and student and teacher relationship. The following document outlines a shortened version of the SQL scripts provided.


School Database: https://www.kaggle.com/datasets/bernardnm/great-school?select=Students.csv

Sample Table Creation














Sample Table Import











The School Database was procured from kaggle.com by choosing tabular relational datasets, getting the measures of interest and attributing them to columns and rows respectively.






Database Structure

The database contains the following primary tables:

students: Stores student details such as StudentID, FirstName, LastName, etc.
teachers: Stores teacher details including the TeacherID, FirstName, LastName, etc.
subjects: Contains information about each subject with columns for SubjectID and SubjectName.
marks: Stores records of marks obtained by students in each subject, along with the teacher who taught the subject.


EER Diagram of Initial Data (relations are manually added between datasets)

I imported the main tables by reverse engineering the “schooldatabase” schema in MySQL Workbench. Foreign keys, primary keys, and non-identifying relationships were created manually.





























Views Created

This project includes three views derived from the four charts in the dataset. These views are ready-made for specific use cases:

marksbysubject: Displays marks for each subject, ordered by subject name.
teacherstudentsubjects: View of all students and teachers who attend the school and all subjects taught.
teacherstudentmarks: A comprehensive view linking students, teachers, and marks.

Sample View

























Key Queries

What are the average marks per subject?
Who are the top performing students per subject? 2B: Select students' first and last names who scored marks above 90.
What is the student to teacher ratio filtered by subject?
Count the total number of students taking each subject.
Retrieve all marks for a specific student (StudentID = 1) across all subjects.
List the top 3 students with the highest average mark across all subjects.
Find the student with the highest average mark.












Final EER Diagram of Dataset

































This project made use of data loading, ETL, stored procedures, events and views as functions of SQL in MySQL Workbench. This project’s scope can be easily enhanced by conducting more data enrichment including more measures and queries.

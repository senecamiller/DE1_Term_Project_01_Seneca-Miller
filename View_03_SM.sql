# Creating a View
USE schooldatabase;

DROP VIEW IF EXISTS teacher_student_subjects;

# Create view with colunmns from 'students', 'subjects', 
# and 'teachers' with 'marks' connecting the 3 tables
CREATE VIEW teacher_student_subjects AS
SELECT 
	m.StudentID,
    m.SubjectID,
    m.TeacherID,
    s.FirstName AS StudentFirstName,
    s.LastName AS StudentLastName,
    b.SubjectName,
    t.FirstName AS TeacherFirstName,
    t.LastName AS TeacherLastName
FROM 
	marks m
JOIN 
	students s ON m.StudentID = s.StudentID
JOIN 
	subjects b ON m.SubjectID = b.SubjectID
JOIN 
	teachers t ON m.TeacherID = t.TeacherID;

SELECT * FROM teacher_student_subjects;

DROP TABLE IF EXISTS teacherstudentsubjects;

CREATE TABLE teacherstudentsubjects AS
    SELECT
		m.StudentID,
		m.SubjectID,
		m.TeacherID,
		s.FirstName AS StudentFirstName,
		s.LastName AS StudentLastName,
		b.SubjectName,
		t.FirstName AS TeacherFirstName,
		t.LastName AS TeacherLastName
	FROM 
		marks m
	JOIN 
		students s ON m.StudentID = s.StudentID
	JOIN 
		subjects b ON m.SubjectID = b.SubjectID
	JOIN 
		teachers t ON m.TeacherID = t.TeacherID
    GROUP BY m.MarkID
    ORDER BY m.MarkID;
    
SELECT * FROM teacherstudentsubjects;

DROP PROCEDURE IF EXISTS createteacherstudentsubjects;

DELIMITER //

CREATE PROCEDURE createteacherstudentsubjects()
BEGIN

	DROP TABLE IF EXISTS teacherstudentsubjects;
    CREATE TABLE teacherstudentsubjects AS
    SELECT
		m.StudentID,
		m.SubjectID,
		m.TeacherID,
		s.FirstName AS StudentFirstName,
		s.LastName AS StudentLastName,
		b.SubjectName,
		t.FirstName AS TeacherFirstName,
		t.LastName AS TeacherLastName
	FROM 
		marks m
	JOIN 
		students s ON m.StudentID = s.StudentID
	JOIN 
		subjects b ON m.SubjectID = b.SubjectID
	JOIN 
		teachers t ON m.TeacherID = t.TeacherID;
END //
DELIMITER ;

CALL createteacherstudentmarks();
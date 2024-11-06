# Creating a View
USE schooldatabase;

DROP VIEW IF EXISTS teacher_student_marks;

# Create view with columns form 'teachers', 'students', and 'marks'
CREATE VIEW teacher_student_marks AS
SELECT 
	m.SubjectID,
    m.MarkID,
    m.MarkObtained,
    CASE
		WHEN m.MarkObtained <= 80 THEN 'LowMark'
        WHEN m.MarkObtained > 80 AND m.MarkObtained <= 90 THEN 'MiddleMark'
        WHEN m.MarkObtained > 90 THEN 'HighMark'
	END AS ComparativeMark,
    m.StudentID,
	s.FirstName AS StudentFirstName,
    s.LastName AS StudentLastName,
    m.TeacherID,
	t.FirstName AS TeacherFirstName,
    t.LastName AS TeacherLastName          
FROM 
	marks m
JOIN 
	students s ON m.StudentID = s.StudentID
JOIN 
	teachers t ON t.TeacherID = m.TeacherID;

SELECT * FROM teacher_student_marks;

DROP TABLE IF EXISTS teacherstudentmarks;

CREATE TABLE teacherstudentmarks AS
    SELECT
		m.SubjectID,
		m.MarkID,
        m.MarkObtained,
		CASE
			WHEN m.MarkObtained <= 80 THEN 'LowMark'
			WHEN m.MarkObtained > 80 AND m.MarkObtained <= 90 THEN 'MiddleMark'
			WHEN m.MarkObtained > 90 THEN 'HighMark'
		END AS ComparativeMark,
		m.StudentID,
		s.FirstName AS StudentFirstName,
		s.LastName AS StudentLastName,
		m.TeacherID,
		t.FirstName AS TeacherFirstName,
		t.LastName AS TeacherLastName          
	FROM 
		marks m
	JOIN 
		students s ON m.StudentID = s.StudentID
	JOIN 
		teachers t ON t.TeacherID = m.TeacherID
    GROUP BY m.MarkID
    ORDER BY m.MarkID;
    
SELECT * FROM teacherstudentmarks;

DROP PROCEDURE IF EXISTS createteacherstudentmarks;

DELIMITER //

CREATE PROCEDURE createteacherstudentmarks()
BEGIN

	DROP TABLE IF EXISTS teacherstudentmarks;
    CREATE TABLE teacherstudentmarks AS
    SELECT
		m.SubjectID,
		m.MarkID,
		CASE
			WHEN m.MarkObtained <= 80 THEN 'LowMark'
			WHEN m.MarkObtained > 80 AND m.MarkObtained <= 90 THEN 'MiddleMark'
			WHEN m.MarkObtained > 90 THEN 'HighMark'
		END AS ComparativeMark,
		m.StudentID,
		s.FirstName AS StudentFirstName,
		s.LastName AS StudentLastName,
		m.TeacherID,
		t.FirstName AS TeacherFirstName,
		t.LastName AS TeacherLastName          
	FROM 
		marks m
	JOIN 
		students s ON m.StudentID = s.StudentID
	JOIN 
		teachers t ON t.TeacherID = m.TeacherID;
END //
DELIMITER ;

CALL createteacherstudentmarks();
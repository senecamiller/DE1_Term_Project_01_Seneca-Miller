#Creating a view
USE schooldatabase;

DROP VIEW IF EXISTS marks_by_subject;

# Create view with columns from 'marks' and 'subjects'
CREATE VIEW marks_by_subject AS
SELECT 
    m.TeacherID,
    m.StudentID,
    m.SubjectID,
    m.MarkID,
	CASE
		WHEN m.MarkObtained <= 80 THEN 'LowMark'
        WHEN m.MarkObtained > 80 AND m.MarkObtained <= 90 THEN 'MiddleMark'
        WHEN m.MarkObtained > 90 THEN 'HighMark'
	END AS ComparativeMark,
    AVG(m.MarkID) AS AverageMark,
    m.ExamDate,
    b.SubjectName
FROM 
	marks m
JOIN 
	subjects b ON m.SubjectID = b.SubjectID
GROUP BY 
	m.MarkID;

SELECT * FROM marks_by_subject;

# Create a table within the view
DROP TABLE IF EXISTS marksbysubject;

CREATE TABLE marksbysubject AS
    SELECT
        m.StudentID,
        m.SubjectID,
        m.TeacherID,
        m.MarkID,
        AVG(m.MarkID) AS AverageMark,
        CASE
			WHEN m.MarkObtained <= 80 THEN 'LowMark'
			WHEN m.MarkObtained > 80 AND m.MarkObtained <= 90 THEN 'MiddleMark'
			WHEN m.MarkObtained > 90 THEN 'HighMark'
		END AS ComparativeMark,
        m.ExamDate,
        b.SubjectName
    FROM
        marks m
        JOIN Subjects AS b USING (SubjectID)
    GROUP BY m.MarkID
    ORDER BY m.MarkID;
    
SELECT * FROM marksbysubject;

DROP PROCEDURE IF EXISTS createmarksbysubject;

DELIMITER //

CREATE PROCEDURE createmarksbysubject()
BEGIN

	DROP TABLE IF EXISTS marksbysubject;
    CREATE TABLE marksbysubject AS
    SELECT
		m.TeacherID,
		m.StudentID,
		m.SubjectID,
		m.MarkID,
		CASE
			WHEN m.MarkObtained <= 80 THEN 'LowMark'
			WHEN m.MarkObtained > 80 AND m.MarkObtained <= 90 THEN 'MiddleMark'
			WHEN m.MarkObtained > 90 THEN 'HighMark'
		END AS ComparativeMark,
		AVG(m.MarkID) AS AverageMark,
		m.ExamDate,
		b.SubjectName
	FROM 
		marks m
	JOIN 
		subjects b ON m.SubjectID = b.SubjectID
	GROUP BY 
		m.MarkID;
END //
DELIMITER ;

CALL createmarksbysubject();

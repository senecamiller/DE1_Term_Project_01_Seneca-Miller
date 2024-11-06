# Query 1: Get average marks per subject
USE schooldatabase;

SELECT 
	b.SubjectName, 
    AVG(m.MarkObtained) AS average_mark
FROM 
	marks m
JOIN
	subjects b ON m.SubjectID = b.SubjectID
GROUP BY 
	b.SubjectID;

DROP VIEW IF EXISTS marks_per_subject;

CREATE VIEW marks_per_subject AS
	SELECT 
		b.SubjectName, 
        AVG(m.MarkObtained) AS average_mark
    FROM 
		marks m
    JOIN
		subjects b ON m.SubjectID = b.SubjectID
	GROUP BY 
		b.SubjectID;

SELECT * FROM marks_per_subject;


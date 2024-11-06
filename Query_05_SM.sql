# Query 5: Retreive all marks for a specific student (StudentID = 1) across all subjects
USE schooldatabase;

SELECT 
	m.SubjectID, 
	m.MarkObtained
FROM 
	marks m
JOIN
	subjects s ON m.SubjectID = s.SubjectID
WHERE 
	m.StudentID = 1;
# Query 4: Count the total number of students in each subject
USE schooldatabase;

SELECT 
	m.SubjectID,
    b.SubjectName,
    COUNT(m.StudentID) AS total_students
FROM 
	marks m
JOIN 
	subjects b ON m.SubjectID = b.SubjectID
GROUP BY m.SubjectID;
# Query 6: Get the top 3 students with the highest average mark across all subjects
USE schooldatabase;

SELECT 
	s.StudentID,
    s.FirstName, 
    s.LastName, 
    AVG(m.MarkObtained) AS avg_mark
FROM 
	marks m
JOIN 
	students s ON m.StudentID = s.StudentID
JOIN
	subjects b ON m.SubjectID = b.SubjectID 
GROUP BY 
	m.StudentID
ORDER BY 
	avg_mark DESC
LIMIT 3;
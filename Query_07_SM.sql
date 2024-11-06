# Query 7: Find the student with the highest average mark
USE schooldatabase;

SELECT 
    s.FirstName, 
    s.LastName, 
    AVG(m.MarkObtained) AS average_mark
FROM 
	marks m
JOIN
	students s ON s.StudentID = m.StudentID
JOIN
	subjects b ON b.SubjectID = m.SubjectID
GROUP BY 
	m.StudentID
ORDER BY
	average_mark DESC
LIMIT 1;

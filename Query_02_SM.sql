# Query 2: Get top-performing students per subject
USE schooldatabase;

SELECT 
	m.StudentID, 
    b.SubjectName, 
    m.MarkObtained AS highest_mark
FROM 
	marks m
JOIN
	subjects b ON m.SubjectID = b.SubjectID
WHERE
	(m.SubjectID, m.MarkObtained) IN (
		SELECT
			m2.SubjectID,
            MAX(m2.MarkObtained) AS highest_mark
		FROM
			marks m2
		GROUP BY
			m2.SubjectID
	)
ORDER BY
	highest_mark DESC;

# Query 2B: Select students' first and last names who scored above 90
Select 
	s.FirstName AS StudentFirstName,
    s.LastName AS StudentLastName,
    ts.MarkObtained
From	
	teacherstudentmarks ts
JOIN
	students s ON ts.StudentID = s.StudentID
WHERE
	ts.MarkObtained > 90
ORDER BY
	s.LastName DESC;

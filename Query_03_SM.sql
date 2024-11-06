# Query 3: Student to teacher ratio by subject
USE schooldatabase;

SELECT
	b.SubjectName,
    COUNT(DISTINCT m.StudentID) AS num_students,
    COUNT(DISTINCT m.TeacherID) AS num_teachers,
    ROUND(COUNT(DISTINCT m.StudentID) / COUNT(DISTINCT m.TeacherID), 0) AS student_to_teacher_ratio
FROM
	marks m
JOIN
	subjects b ON m.SubjectID = b.SubjectID
GROUP BY
	b.SubjectID
ORDER BY m.SubjectID DESC;
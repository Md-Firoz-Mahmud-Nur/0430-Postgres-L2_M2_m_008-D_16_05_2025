CREATE TABLE Student_01_PracticeTask (
  id SERIAL PRIMARY KEY,
  roll INT UNIQUE,
  name VARCHAR(50),
  age INT,
  department VARCHAR(50),
  score FLOAT,
  status VARCHAR(10),
  last_login DATE
)

INSERT INTO Student_01_PracticeTask (roll, name, age, department, score, status, last_login)
VALUES(101, 'Alice Rahman', 20, 'CSE', 85.5, 'active', '2024-09-01'),
(102, 'Bob Hasan', 21, 'EEE', 78.0, 'active', '2024-09-02'),
(103, 'Charlie Islam', 19, 'BBA', 92.3, 'inactive', '2024-08-29'),
(104, 'Daisy Akter', 22, 'CSE', 88.8, 'active', '2024-09-05'),
(105, 'Ethan Chowdhury', 20, 'ECE', 69.4, 'active', '2024-09-03'),
(106, 'Farhana Jahan', 23, 'English', 74.2, 'inactive', '2024-08-30'),
(107, 'Gazi Shakib', 21, 'Physics', 81.0, 'active', '2024-09-04'),
(108, 'Hena Khatun', 22, 'Math', 90.5, 'active', '2024-09-01'),
(109, 'Ibrahim Noor', 20, 'CSE', 66.9, 'inactive', '2024-08-28'),
(110, 'Joya Sultana', 19, 'Economics', 79.7, 'active', '2024-09-02');

SELECT * FROM Student_01_PracticeTask

-- 1. Add a column email (VARCHAR) to the existing students table.
ALTER TABLE Student_01_PracticeTask ADD COLUMN email VARCHAR(80);

-- 2. Rename the column email to student_email.
ALTER TABLE Student_01_PracticeTask RENAME COLUMN email TO student_email;

-- 3. Add a UNIQUE constraint to student_email.
ALTER TABLE Student_01_PracticeTask ADD constraint Student_01_PracticeTask_email_unique UNIQUE (student_email);

-- 4. Add a PRIMARY KEY to a new table named courses.
CREATE TABLE Courses_02_PracticeTask (
    course_id INT UNIQUE NOT NULL,
    course_name VARCHAR(100)
)

SELECT * FROM Courses_02_PracticeTask;

-- 5. Drop a column from any existing table.
ALTER TABLE Student_01_PracticeTask DROP COLUMN student_email;

-- 6. Write a query to find all students who have a score greater than 80 and not null.
SELECT * FROM Student_01_PracticeTask
  WHERE score > 80 AND NOT score IS NULL;

-- 7. Use the NOT operator to exclude students from a specific department.
SELECT * FROM Student_01_PracticeTask
  WHERE NOT department = 'CSE';


-- 8. Fetch students whose names start with ‘A’ using LIKE and ILIKE.
SELECT * FROM Student_01_PracticeTask
  WHERE name LIKE 'A%';

SELECT * FROM Student_01_PracticeTask
  WHERE name ILIKE 'A%';

-- 9. Select all students whose age is between 18 and 25.
SELECT * FROM Student_01_PracticeTask
  WHERE age BETWEEN 18 AND 25;

-- 10 Retrieve rows using IN for a specific set of roll numbers.
SELECT * FROM Student_01_PracticeTask
  WHERE roll IN (101, 103, 105);

-- 11. Count how many students exist in the students table.
SELECT COUNT(*) FROM Student_01_PracticeTask

-- 12. Find the average score of students in a specific department.
SELECT AVG(score) FROM Student_01_PracticeTask
  WHERE department = 'CSE';

-- 13. Get the maximum and minimum age of all students
SELECT max(age), min(age) FROM Student_01_PracticeTask

-- 14. Update the status of students who scored less than 70 to 'failed'.
UPDATE Student_01_PracticeTask SET status = 'failed'
  WHERE score < 70;

-- 15. Delete students who have not logged in since last year.
DELETE FROM Student_01_PracticeTask
  WHERE last_login < '2024-09-01';

-- 16. Use LIMIT and OFFSET to fetch the second page of results (5 per page).
SELECT * FROM Student_01_PracticeTask LIMIT 3 OFFSET 3
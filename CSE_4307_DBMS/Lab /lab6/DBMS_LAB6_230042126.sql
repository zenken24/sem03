
-- Task 1

SELECT 
    email_addr,
    POSITION('@' IN email_addr) AS at_symbol_index,
    SUBSTR(email_addr, POSITION('@' IN email_addr) + 1) AS domain_only
FROM Students;

-- Task 2

SELECT 
    full_name
FROM Students
WHERE EXTRACT(YEAR FROM enrollment_date) = 2023;

-- Task 3

SELECT 
    student_id
FROM Enrollments
WHERE course_code = 'CS102'
AND student_id NOT IN (
    SELECT student_id 
    FROM Enrollments 
    WHERE course_code = 'CS101'
);

-- Task 4

SELECT 
    full_name,
    SUBSTR(email_addr, POSITION('@' IN email_addr) + 1) AS domain
FROM Students
WHERE student_id IN (
    SELECT person_id 
    FROM Gate_Logs 
    WHERE location = 'Server Room'
);

-- Task 5

CREATE MATERIALIZED VIEW MatView_Enrollment_Stats AS
SELECT 
    course_code,
    COUNT(student_id) AS total_students
FROM Enrollments
GROUP BY course_code;

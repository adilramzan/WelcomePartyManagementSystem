use db_proj1;

-- Retrieve all students along with their family information:
SELECT s.username, s.FName, s.LName, s.familymember, f.username as family_username
FROM student s
LEFT JOIN family f ON s.family_id = f.family_id;

-- Retrieve all teachers along with their family information:
SELECT t.username, t.FName, t.LName, t.familymember, f.username as family_username
FROM teacher t
LEFT JOIN family f ON t.family_id = f.family_id;

-- Retrieve all managers and their corresponding expenses:
SELECT m.FName, m.LName, m.managertype, e.descriptionExp, e.amount
FROM manager m
JOIN expense e ON m.manager_id = e.manager_id;

-- Retrieve all announcements with the corresponding manager information:
SELECT a.title, a.message, m.FName, m.LName
FROM announcement a
JOIN manager m ON a.manager_id = m.manager_id;

-- Retrieve all menu suggestions along with the student information:
SELECT ms.items, ms.votes, s.username as student_username
FROM menu_suggestion ms
JOIN student s ON ms.student_id = s.student_id;

-- Retrieve all performance proposals with student and performance details:
SELECT pp.duration, pp.votes, pp.specialRe, pp.performanceType, s.username as student_username
FROM performance_proposal pp
JOIN student s ON pp.student_id = s.student_id;

-- Retrieve attendance information for a specific user:
SELECT a.event_date, a.family_member_Attendance
FROM attendance a
JOIN main_user mu ON a.user_id = mu.user_id
WHERE mu.username = 'adil';

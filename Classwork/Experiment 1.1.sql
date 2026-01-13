-- Table Structure
CREATE TABLE PROJECT(
    project_id INT PRIMARY KEY CHECK(project_id > 0),
    proj_name VARCHAR(30) NOT NULL UNIQUE CHECK(length(proj_name) > 0),
    dept_id INT REFERENCES DEPARTMENT(dept_id)
);

-- UPDATED INDIAN DATA FOR DEPARTMENTS
INSERT INTO DEPARTMENT (dept_id, dept_name) VALUES
(10, 'Operations'),
(20, 'Software Engineering'),
(30, 'Data Science'),
(40, 'Product Design');

-- UPDATED INDIAN NAMES FOR EMPLOYEES
INSERT INTO EMPLOYEE (emp_id, emp_name, dept_id) VALUES
(501, 'Arjun Malhotra', 20),
(502, 'Siddharth Iyer', 10),
(503, 'Ananya Chatterjee', 20),
(504, 'Ishaan Deshmukh', 30),
(505, 'Kavya Reddy', 40);

-- UPDATED INDIAN DATA FOR PROJECTS
INSERT INTO PROJECT (project_id, proj_name, dept_id) VALUES
(901, 'Cloud Migration', 10),
(902, 'Mobile App v2', 20),
(903, 'AI Recommendation Engine', 30),
(904, 'UI/UX Redesign', 40);

-- UPDATE EXAMPLES: 
UPDATE DEPARTMENT 
SET dept_name = 'DevOps & Infrastructure'
WHERE dept_name = 'Operations';

-- Moving Ananya to Data Science
UPDATE EMPLOYEE 
SET dept_id = 30
WHERE emp_name = 'Ananya Chatterjee';

-- DELETE EXAMPLES: 
INSERT INTO EMPLOYEE (emp_id, emp_name, dept_id) VALUES
(999, 'Rohan Das', 40);

DELETE FROM EMPLOYEE 
WHERE emp_id = 999; 

-- ROLES & PERMISSIONS: 
CREATE ROLE analyst_role;
CREATE USER analyst_user WITH PASSWORD 'secure_pass_2026';

GRANT analyst_role TO analyst_user;
GRANT SELECT ON DEPARTMENT, EMPLOYEE, PROJECT TO analyst_role;

-- Revoking permissions: 
REVOKE CREATE ON SCHEMA public FROM analyst_role;

-- SCHEMA MODIFICATION: 
ALTER TABLE PROJECT 
RENAME COLUMN "proj_name" TO "project_title";

DROP TABLE IF EXISTS TEST_TABLE;

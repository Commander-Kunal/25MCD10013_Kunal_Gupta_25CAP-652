create table schema_audit(
schema_id serial primary key,
schema_name varchar(50),
violation_count int
);

--Insert records into the table.
insert into schema_audit(schema_name, violation_count) values
('UserDB', 0),
('FinanceDB', 2),
('SalesDB', 5),
('AuditDB', 9),
('BackupDB', 15);

select*from schema_audit;

--Classifying Data Using CASE Expression
select schema_name, violation_count,
case
 when violation_count = 0 then 'No Violation'
 when violation_count between 1 and 3 then 'Minor Violation'
 when violation_count between 4 and 7 then 'Moderate Violation'
 else 'Critical Violation'
end as violation_status
from schema_audit;

--Applying CASE Logic in Data Updates
alter table schema_audit add approval_status varchar(30);

update schema_audit
set approval_status =
case
 when violation_count = 0 then 'Approved'
 when violation_count between 1 and 5 then 'Needs Review'
 else 'Rejected'
end;


--Implementing IF–ELSE Logic Using PL/pgSQL
do $$
declare
 v_count int := 6;
begin
 if v_count = 0 then
  raise notice 'System is clean. No violations.';
 elseif v_count <= 5 then
  raise notice 'System has minor issues. Review required.';
 else
  raise notice 'System is critical. Immediate action required.';
 end if;
end $$;


--Real-World Classification Scenario (Grading System)
-- grade system example

create table students(
student_name varchar(30),
marks int
);

--Insert Student Data
insert into students values
('Amit',85), ('Neha',72), ('Riya',64), ('Karan',45), ('Rohit',32);

select student_name, marks,
case
 when marks >= 80 then 'A Grade'
 when marks >= 60 then 'B Grade'
 when marks >= 40 then 'C Grade'
 else 'Fail'
end as grade
from students;

select * from students
--Using CASE for Custom Sorting
select schema_name, violation_count, approval_status
from schema_audit
order by
case
 when violation_count = 0 then 1
 when violation_count between 1 and 3 then 2
 when violation_count between 4 and 7 then 3
 else 4
end;

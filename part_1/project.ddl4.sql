drop view S16_person_view ;
drop view S16_employee_view ;
drop view S16_project_employee_view ;
drop view S16_manager_view ;
drop view S16_interim_manager_view ;
drop view S16_president_view ;
drop view S16_previous_employee_view ;

drop view S16_project_view ;
drop view S16_previous_project_view ;
drop view S16_current_project_view ;

create view S16_person_view as
SELECT
	person_id,
	first_name,
	last_name,
	home_address,
	zipcode,
	home_phone,
	us_citizen,
    S16_Person_person_id1,
	type
FROM S16_Person where type = 'Person' ;

create or replace TRIGGER S16_person_trigger
	INSTEAD OF insert ON S16_person_view
	FOR EACH ROW
BEGIN
	insert into S16_Person(
		person_id,
		first_name,
		last_name,
		home_address,
		zipcode,
		home_phone,
		us_citizen,
        S16_Person_person_id1,
		type)
		 VALUES (
		 :NEW.person_id,
		 :NEW.first_name,
		 :NEW.last_name,
		 :NEW.home_address,
		 :NEW.zipcode,
		 :NEW.home_phone,
		 :NEW.us_citizen,
         :NEW.S16_Person_person_id1,
		 'Person') ;
END;
/

create view S16_employee_view as
SELECT
	person_id,
	first_name,
	last_name,
	home_address,
	zipcode,
	home_phone,
	us_citizen,
    S16_Person_person_id1,
	type,
	employee_id,
	salary,
	salary_exception,
	S16_Person_person_id
FROM S16_Person where type = 'Employee' ;

create or replace TRIGGER S16_employee_trigger
	INSTEAD OF insert ON S16_employee_view
	FOR EACH ROW
BEGIN
	insert into S16_Person(
		person_id,
		first_name,
		last_name,
		home_address,
		zipcode,
		home_phone,
		us_citizen,
        S16_Person_person_id1,
		type,
		employee_id,
		salary,
		salary_exception,
		S16_Person_person_id)
		 VALUES (
		 :NEW.person_id,
		 :NEW.first_name,
		 :NEW.last_name,
		 :NEW.home_address,
		 :NEW.zipcode,
		 :NEW.home_phone,
		 :NEW.us_citizen,
         :NEW.S16_Person_person_id1,
		 'Employee',
		 :NEW.employee_id,
		 :NEW.salary,
		 :NEW.salary_exception,
		 :NEW.S16_Person_person_id) ;
END;
/

create view S16_project_employee_view as
SELECT
	person_id,
	first_name,
	last_name,
	home_address,
	zipcode,
	home_phone,
	us_citizen,
    S16_Person_person_id1,
	type,
	employee_id,
	salary,
	salary_exception,
	S16_Person_person_id
FROM S16_Person where type = 'Project_Employee' ;

create or replace TRIGGER S16_project_employee_trigger
	INSTEAD OF insert ON S16_project_employee_view
	FOR EACH ROW
BEGIN
	insert into S16_Person(
		person_id,
		first_name,
		last_name,
		home_address,
		zipcode,
		home_phone,
		us_citizen,
        S16_Person_person_id1,
		type,
		employee_id,
		salary,
		salary_exception,
		S16_Person_person_id)
		 VALUES (
		 :NEW.person_id,
		 :NEW.first_name,
		 :NEW.last_name,
		 :NEW.home_address,
		 :NEW.zipcode,
		 :NEW.home_phone,
		 :NEW.us_citizen,
         :NEW.S16_Person_person_id1,
		 'Project_Employee',
		 :NEW.employee_id,
		 :NEW.salary,
		 :NEW.salary_exception,
		 :NEW.S16_Person_person_id) ;
END;
/

create view S16_manager_view as
SELECT
	person_id,
	first_name,
	last_name,
	home_address,
	zipcode,
	home_phone,
	us_citizen,
    S16_Person_person_id1,
	type,
	employee_id,
	salary,
	salary_exception,
	bonus,
	S16_Department_dept_no,
	S16_Person_person_id
FROM S16_Person where type ='Manager' ;

create or replace TRIGGER S16_manager_trigger
	INSTEAD OF insert ON S16_manager_view
	FOR EACH ROW
BEGIN
	insert into S16_Person(
		person_id,
		first_name,
		last_name,
		home_address,
		zipcode,
		home_phone,
		us_citizen,
        S16_Person_person_id1,
		type,
		employee_id,
		salary,
		salary_exception,
		bonus,
		S16_Department_dept_no,
        S16_Person_person_id)
		 VALUES (
		 :NEW.person_id,
		 :NEW.first_name,
		 :NEW.last_name,
		 :NEW.home_address,
		 :NEW.zipcode,
		 :NEW.home_phone,
		 :NEW.us_citizen,
         :NEW.S16_Person_person_id1,
		 'Manager',
		 :NEW.employee_id,
		 :NEW.salary,
		 :NEW.salary_exception,
		 :NEW.bonus,
		 :NEW.S16_Department_dept_no,
         :NEW.S16_Person_person_id) ;
END;
/

create view S16_interim_manager_view as
SELECT
	person_id,
	first_name,
	last_name,
	home_address,
	zipcode,
	home_phone,
	us_citizen,
    S16_Person_person_id1,
	type,
	employee_id,
	salary,
	salary_exception,
	bonus,
	S16_Department_dept_no,
	S16_Person_person_id
FROM S16_Person where type ='Interim_Manager' ;

create or replace TRIGGER S16_interim_manager_trigger
	INSTEAD OF insert ON S16_interim_manager_view
	FOR EACH ROW
BEGIN
	insert into S16_Person(
		person_id,
		first_name,
		last_name,
		home_address,
		zipcode,
		home_phone,
		us_citizen,
        S16_Person_person_id1,
		type,
		employee_id,
		salary,
		salary_exception,
		bonus,
		S16_Department_dept_no,
		S16_Person_person_id)
		 VALUES (
		 :NEW.person_id,
		 :NEW.first_name,
		 :NEW.last_name,
		 :NEW.home_address,
		 :NEW.zipcode,
		 :NEW.home_phone,
		 :NEW.us_citizen,
         :NEW.S16_Person_person_id1,
		 'Interim_Manager',
		 :NEW.employee_id,
		 :NEW.salary,
		 :NEW.salary_exception,
		 :NEW.bonus,
		 :NEW.S16_Department_dept_no,
		 :NEW.S16_Person_person_id) ;
END;
/

create view S16_president_view as
SELECT
	person_id,
	first_name,
	last_name,
	home_address,
	zipcode,
	home_phone,
	us_citizen,
    S16_Person_person_id1,
	type,
	employee_id,
	salary,
	salary_exception,
	bonus,
	S16_Department_dept_no
FROM S16_Person where type ='President' ;

create or replace TRIGGER S16_president_trigger
	INSTEAD OF insert ON S16_president_view
	FOR EACH ROW
BEGIN
	insert into S16_Person(
		person_id,
		first_name,
		last_name,
		home_address,
		zipcode,
		home_phone,
		us_citizen,
        S16_Person_person_id1,
		type,
		employee_id,
		salary,
		salary_exception,
		bonus,
		S16_Department_dept_no)
		 VALUES (
		 :NEW.person_id,
		 :NEW.first_name,
		 :NEW.last_name,
		 :NEW.home_address,
		 :NEW.zipcode,
		 :NEW.home_phone,
		 :NEW.us_citizen,
         :NEW.S16_Person_person_id1,
		 'President',
		 :NEW.employee_id,
		 :NEW.salary,
		 :NEW.salary_exception,
		 :NEW.bonus,
		 :NEW.S16_Department_dept_no) ;
END;
/

create view S16_previous_employee_view as
SELECT
	person_id,
	first_name,
	last_name,
	home_address,
	zipcode,
	home_phone,
	us_citizen,
    S16_Person_person_id1,
	type,
	is_fired,
	old_salary
FROM S16_Person where type='Previous_Employee' ;

create or replace TRIGGER S16_previous_employee_trigger
	INSTEAD OF insert ON S16_previous_employee_view
	FOR EACH ROW
BEGIN
	insert into S16_Person(
		person_id,
		first_name,
		last_name,
		home_address,
		zipcode,
		home_phone,
		us_citizen,
        S16_Person_person_id1,
		type,
		is_fired,
		old_salary)
		 VALUES (
		 :NEW.person_id,
		 :NEW.first_name,
		 :NEW.last_name,
		 :NEW.home_address,
		 :NEW.zipcode,
		 :NEW.home_phone,
		 :NEW.us_citizen,
         :NEW.S16_Person_person_id1,
		 'Previous_Employee',
		 :NEW.is_fired,
		 :NEW.old_salary) ;
END;
/

create view S16_project_view as
SELECT
	project_no,
	project_title,
	S16_Project_project_no,
	S16_Person_person_id,
	S16_Department_dept_no,
	type
FROM S16_Project where type='Project' ;

create or replace TRIGGER S16_project_trigger
	INSTEAD OF insert ON S16_project_view
	FOR EACH ROW
BEGIN
	insert into S16_Project(
		project_no,
		project_title,
		S16_Project_project_no,
		S16_Person_person_id,
		S16_Department_dept_no,
		type)
		 VALUES (
		 :NEW.project_no,
		 :NEW.project_title,
		 :NEW.S16_Project_project_no,
		 :NEW.S16_Person_person_id,
		 :NEW.S16_Department_dept_no,
		 'Project') ;
END;
/

create view S16_previous_project_view as
SELECT
	project_no,
	project_title,
	S16_Project_project_no,
	S16_Person_person_id,
	S16_Department_dept_no,
	type,
	end_date,
	est_person_hours
FROM S16_Project where type='Previous_Project' ;

create or replace TRIGGER S16_previous_project_trigger
	INSTEAD OF insert ON S16_previous_project_view
	FOR EACH ROW
BEGIN
	insert into S16_Project(
		project_no,
		project_title,
		S16_Project_project_no,
		S16_Person_person_id,
		S16_Department_dept_no,
		type,
		end_date,
		est_person_hours)
		 VALUES (
		 :NEW.project_no,
		 :NEW.project_title,
		 :NEW.S16_Project_project_no,
		 :NEW.S16_Person_person_id,
		 :NEW.S16_Department_dept_no,
		 'Previous_Project',
		 :NEW.end_date,
		 :NEW.est_person_hours) ;
END;
/

create view S16_current_project_view as
SELECT
	project_no,
	project_title,
	S16_Project_project_no,
	S16_Person_person_id,
	S16_Department_dept_no,
	type,
	project_active
FROM S16_Project where type='Current_Project' ;

create or replace TRIGGER S16_current_project_trigger
	INSTEAD OF insert ON S16_current_project_view
	FOR EACH ROW
BEGIN
	insert into S16_Project(
		project_no,
		project_title,
		S16_Project_project_no,
		S16_Person_person_id,
		S16_Department_dept_no,
		type,
		project_active)
		 VALUES (
		 :NEW.project_no,
		 :NEW.project_title,
		 :NEW.S16_Project_project_no,
		 :NEW.S16_Person_person_id,
		 :NEW.S16_Department_dept_no,
		 'Current_Project',
		 :NEW.project_active) ;
END;
/












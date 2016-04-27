--DML file for Final Project
--CS347 Data Management with Dr. Cannata
--Derek Cornelius and Mario Solis

--Starting code provided here: http://www.cs.utexas.edu/~cannata/dbms/Project/Project%20Requirements%20and%20Suggestions.html

-- Truncate each of the sample data tables using the following statement:
truncate table S16_Person;
truncate table S16_Project;
truncate table S16_Department;
truncate table S16_Par_Child;
truncate table S16_Proj_Emp;


-- Disable the PK triggers on the sample data tables using the following syntax:

alter trigger S16_Department_PK_trig disable;
alter trigger S16_Par_Child_PK_trig disable;
alter trigger S16_Person_PK_trig disable;
alter trigger S16_Proj_Emp_PK_trig disable;
alter trigger S16_Project_PK_trig disable;

alter trigger S16_Department_AUD_trig disable;
alter trigger S16_Par_Child_AUD_trig disable;
alter trigger S16_Person_AUD_trig disable;
alter trigger S16_Proj_Emp_AUD_trig disable;
alter trigger S16_Project_AUD_trig disable;

alter trigger S16_person_trigger disable;
alter trigger S16_employee_trigger disable;
alter trigger S16_project_employee_trigger disable;
alter trigger S16_manager_trigger disable;
alter trigger S16_interim_manager_trigger disable;
alter trigger S16_president_trigger disable;
alter trigger S16_previous_employee_trigger disable;
alter trigger S16_previous_project_trigger disable;
alter trigger S16_current_project_trigger disable;

-- If you have circular Foreign Key dependencies, disable enough of the Foreign Key Constraints to break the cycle using the following syntax:

alter table S16_Person disable constraint "S16_PERSON_PK" CASCADE;
alter table S16_Person disable constraint "S16_PERSON_S16_DEPARTMENT_FK";
alter table S16_Person disable constraint "S16_PERSON_S16_PERSON_FK";
alter table S16_Person disable constraint "S16_PERSON_S16_PERSON_FKV1";
alter table S16_Project disable constraint "S16_PROJECT_PK" CASCADE;
alter table S16_Project disable constraint "S16_PROJECT_S16_DEPARTMENT_FK";
alter table S16_Project disable constraint "S16_PROJECT_S16_PROJECT_FK";
alter table S16_Project disable constraint "S16_PROJECT_S16_PERSON_FK";
alter table S16_Department disable constraint "S16_DEPARTMENT_PK";
alter table S16_Par_Child disable constraint "S16_PAR_CHILD_PK";
alter table S16_Par_Child disable constraint "S16_PAR_CHILD_S16_PERSON_FK";
alter table S16_Par_Child disable constraint "S16_PAR_CHILD_S16_PERSON_FKV1";
alter table S16_Proj_Emp disable constraint "S16_PROJ_EMP_PK";
alter table S16_Proj_Emp disable constraint "S16_PROJ_EMP_S16_PERSON_FK";
alter table S16_Proj_Emp disable constraint "S16_PROJ_EMP_S16_PROJECT_FK";

-- Put all of the sample data INSERT statements here. Be sure to use PK and FK values that
-- are < 100 so that they won't be repeated by the PK triggers when they are re-enabled.

insert into S16_Person (person_id, first_name, last_name, home_address, zipcode, home_phone, us_citizen, S16_Person_person_id1, type)
	VALUES (1,	'Joe',		'Schmoe',		'2222 Oyster Ave',	95921,	4235553069,	1,	2,	'Person');
insert into S16_Person (person_id, first_name, last_name, home_address, zipcode, home_phone, us_citizen, S16_Person_person_id1, type, employee_id, salary, salary_exception, S16_Person_person_id)
	VALUES (2,	'Bobby',	'Schmoe',		'809 Leander Dr',	78765,	5125550395,	1,	1,	'Employee',				2,	60000,	0,	4);
insert into S16_Person(person_id, first_name, last_name, home_address, zipcode, home_phone, us_citizen, S16_Person_person_id1, type, employee_id, salary, salary_exception, S16_Person_person_id)
	VALUES (3,	'Wang',		'Shanyuan',		'40 Elias Circle',	20122,	9095553251,	0,	4,	'Project_Employee',		3,	83000,	0,	5);
insert into S16_Person(person_id, first_name, last_name, home_address, zipcode, home_phone, us_citizen, S16_Person_person_id1, type, employee_id, salary, salary_exception, bonus, S16_Department_dept_no, S16_Person_person_id)
	VALUES (4,	'Charlie',	'Edison',		'7183 Martin St',	83383,	4115553485,	0,	3,	'Manager',				4,	120000,	1,	3000,	1,	6);
insert into S16_Person(person_id, first_name, last_name, home_address, zipcode, home_phone, us_citizen, S16_Person_person_id1, type, employee_id, salary, salary_exception, bonus, S16_Department_dept_no, S16_Person_person_id)
	VALUES (5,	'Olaf',		'Perkinson',	'200 Klavien St',	243,	4113332,	0,	6,	'Interim_Manager',		5,	90000,	0,	200,	2,	4);
insert into S16_Person(person_id, first_name, last_name, home_address, zipcode, home_phone, us_citizen, S16_Person_person_id1, type, employee_id, salary, salary_exception, bonus, S16_Department_dept_no)
	VALUES (6, 'Lizzy',		'Perkinson',	'3020 Grand Ave',	24434,	6783324404,	1,	5,	'President',			6,	300000,	1,	10000,	1);
insert into S16_Person(person_id, first_name, last_name, home_address, zipcode, home_phone, us_citizen, S16_Person_person_id1, type, is_fired, old_salary)
	VALUES (7, 'Burton',	'Jenkins',		'4 Shillack Ln',	23322,	4003321599,	1,	8,	'Previous_Employee',	1,	50000);
insert into S16_Person (person_id, first_name, last_name, home_address, zipcode, home_phone, us_citizen, S16_Person_person_id1, type)
	VALUES (8, 'Sally',		'Jenkins',		'4 Shillack Ln',	23322,	4003321599,	1,	7,	'Person');
	
insert into S16_Project(project_no, project_title, S16_Person_person_id, S16_Department_dept_no, type)
	VALUES (1,	'Project Oasis',		4,	1,	'Project');
insert into S16_Project(project_no, project_title, S16_Person_person_id, S16_Department_dept_no, type, est_person_hours)
	VALUES (2, 'New Jersey Project',	6,	1,	'Previous_Project',	400);
insert into S16_Project(project_no, project_title, S16_Project_project_no, S16_Person_person_id, S16_Department_dept_no, type, project_active)
	VALUES (3, 'Judgement Day',			1,	5,	2,	'Current_Project',	1);
	
insert into S16_Department(dept_no, dept_name)
	VALUES (1, 'Marketing');
insert into S16_Department(dept_no, dept_name)
	VALUES (2, 'Sales');
	
insert into S16_Par_Child(parent_child_id, S16_Person_person_id1, S16_Person_person_id)
	VALUES(1, 5, 2);
insert into S16_Par_Child(parent_child_id, S16_Person_person_id1, S16_Person_person_id)
	VALUES(2, 6, 2);
	
insert into S16_Proj_Emp(cpe_id, S16_Project_project_no, S16_Person_person_id)
	VALUES (1, 1, 3);
	
-- end of insert statements

-- Enable the PK triggers on the sample data tables using the following statement:

alter trigger S16_Department_PK_trig enable;
alter trigger S16_Par_Child_PK_trig enable;
alter trigger S16_Person_PK_trig enable;
alter trigger S16_Proj_Emp_PK_trig enable;
alter trigger S16_Project_PK_trig enable;

alter trigger S16_Department_AUD_trig enable;
alter trigger S16_Par_Child_AUD_trig enable;
alter trigger S16_Person_AUD_trig enable;
alter trigger S16_Proj_Emp_AUD_trig enable;
alter trigger S16_Project_AUD_trig enable;

alter trigger S16_person_trigger enable;
alter trigger S16_employee_trigger enable;
alter trigger S16_project_employee_trigger enable;
alter trigger S16_manager_trigger enable;
alter trigger S16_interim_manager_trigger enable;
alter trigger S16_president_trigger enable;
alter trigger S16_previous_employee_trigger enable;
alter trigger S16_previous_project_trigger enable;
alter trigger S16_current_project_trigger enable;

-- Enable all of the Foreign Key Constraints that you disabled earlier using the following syntax:

--alter table emp enable constraint "EMP_DEPTNO_FK";
alter table S16_Person enable constraint "S16_PERSON_PK";
alter table S16_Project enable constraint "S16_PROJECT_PK";
alter table S16_Department enable constraint "S16_DEPARTMENT_PK";
alter table S16_Proj_Emp enable constraint "S16_PROJ_EMP_PK";

alter table S16_Person enable constraint "S16_PERSON_S16_DEPARTMENT_FK";
alter table S16_Person enable constraint "S16_PERSON_S16_PERSON_FK";
alter table S16_Person enable constraint "S16_PERSON_S16_PERSON_FKV1";
alter table S16_Project enable constraint "S16_PROJECT_S16_DEPARTMENT_FK";
alter table S16_Project enable constraint "S16_PROJECT_S16_PROJECT_FK";
alter table S16_Project enable constraint "S16_PROJECT_S16_PERSON_FK";
alter table S16_Par_Child enable constraint "S16_PAR_CHILD_PK";
alter table S16_Par_Child enable constraint "S16_PAR_CHILD_S16_PERSON_FK";
alter table S16_Par_Child enable constraint "S16_PAR_CHILD_S16_PERSON_FKV1";
alter table S16_Proj_Emp enable constraint "S16_PROJ_EMP_S16_PERSON_FK";
alter table S16_Proj_Emp enable constraint "S16_PROJ_EMP_S16_PROJECT_FK";















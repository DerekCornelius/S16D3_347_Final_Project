DROP SEQUENCE S16_Department_seq ; 
create sequence S16_Department_seq 
start with 100 
increment by 1 
nomaxvalue 
;
DROP TRIGGER S16_Department_PK_trig 
; 

create or replace trigger S16_Department_PK_trig 
before insert on S16_Department
for each row 
begin 
select S16_Department_seq.nextval into :new.dept_no from dual; 
end; 
/

DROP SEQUENCE S16_Par_Child_seq ; 
create sequence S16_Par_Child_seq 
start with 100 
increment by 1 
nomaxvalue 
;
DROP TRIGGER S16_Par_Child_PK_trig 
; 

create or replace trigger S16_Par_Child_PK_trig 
before insert on S16_Par_Child
for each row 
begin 
select S16_Par_Child_seq.nextval into :new.parent_child_id from dual; 
end; 
/

DROP SEQUENCE S16_Person_seq ; 
create sequence S16_Person_seq 
start with 100 
increment by 1 
nomaxvalue 
;
DROP TRIGGER S16_Person_PK_trig 
; 

create or replace trigger S16_Person_PK_trig 
before insert on S16_Person
for each row 
begin 
select S16_Person_seq.nextval into :new.person_id from dual; 
end; 
/

DROP SEQUENCE S16_Proj_Emp_seq ; 
create sequence S16_Proj_Emp_seq 
start with 100 
increment by 1 
nomaxvalue 
;
DROP TRIGGER S16_Proj_Emp_PK_trig 
; 

create or replace trigger S16_Proj_Emp_PK_trig 
before insert on S16_Proj_Emp
for each row 
begin 
select S16_Proj_Emp_seq.nextval into :new.cpe_id from dual; 
end; 
/

DROP SEQUENCE S16_Project_seq ; 
create sequence S16_Project_seq 
start with 100 
increment by 1 
nomaxvalue 
;
DROP TRIGGER S16_Project_PK_trig 
; 

create or replace trigger S16_Project_PK_trig 
before insert on S16_Project
for each row 
begin 
select S16_Project_seq.nextval into :new.project_no from dual; 
end; 
/

DROP INDEX S16_Person_person_id_FK_0 ;
CREATE INDEX S16_Person_person_id_FK_0 ON S16_Par_Child(S16_Person_person_id) ;
DROP INDEX S16_Person_person_id1_FK_1 ;
CREATE INDEX S16_Person_person_id1_FK_1 ON S16_Par_Child(S16_Person_person_id1) ;
DROP INDEX S16_Department_dept_no_FK_2 ;
CREATE INDEX S16_Department_dept_no_FK_2 ON S16_Person(S16_Department_dept_no) ;
DROP INDEX S16_Person_person_id_FK_3 ;
CREATE INDEX S16_Person_person_id_FK_3 ON S16_Person(S16_Person_person_id) ;
DROP INDEX S16_Person_person_id1_FK_4 ;
CREATE INDEX S16_Person_person_id1_FK_4 ON S16_Person(S16_Person_person_id1) ;
DROP INDEX S16_Person_person_id_FK_5 ;
CREATE INDEX S16_Person_person_id_FK_5 ON S16_Proj_Emp(S16_Person_person_id) ;
DROP INDEX S16_Project_project_no_FK_6 ;
CREATE INDEX S16_Project_project_no_FK_6 ON S16_Proj_Emp(S16_Project_project_no) ;
DROP INDEX S16_Department_dept_no_FK_7 ;
CREATE INDEX S16_Department_dept_no_FK_7 ON S16_Project(S16_Department_dept_no) ;
DROP INDEX S16_Person_person_id_FK_8 ;
CREATE INDEX S16_Person_person_id_FK_8 ON S16_Project(S16_Person_person_id) ;
DROP INDEX S16_Project_project_no_FK_9 ;
CREATE INDEX S16_Project_project_no_FK_9 ON S16_Project(S16_Project_project_no) ;

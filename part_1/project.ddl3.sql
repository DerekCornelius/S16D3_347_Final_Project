DROP SEQUENCE S16_Department_seq ; 
create sequence S16_Department_seq 
start with 100 
increment by 1 
nomaxvalue 
;

create or replace trigger S16_Department_PK_trig 
before insert on S16_Department
for each row 
begin 
select S16_Department_seq.nextval into :new.dept_no from dual; 
end; 
/
alter table S16_Department add created date ; 
alter table S16_Department add created_by VARCHAR2 (255) ; 
alter table S16_Department add row_version_number integer ; 
alter table S16_Department add updated date ; 
alter table S16_Department add updated_by VARCHAR2 (255) ; 
/
create or replace trigger S16_Department_AUD_trig 
before insert or update on S16_Department 
for each row 
begin 
  if inserting then 
    :new.created := localtimestamp; 
    :new.created_by := nvl(wwv_flow.g_user,user); 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
    :new.row_version_number := 1; 
  elsif updating then 
    :new.row_version_number := nvl(:old.row_version_number,1) + 1; 
  end if; 
  if inserting or updating then 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
  end if; 
end; 
/

DROP SEQUENCE S16_Par_Child_seq ; 
create sequence S16_Par_Child_seq 
start with 100 
increment by 1 
nomaxvalue 
;

create or replace trigger S16_Par_Child_PK_trig 
before insert on S16_Par_Child
for each row 
begin 
select S16_Par_Child_seq.nextval into :new.parent_child_id from dual; 
end; 
/
alter table S16_Par_Child add created date ; 
alter table S16_Par_Child add created_by VARCHAR2 (255) ; 
alter table S16_Par_Child add row_version_number integer ; 
alter table S16_Par_Child add updated date ; 
alter table S16_Par_Child add updated_by VARCHAR2 (255) ; 
/
create or replace trigger S16_Par_Child_AUD_trig 
before insert or update on S16_Par_Child 
for each row 
begin 
  if inserting then 
    :new.created := localtimestamp; 
    :new.created_by := nvl(wwv_flow.g_user,user); 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
    :new.row_version_number := 1; 
  elsif updating then 
    :new.row_version_number := nvl(:old.row_version_number,1) + 1; 
  end if; 
  if inserting or updating then 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
  end if; 
end; 
/

DROP SEQUENCE S16_Person_seq ; 
create sequence S16_Person_seq 
start with 100 
increment by 1 
nomaxvalue 
;

create or replace trigger S16_Person_PK_trig 
before insert on S16_Person
for each row 
begin 
select S16_Person_seq.nextval into :new.person_id from dual; 
end; 
/
alter table S16_Person add created date ; 
alter table S16_Person add created_by VARCHAR2 (255) ; 
alter table S16_Person add row_version_number integer ; 
alter table S16_Person add updated date ; 
alter table S16_Person add updated_by VARCHAR2 (255) ; 
/
create or replace trigger S16_Person_AUD_trig 
before insert or update on S16_Person 
for each row 
begin 
  if inserting then 
    :new.created := localtimestamp; 
    :new.created_by := nvl(wwv_flow.g_user,user); 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
    :new.row_version_number := 1; 
  elsif updating then 
    :new.row_version_number := nvl(:old.row_version_number,1) + 1; 
  end if; 
  if inserting or updating then 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
  end if; 
end; 
/

DROP SEQUENCE S16_Proj_Emp_seq ; 
create sequence S16_Proj_Emp_seq 
start with 100 
increment by 1 
nomaxvalue 
;

create or replace trigger S16_Proj_Emp_PK_trig 
before insert on S16_Proj_Emp
for each row 
begin 
select S16_Proj_Emp_seq.nextval into :new.cpe_id from dual; 
end; 
/
alter table S16_Proj_Emp add created date ; 
alter table S16_Proj_Emp add created_by VARCHAR2 (255) ; 
alter table S16_Proj_Emp add row_version_number integer ; 
alter table S16_Proj_Emp add updated date ; 
alter table S16_Proj_Emp add updated_by VARCHAR2 (255) ; 
/
create or replace trigger S16_Proj_Emp_AUD_trig 
before insert or update on S16_Proj_Emp 
for each row 
begin 
  if inserting then 
    :new.created := localtimestamp; 
    :new.created_by := nvl(wwv_flow.g_user,user); 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
    :new.row_version_number := 1; 
  elsif updating then 
    :new.row_version_number := nvl(:old.row_version_number,1) + 1; 
  end if; 
  if inserting or updating then 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
  end if; 
end; 
/

DROP SEQUENCE S16_Project_seq ; 
create sequence S16_Project_seq 
start with 100 
increment by 1 
nomaxvalue 
;

create or replace trigger S16_Project_PK_trig 
before insert on S16_Project
for each row 
begin 
select S16_Project_seq.nextval into :new.project_no from dual; 
end; 
/
alter table S16_Project add created date ; 
alter table S16_Project add created_by VARCHAR2 (255) ; 
alter table S16_Project add row_version_number integer ; 
alter table S16_Project add updated date ; 
alter table S16_Project add updated_by VARCHAR2 (255) ; 
/
create or replace trigger S16_Project_AUD_trig 
before insert or update on S16_Project 
for each row 
begin 
  if inserting then 
    :new.created := localtimestamp; 
    :new.created_by := nvl(wwv_flow.g_user,user); 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
    :new.row_version_number := 1; 
  elsif updating then 
    :new.row_version_number := nvl(:old.row_version_number,1) + 1; 
  end if; 
  if inserting or updating then 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
  end if; 
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

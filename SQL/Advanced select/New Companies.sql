/*
CREATE TABLE rf.company
(
  company_code  VARCHAR2(50),
  founder       VARCHAR2(50)
)
TABLESPACE QUORUM_INDEX
STORAGE    (
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
NOMONITORING;
/

CREATE TABLE rf.Lead_Manager
(
  lead_manager_code  VARCHAR2(50),
  company_code       VARCHAR2(50)
)
TABLESPACE QUORUM_INDEX
STORAGE    (
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
NOMONITORING;
/

CREATE TABLE rf.Senior_Manager
(
  senior_manager_code  VARCHAR2(50),
  lead_manager_code  VARCHAR2(50),
  company_code       VARCHAR2(50)
)
TABLESPACE QUORUM_INDEX
STORAGE    (
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
NOMONITORING;
/

CREATE TABLE rf.Manager
(
  manager_code  VARCHAR2(50),
  senior_manager_code  VARCHAR2(50),
  lead_manager_code  VARCHAR2(50),
  company_code       VARCHAR2(50)
)
TABLESPACE QUORUM_INDEX
STORAGE    (
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
NOMONITORING;
/

CREATE TABLE rf.Employee
(
  employee_code  VARCHAR2(50),
  manager_code  VARCHAR2(50),
  senior_manager_code  VARCHAR2(50),
  lead_manager_code  VARCHAR2(50),
  company_code       VARCHAR2(50)
)
TABLESPACE QUORUM_INDEX
STORAGE    (
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
NOMONITORING;
/

insert into rf.company (company_code,founder) values ('C1','Monika');
insert into rf.company (company_code,founder) values ('C2','Samantha');

insert into rf.Lead_Manager (lead_manager_code,company_code) values ('LM1','C1');
insert into rf.Lead_Manager (lead_manager_code,company_code) values ('LM2','C2');

insert into rf.Senior_Manager (senior_manager_code,lead_manager_code,company_code) values ('SM1','LM1','C1');
insert into rf.Senior_Manager (senior_manager_code,lead_manager_code,company_code) values ('SM2','LM1','C1');
insert into rf.Senior_Manager (senior_manager_code,lead_manager_code,company_code) values ('SM3','LM2','C2');

insert into rf.Manager(manager_code,senior_manager_code,lead_manager_code,company_code) values('M1','SM1','LM1','C1');
insert into rf.Manager(manager_code,senior_manager_code,lead_manager_code,company_code) values('M2','SM3','LM2','C2');
insert into rf.Manager(manager_code,senior_manager_code,lead_manager_code,company_code) values('M3','SM3','LM2','C2');

insert into rf.Employee(employee_code,manager_code,senior_manager_code,lead_manager_code,company_code) values ('E1','M1','SM1','LM1','C1');
insert into rf.Employee(employee_code,manager_code,senior_manager_code,lead_manager_code,company_code) values ('E2','M1','SM1','LM1','C1');
insert into rf.Employee(employee_code,manager_code,senior_manager_code,lead_manager_code,company_code) values ('E3','M2','SM3','LM2','C2');
insert into rf.Employee(employee_code,manager_code,senior_manager_code,lead_manager_code,company_code) values ('E4','M3','SM3','LM2','C2');

commit;
*/

select
  c.COMPANY_CODE
  , c.FOUNDER
  , count(distinct e.lead_manager_code) 
  , count(distinct e.senior_manager_code) 
  , count(distinct e.manager_code)
  , count(distinct e.employee_code)
from
  RF.COMPANY c, rf.employee e
where
  e.company_code = c.company_code
group by 
  c.company_code, c.founder  
order by  
  c.COMPANY_CODE
;

/*
drop TABLE rf.company;
drop TABLE rf.Lead_Manager;
drop TABLE rf.Senior_Manager;
drop TABLE rf.Manager;
drop TABLE rf.Employee;
/
*/
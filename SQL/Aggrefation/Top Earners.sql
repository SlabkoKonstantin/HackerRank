--drop table EMPLOYEE;

CREATE TABLE EMPLOYEE
(
  employee_id  INTEGER,
  name         VARCHAR2(50),
  months       INTEGER,
  salary       INTEGER
)
STORAGE    (
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
NOMONITORING;
/

INSERT into Employee (employee_id, name, months, salary) values (12228,'Rose',15,1968);
INSERT into Employee (employee_id, name, months, salary) values (33645,'Angela',1,3443);
INSERT into Employee (employee_id, name, months, salary) values (45692,'Frank',17,1608);
INSERT into Employee (employee_id, name, months, salary) values (56118,'Patrick',7,1345);
INSERT into Employee (employee_id, name, months, salary) values (59725,'Lisa',11,2330);
INSERT into Employee (employee_id, name, months, salary) values (74197,'Kimberly',16,4372);
INSERT into Employee (employee_id, name, months, salary) values (78454,'Bonnie',8,1771);
INSERT into Employee (employee_id, name, months, salary) values (83565,'Michael',6,2017);
INSERT into Employee (employee_id, name, months, salary) values (98607,'Todd',5,3396);
INSERT into Employee (employee_id, name, months, salary) values (99989,'Joe',9,3573);
commit;
/

WITH emp AS
        (SELECT employee_id
            , name
            , months
            , salary
            , months * salary AS earnings
            , max(months * salary) over() as max_earnings
           FROM employee)
SELECT emp.max_earnings, count(emp.max_earnings) as cnt
  FROM emp
  where emp.earnings = emp.max_earnings
  group by emp.max_earnings;
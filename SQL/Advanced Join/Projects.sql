--drop TABLE projects;

CREATE TABLE projects
(
   task_id      NUMBER
  ,start_date   DATE
  ,end_date     DATE
)
;

insert into projects(task_id, start_date, end_date) values (1,to_date('01.10.2015','dd.mm.yyyy'),to_date('02.10.2015','dd.mm.yyyy')); 
insert into projects(task_id, start_date, end_date) values (2,to_date('02.10.2015','dd.mm.yyyy'),to_date('03.10.2015','dd.mm.yyyy'));
insert into projects(task_id, start_date, end_date) values (3,to_date('03.10.2015','dd.mm.yyyy'),to_date('04.10.2015','dd.mm.yyyy'));
insert into projects(task_id, start_date, end_date) values (4,to_date('13.10.2015','dd.mm.yyyy'),to_date('14.10.2015','dd.mm.yyyy'));
insert into projects(task_id, start_date, end_date) values (5,to_date('14.10.2015','dd.mm.yyyy'),to_date('15.10.2015','dd.mm.yyyy'));
insert into projects(task_id, start_date, end_date) values (6,to_date('28.10.2015','dd.mm.yyyy'),to_date('29.10.2015','dd.mm.yyyy'));
insert into projects(task_id, start_date, end_date) values (7,to_date('30.10.2015','dd.mm.yyyy'),to_date('31.10.2015','dd.mm.yyyy'));
commit;

  SELECT f.root, f.end_date
    FROM (    SELECT p.start_date, p.end_date, CONNECT_BY_ROOT p.start_date AS root, LEVEL AS duration, CONNECT_BY_ISLEAF
                FROM projects p
               WHERE CONNECT_BY_ISLEAF = 1
          CONNECT BY PRIOR p.end_date = p.start_date) f
   WHERE f.root NOT IN (SELECT pp.end_date
                          FROM projects pp)
ORDER BY f.duration, f.start_date;
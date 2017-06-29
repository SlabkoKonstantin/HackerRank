CREATE TABLE students
(
   id     NUMBER
  ,name   VARCHAR2(100)
);

CREATE TABLE friends
(
   id          NUMBER
  ,friend_id   NUMBER
);

CREATE TABLE PACKAGES
(
   id       NUMBER
  ,salary   NUMBER
);

insert into students (ID,Name) values (1,'Ashley');
insert into students (ID,Name) values (2,'Samantha');
insert into students (ID,Name) values (3,'Julia');
insert into students (ID,Name) values (4,'Scarlet');

insert into friends (id, friend_id) values(1,2);	
insert into friends (id, friend_id) values(2,3);	
insert into friends (id, friend_id) values(3,4);	
insert into friends (id, friend_id) values(4,1);	


insert into PACKAGES (ID,Salary) values (1,15.20);
insert into PACKAGES (ID,Salary) values (2,10.06);
insert into PACKAGES (ID,Salary) values (3,11.55);
insert into PACKAGES (ID,Salary) values (4,12.12);

commit;

select d.name from (
SELECT f.id
, f.friend_id
, s.NAME
, (select p.salary from packages p where p.ID = s.id) as s_salary
, (select p.salary from packages p where p.ID = f.friend_id) as f_salary
  FROM friends f, students s
 WHERE s.id = f.id
) d
where d.f_salary > d.s_salary
order by d.f_salary;
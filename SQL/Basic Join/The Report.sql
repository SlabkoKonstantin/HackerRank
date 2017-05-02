-- Create table
create table Students
(
  id    number not null,
  name  varchar2(100) not null,
  marks number
);

-- Create table
create table Grades
(
  grade    number not null,
  min_mark number not null,
  max_mark number not null
);

insert into grades (grade, min_mark, max_mark) 
values (1,0,9);
insert into grades (grade, min_mark, max_mark) 
values (2,10,19);
insert into grades (grade, min_mark, max_mark) 
values (3,20,29);
insert into grades (grade, min_mark, max_mark) 
values (4,30,39);
insert into grades (grade, min_mark, max_mark) 
values (5,40,49);
insert into grades (grade, min_mark, max_mark) 
values (6,50,59);
insert into grades (grade, min_mark, max_mark) 
values (7,60,69);
insert into grades (grade, min_mark, max_mark) 
values (8,70,79);
insert into grades (grade, min_mark, max_mark) 
values (9,80,89);
insert into grades (grade, min_mark, max_mark) 
values (10,90,100);

insert into students (id, name, marks) 
values (1,'Julia',88);
insert into students (id, name, marks) 
values (2,'Samantha',68);
insert into students (id, name, marks) 
values (3,'Maria',99);
insert into students (id, name, marks) 
values (4,'Scarlet',78);
insert into students (id, name, marks) 
values (5,'Ashley',63);
insert into students (id, name, marks) 
values (6,'Jane',81);

commit;

select 
  case when dd.grade >= 8 then dd.name else null end as name
  , dd.grade
  , dd.marks
  from (select s.name,
               (select g.grade
                  from grades g
                 where s.marks between g.min_mark and g.max_mark) grade,
               s.marks
          from students s order by s.name) dd
order by grade desc, name;
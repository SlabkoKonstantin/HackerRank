-- Create table
create table Hackers
(
  hacker_id number,
  name      varchar2(100)
)
tablespace USERS
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
  
-- Create table
create table Difficulty
(
  difficulty_level number,
  score           number
)
tablespace USERS
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

-- Create table
create table Challenges
(
  challenge_id     number,
  hacker_id        number,
  difficulty_level number
)
tablespace USERS
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

-- Create table
create table Submissions
(
  submission_id number,
  hacker_id     number,
  challenge_id  number,
  score         number
)
tablespace USERS
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

insert into hackers (hacker_id, name) values (5580,'Rose');
insert into hackers (hacker_id, name) values (8439,'Angela');
insert into hackers (hacker_id, name) values (27205,'Frank');
insert into hackers (hacker_id, name) values (52243,'Patrick');
insert into hackers (hacker_id, name) values (52348,'Lisa');
insert into hackers (hacker_id, name) values (57645,'Kimberly');
insert into hackers (hacker_id, name) values (77726,'Bonnie');
insert into hackers (hacker_id, name) values (83082,'Michael');
insert into hackers (hacker_id, name) values (86870,'Todd');
insert into hackers (hacker_id, name) values (90411,'Joe');

insert into difficulty (difficulty_level, score) values (1,20);
insert into difficulty (difficulty_level, score) values (2,30);
insert into difficulty (difficulty_level, score) values (3,40);
insert into difficulty (difficulty_level, score) values (4,60);
insert into difficulty (difficulty_level, score) values (5,80);
insert into difficulty (difficulty_level, score) values (6,100);
insert into difficulty (difficulty_level, score) values (7,120);

insert into challenges (challenge_id,hacker_id,difficulty_level) values (4810,77726,4);
insert into challenges (challenge_id,hacker_id,difficulty_level) values (21089,27205,1);
insert into challenges (challenge_id,hacker_id,difficulty_level) values (36566,5580,7);
insert into challenges (challenge_id,hacker_id,difficulty_level) values (66730,52243,6);
insert into challenges (challenge_id,hacker_id,difficulty_level) values (71055,52243,2);

insert into submissions (submission_id,hacker_id,challenge_id,score) values (68628,77726,36566,30);
insert into submissions (submission_id,hacker_id,challenge_id,score) values (65300,77726,21089,10);
insert into submissions (submission_id,hacker_id,challenge_id,score) values (40326,52243,36566,77);
insert into submissions (submission_id,hacker_id,challenge_id,score) values (8941,27205,4810,4);
insert into submissions (submission_id,hacker_id,challenge_id,score) values (83554,77726,66730,30);
insert into submissions (submission_id,hacker_id,challenge_id,score) values (43353,52243,66730,0);
insert into submissions (submission_id,hacker_id,challenge_id,score) values (55385,52348,71055,20);
insert into submissions (submission_id,hacker_id,challenge_id,score) values (39784,27205,71055,23);
insert into submissions (submission_id,hacker_id,challenge_id,score) values (94613,86870,71055,30);
insert into submissions (submission_id,hacker_id,challenge_id,score) values (45788,52348,36566,0);
insert into submissions (submission_id,hacker_id,challenge_id,score) values (93058,86870,36566,30);
insert into submissions (submission_id,hacker_id,challenge_id,score) values (7344,8439,66730,92);
insert into submissions (submission_id,hacker_id,challenge_id,score) values (2721,8439,4810,36);
insert into submissions (submission_id,hacker_id,challenge_id,score) values (523,5580,71055,4);
insert into submissions (submission_id,hacker_id,challenge_id,score) values (49105,52348,66730,0);
insert into submissions (submission_id,hacker_id,challenge_id,score) values (55877,57645,66730,80);
insert into submissions (submission_id,hacker_id,challenge_id,score) values (38355,27205,66730,35);
insert into submissions (submission_id,hacker_id,challenge_id,score) values (3924,8439,36566,80);
insert into submissions (submission_id,hacker_id,challenge_id,score) values (97397,90411,66730,100);
insert into submissions (submission_id,hacker_id,challenge_id,score) values (84162,83082,4810,40);
insert into submissions (submission_id,hacker_id,challenge_id,score) values (97431,90411,71055,30);

commit;  

with dd as (
select
 h.hacker_id
 ,h.name
 ,s.submission_id
-- ,s.hacker_id
 ,s.challenge_id
 ,s.score
 ,c.difficulty_level
 ,d.score
from
  submissions s
  left join challenges c on s.challenge_id = c.challenge_id
  inner join difficulty d on d.difficulty_level = c.difficulty_level
  inner join hackers h on h.hacker_id = s.hacker_id
where
  s.score = d.score -- оставляем тех, кто достиг полного счета  
)
select 
  dd.hacker_id, dd.name
from dd
  group by dd.hacker_id, dd.name
having count(*) > 1  
order by
  count(*) desc, dd.hacker_id
;
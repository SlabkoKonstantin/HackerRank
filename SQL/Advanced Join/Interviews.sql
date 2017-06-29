--drop TABLE contests;
--drop TABLE colleges;
--drop TABLE challenges;
--drop TABLE view_stats;
--drop TABLE submission_stats; 

CREATE TABLE contests
(
   contest_id   INTEGER
  ,hacker_id    INTEGER
  ,name         VARCHAR2(100)
);

CREATE TABLE colleges
(
   college_id   INTEGER
  ,contest_id   INTEGER
);

CREATE TABLE challenges
(
   challenge_id   INTEGER
  ,college_id    INTEGER
);

CREATE TABLE view_stats
(
   challenge_id         INTEGER
  ,total_views          INTEGER
  ,total_unique_views   INTEGER
);

CREATE TABLE submission_stats
(
   challenge_id                 INTEGER
  ,total_submissions            INTEGER
  ,total_accepted_submissions   INTEGER
);

insert into Contests (contest_id, hacker_id, name) values (66406, 17973, 'Rose');
insert into Contests (contest_id, hacker_id, name) values (66556, 79153, 'Angela');
insert into Contests (contest_id, hacker_id, name) values (94828, 80275, 'Frank');

insert into Colleges (college_id, contest_id) values (11219, 66406);
insert into Colleges (college_id, contest_id) values (32473, 66556);
insert into Colleges (college_id, contest_id) values (56685, 94828);

insert into Challenges (challenge_id, college_id) values (18765, 11219);
insert into Challenges (challenge_id, college_id) values (47127, 11219);
insert into Challenges (challenge_id, college_id) values (60292, 32473);
insert into Challenges (challenge_id, college_id) values (72974, 56685);
 
insert into View_Stats (challenge_id, total_views, total_unique_views) values (47127, 26, 19);
insert into View_Stats (challenge_id, total_views, total_unique_views) values (47127, 15, 14);
insert into View_Stats (challenge_id, total_views, total_unique_views) values (18765, 43, 10);
insert into View_Stats (challenge_id, total_views, total_unique_views) values (18765, 72, 13);
insert into View_Stats (challenge_id, total_views, total_unique_views) values (75516, 35, 17);
insert into View_Stats (challenge_id, total_views, total_unique_views) values (60292, 11, 10);
insert into View_Stats (challenge_id, total_views, total_unique_views) values (72974, 41, 15);
insert into View_Stats (challenge_id, total_views, total_unique_views) values (75516, 75, 11);

insert into Submission_Stats (challenge_id, total_submissions, total_accepted_submissions) values (75516, 34, 12);
insert into Submission_Stats (challenge_id, total_submissions, total_accepted_submissions) values (47127, 27, 10);
insert into Submission_Stats (challenge_id, total_submissions, total_accepted_submissions) values (47127, 56, 18);
insert into Submission_Stats (challenge_id, total_submissions, total_accepted_submissions) values (75516, 74, 12);
insert into Submission_Stats (challenge_id, total_submissions, total_accepted_submissions) values (75516, 83, 8);
insert into Submission_Stats (challenge_id, total_submissions, total_accepted_submissions) values (72974, 68, 24);
insert into Submission_Stats (challenge_id, total_submissions, total_accepted_submissions) values (72974, 82, 14);
insert into Submission_Stats (challenge_id, total_submissions, total_accepted_submissions) values (47127, 28, 11);

commit;

with dd as (
SELECT 
  cn.contest_id
  , cn.hacker_id
  , cn.name
  , cl.college_id
  , ch.challenge_id
  , vs.total_views
  , vs.total_unique_views
  , 0 as total_submissions
  , 0 as total_accepted_submissions
FROM 
  contests cn
  , colleges cl
  , challenges ch 
  , View_Stats vs
  --, Submission_Stats ss
where
  cn.contest_id = cl.contest_id
  and cl.college_id = ch.college_id
  and vs.challenge_id = ch.challenge_id
  --and ss.challenge_id = ch.challenge_id
union all
SELECT 
  cn.contest_id
  , cn.hacker_id
  , cn.name
  , cl.college_id
  , ch.challenge_id
  , 0 as total_views
  , 0 as total_unique_views
  , ss.total_submissions
  , ss.total_accepted_submissions
FROM 
  contests cn
  , colleges cl
  , challenges ch 
  --, View_Stats vs
  , Submission_Stats ss
where
  cn.contest_id = cl.contest_id
  and cl.college_id = ch.college_id
  --and vs.challenge_id = ch.challenge_id
  and ss.challenge_id = ch.challenge_id  
)
select 
  dd.contest_id
  , dd.hacker_id
  , dd.name
  , sum(dd.total_submissions)  as total_submissions 
  , sum(dd.total_accepted_submissions) as total_accepted_submissions
  , sum(dd.total_views) as total_views    
  , sum(dd.total_unique_views)  as total_unique_views 
from
 dd
group by
  dd.contest_id
  , dd.hacker_id
  , dd.name
having
  sum(dd.total_submissions) > 0 
  or sum(dd.total_accepted_submissions) > 0
  or sum(dd.total_views) > 0    
  or sum(dd.total_unique_views) > 0  
order by
  dd.contest_id  
;
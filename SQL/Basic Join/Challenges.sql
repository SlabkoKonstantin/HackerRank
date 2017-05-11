CREATE TABLE HACKERS
(
  hacker_id  INTEGER,
  name       VARCHAR2(100)
);

CREATE TABLE CHALLENGES
(
  challenge_id  INTEGER,
  hacker_id     INTEGER
);



-- Sample Input 0

-- Hackers Table

insert into Hackers (hacker_id,name) values (5077,'Rose');
insert into Hackers (hacker_id,name) values (21283,'Angela');
insert into Hackers (hacker_id,name) values (62743,'Frank');
insert into Hackers (hacker_id,name) values (88255,'Patrick');
insert into Hackers (hacker_id,name) values (96196,'Lisa');

--Challenges Table
insert into Challenges (challenge_id, hacker_id) values (61654,5077);
insert into Challenges (challenge_id, hacker_id) values (58302,21283);
insert into Challenges (challenge_id, hacker_id) values (40587,88255);
insert into Challenges (challenge_id, hacker_id) values (29477,5077);
insert into Challenges (challenge_id, hacker_id) values (1220,21283);
insert into Challenges (challenge_id, hacker_id) values (69514,21283);
insert into Challenges (challenge_id, hacker_id) values (46561,62743);
insert into Challenges (challenge_id, hacker_id) values (58077,62743);
insert into Challenges (challenge_id, hacker_id) values (18483,88255);
insert into Challenges (challenge_id, hacker_id) values (76766,21283);
insert into Challenges (challenge_id, hacker_id) values (52382,5077);
insert into Challenges (challenge_id, hacker_id) values (74467,21283);
insert into Challenges (challenge_id, hacker_id) values (33625,96196);
insert into Challenges (challenge_id, hacker_id) values (26053,88255);
insert into Challenges (challenge_id, hacker_id) values (42665,62743);
insert into Challenges (challenge_id, hacker_id) values (12859,62743);
insert into Challenges (challenge_id, hacker_id) values (70094,21283);
insert into Challenges (challenge_id, hacker_id) values (34599,88255);
insert into Challenges (challenge_id, hacker_id) values (54680,88255);
insert into Challenges (challenge_id, hacker_id) values (61881,5077);

commit;

-- Sample Input 1

-- Hackers Table

insert into Hackers (hacker_id,name) values (12299,'Rose');
insert into Hackers (hacker_id,name) values (34856,'Angela');
insert into Hackers (hacker_id,name) values (79345,'Frank');
insert into Hackers (hacker_id,name) values (80491,'Patrick');
insert into Hackers (hacker_id,name) values (81041,'Lisa');

-- Challenges Table
insert into Challenges (challenge_id, hacker_id) values (63963,81041);
insert into Challenges (challenge_id, hacker_id) values (63117,79345);
insert into Challenges (challenge_id, hacker_id) values (28225,34856);
insert into Challenges (challenge_id, hacker_id) values (21989,12299);
insert into Challenges (challenge_id, hacker_id) values (4653,12299);
insert into Challenges (challenge_id, hacker_id) values (70070,79345);
insert into Challenges (challenge_id, hacker_id) values (36905,34856);
insert into Challenges (challenge_id, hacker_id) values (61136,80491);
insert into Challenges (challenge_id, hacker_id) values (17234,12299);
insert into Challenges (challenge_id, hacker_id) values (80308,79345);
insert into Challenges (challenge_id, hacker_id) values (40510,34856);
insert into Challenges (challenge_id, hacker_id) values (79820,80491);
insert into Challenges (challenge_id, hacker_id) values (22720,12299);
insert into Challenges (challenge_id, hacker_id) values (21394,12299);
insert into Challenges (challenge_id, hacker_id) values (36261,34856);
insert into Challenges (challenge_id, hacker_id) values (15334,12299);
insert into Challenges (challenge_id, hacker_id) values (71435,79345);
insert into Challenges (challenge_id, hacker_id) values (23157,34856);
insert into Challenges (challenge_id, hacker_id) values (54102,34856);
insert into Challenges (challenge_id, hacker_id) values (69065,80491);
commit;


WITH chall_stat AS
        (SELECT DISTINCT c.hacker_id, h.name, COUNT(c.challenge_id) OVER (PARTITION BY c.hacker_id) AS cur_max_chall
           FROM challenges c, hackers h
          WHERE h.hacker_id = c.hacker_id)
    ,chall_stat_cnt AS
        (  SELECT dd.cur_max_chall, COUNT(dd.cur_max_chall) AS cnt, MAX(dd.cur_max_chall) OVER () AS overall_max_chall
             FROM chall_stat dd
         GROUP BY dd.cur_max_chall)
    ,chall_filtered AS
        (SELECT cs.cur_max_chall
           FROM chall_stat_cnt cs
          WHERE (cs.cnt = 1
             AND cs.cur_max_chall < cs.overall_max_chall)
             OR (cs.cnt >= 1
             AND cs.cur_max_chall = cs.overall_max_chall))
  SELECT css.hacker_id, css.name, css.cur_max_chall
    FROM chall_stat css
   WHERE css.cur_max_chall IN (SELECT cf.cur_max_chall
                                 FROM chall_filtered cf)
ORDER BY css.cur_max_chall DESC, css.hacker_id;
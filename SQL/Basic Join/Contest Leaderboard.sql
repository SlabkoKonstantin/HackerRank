CREATE TABLE HACKERS
(
  HACKER_ID  INTEGER,
  NAME       VARCHAR2(100 BYTE)
);

CREATE TABLE submissions
(
  submission_id  INTEGER,
  hacker_id      INTEGER,
  challenge_id   INTEGER,
  score          INTEGER
);

insert into hackers (hacker_id,	name) values (4071,'Rose');
insert into hackers (hacker_id,	name) values (4806,'Angela');
insert into hackers (hacker_id,	name) values (26071,'Frank');
insert into hackers (hacker_id,	name) values (49438,'Patrick');
insert into hackers (hacker_id,	name) values (74842,'Lisa');
insert into hackers (hacker_id,	name) values (80305,'Kimberly');
insert into hackers (hacker_id,	name) values (84072,'Bonnie');
insert into hackers (hacker_id,	name) values (87868,'Michael');
insert into hackers (hacker_id,	name) values (92118,'Todd');
insert into hackers (hacker_id,	name) values (95895,'Joe');

insert into submissions (submission_id,	hacker_id, challenge_id, score) values (67194,74842,63132,76);
insert into submissions (submission_id,	hacker_id, challenge_id, score) values (64479,74842,19797,98);
insert into submissions (submission_id,	hacker_id, challenge_id, score) values (40742,26071,49593,20);
insert into submissions (submission_id,	hacker_id, challenge_id, score) values (17513,4806,49593,32);
insert into submissions (submission_id,	hacker_id, challenge_id, score) values (69846,80305,19797,19);
insert into submissions (submission_id,	hacker_id, challenge_id, score) values (41002,26071,89343,36);
insert into submissions (submission_id,	hacker_id, challenge_id, score) values (52826,49438,49593,9);
insert into submissions (submission_id,	hacker_id, challenge_id, score) values (31093,26071,19797,2);
insert into submissions (submission_id,	hacker_id, challenge_id, score) values (81614,84072,49593,100);
insert into submissions (submission_id,	hacker_id, challenge_id, score) values (44829,26071,89343,17);
insert into submissions (submission_id,	hacker_id, challenge_id, score) values (75147,80305,49593,48);
insert into submissions (submission_id,	hacker_id, challenge_id, score) values (14115,4806,49593,76);
insert into submissions (submission_id,	hacker_id, challenge_id, score) values (6943,4071,19797,95);
insert into submissions (submission_id,	hacker_id, challenge_id, score) values (12855,4806,25917,13);
insert into submissions (submission_id,	hacker_id, challenge_id, score) values (73343,80305,49593,42);
insert into submissions (submission_id,	hacker_id, challenge_id, score) values (84264,84072,63132,0);
insert into submissions (submission_id,	hacker_id, challenge_id, score) values (9951,4071,49593,43);
insert into submissions (submission_id,	hacker_id, challenge_id, score) values (45104,49438,25917,34);
insert into submissions (submission_id,	hacker_id, challenge_id, score) values (53795,74842,19797,5);
insert into submissions (submission_id,	hacker_id, challenge_id, score) values (26363,26071,19797,29);
insert into submissions (submission_id,	hacker_id, challenge_id, score) values (10063,4071,49593,96);

commit;

  SELECT d.hacker_id, h.name, SUM(d.score) AS score
    FROM (  SELECT s.hacker_id, MAX(score) AS score
              FROM submissions s
             WHERE s.score <> 0
          GROUP BY s.hacker_id, s.challenge_id) d
          , HACKERS h 
where h.hacker_id = d.hacker_id           
GROUP BY d.hacker_id, h.name
ORDER BY SUM(d.score) DESC, d.hacker_id ASC;
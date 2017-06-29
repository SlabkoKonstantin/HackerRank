drop table hackers;
drop table submissions;

CREATE TABLE hackers
(
   hacker_id   INTEGER
  ,name        VARCHAR2(100)
);

CREATE TABLE submissions
(
   submission_date   DATE
  ,submission_id     INTEGER
  ,hacker_id          INTEGER
  ,score              INTEGER
);

INSERT INTO hackers(hacker_id, name)
     VALUES (15758, 'Rose');

INSERT INTO hackers(hacker_id, name)
     VALUES (20703, 'Angela');

INSERT INTO hackers(hacker_id, name)
     VALUES (36396, 'Frank');

INSERT INTO hackers(hacker_id, name)
     VALUES (38289, 'Patrick');

INSERT INTO hackers(hacker_id, name)
     VALUES (44065, 'Lisa');

INSERT INTO hackers(hacker_id, name)
     VALUES (53473, 'Kimberly');

INSERT INTO hackers(hacker_id, name)
     VALUES (62529, 'Bonnie');

INSERT INTO hackers(hacker_id, name)
     VALUES (79722, 'Michael');

INSERT INTO submissions(submission_date, submission_id, hacker_id, score)
     VALUES (TO_DATE('2016-03-01', 'yyyy-mm-dd'), 8494, 20703, 0);

INSERT INTO submissions(submission_date, submission_id, hacker_id, score)
     VALUES (TO_DATE('2016-03-01', 'yyyy-mm-dd'), 22403, 53473, 15);

INSERT INTO submissions(submission_date, submission_id, hacker_id, score)
     VALUES (TO_DATE('2016-03-01', 'yyyy-mm-dd'), 23965, 79722, 60);

INSERT INTO submissions(submission_date, submission_id, hacker_id, score)
     VALUES (TO_DATE('2016-03-01', 'yyyy-mm-dd'), 30173, 36396, 70);

INSERT INTO submissions(submission_date, submission_id, hacker_id, score)
     VALUES (TO_DATE('2016-03-02', 'yyyy-mm-dd'), 34928, 20703, 0);

INSERT INTO submissions(submission_date, submission_id, hacker_id, score)
     VALUES (TO_DATE('2016-03-02', 'yyyy-mm-dd'), 38740, 15758, 60);

INSERT INTO submissions(submission_date, submission_id, hacker_id, score)
     VALUES (TO_DATE('2016-03-02', 'yyyy-mm-dd'), 42769, 79722, 25);

INSERT INTO submissions(submission_date, submission_id, hacker_id, score)
     VALUES (TO_DATE('2016-03-02', 'yyyy-mm-dd'), 44364, 79722, 60);

INSERT INTO submissions(submission_date, submission_id, hacker_id, score)
     VALUES (TO_DATE('2016-03-03', 'yyyy-mm-dd'), 45440, 20703, 0);

INSERT INTO submissions(submission_date, submission_id, hacker_id, score)
     VALUES (TO_DATE('2016-03-03', 'yyyy-mm-dd'), 49050, 36396, 70);

INSERT INTO submissions(submission_date, submission_id, hacker_id, score)
     VALUES (TO_DATE('2016-03-03', 'yyyy-mm-dd'), 50273, 79722, 5);

INSERT INTO submissions(submission_date, submission_id, hacker_id, score)
     VALUES (TO_DATE('2016-03-04', 'yyyy-mm-dd'), 50344, 20703, 0);

INSERT INTO submissions(submission_date, submission_id, hacker_id, score)
     VALUES (TO_DATE('2016-03-04', 'yyyy-mm-dd'), 51360, 44065, 90);

INSERT INTO submissions(submission_date, submission_id, hacker_id, score)
     VALUES (TO_DATE('2016-03-04', 'yyyy-mm-dd'), 54404, 53473, 65);

INSERT INTO submissions(submission_date, submission_id, hacker_id, score)
     VALUES (TO_DATE('2016-03-04', 'yyyy-mm-dd'), 61533, 79722, 45);

INSERT INTO submissions(submission_date, submission_id, hacker_id, score)
     VALUES (TO_DATE('2016-03-05', 'yyyy-mm-dd'), 72852, 20703, 0);

INSERT INTO submissions(submission_date, submission_id, hacker_id, score)
     VALUES (TO_DATE('2016-03-05', 'yyyy-mm-dd'), 74546, 38289, 0);

INSERT INTO submissions(submission_date, submission_id, hacker_id, score)
     VALUES (TO_DATE('2016-03-05', 'yyyy-mm-dd'), 76487, 62529, 0);

INSERT INTO submissions(submission_date, submission_id, hacker_id, score)
     VALUES (TO_DATE('2016-03-05', 'yyyy-mm-dd'), 82439, 36396, 10);

INSERT INTO submissions(submission_date, submission_id, hacker_id, score)
     VALUES (TO_DATE('2016-03-05', 'yyyy-mm-dd'), 90006, 36396, 40);

INSERT INTO submissions(submission_date, submission_id, hacker_id, score)
     VALUES (TO_DATE('2016-03-06', 'yyyy-mm-dd'), 90404, 20703, 0);
     
commit;     


WITH SUBS_DAY AS (
SELECT
    submission_date
    ,hacker_id
    ,name
    ,COUNT(*) AS subs
FROM
    SUBMISSIONS s
    LEFT JOIN HACKERS h
        USING(hacker_id)
GROUP BY
    submission_date
    ,hacker_id
    ,name
)
, CONSEC AS (
SELECT
     hacker_id
    ,name
    ,submission_date
    ,subs
FROM SUBS_DAY
START WITH submission_date = DATE '2016-03-01'
CONNECT BY 
    PRIOR submission_date = submission_date - 1
    AND PRIOR hacker_id = hacker_id
)
SELECT
    sd.submission_date
    ,COUNT(c.hacker_id) AS dist_hacker_subs
    ,MIN(sd.hacker_id) KEEP (DENSE_RANK LAST ORDER BY sd.subs) AS best_hacker_id
    ,MIN(sd.name) KEEP (DENSE_RANK FIRST ORDER BY sd.subs DESC, sd.hacker_id) AS best_hacker_name
FROM
    CONSEC c
    RIGHT JOIN SUBS_DAY sd
        ON c.submission_date = sd.submission_date
        AND c.hacker_id = sd.hacker_id
GROUP BY
    sd.submission_date
ORDER BY
    submission_date;
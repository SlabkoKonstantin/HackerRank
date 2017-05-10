CREATE TABLE WANDS
(
  id            INTEGER,
  code          INTEGER,
  coins_needed  INTEGER,
  power         INTEGER
);

CREATE TABLE WANDS_PROPERTY
(
  code     INTEGER,
  age      INTEGER,
  is_evil  INTEGER
);

insert into wands (id,code,coins_needed,power) values (1,4,3688,8);
insert into wands (id,code,coins_needed,power) values (2,3,9365,3);
insert into wands (id,code,coins_needed,power) values (3,3,7187,10);
insert into wands (id,code,coins_needed,power) values (4,3,734,8);
insert into wands (id,code,coins_needed,power) values (5,1,6020,2);
insert into wands (id,code,coins_needed,power) values (6,2,6773,7);
insert into wands (id,code,coins_needed,power) values (7,3,9873,9);
insert into wands (id,code,coins_needed,power) values (8,3,7721,7);
insert into wands (id,code,coins_needed,power) values (9,1,1647,10);
insert into wands (id,code,coins_needed,power) values (10,4,504,5);
insert into wands (id,code,coins_needed,power) values (11,2,7587,5);
insert into wands (id,code,coins_needed,power) values (12,5,9897,10);
insert into wands (id,code,coins_needed,power) values (13,3,4651,8);
insert into wands (id,code,coins_needed,power) values (14,2,5408,1);
insert into wands (id,code,coins_needed,power) values (15,2,6018,7);
insert into wands (id,code,coins_needed,power) values (16,4,7710,5);
insert into wands (id,code,coins_needed,power) values (17,2,8798,7);
insert into wands (id,code,coins_needed,power) values (18,2,3312,3);
insert into wands (id,code,coins_needed,power) values (19,4,7651,6);
insert into wands (id,code,coins_needed,power) values (20,5,5689,3);

insert into wands_property (code,age,is_evil) values (1,45,0);
insert into wands_property (code,age,is_evil) values (2,40,0);
insert into wands_property (code,age,is_evil) values (3,4,1);
insert into wands_property (code,age,is_evil) values (4,20,0);
insert into wands_property (code,age,is_evil) values (5,17,0);

commit;

  SELECT w.id, p.age, w.coins_needed, w.POWER
    FROM wands w, wands_property p
   WHERE w.code = p.code
     AND p.is_evil = 0
     AND w.coins_needed = (SELECT MIN(wo.coins_needed)
                             FROM wands wo
                            WHERE wo.POWER = w.POWER
                              AND wo.code = w.code)
ORDER BY w.POWER DESC, p.age DESC;
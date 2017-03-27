CREATE TABLE RF.OCCUPATIONS
(
  name        VARCHAR2(100),
  occupation  VARCHAR2(100)
)
TABLESPACE QUORUM_DATA
STORAGE    (
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
NOMONITORING
/

Insert into RF.OCCUPATIONS   (NAME, OCCUPATION) Values   ('Ashely','Professor');
Insert into RF.OCCUPATIONS   (NAME, OCCUPATION) Values   ('Christeen','Professor');
Insert into RF.OCCUPATIONS   (NAME, OCCUPATION) Values   ('Jane','Actor');
Insert into RF.OCCUPATIONS   (NAME, OCCUPATION) Values   ('Jenny','Doctor');
Insert into RF.OCCUPATIONS   (NAME, OCCUPATION) Values   ('Julia','Actor');
Insert into RF.OCCUPATIONS   (NAME, OCCUPATION) Values   ('Ketty','Professor');
Insert into RF.OCCUPATIONS   (NAME, OCCUPATION) Values   ('Maria','Actor');
Insert into RF.OCCUPATIONS   (NAME, OCCUPATION) Values   ('Meera','Singer');
Insert into RF.OCCUPATIONS   (NAME, OCCUPATION) Values   ('Priya','Singer');
Insert into RF.OCCUPATIONS   (NAME, OCCUPATION) Values   ('Samantha','Doctor');

COMMIT;

-- without pivot
with dd as (
SELECT
  RANK() OVER(PARTITION BY occupation ORDER BY name)         AS RANK 
  , case when occupation = 'Doctor' then name else null end as Doctor
  , case when occupation = 'Professor' then name else null end as Professor
  , case when occupation = 'Singer' then name else null end as Singer
  , case when occupation = 'Actor' then name else null end as Actor   
FROM occupations
)
select min(doctor), min(Professor), min(Singer), min(Actor) from dd group by rank;

-- with pivot

SELECT doctor, professor, singer, actor
  FROM (  SELECT *
            FROM (  SELECT name, occupation, (ROW_NUMBER() OVER(PARTITION BY occupation ORDER BY name)) AS row_num
                      FROM occupations
                  ORDER BY name ASC)
                 PIVOT
                    (MIN(name)
                    FOR occupation
                    IN ('Doctor' AS doctor, 'Professor' AS professor, 'Singer' AS singer, 'Actor' AS actor))
        ORDER BY row_num);

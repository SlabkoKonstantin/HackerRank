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

SELECT name || '(' || SUBSTR(occupation, 1, 1) || ')' AS d
    FROM rf.occupations
ORDER BY name;
select 'There are total ' || count(occupation) || ' ' || lower(occupation) || 's.' as d from rf.OCCUPATIONS group by occupation
order by  count(occupation), occupation;
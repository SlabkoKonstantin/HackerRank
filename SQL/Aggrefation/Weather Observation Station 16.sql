-- create table script is in Weather Observation Station 2.sql

SELECT ROUND(min(lat_n), 4) 
FROM station
where lat_n > 38.7780;
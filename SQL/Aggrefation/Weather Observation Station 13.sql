-- create table script is in Weather Observation Station 2.sql

INSERT into STATION(id,city,state,lat_n,long_w) values (4,'City4','S4',46.7,315.3);
commit;

SELECT ROUND(SUM(lat_n), 4) 
FROM station
where lat_n between 38.7880 and 137.2345;
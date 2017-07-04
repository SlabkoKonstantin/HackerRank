-- create table script is in Weather Observation Station 2.sql

--INSERT into STATION(id,city,state,lat_n,long_w) values (4,'City4','S4',146.7,314.2);
--commit;

select dd.long_w from (
SELECT  
  ROUND(long_w, 4) as long_w, lat_n  
  , max(lat_n) over() as max_lat_n
FROM station
where lat_n < 137.2345
) dd
where dd.lat_n = dd.max_lat_n;
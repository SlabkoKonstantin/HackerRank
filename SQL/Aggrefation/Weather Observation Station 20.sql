-- create table script is in Weather Observation Station 2.sql

-- Oracle
SELECT round(lat_n,4)
  FROM (SELECT lat_n, ROW_NUMBER() OVER (ORDER BY lat_n) AS rn FROM station) x
 WHERE x.rn = (SELECT ROUND((COUNT(lat_n) + 1) / 2, 0) FROM station);
 
-- MySQL
SELECT ROUND(x.lat_n, 4)
    FROM station x, station y
GROUP BY x.lat_n
  HAVING SUM(SIGN(1 - SIGN(y.lat_n - x.lat_n))) / COUNT(*) > .5
 LIMIT 1; 
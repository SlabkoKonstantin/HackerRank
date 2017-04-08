-- create table script is in Weather Observation Station 2.sql

with pp as (
select min(lat_n) as a
, min(long_w) as b
, max(lat_n) as c
, max(long_w) as d
FROM station
)
select round(
  sqrt(power(pp.c - pp.a,2) + power(pp.d - pp.b,2))  
  ,4) from pp;
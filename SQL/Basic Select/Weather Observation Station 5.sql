select city || ' ' || l from (
select city, length(city) as l from station where length(city) =  
(select min(length(city)) from station)
order by city
) where rownum <= 1
union all  
select city || ' ' || l from (
select city, length(city) as l from station where length(city) =  
(select max(length(city)) from station)
order by city
) where rownum <= 1;
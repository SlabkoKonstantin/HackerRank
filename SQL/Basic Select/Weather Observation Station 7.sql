select distinct(city) from station where regexp_like(lower(city) ,'(a|e|i|o|u)\s?$') order by city;
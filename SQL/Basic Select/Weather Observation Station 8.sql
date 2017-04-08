--select distinct(city) from station where regexp_like(city ,'^(A|E|I|O|U)\S*(a|e|i|o|u)\s?$') order by city;

SELECT distinct CITY 
FROM STATION 
WHERE (CITY LIKE 'A%' OR CITY LIKE 'E%' OR CITY LIKE 'I%' OR CITY LIKE 'O%' OR CITY LIKE 'U%' ) AND
      (CITY LIKE '%a' OR CITY LIKE '%e' OR CITY LIKE '%i' OR CITY LIKE '%o' OR CITY LIKE '%u' );
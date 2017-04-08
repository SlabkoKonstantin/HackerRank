select sum(ct.population)
from city ct, country cn
where ct.CountryCode = cn.Code
and cn.continent = 'Asia';
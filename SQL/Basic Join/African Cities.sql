select ct.name
from city ct, country cn
where ct.CountryCode = cn.Code
and cn.continent = 'Africa';
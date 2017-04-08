select
  cn.continent,
  floor(avg(ct.population))
from city ct, country cn
where ct.countrycode = cn.code
group by cn.continent;
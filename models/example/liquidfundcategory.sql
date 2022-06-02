{{config(materialized='table')}}
select code,
sum(nav) over(partition by date_part(year,nav_date) order by nav_date) as YTD,
sum(nav) over(partition by date_part(month,nav_date) order by nav_date) as MTD
from navhistory
where code in (select m.code
                 from fundcategory f, mutualfund m
                 where f.category like '%Liquid%' and m.category_id = f.id)

{{config(materialized='table')}}
select nav_date as Date,date_part(year,nav_date) as Year, date_part(month,nav_date) as Month, max(nav) as Nav
from navhistory
group by nav_date
order by nav_date

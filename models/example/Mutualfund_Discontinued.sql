{{config(materialized='table')}}
select name as Mutual_Funds, max(date_part(year,nav_date)) as Year
from navhistory, mutualfund
where mutualfund.code = navhistory.code
group by name
having max(date_part(year,nav_date))='2018'

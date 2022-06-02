{{config(materialized='table')}}
select f.category as Scheme,date_part(Month, nav_date) as Month,date_part(Year, nav_date) as Year, avg(nav) as Avg_Nav ,avg(repurchase_price) as Avg_Repurchase_Price, avg(sale_price) as Avg_Sales_Price
from fundcategory f,mutualfund m, navhistory n
where f.id = m.category_id and m.code = n.code
group by f.category, date_part(Year, nav_date), date_part(Month, nav_date)

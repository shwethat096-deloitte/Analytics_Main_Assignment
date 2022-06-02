{{config(materialized='table')}}
select nav,
sum(nav) over(partition by year order by date) as YTD,
sum(nav) over(partition by year,month order by date) as MTD,
pow((nav/nav),1) -1 as Inception
from "MAINASSIGNMENT"."DBT"."EXTRATABLE"

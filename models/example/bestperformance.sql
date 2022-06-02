{{config(materialized='table')}}
select top 1 name
from "MAINASSIGNMENT"."DBT"."MILESTONE2_1_YTDMTD", "MAINASSIGNMENT"."DBT"."MUTUALFUND"
order by nav desc

{{config(materialized='table')}}
select name
from "MAINASSIGNMENT"."DBT"."MILESTONE2_1_YTDMTD", "MAINASSIGNMENT"."DBT"."MUTUALFUND"
order by nav asc

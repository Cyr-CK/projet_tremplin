select 
  *
from {{ source('dbt_bq_weather', 'NYC_Weather_2016_2022') }}
  
select 
  *
from {{ source('dbt_bq_weather', 'NYC_Weather_2016_2022') }}
where
  time between '2019-01-01' and '2020-06-01'
select 
  *
from {{ source('dbt_bq_weather', 'NYC_weather') }}
  
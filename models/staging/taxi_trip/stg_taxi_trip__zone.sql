select
  *
from
  {{ source('dbt_bq_taxi', 'taxi_zone_geo') }}
select
  *
from
  {{ ref('stg_weather') }}
where
  time between '2019-01-01' and '2020-06-01'
select 
  * except(congestion_surcharge),
  cast(coalesce (congestion_surcharge,'0') as float64) as congestion_surcharge 
from {{ source('dbt_bq_taxi', 'yellow_tripdata_2019-01') }}
union all
select * from {{ source('dbt_bq_taxi', 'yellow_tripdata_2019-02') }}
union all
select * from {{ source('dbt_bq_taxi', 'yellow_tripdata_2019-03') }}
union all
select * from {{ source('dbt_bq_taxi', 'yellow_tripdata_2019-04') }}
union all
select * from {{ source('dbt_bq_taxi', 'yellow_tripdata_2019-05') }}
union all
select * from {{ source('dbt_bq_taxi', 'yellow_tripdata_2019-06') }}
union all
select * from {{ source('dbt_bq_taxi', 'yellow_tripdata_2019-07') }}
union all
select * from {{ source('dbt_bq_taxi', 'yellow_tripdata_2019-08') }}
union all
select * from {{ source('dbt_bq_taxi', 'yellow_tripdata_2019-09') }}
union all
select * from {{ source('dbt_bq_taxi', 'yellow_tripdata_2019-10') }}
union all
select * from {{ source('dbt_bq_taxi', 'yellow_tripdata_2019-11') }}
union all
select * from {{ source('dbt_bq_taxi', 'yellow_tripdata_2019-12') }}
union all
select * from {{ source('dbt_bq_taxi', 'yellow_tripdata_2020-01') }}
union all
select * from {{ source('dbt_bq_taxi', 'yellow_tripdata_2020-02') }}
union all
select * from {{ source('dbt_bq_taxi', 'yellow_tripdata_2020-03') }}
union all
select * from {{ source('dbt_bq_taxi', 'yellow_tripdata_2020-04') }}
union all
select * from {{ source('dbt_bq_taxi', 'yellow_tripdata_2020-05') }}
union all
select * from {{ source('dbt_bq_taxi', 'yellow_tripdata_2020-06') }}
{% set tables = ['yellow_tripdata_2019-01','yellow_tripdata_2019-02', 'yellow_tripdata_2019-03', 'yellow_tripdata_2019-04', 'yellow_tripdata_2019-05','yellow_tripdata_2019-06',
                 'yellow_tripdata_2019-07','yellow_tripdata_2019-08','yellow_tripdata_2019-09','yellow_tripdata_2019-10','yellow_tripdata_2019-11','yellow_tripdata_2019-12',
                 'yellow_tripdata_2020-01','yellow_tripdata_2020-02','yellow_tripdata_2020-03','yellow_tripdata_2020-04','yellow_tripdata_2020-05','yellow_tripdata_2020-06'] 
%}


{% for table in tables %}
  {% if table == 'yellow_tripdata_2019-01'%}
    select 
      * except(congestion_surcharge),
      cast(coalesce (congestion_surcharge,'0') as float64) as congestion_surcharge 
    from {{ source('dbt_bq_taxi', table) }}
  {% else %}
    select * from {{ source('dbt_bq_taxi', table) }}
  {% endif %}
  {% if not loop.last %}
    union all
  {% endif %}
{% endfor %}
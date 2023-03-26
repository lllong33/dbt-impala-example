{{
    config(
        materialized='incremental',
        partition_by=['id'],
        incremental_strategy='insert_overwrite',
    )
}}


with source_data as (
    select  "Name 1" as name, "City1" as city, 1 as id
    union all 
    select "Name 2" as name, "City2" as city, 2 as id
)

select * from source_data




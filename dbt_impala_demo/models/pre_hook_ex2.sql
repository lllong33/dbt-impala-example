-- create table_pre
{{ config(
    pre_hook=[
            "DROP TABLE IF EXISTS {{ this }}_pre1",
            "CREATE TABLE {{ this }}_pre1 stored as parquet as  
            select 1 as id, 'a' as name 
            union all
            select 2 as id, 'b' as name
            union all
            select 3 as id, 'c' as name
            ",
            "invalidate metadata {{ this }}_pre1",
            "COMPUTE STATS {{ this }}_pre1",
        ]
) }}


select * from {{ this }}_pre1
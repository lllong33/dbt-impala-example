-- create table_pre
{{ config(
    pre_hook=[
            "DROP TABLE IF EXISTS {{ this }}_pre1",
            "CREATE TABLE {{ this }}_pre1 (id INT, name STRING);",
            "INSERT INTO {{ this }}_pre1 VALUES (1, 'a');",
            "INSERT INTO {{ this }}_pre1 VALUES (2, 'b');",
            "INSERT INTO {{ this }}_pre1 VALUES (3, 'c');"
        ]
) }}

select * from {{ this }}_pre1
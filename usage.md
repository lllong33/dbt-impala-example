ft, IS, tps

# F1 complete practice
IS env_var可以放在set_env_var.sh文件, profiles.ym 注意不要引用未声明变量

IS dbt.raw_covid__vaccines insert into 这个表3000条花了10min

IS schema: "{{ env_var('DBT_IMPALA_SCHEMA') }}"
这里需要加上双引号 :<

TPS test中 table 没有指定 col, skip

IS test 中如何定义优雅定义一百多个列的表所有列 not null;

TPS [impala3.3开始支持DATE type](https://impala.apache.org/docs/build/html/topics/impala_date.html), CDH6.3.3&impala3.3开始收费
- TIMESTAMP not supported partition-column. cast as string

TPS dbt impala partition incremental
config(
        materialized='incremental',
        partition_by='report_date'
    )
--full-refresh

IS 为啥写到 dbt_mart_covid 库了
在 dbt_project.yml 文件中定义了 schema, materialized;
- ex dbt_mart_covid, 两个schema 合并后名称
IS0.1 这里前置+指什么?

```sql
show tables in dbt like "my_first_dbt_model"
describe extended dbt.dw_jhxj_wide
-- drop database  dbt_mart_covid cascade
```

./start.sh 2
dbt run -m +models/marts/covid/mart_covid_cases.sql

## date Stream:
dbt (database)
- ref__population (table)
- ref__country_codes (table)
- raw_covid__vaccines (table)
- raw_covid__cases (table)
- stg_covid__cases (view)
- mart_covid_cases (table)


# F2 dbt pre_hook practice

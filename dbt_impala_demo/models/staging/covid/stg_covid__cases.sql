select 
  cast(cast(unix_timestamp(date_rep, "dd/MM/yyyy") as timestamp) AS DATE) as rep_date, 
  cases, 
  deaths, 
  geo_id
from {{ source('raw_covid','raw_covid__cases') }};

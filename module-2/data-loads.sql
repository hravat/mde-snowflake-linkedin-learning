snow stage create snowflake_cli_stage --database MDE_SNOWFLAKE_LINKEDIN --schema PUBLIC;


USE DATABASE MDE_SNOWFLAKE_LINKEDIN;
USE SCHEMA PUBLIC; 
SHOW STAGES; 


snow stage copy module-2\sample_orders.csv "@MDE_SNOWFLAKE_LINKEDIN.PUBLIC.snowflake_cli_stage"; 
snow stage list-files MDE_SNOWFLAKE_LINKEDIN.PUBLIC.snowflake_cli_stage;

snow stage copy module-2\load_from_cli_stage.sql  "@MDE_SNOWFLAKE_LINKEDIN.PUBLIC.snowflake_cli_stage";

snow stage execute "@MDE_SNOWFLAKE_LINKEDIN.PUBLIC.snowflake_cli_stage/load_from_cli_stage.sql";


select * 
from sample_orders_cli
LIMIT 10;
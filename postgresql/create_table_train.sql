

DROP TABLE IF EXISTS Train CASCADE;
DROP TABLESPACE Train;

CREATE TABLESPACE Train
       LOCATION '/home4/postgres/train';

create table Train (
id varchar(20), click integer, hour varchar(10), C1 varchar(20),
banner_pos varchar(20), site_id varchar(20), site_domain varchar(20), site_category varchar(20),
app_id varchar(20), app_domain varchar(20), app_category varchar(20), device_id varchar(20), 
device_ip varchar(20), device_model varchar(20), device_type varchar(20),
device_conn_type varchar(20), C14 varchar(20), C15 varchar(20), C16 varchar(20),
C17 varchar(20), C18 varchar(20), C19 varchar(20), C20 varchar(20), C21 varchar(20)
)
TABLESPACE Train
;


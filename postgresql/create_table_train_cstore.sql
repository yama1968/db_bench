

-- load extension first time after install
CREATE EXTENSION cstore_fdw;

-- create server object
CREATE SERVER cstore_server FOREIGN DATA WRAPPER cstore_fdw;

DROP FOREIGN TABLE IF EXISTS Train CASCADE;


create FOREIGN table Train (
id varchar(20), click integer, hour varchar(10), C1 varchar(20),
banner_pos varchar(20), site_id varchar(20), site_domain varchar(20), site_category varchar(20),
app_id varchar(20), app_domain varchar(20), app_category varchar(20), device_id varchar(20),
device_ip varchar(20), device_model varchar(20), device_type varchar(20),
device_conn_type varchar(20), C14 varchar(20), C15 varchar(20), C16 varchar(20),
C17 varchar(20), C18 varchar(20), C19 varchar(20), C20 varchar(20), C21 varchar(20)
)
SERVER cstore_server
OPTIONS(compression 'pglz')
;

grant all on table Train to yannick;

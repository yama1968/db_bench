USE test;

DROP TABLE IF EXISTS train;

create table train (
id varchar PRIMARY KEY,
click int, hour varchar, C1 varchar,
banner_pos varchar, site_id varchar, site_domain varchar, site_category varchar,
app_id varchar, app_domain varchar, app_category varchar, device_id varchar,
device_ip varchar, device_model varchar, device_type varchar,
device_conn_type varchar, C14 varchar, C15 varchar, C16 varchar,
C17 varchar, C18 varchar, C19 varchar, C20 varchar, C21 varchar
);


drop table if exists Train;

create table Train (
id String, click Int8, hour String, C1 String,
banner_pos String, site_id String, site_domain String, site_category String,
app_id String, app_domain String, app_category String, device_id String, 
device_ip String, device_model String, device_type String,
device_conn_type String, C14 String, C15 String, C16 String,
C17 String, C18 String, C19 String, C20 String, C21 String
)
ENGINE = Log
;


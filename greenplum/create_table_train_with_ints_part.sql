

/*
	Creating columns with char(8) or integer
	Right now much slower for pivotal, by a factor of 3, for querying...
*/

DROP TABLE Train CASCADE;
DROP TABLESPACE Train;

CREATE TABLESPACE Train
        FILESPACE Train_filespace;

create table Train (
id varchar(20), click integer, hour char(8), C1 integer,
banner_pos integer, site_id char(8), site_domain char(8), site_category char(8),
app_id char(8), app_domain char(8), app_category char(8), device_id char(8),
device_ip char(8), device_model char(8), device_type integer,
device_conn_type integer, C14 integer, C15 integer, C16 integer,
C17 integer, C18 integer, C19 integer, C20 integer, C21 integer
)
WITH (appendonly=true, orientation=column, compresstype=zlib, compresslevel=6)
TABLESPACE Train
DISTRIBUTED BY (device_id, device_ip)
PARTITION BY RANGE (hour)
  (START ('14100000') END ('14300000'))
;


drop table if exists train_csv;
drop table if exists train;

create external table train_csv stored as TEXTFILE
row format delimited fields terminated by ','
location '/home/yannick/tmp/train.csv';

CREATE EXTERNAL TABLE train_csv
 USING com.databricks.spark.csv
OPTIONS (path '/home/yannick/tmp/train.csv', header "true", inferSchema "true");

create table train stored as parquet location '/home4/yannick4/tmp/train.parquet'
as select * from train_csv;

create temporary view train
using org.apache.spark.sql.parquet
OPTIONS (
path '/home4/yannick4/tmp/train.parquet'
);

create external table train
(
id varchar(20), click integer, hour char(8), C1 integer,
banner_pos integer, site_id char(8), site_domain char(8), site_category char(8),
app_id char(8), app_domain char(8), app_category char(8), device_id char(8),
device_ip char(8), device_model char(8), device_type integer,
device_conn_type integer, C14 integer, C15 integer, C16 integer,
C17 integer, C18 integer, C19 integer, C20 integer, C21 integer
)
stored as parquet
location'/home4/yannick4/tmp/train.parquet';

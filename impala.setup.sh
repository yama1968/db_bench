#!/bin/bash

#TRAIN=./data/train100k.gz
TRAIN=./data/train.gz

hdfs dfs -rm -skipTrash /user/cloudera/train.csv

sudo -u hdfs hive <<END

drop table train_csv;

END


gunzip < $TRAIN | tail -n +2 | hdfs dfs -put - /user/cloudera/train.csv
hdfs dfs -ls -h

sudo -u hdfs hive <<END

create table train_csv (
id string, click int, hour string, C1 string, banner_pos string, site_id string, site_domain string, site_category string, app_id string, app_domain string, app_category string, device_id string, device_ip string, device_model string, device_type string, device_conn_type string, C14 string, C15 string, C16 string, C17 string, C18 string, C19 string, C20 string, C21 string
)
row format delimited fields terminated by ',';

load data inpath '/user/cloudera/train.csv'
   into table train_csv;

select * from train_csv limit 1;

END


hdfs dfs -ls -h

impala-shell <<END
set compression_codec=snappy;

invalidate metadata;

drop table train;

create table train (
id string, click int, hour string, C1 string, banner_pos string, site_id string, site_domain string, site_category string, app_id string, app_domain string, app_category string, device_id string, device_ip string, device_model string, device_type string, device_conn_type string, C14 string, C15 string, C16 string, C17 string, C18 string, C19 string, C20 string, C21 string
)
stored as parquetfile;

insert into train select * from train_csv;

select * from train limit 1;

END



CREATE TABLE train_kudu2
PRIMARY KEY (hour, device_id, id)
PARTITION BY HASH PARTITIONS 16
STORED AS KUDU
TBLPROPERTIES(
'kudu.table_name' = 'train_kudu2',
'kudu.num_tablet_replicas' =  '1',
'kudu.master_addresses' = 'localhost'
)
AS SELECT hour, device_id, id, click, C1, banner_pos, site_id, site_domain, site_category, app_id,
app_domain , app_category ,  device_ip , device_model , device_type , device_conn_type ,
C14 , C15 , C16 , C17 , C18 , C19 , C20 , C21
FROM train_csv
;

select * from train_kudu2 where device_id = 'e189fa71';

SELECT device_id, hour, cnt
  FROM (SELECT device_id, hour, count(*) AS cnt
          FROM train_kudu2
         GROUP BY device_id, hour) AS foo
 ORDER BY cnt desc
 LIMIT 20;

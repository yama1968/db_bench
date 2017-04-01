

USE test;

TRUNCATE TABLE Train;

 COPY Train (
   id,click,hour,C1,banner_pos,site_id,site_domain,site_category,app_id,app_domain,app_category,device_id,device_ip,device_model,device_type,device_conn_type,C14,C15,C16,C17,C18,C19,C20,C21
   )
 FROM '/home/yannick/tmp/train.csv'
 WITH DELIMITER = ',' AND HEADER = true AND CHUNKSIZE=1000
;

SELECT *
  FROM Train
 LIMIT 10;

/*

Using 7 child processes

Starting copy of test.train with columns [id, click, hour, c1, banner_pos, site_id, site_domain, site_category, app_id, app_domain, app_category, device_id, device_ip, device_model, device_type, device_conn_type, c14, c15, c16, c17, c18, c19, c20, c21].
Processed: 40428967 rows; Rate:   13603 rows/s; Avg. rate:   23304 rows/s
40428967 rows imported from 1 files in 28 minutes and 54.822 seconds (0 skipped).

*/

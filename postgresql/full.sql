
\timing on

DELETE FROM Train;

set max_parallel_workers_per_gather = 8;

VACUUM FULL;

 COPY Train (
   id,click,hour,C1,banner_pos,site_id,site_domain,site_category,app_id,app_domain,app_category,device_id,device_ip,device_model,device_type,device_conn_type,C14,C15,C16,C17,C18,C19,C20,C21
   )
 FROM '/home/yannick/tmp/train.csv'
  CSV HEADER
;

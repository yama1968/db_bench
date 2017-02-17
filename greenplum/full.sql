
\timing on

DELETE FROM Train;

 COPY Train
 FROM '/home/gpadmin/train.csv'
  CSV HEADER
  LOG ERRORS INTO Train_load_errors KEEP
SEGMENT REJECT LIMIT 10 ROWS;


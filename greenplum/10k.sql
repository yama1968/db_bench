
\timing

DELETE FROM Train;

 COPY Train
 FROM '/home/gpadmin/train10k.csv'
  CSV HEADER
  LOG ERRORS INTO Train_load_errors KEEP
SEGMENT REJECT LIMIT 10 ROWS;

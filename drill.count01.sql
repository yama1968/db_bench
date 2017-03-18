

set planner.enable_decimal_data_type = True;

SELECT count(*) AS cnt,
       avg(click) AS p
  FROM (
    SELECT *
      FROM dfs.`/home/yannick/tmp/train.parquet`
     WHERE banner_pos = '3'
    ) AS T;

SELECT *
  FROM dfs.`/home/yannick/tmp/train.parquet`
 WHERE device_type = '2';

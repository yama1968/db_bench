

SELECT click, count(*)
  FROM (
        SELECT t.id, t.`hour` as my_jour, t.click, t.device_id, DID.p, DID.nnb
          FROM dfs.`/home4/yannick4/tmp/train.parquet` AS t
          JOIN (
                SELECT device_id, count(*) as nnb, avg(click) as p
                  FROM dfs.`/home4/yannick4/tmp/train.parquet`
                 GROUP BY device_id
            ) AS DID
            ON t.device_id = DID.device_id
    )
 GROUP BY click
 ORDER BY click;

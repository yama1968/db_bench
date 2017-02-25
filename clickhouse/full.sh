#
 
time ( \
tail -n +2 /home/yannick/tmp/train.csv | \
	clickhouse-client --query="INSERT INTO Train FORMAT CSV" \
	)

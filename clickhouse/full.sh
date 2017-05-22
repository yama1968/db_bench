#

time ( \
tail -n +2 /home/yannick/tmp/train.csv | \
	clickhouse-client -t --query="INSERT INTO Train FORMAT CSV" \
	)


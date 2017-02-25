#

tail -n +2 /home/yannick/tmp/train10k.csv | \
	clickhouse-client --query="INSERT INTO Train FORMAT CSV"

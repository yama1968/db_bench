#!/bin/bash


db=clickhouse_merge_tree
cmd="$1"

clickhouse-client -n -m -t --echo  < ./"$cmd" 2>&1 | tee log/"$db"."$cmd".$(date -u "+%F-%H%M%S").log

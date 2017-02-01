#!/bin/bash

cmd="$1"

impala-shell -f ./"$cmd".sql 2>&1 | tee log/kudu."$cmd".$(date -u "+%F-%H%M%S").log


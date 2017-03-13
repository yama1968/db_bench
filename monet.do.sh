#!/bin/bash

cmd="$1"

cat "$cmd" | \
mclient -e -is 2>&1 | tee log/monetdb."$cmd".$(date -u "+%F-%H%M%S").log

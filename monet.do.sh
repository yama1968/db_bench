#!/bin/bash

cmd="$1"

cat "$cmd" | \
mclient -u monetdb -e -is db 2>&1 | tee log/monetdb."$cmd".$(date -u "+%F-%H%M%S").log


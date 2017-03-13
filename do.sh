#!/bin/bash


db="$1"
cmd="$2"

$db -f ./"$cmd" 2>&1 | tee log/"$db"."$cmd".$(date -u "+%F-%H%M%S").log

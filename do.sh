#!/bin/bash


db="$1"
cmd="$2"
cmt="$3"

$db -f ./"$cmd" 2>&1 | tee log/"$db"."$cmd"."$cmt".$(date -u "+%F-%H%M%S").log

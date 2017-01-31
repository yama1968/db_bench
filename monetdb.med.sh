#!/bin/bash

n=monetdb.med

(cat ./sql_med_test.sql) | \
    mclient -e -is db | tee log/$n.$(date -u "+%F-%T").log

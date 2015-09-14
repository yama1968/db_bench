#!/bin/bash

(echo "\\timing"; cat ./sql_med_test.sql) | \
    vsql -a | tee log/vertica.med.$(date -u "+%F-%T").log

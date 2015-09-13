#!/bin/bash

(echo "\\timing"; cat ./sql_med_test.sql) | \
    vsql | tee log/vertica.med.log

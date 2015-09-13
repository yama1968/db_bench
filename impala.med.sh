#!/bin/bash

impala-shell -f ./sql_med_test.sql 2>&1 | tee log/impala.med.log

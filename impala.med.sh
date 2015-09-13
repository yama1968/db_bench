#!/bin/bash

impala-shell -f ./sql_med_test.sql | tee log/impala.med.log

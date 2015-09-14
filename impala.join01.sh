#!/bin/bash

t=impala.join01

(cat ./$t.sql) | \
    impala-shell 2>&1 | tee log/$t.$(date -u "+%F-%H%M%S").log

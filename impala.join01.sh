#!/bin/bash

t=impala.join01

(cat ./text.join01.sql) | \
    impala-shell 2>&1 | tee log/$t.$(date -u "+%F-%H%M%S").log

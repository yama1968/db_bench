#!/bin/bash

t=monetdb.join01

(cat ./$t.sql) | \
    mclient -e -is db 2>&1 | tee log/$t.$(date -u "+%F-%H%M%S").log

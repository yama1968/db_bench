#!/bin/bash

t=vertica.join01

(echo "\\timing"; cat ./$t.sql) | \
    vsql -a | tee log/$t.$(date -u "+%F-%H%M%S").log

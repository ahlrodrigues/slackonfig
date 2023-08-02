#!/bin/bash

log=/home/ahlr/Downloads/teste.txt
num=$(wc -l $log | awk '{ print $1 }')

if [ -e $log ]; then


if [ $num -ge 10 ]; then
    sed -i '1d' $log
fi


fi

#!/bin/bash
 
for SERIAL in 'T' '8' '1' '6' 'F'
do
    adb -s $SERIAL shell su -c 'crond -b -c /data/crontab'
done

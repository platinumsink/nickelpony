#!/bin/bash
# Do config here for IP.
# Leave last digit off of base.
# Assumes sequence numbers.
IPBASE="192.168.45.10";
IPPORT=":5555";
 
# No more configing
for COUNT in `seq 0 4`;
do
    adb -s $IPBASE$COUNT$IPPORT shell am force-stop com.peen.mine
    sleep 2
    adb -s $IPBASE$COUNT$IPPORT shell am start -n com.peen.mine
done

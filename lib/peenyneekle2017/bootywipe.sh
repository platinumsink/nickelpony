#!/bin/bash
# Do config here for IP.
# Leave last digit off of base.
# Assumes sequence numbers.
IPBASE="192.168.45.10";
IPPORT=":5555";
 
# No more configing
for COUNT in `seq 0 4`;
do
    adb connect $IPBASE$COUNT
    adb -s $IPBASE$COUNT$IPPORT shell am force-stop com.perk.livetv.aphone
    sleep 2
    adb -s $IPBASE$COUNT$IPPORT shell su -c 'mkdir -p /storage/sdcard0/tmp/'
    adb -s $IPBASE$COUNT$IPPORT shell su -c 'rm -rf /storage/sdcard0/tmp/shared_prefs/*'
    adb -s $IPBASE$COUNT$IPPORT shell su -c 'rm -rf /storage/sdcard0/tmp/*'
    nohup adb -s $IPBASE$COUNT$IPPORT shell su -c 'reboot' &
    disown
done

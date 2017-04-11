#!/bin/bash

SPEEDTEST_OUTPUT=$(speedtest-cli)

#SPEEDTEST_OUTPUT=$(cat last_test.txt)

DOWLOAD_SPEED=$(echo $SPEEDTEST_OUTPUT | grep -oP '(?<=Download: ).+?s')
UPLOAD_SPEED=$(echo $SPEEDTEST_OUTPUT | grep -oP '(?<=Upload: ).+?s')
#echo Download speed is: $DOWLOAD_SPEED
#echo Upload speed is: $UPLOAD_SPEED
echo Test Performed at: $(date) > last_test.txt
echo $SPEEDTEST_OUTPUT >> last_test.txt
echo "'$(date +%s)','$DOWLOAD_SPEED','$UPLOAD_SPEED'" >> speeds.csv

#!/bin/bash
TO_TEAM=$1
ALERT_TYPE=$2
BODY=$3
SUBJECT=$4
TO_ADDRESS=$5
FINAL_BODY=$(sed -e 's/TO_TEAM/$TO_TEAM/g' -e 's/ALERT_TYPE/$ALERT_TYPE/g' -e 's/BODY/$BODY/g' template.html)
echo "$FINAL_BODY" | mail -s "$SUBJECT" "TO_ADDRESS"

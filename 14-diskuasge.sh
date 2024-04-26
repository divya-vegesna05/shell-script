#!/bin/bash
DISK_USAGE=$(df -hT | grep -vE 'tmp|file')
DISK_THRESHOLD=1
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
NORMAL="\e[0m"
message=""
while IFS= read line
do
USAGE=$(echo $line | awk '{print $6F}' | cut -d % -f1)
PARTITION=$(echo $line | awk '{print $1F}')
if [ $USAGE -gt $DISK_THRESHOLD ]
then
message+="$RED High Disk Usage on partition $PARTITION is $USAGE\n $NORMAL"
fi
done <<<$DISK_USAGE
echo -e "message:$message"
#echo -e "$message" | mail -s "ALERT: HIGH DISK USAGE" divya.vegesna55@gmail.com
sh 15-mail.sh "devops-team" "diskALERT" "$message" "highdiskusage" "divya.vegesna55@gmail.com"
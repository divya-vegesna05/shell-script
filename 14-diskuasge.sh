#!/bin/bash
SOURCE_DIR="/tmp/shellscript-logs"
DISK_USAGE=$(df -hT | grep -vE 'tmp|file')
DISK_THRESHOLD=1
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
NORMAL="\e[0m"
if [ ! -d $SOURCE_DIR ]
then 
echo "$RED Error: $SOURCE_DIR doesnt exist $NORMAL"
fi
while IFS= read -r line
do
USAGE=$(echo $line | awk '{print $6F}' | cut -d % -f1)
PARTITION=$(echo $line | awk '{print $1F}')
if [ $USAGE -gt $DISK_THRESHOLD ]
then
message+= "High Disk Usage on partition $PARTITION is $USAGE "
fi
done <<<$DISK_USAGE
echo "message:$message" 
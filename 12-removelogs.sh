#!/bin/bash
SOURCE_DIR="/tmp/shellscript-logs"
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
NORMAL="\e[0m"
if [ ! -d $SOURCE_DIR ]
then
echo -e "$RED ERROR: $SOURCE_DIR does not exists"
exit 1
fi
FILES_TO_DELETE= $(find $SOURCE_DIR -type f -mtime +14 -name "*.log")
while IFS= read -r line
do 
echo "deleting line $line"
done << $FILES_TO_DELETE
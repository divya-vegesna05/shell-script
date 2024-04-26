#!/bin/bash
SOURCE_DIR="/etc/passwd"
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
NORMAL="\e[0m"
if [ ! -f $SOURCE_DIR ]
then
echo "$RED ERROR: $SOURCE_DIR doesnot exist $NORMAL"
fi
while IFS=":" read -r username password userid groupid userid_info homedir command
do
echo "username is $username"
echo "userid is $userid"
echo "homedir is $homedir"
done < $SOURCE_DIR

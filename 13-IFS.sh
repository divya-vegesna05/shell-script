#!/bin/bash
SOURCE_FILE="/etc/passwd"
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
NORMAL="\e[0m"
if [ ! -f $SOURCE_FILE ]
then
echo "$RED ERROR: $SOURCE_FILE doesnot exist $NORMAL"
fi
while IFS=":" read -r username password userid groupid userid_info homedir command
do
echo "username is $username"
echo "userid is $userid"
echo "homedir is $homedir"
done < $SOURCE_FILE

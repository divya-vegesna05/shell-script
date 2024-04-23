#!/bin/bash
ID=$(id -u)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOGFILE="/tmp/$0_$TIMESTAMP.log"
RED="\e[31m"
GREEN="\e[31m"
YELLOW="\e[33m"
VALIDATE(){
    if [ $1 -ne 0 ]
    then
      echo -e "$RED Error: $2 failed"
    else
      echo -e "$GREEN: $2 success"
    fi
}
if [ $ID -ne 0 ]
then
echo "ERROR: please use root access" 
else
echo "root user"
fi
for package in $@ 
do 
yum list installed $package
if [ $? -ne 0 ]
then
yum install $package -y
else
echo "$package already installed $YELLOW skipping..."
fi
done

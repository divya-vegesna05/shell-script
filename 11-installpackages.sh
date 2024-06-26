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
      exit 1
    else
      echo -e "$GREEN: $2 success"
    fi
}
if [ $ID -ne 0 ]
then
echo -e "$RED ERROR: please use root access" 
else
echo "root user"
fi
for package in $@ 
do 
yum list installed $package &>> $LOGFILE
if [ $? -ne 0 ]
then
yum install $package -y &>> $LOGFILE
else
echo -e "$package already installed $YELLOW skipping..."
fi
done

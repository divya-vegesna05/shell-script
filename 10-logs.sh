#!/bin/bash
ID=$(id -u)
RED="\e[31m"
GREEN="\e[31m"
NORMAL="\e[0m"
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOGFILE=/tmp/$0_$TIMESTAMP.log
echo "current time is $TIMESTAMP"
VALIDATE(){
if [ $1 -ne 0 ]
then
echo "Error: $2 $RED failed "
else
echo "$2 $GREEN success"
fi
}
if [ $ID -ne 0 ]
then
echo "$RED ERROR: not a root user"
exit 1
else
echo "root user"
fi 
yum install mysql -y &>> $LOGFILE
VALIDATE $? "installing mysql"
yum install git -y &>> $LOGFILE
VALIDATE $? "installing git"
#!/bin/bash
ID=$(id -u)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOGFILE=/tmp/$0_$TIMESTAMP.log
VALIDATE(){
if [ $1 -ne 0 ]
then
echo "Error: $2 failed"
else
echo "$2 success"
fi
}
if [ $ID -ne 0 ]
then
echo "not a root user"
exit 1
else
echo "root user"
fi 
yum install mysql -y &>> $LOGFILE
VALIDATE $? "installing mysql"
yum install git -y &>> $LOGFILE
VALIDATE $? "installing git"
#!/bin/bash
ID=$(id -u)
if [ $ID -ne 0 ]
then
echo "not a root user"
else
echo "root user"
fi 
yum install mysql -y
if [ $? -ne 0 ]
then
echo "install failed"
else
echo "installation success"
fi
#!/bin/bash
AMI_IMAGE=ami-0f3c7d07486cad139
SG_ID=sg-0e0ea845438880613
SUBNET_ID="subnet-042abd3162d58609f"
INSTANCES=("web" "cart" "catalogue" "shipping" "user" "mysql")
for i in "${INSTANCES[@]}"
do
if [ $i == "mysql" ] || [ $i == "shipping" ]
then
    INSTANCE_TYPE="t3.small"
else
    INSTANCE_TYPE="t2.micro"
fi
PrivateIpAddress=$(aws ec2 run-instances --image-id $AMI_IMAGE --count 1 --instance-type $INSTANCE_TYPE --security-group-ids $SG_ID --tag-specifications --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$i}]" --query 'Instances[0].PrivateIpAddress' --output text)
echo $i:$PrivateIpAddress
done
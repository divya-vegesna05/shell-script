#!/bin/bash
AMI_IMAGE=ami-0f3c7d07486cad139
SG_ID=sg-0e0ea845438880613
SUBNET_ID="subnet-042abd3162d58609f"
INSTANCES=("web" "cart" "catalogue" "shipping" "user" "mysql")
ZONE_ID=Z07231219S408J0QGA3I
DOMAIN_NAME="jasritha.tech"
for i in "${INSTANCES[@]}"
do
if [ $i == "mysql" ] || [ $i == "shipping" ]
then
    INSTANCE_TYPE="t3.small"
else
    INSTANCE_TYPE="t2.micro"
fi
PrivateIpAddress=$(aws ec2 run-instances --image-id $AMI_IMAGE --count 1 --instance-type $INSTANCE_TYPE --security-group-ids $SG_ID --tag-specifications --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$i}]" --query 'Instances[0].PrivateIpAddress' --output text)
PublicIpAddress=$(aws ec2 run-instances --image-id $AMI_IMAGE --count 1 --instance-type $INSTANCE_TYPE --security-group-ids $SG_ID --tag-specifications --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$i}]" --query 'Instances[0].PublicIpAddress' --output text)
echo $i:$PrivateIpAddress
if [ "$i" != "web" ]
then
aws route53 change-resource-record-sets \
  --hosted-zone-id $ZONE_ID \
  --change-batch '
  {
    "Comment": "Testing creating a record set"
    ,"Changes": [{
      "Action"              : "CREATE"
      ,"ResourceRecordSet"  : {
        "Name"              : "'$i'.'$DOMAIN_NAME'"
        ,"Type"             : "A"
        ,"TTL"              : 1
        ,"ResourceRecords"  : [{
            "Value"         : "'$PrivateIpAddress'"
        }]
      }
    }]
  }'
else
aws route53 change-resource-record-sets \
  --hosted-zone-id $ZONE_ID \
  --change-batch '
  {
    "Comment": "Testing creating a record set"
    ,"Changes": [{
      "Action"              : "CREATE"
      ,"ResourceRecordSet"  : {
        "Name"              : "'$i'.'$DOMAIN_NAME'"
        ,"Type"             : "A"
        ,"TTL"              : 1
        ,"ResourceRecords"  : [{
            "Value"         : "'$PublicIpAddress'"
        }]
      }
    }]
  }'
fi
done
#!/bin/bash

echo "Starting server installation....."

# update the system
yum update -y

# install httpd
yum install httpd -y

# start the httpd apache service
service httpd start

# ensure it runs every time
chkconfig httpd on

# download file from s3 into the region in which this ec2 instance is
aws s3 cp --recursive s3://firststaticwebsite-s3bucket/source/ /var/www/html/ --region us-west-2

echo ".... server installation finished"

#we are using this script for auto-scaling EC2 instances
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

# download file from s3
aws s3 cp s3://firststaticwebsite-s3bucket/ /var/www/html/

echo ".... server installation finished"
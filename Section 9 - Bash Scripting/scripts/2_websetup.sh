#!/bin/bash

# Installing Dependencies
echo "####################################"
echo "Installing packages"
echo "####################################"
sudo yum install wget unzip httpd -y > /dev/null # will be redirect to null if there are no errors
echo

# Start & enable Service
echo "####################################"
echo "Start & Enable HTTPD Service"
echo "####################################"
sudo systemctl start httpd
sudo systemctl enable httpd
echo

# Creating Temp Directory
echo "####################################"
echo "Start Artifact Deployment"
echo "####################################"
mkdir -p /tmp/webfiles # -p to ignore errors if dir exists
cd /tmp/webfiles
echo

wget https://www.tooplate.com/zip-templates/2098_health.zip > /dev/null
unzip 2098_health.zip > /dev/null
sudo cp -r 2098_health/* /var/www/html/
echo

# Open ports in firewalld
echo "####################################"
echo "Open ports in firewalld"
echo "####################################"
sudo firewall-cmd --add-service=http --add-service=https --permanent
sudo systemctl reload firewalld
echo

# Bounce Service
echo "####################################"
echo "Restarting HTTPD service"
echo "####################################"
systemctl restart httpd
echo

# Clean Up
echo "####################################"
echo "Removing Temporary Files"
echo "####################################"
rm -rf /tmp/webfiles
echo

# Show httpd status and copied files
echo "####################################"
echo "Show httpd status"
echo "####################################"
sudo systemctl status httpd
echo

# Show copied files
echo "####################################"
echo "Show copied files"
echo "####################################"
ls /var/www/html
echo

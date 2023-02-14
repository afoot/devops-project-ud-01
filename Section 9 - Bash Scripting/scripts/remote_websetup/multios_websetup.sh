#!/bin/bash

# Variable Declaration
#PACKAGE="httpd wget unzip"
#SVC="httpd"
URL='https://www.tooplate.com/zip-templates/2098_health.zip'
ART_NAME='2098_health'
TEMPDIR="/tmp/webfiles"

yum --help &> /dev/null

if [ $? -eq 0 ]
then
  # Set variables for CentOS  
  PACKAGE="httpd wget unzip"
  SVC="httpd"
  echo "Running Setup on CentOS" 
 
  # Installing Dependencies
  echo "####################################"
  echo "Installing packages"
  echo "####################################"
  sudo yum install $PACKAGE -y > /dev/null # will be redirect to null if there are no errors
  echo

  # Start & enable Service
  echo "####################################"
  echo "Start & Enable HTTPD Service"
  echo "####################################"
  sudo systemctl start $SVC
  sudo systemctl enable $SVC
  echo

  # Creating Temp Directory
  echo "####################################"
  echo "Start Artifact Deployment"
  echo "####################################"
  mkdir -p $TEMPDIR # -p to ignore errors if dir exists
  cd $TEMPDIR
  echo

  sudo wget $URL > /dev/null
  sudo unzip $ART_NAME.zip > /dev/null
  sudo cp -r $ART_NAME/* /var/www/html/
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
  echo "Restarting httpd service"
  echo "####################################"
  sudo systemctl restart $SVC
  echo

  # Clean Up
  echo "####################################"
  echo "Removing Temporary Files"
  echo "####################################"
  rm -rf $TEMPDIR
  echo

  # Show httpd status and copied files
  echo "####################################"
  echo "Show httpd status"
  echo "####################################"
  sudo systemctl status $SVC
  echo

  # Show copied files
  echo "####################################"
  echo "Show copied files"
  echo "####################################"
  ls /var/www/html
  echo

else
  # Set variables for Ubuntu
  PACKAGE="apache2 wget unzip"
  SVC="apache2"
  echo "Running Setup on Ubuntu" 
 
  # Installing Dependencies
  echo "####################################"
  echo "Installing packages"
  echo "####################################"
  sudo apt-get update
  sudo apt-get install $PACKAGE -y > /dev/null # will be redirect to null if there are no errors
  echo

  # Start & enable Service
  echo "####################################"
  echo "Start & Enable HTTPD Service"
  echo "####################################"
  sudo systemctl start $SVC
  sudo systemctl enable $SVC
  echo

  # Creating Temp Directory
  echo "####################################"
  echo "Start Artifact Deployment"
  echo "####################################"
  mkdir -p $TEMPDIR # -p to ignore errors if dir exists
  cd $TEMPDIR
  echo

  sudo wget $URL > /dev/null
  sudo unzip $ART_NAME.zip > /dev/null
  sudo cp -r $ART_NAME/* /var/www/html/
  echo

  # Open ports in firewalld
#  echo "####################################"
#  echo "Open ports in firewalld"
#  echo "####################################"
#  sudo firewall-cmd --add-service=http --add-service=https --permanent
#  sudo systemctl reload firewalld
#  echo

  # Bounce Service
  echo "####################################"
  echo "Restarting httpd service"
  echo "####################################"
  sudo systemctl restart $SVC
  echo

  # Clean Up
  echo "####################################"
  echo "Removing Temporary Files"
  echo "####################################"
  sudo rm -rf $TEMPDIR
  echo

  # Show httpd status and copied files
  echo "####################################"
  echo "Show httpd status"
  echo "####################################"
  sudo systemctl status $SVC
  echo

  # Show copied files
  echo "####################################"
  echo "Show copied files"
  echo "####################################"
  ls /var/www/html
  echo
fi

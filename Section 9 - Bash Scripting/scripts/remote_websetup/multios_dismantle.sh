#!/bin/bash

yum --help &> /dev/null

if [ $? -eq 0 ]
then
  # Set variables for CentOS
  PACKAGE="httpd"
  HTML_DIR=/var/www/html/

  echo
  echo "########################################"
  echo "Stop $PACKAGE service"
  echo "########################################"
  sudo systemctl stop $PACKAGE
  echo
  echo "########################################"
  echo "Clean html folder"
  echo "########################################"
  sudo rm -rf $HTML_DIR*
  echo
  echo "########################################"
  echo "Remove $PACKAGE service"
  echo "########################################"
  sudo yum remove $PACKAGE -y
  sudo yum autoremove -y
  echo
  echo "########################################"
  echo "All cleaned, $PACKAGE uninstalled"
  echo "########################################"
  echo
  echo "########################################"
  echo "Checking html folder"
  echo "########################################"
  ls $HTML_DIR
  echo
  echo "########################################"
  echo "Checking $PACKAGE service"
  echo "########################################"
  sudo systemctl status $PACKAGE

else
  # Set variables for Ubuntu
  PACKAGE="apache2"
  HTML_DIR=/var/www/html/

  echo
  echo "########################################"
  echo "Stop $PACKAGE service"
  echo "########################################"
  sudo systemctl stop $PACKAGE
  echo
  echo "########################################"
  echo "Clean html folder"
  echo "########################################"
  sudo rm -rf $HTML_DIR*
  echo
  echo "########################################"
  echo "Remove $PACKAGE service"
  echo "########################################"
  sudo apt-get update
  sudo apt-get purge $PACKAGE -y
  sudo apt-get autoremove --purge -y
  echo
  echo "########################################"
  echo "All cleaned, $PACKAGE uninstalled"
  echo "########################################"
  echo
  echo "########################################"
  echo "Checking html folder with ls"
  echo "########################################"
  ls $HTML_DIR
  echo
  echo "########################################"
  echo "Checking $PACKAGE service"
  echo "########################################"
  sudo systemctl status $PACKAGE
fi

#!/bin/bash

echo "#####################################################"
date
#ls /var/run/httpd/httpd.pid &> /dev/null

if [ -f /var/run/httpd/httpd.pid ] # -f checks if file exists or not
then
  echo "httpd process is running."
else
  echo "httpd process is NOT running."
  echo "Starting the process."
  systemctl start httpd
  if [ $? -eq 0 ] # -eq equal =
  then
    echo "Process started successfully."
  else
    echo "Process starting failed, contact the admin."
  fi
fi
echo "#####################################################"
echo

#!/bin/bash

echo "#####################################################"
date
ls /var/run/httpd/httpd.pid &> /dev/null

if [ $? -eq 0 ] # -eq equal =
then
  echo "httpd process is running."
else
  echo "httpd process is NOT running."
  echo "Starting the process."
  systemctl start httpd
  if [ $? -eq 0 ]
  then
    echo "Process started successfully."
  else
    echo "Process starting failed, contact the admin."
  fi
fi
echo "#####################################################"
echo

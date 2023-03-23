#!/bin/bash

value=$(ip a | grep -v LOOPBACK | grep -ic mtu) 
# grep -v excludes string
# grep -ic counts how many times there are value

if [ $value -eq 1 ] # -eq equal =
then
  echo "1 Active Network Interface found."
elif [ $value -gt 1 ]
then
  echo "Found multiple active interfaces."
else
  echo "No active interace found."
fi

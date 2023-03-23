#!/bin/bash

echo
echo
echo "Welcome $USER on $HOSTNAME."
echo "###############################################"

# () or `` to use commands as vars

FREERAM=$(free -m | grep Mem | awk '{print $4}')
LOAD=`uptime | awk '{print $9}'`
ROOTFREE=$(df -h | grep '/dev/mapper/centos-root' | awk '{print $4}')

echo
echo "###############################################"
echo "Avalaible free RAM is $FREERAM MB"
echo "###############################################"
echo "Current Load Average $LOAD"
echo "###############################################"
echo "Free ROOT partition size is $ROOTFREE"
echo
echo

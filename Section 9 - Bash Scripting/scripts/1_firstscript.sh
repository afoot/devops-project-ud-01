#!/bin/bash

### This script prints system info ###
echo "Welcome to bash script."
echo

# checking system uptime 
echo "####################################"
echo "The uptime of the system is: "
uptime
echo


# Memory Utilization
echo "####################################"
echo "Memory Utilization"
free -h
echo

# Disk Utilization
echo "####################################"
echo "Disk Utulization"
df -h

#!/bin/bash

for VAR1 in java .net python ruby php
do
  echo "Looping..."
  sleep 1 # sleep just needed to execute command slower
  echo "#########################################"
  echo "Value of VAR1 is $VAR1."
  echo "#########################################"
  date
  echo
done

#!/bin/bash

counter=0

while [ $counter -lt 5 ] # -lt less then
do
  echo "Looping..."
  echo "Value of counter is $counter."
  counter=$(( $counter + 1 ))
  sleep 1 # using sleep 1 sec just to slow down execution
done

echo "Out of loop"

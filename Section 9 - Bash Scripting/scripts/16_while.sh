#!/bin/bash

counter=3

while true
do
  echo "Looping..."
  echo "Value of counter is $counter."
  counter=$(( $counter * 10 ))
  #sleep 1 # using sleep 1 sec just to slow down execution
done

echo "Out of loop"

#!/bin/bash

USR='devops'

for host in `cat remhosts`
do
  echo
  echo "##############################################"
  echo "Connecting to $host"
  echo "Pushing script to $host"
  scp multios_websetup.sh $USR@$host:/tmp/
  echo "Executing script on $host"
  ssh $USR@$host sudo /tmp/multios_websetup.sh
  ssh $USR@$host sudo rm -rf /tmp/multios_websetup.sh
  echo "##############################################"
  echo
done

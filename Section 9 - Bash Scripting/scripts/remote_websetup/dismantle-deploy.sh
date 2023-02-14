#!/bin/bash

USR='devops'

for host in `cat remhosts`
do
  echo
  echo "##############################################"
  echo "Connecting to $host"
  echo "Pushing script to $host"
  scp multios_dismantle.sh $USR@$host:/tmp/
  echo "Executing script on $host"
  ssh $USR@$host /tmp/multios_dismantle.sh
  ssh $USR@$host sudo rm -rf /tmp/multios_dismantle.sh
  echo "##############################################"
  echo
done

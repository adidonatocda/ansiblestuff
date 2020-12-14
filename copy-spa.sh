#!/bin/bash
# Read Password
echo -n Password: 
read -s password
echo
# Run Command
echo $password

file=asa-restapi-7141-lfbff-k8.SPA
user=ansible

for device in $(cat device.txt)
do
 sshpass -p $password  scp -o KexAlgorithms=+diffie-hellman-group1-sha1 -o StrictHostKeyChecking=no $file $user@$device:disk0:$file
done
wait


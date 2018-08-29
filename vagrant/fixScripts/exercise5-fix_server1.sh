#!/bin/bash
#add fix to exercise5-server1 here
sudo apt-get install sshpass
ssh-keygen -t rsa -b 2048 -N "" -f .ssh/id_rsa -q
ssh-keyscan -H 192.168.100.11 >> .ssh/known_hosts
sshpass -p vagrant ssh-copy-id -i .ssh/id_rsa.pub vagrant@192.168.100.11
#!/bin/bash
#add fix to exercise5-server2 here
sudo apt-get install sshpass
ssh-keygen -t rsa -b 2048 -N "" -f .ssh/id_rsa -q
ssh-keyscan -H 192.168.100.10 >> .ssh/known_hosts
sshpass -p vagrant ssh-copy-id -i .ssh/id_rsa.pub vagrant@192.168.100.10
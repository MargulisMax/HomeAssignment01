#!/bin/bash
#add fix to exercise5-server2 here
sudo apt-get install sshpass
ssh-keygen -t rsa -b 2048 -N "" -f ~/.ssh/id_rsa -q
sshpass -p vagrant ssh-copy-id -i ~/.ssh/id_rsa.pub vagrant@server1
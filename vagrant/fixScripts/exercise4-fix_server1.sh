#!/bin/bash
#add fix to exercise4-server1 here

#sudo sh -c "echo 192.168.100.11  server2 >> /etc/hosts"
sudo sed -i '2 a 192.168.100.11 server2' /etc/hosts
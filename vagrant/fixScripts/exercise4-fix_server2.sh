#!/bin/bash
#add fix to exercise4-server2 here

#sudo sh -c "echo 192.168.100.10  server1 >> /etc/hosts"
sudo sed -i '2 a 192.168.100.10 server1' /etc/hosts
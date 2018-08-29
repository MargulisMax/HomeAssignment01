#!/bin/bash
#add fix to exercise5-server2 here
sudo apt-get install sshpass
ssh-keygen -t rsa -b 2048 -N "" -f .ssh/id_rsa -q
#ssh-keyscan -H 192.168.100.10 >> .ssh/known_hosts
chown vagrant:vagrant .ssh/*
#sshpass -p vagrant ssh-copy-id -i .ssh/id_rsa.pub vagrant@192.168.100.10

echo '#!/bin/bash' > /tmp/sshostup.sh
echo "exec &> /tmp/capture.log" >> /tmp/sshostup.sh
echo "while [ \`ping -c 1 server1; echo \$?\` != 0 ]; do sleep 10; done" >> /tmp/sshostup.sh
echo "su vagrant -c 'ssh-keyscan -H server1 >> /home/vagrant/.ssh/known_hosts'" >> /tmp/sshostup.sh
echo "sshpass -p vagrant ssh-copy-id -i /home/vagrant/.ssh/id_rsa.pub vagrant@server1" >> /home/vagrant/.bashrc
echo "chown vagrant:vagrant .ssh/known_hosts" >> /tmp/sshostup.sh 

bash /tmp/sshostup.sh &

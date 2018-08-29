#!/bin/bash
#add fix to exercise5-server1 here
sudo apt-get install sshpass
ssh-keygen -t rsa -b 2048 -N "" -f .ssh/id_rsa -q
chown vagrant:vagrant .ssh/*

echo '#!/bin/bash' > /tmp/sshostup.sh
echo "exec &> /tmp/capture.log" >> /tmp/sshostup.sh
echo "while [ \`nc -z -w 2 192.168.100.11 22; echo \$?\` != 0 ]; do sleep 10; done" >> /tmp/sshostup.sh
echo "su vagrant -c 'ssh-keyscan -H server2 >> /home/vagrant/.ssh/known_hosts'" >> /tmp/sshostup.sh
echo "sshpass -p vagrant ssh-copy-id -o StrictHostkeyChecking=no -i /home/vagrant/.ssh/id_rsa.pub vagrant@server2" >> /tmp/sshostup.sh
echo "chown vagrant:vagrant .ssh/known_hosts" >> /tmp/sshostup.sh 

bash /tmp/sshostup.sh &

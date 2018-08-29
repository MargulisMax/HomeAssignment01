#!/bin/bash
#add fix to exercise5-server2 here
sudo apt-get install sshpass
<<<<<<< HEAD
ssh-keyscan server1 >> .ssh/known_hosts
ssh-keygen -t rsa -b 2048 -N "" -f ~/.ssh/id_rsa -q
sshpass -p vagrant ssh-copy-id -i ~/.ssh/id_rsa.pub vagrant@server1
=======
ssh-keygen -t rsa -b 2048 -N "" -f .ssh/id_rsa -q
#ssh-keyscan -H 192.168.100.10 >> .ssh/known_hosts
chown vagrant:vagrant .ssh/*
#sshpass -p vagrant ssh-copy-id -i .ssh/id_rsa.pub vagrant@192.168.100.10

echo '#!/bin/bash' > /tmp/sshostup.sh
echo "exec &> /tmp/capture.log" >> /tmp/sshostup.sh
echo "while [ \`ping -c 1 server1; echo \$?\` != 0 ]; do sleep 10; done" >> /tmp/sshostup.sh
echo "su vagrant -c 'ssh-keyscan -H server1 >> /home/vagrant/.ssh/known_hosts'" >> /tmp/sshostup.sh
echo "sshpass -p vagrant ssh-copy-id -o StrictHostkeyChecking=no -i /home/vagrant/.ssh/id_rsa.pub vagrant@server1" >> /tmp/sshostup.sh
echo "chown vagrant:vagrant .ssh/known_hosts" >> /tmp/sshostup.sh 

bash /tmp/sshostup.sh &
>>>>>>> 2700fbdc5bcac3bb8ff37ca44b7f717c5ae956d2

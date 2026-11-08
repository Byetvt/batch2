20261108 - change install to git pull, old scripts are obsolete
wget -q "https://raw.githubusercontent.com/Byetvt/batch2/main/ansible-SETUP.sh" -O "ansible-SETUP.sh"
$HOME/ansible-SETUP.sh 









----

$HOME/setup-ansible.sh 

cd $HOME/ansible-config

ansible-playbook main.yml --ask-become-pass


.


.

.

rem $HOME/ansible-config is the working directory

rem normal -  ansible-playbook main.yml -i "localhost," -c local -K

rem debug  -  ANSIBLE_LOG_PATH=./ansible_debug.log ansible-playbook main.yml -i "localhost," -c local -K -vvv


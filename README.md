
$HOME/setup-ansible.sh 

cd $HOME/ansible-config

ansible-playbook main.yml --ask-become-pass


.

.

.

.

rem $HOME/ansible-config is the working directory

rem normal -  ansible-playbook main.yml -i "localhost," -c local -K

rem debug  -  ANSIBLE_LOG_PATH=./ansible_debug.log ansible-playbook main.yml -i "localhost," -c local -K -vvv


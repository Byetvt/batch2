# batch2
Improved

$HOME/setup-ansible.sh 
cd $HOME/ansible-config

#$HOME/ansible-config is the working directory

ansible-playbook main.yml --ask-become-pass

# normal  ansible-playbook main.yml -i "localhost," -c local -K
# debug   ANSIBLE_LOG_PATH=./ansible_debug.log ansible-playbook main.yml -i "localhost," -c local -K -vvv

# Setup Instructions

> **Note (2026-11-08):** Installation process updated to `git pull`. Older setup scripts are obsolete.

---

## Download Setup Script

To download the setup script directly:

```bash
wget -q "https://raw.githubusercontent.com/Byetvt/batch2/main/ansible-SETUP.sh" -O "ansible-SETUP.sh" && chmod 755 "ansible-SETUP.sh"


















.


.
.
.
```old


20261108 - change install to git pull, old scripts are obsolete

wget -q "https://raw.githubusercontent.com/Byetvt/batch2/main/ansible-SETUP.sh" -O "ansible-SETUP.sh"

.

or this to bypass cache
.

wget --no-cache --header="Cache-Control: no-cache" -q "https://raw.githubusercontent.com/Byetvt/batch2/main/ansible-SETUP.sh?$(date +%s)" -O "ansible-SETUP.sh"
.

$HOME/ansible-SETUP.sh 


----

cd $HOME/ansible-config

ansible-playbook main.yml --ask-become-pass


.


.

.

rem $HOME/ansible-config is the working directory

rem normal -  ansible-playbook main.yml -i "localhost," -c local -K

rem debug  -  ANSIBLE_LOG_PATH=./ansible_debug.log ansible-playbook main.yml -i "localhost," -c local -K -vvv


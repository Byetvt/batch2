#!/bin/bash

#source $HOME/setup-ansible.sh

# Define the target path
TARGET_DIR="$HOME/ansible-config"

# 1. Create the config directory if it doesn't exist
if [ ! -d "$TARGET_DIR" ]; then
    echo "Directory $TARGET_DIR does not exist. Creating it now..."
    mkdir -p "$TARGET_DIR"
    echo "Success: Directory created."
else
    echo "Directory $TARGET_DIR already exists. No action needed."
fi

# 2. Check if Ansible is installed
if ! command -v ansible &> /dev/null; then
    echo "Ansible is not installed. Starting installation..."

    # Update package list and install prerequisites
    sudo apt update
    sudo apt install -y software-properties-common

    # Add the official Ansible PPA
    sudo add-apt-repository --yes --update ppa:ansible/ansible

    # Install Ansible
    sudo apt install -y ansible

    echo "Ansible installation complete."
else
    echo "Ansible is already installed: $(ansible --version | head -n 1)"
fi

# 3. Change directory to the config folder
cd "$TARGET_DIR" || exit
echo "Current directory: $(pwd)"

# 4. Download YAML files into the target directory
echo "Downloading Ansible playbooks to $TARGET_DIR..."

wget -q "https://raw.githubusercontent.com/Byetvt/batch2/main/main.yml" -O "$TARGET_DIR/main.yml"
wget -q "https://raw.githubusercontent.com/Byetvt/batch2/main/ansible_bash.yml" -O "$TARGET_DIR/ansible_bash.yml"
wget -q "https://raw.githubusercontent.com/Byetvt/batch2/main/ansible_flatpaks.yml" -O "$TARGET_DIR/ansible_flatpaks.yml"
wget -q "https://raw.githubusercontent.com/Byetvt/batch2/main/ansible_packages.yml" -O "$TARGET_DIR/ansible_packages.yml"
wget -q "https://raw.githubusercontent.com/Byetvt/batch2/main/setup_ai_stack.yml" -O "$TARGET_DIR/setup_ai_stack.yml"
wget -q "https://raw.githubusercontent.com/Byetvt/batch2/main/remove_ai_stack.yml" -O "$TARGET_DIR/remove_ai_stack.yml"


echo "Download complete."

# 5. Display helpful usage commands
echo "----------------------------------------------------------------"
echo "Usage Tips:"
echo "Full debug install == ANSIBLE_LOG_PATH=./ansible_debug.log ansible-playbook main.yml -vvv"
echo "just run install   == ansible-playbook main.yml --ask-become-pass"
echo "----------------------------------------------------------------"


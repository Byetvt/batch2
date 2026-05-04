#!/bin/bash

# Configuration
REPO_API="https://api.github.com/repos/Byetvt/batch2/contents/"
RAW_BASE_URL="https://raw.githubusercontent.com/Byetvt/batch2/main"
OUTPUT_PLAYBOOK="get_ansible_config_repo.yml"
DEST_DIR="~/github-ansible-pull-all"

echo "Generating Ansible playbook: $OUTPUT_PLAYBOOK"

# Start writing the playbook header
cat <<EOF > $OUTPUT_PLAYBOOK
---
- name: Dynamic File Sync from GitHub
  hosts: localhost
  tasks:
    - name: Ensure destination directory exists
      file:
        path: $DEST_DIR
        state: directory
        mode: '0755'

    - name: Download filtered files
      get_url:
        url: "{{ item.url }}"
        dest: "{{ item.dest }}"
        mode: "{{ item.mode }}"
        force: yes
      loop:
EOF

# Fetch file list from API and append tasks to the loop
# We use '0755' for scripts (.sh, .py) and '0644' for yaml
curl -s "$REPO_API" | grep -oP '"name": "\K[^"]+' | grep -E '\.(yml|sh|py|md|txt)$' | while read -r FILE; do
    if [[ $FILE == *.yml ]]; then
        MODE="0644"
    else
        MODE="0755"
    fi
    
    echo "        - { url: '$RAW_BASE_URL/$FILE', dest: '$DEST_DIR/$FILE', mode: '$MODE' }" >> $OUTPUT_PLAYBOOK
done

echo "Success! You can now run: ansible-playbook $OUTPUT_PLAYBOOK"

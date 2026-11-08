# not executable on the main ansible box
## wget -q "https://raw.githubusercontent.com/Byetvt/batch2/main/ansible-SETUP.sh" -O "ansible-SETUP.sh"
## $HOME/ansible-SETUP.sh 

#!/usr/bin/env bash
set -euo pipefail

REPO_URL="https://github.com/Byetvt/batch2.git"
DEST="$HOME/ansible-config"
PLAYBOOK="main.yml"

# 1. Check if Ansible and Git are installed using baseline repositories
##sudo apt install -y software-properties-common
##sudo add-apt-repository --yes --update ppa:ansible/ansible

for pkg in ansible git; do
    if ! command -v "$pkg" &> /dev/null; then
        echo "$pkg is not installed. Installing baseline package..."
        sudo apt update
        sudo apt install -y "$pkg"
        echo "$pkg installation complete."
    else
        echo "$pkg is already installed: $($pkg --version | head -n 1)"
    fi
done

# 2. Update existing checkout or delete and pull fresh repo, then run playbook
read -r -p "Pull latest changes only, or delete folder and pull full repo? [update/delete] (default: update) " answer
case "${answer:-update}" in
    [dD]|[dD][eE][lL][eE][tT][eE]|[fF][uU][lL][lL])
        echo "Deleting $DEST and pulling full repo..."
        rm -rf "$DEST"
        ansible-pull -U "$REPO_URL" -d "$DEST" -f "$PLAYBOOK" -i "localhost," -c local -K
        ;;
    *)
        echo "Pulling latest changes into existing checkout..."
        ansible-pull -U "$REPO_URL" -d "$DEST" -f "$PLAYBOOK" -i "localhost," -c local -K
        ;;
esac





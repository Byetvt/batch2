# not executable on the main ansible box
# wget -q "https://raw.githubusercontent.com/Byetvt/batch2/main/ansible-SETUP.sh" -O "ansible-SETUP.sh"
# or this to bypass cache
# wget --no-cache --header="Cache-Control: no-cache" -q "https://raw.githubusercontent.com/Byetvt/batch2/main/ansible-SETUP.sh?$(date +%s)" -O "ansible-SETUP.sh"
## $HOME/ansible-SETUP.sh 

#!/usr/bin/env bash
set -euo pipefail

REPO_URL="https://github.com/Byetvt/batch2.git"
DEST="$HOME/ansible-config"
PLAYBOOK="main.yml"

# 1. Check if Ansible and Git are installed using baseline repositories
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

# 2. Update existing checkout or delete and clone fresh repo via Git
read -r -p "Pull latest changes only, or delete folder and clone fresh repo? [update/delete] (default: update) " answer
case "${answer:-update}" in
    [dD]|[dD][eE][lL][eE][tT][eE]|[fF][uU][lL][lL])
        echo "Deleting $DEST and cloning fresh repo..."
        rm -rf "$DEST"
        git clone "$REPO_URL" "$DEST"
        ;;
    *)
        if [ -d "$DEST/.git" ]; then
            echo "Pulling latest changes into existing checkout..."
            git -C "$DEST" pull
        else
            echo "Directory exists but is not a git repo. Cloning fresh..."
            rm -rf "$DEST"
            git clone "$REPO_URL" "$DEST"
        fi
        ;;
esac

# 3. Change directory to ansible-config and run playbook interactively
echo "Switching to $DEST and running playbook..."
cd "$DEST"
ansible-playbook "$PLAYBOOK" -i "localhost," -c local -K

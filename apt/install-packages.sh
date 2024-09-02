#!/bin/bash

# Update and upgrade the system
sudo apt update && sudo apt upgrade -y

# Install basic packages
sudo apt install -y \
    build-essential \
    curl \
    fuse \
    fuseiso \
    git \
    git-lfs \
    # google-drive-ocamlfuse \
    wget \
    vim \
    unzip \
    gnupg2 \
    apt-transport-https \
    ca-certificates \
    software-properties-common

# Install data entry wares
sudo apt install -y \
    master-pdf-editor-*
# Install graphic desktop enhancements
sudo apt install -y \
    breeze-cursor-theme \
    breeze-icon-theme

# Fetch the latest NVM release and install it
LATEST_NVM=$(curl -s https://api.github.com/repos/nvm-sh/nvm/releases/latest | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/${LATEST_NVM}/install.sh | bash

# Source NVM and install the latest LTS version of Node.js
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install --lts

# Install TypeScript globally
npm install -g typescript

# Install common Node.js packages
npm install -g \
    depcheck \
    npm-check-updates \
    npm-completion

# Setup GPG for signing commits and messages
sudo apt install -y \
    gnupg \
    pinentry-curses

# Install Docker
sudo apt install -y \
    docker.io \
    docker-compose
sudo usermod -aG docker $USER

# Install Infrastructure Toolkits

## AWS
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# Install privacy and security tools
sudo apt install -y \
    ufw \
    fail2ban \
    keepassxc \
    signal-desktop

# Enable firewall
sudo ufw enable

# Setup fail2ban
sudo systemctl enable fail2ban
sudo systemctl start fail2ban

# Setup Gnome Keyring
sudo apt install gcc make libsecret-1-0 libsecret-1-dev
sudo make -C /usr/share/doc/git/contrib/credential/libsecret

# Cleanup
sudo apt autoremove -y

echo "Setup complete! Please restart your computer to ensure all changes take effect."

#!/bin/bash
# Function to install Ansible
install_ansible() {
    sudo apt update
    sudo apt install -y software-properties-common
    
    # Add Ansible PPA and install Ansible
    sudo add-apt-repository --yes --update ppa:ansible/ansible
    sudo apt install -y ansible
}

# Check for arguments
if [ "$#" -gt 0 ]; then
    echo "Running only the Ansible playbook..."
    ansible-playbook setup.yml --ask-become-pass
else
    echo "Installing Ansible..."
    install_ansible
    echo "Running the Ansible playbook..."
    ansible-playbook setup.yml --ask-become-pass
fi

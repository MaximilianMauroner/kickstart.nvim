#!/bin/bash
sudo apt update
sudo apt install -y software-properties-common

# Add Ansible PPA and install Ansible
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install -y ansible

ansible-playbook setup.yml --ask-become-pass

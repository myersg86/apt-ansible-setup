#!/bin/bash
set -xv
# Install dependencies & recommendations
sudo dpkg --configure --pending &&
sudo dpkg --configure -a &&
sudo apt-get install apt aptitude apt-listchanges &&
sudo apt-get update &&
sudo apt update &&
sudo apt install -f &&
sudo apt-get install --install-recommends -y aptitude git git-core software-properties-common dirmngr vim python-apt

# Install ansible
if ! grep -q "ansible/ansible" /etc/apt/sources.list /etc/apt/sources.list.d/*; then
    echo "Adding Ansible keys "
	sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367 &&
    echo "Ansible keys added."
    echo ""
    echo "Adding latest Ansible repo to /etc/apt/sources.list "
    sudo sh -c "echo 'deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main' >> /etc/apt/sources.list"
fi

if ! hash ansible >/dev/null 2>&1; then
    echo "Installing Ansible..."#!/bin/bash

# Install dependencies & recommendations
sudo apt update
sudo apt-get install --install-recommends -y git git-core software-properties-common dirmngr vim aptitude python-apt

# Install ansible
if ! grep -q "ansible/ansible" /etc/apt/sources.list /etc/apt/sources.list.d/*; then
    echo "Adding Ansible keys "
	sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367 &&
    echo "Ansible keys added."
    echo ""
    echo "Adding latest Ansible repo to /etc/apt/sources.list "
    sudo sh -c "echo 'deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main' >> /etc/apt/sources.list"
fi

if ! hash ansible >/dev/null 2>&1; then
    echo "Installing Ansible..."
    sudo apt-get update &&
    sudo apt-get install ansible --install-recommends -y
else
    echo "Ansible already installed"
fi

#####################################
# Display real installation process #
echo ""
echo "Prep-work Complete"
echo ""
echo "Ansible installation was successful."
echo ""
echo "You can run playbooks directly from a github repo using:"
echo "ansible-pull -U https://github.com/USER/REPO.git PLAYBOOK.yml"
    sudo apt-get update &&
    sudo apt-get install ansible --install-recommends -y
else
    echo "Ansible already installed"
fi

#####################################
# Display real installation process #
echo ""
echo "Prep-work Complete"
echo ""
echo "Ansible installation was successful."
echo ""
echo "You can run playbooks directly from a github repo using:"
echo "ansible-pull -U https://github.com/USER/REPO.git PLAYBOOK.yml"

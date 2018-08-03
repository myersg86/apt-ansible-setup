#!/bin/bash

# Configure dpkg & install apt utils
sudo dpkg --configure -a &&
sudo apt-get update &&
# Install dependencies & recommendations
sudo apt-get install --install-recommends -y apt aptitude git git-core software-properties-common dirmngr vim python-apt &&

# Install ansible
if ! grep -q "ansible/ansible" /etc/apt/sources.list /etc/apt/sources.list.d/*; then
    echo "Adding Ansible keys "
	sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367 &&
    echo "Ansible keys added."
    echo ""
    echo "Adding latest Ansible repo to /etc/apt/sources.list "
    sudo sh -c "echo 'deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main' >> /etc/apt/sources.list"
    echo "Installing Ansible..."
    sudo apt-get update &&
    sudo apt-get install ansible --install-recommends -y
    sudo sh -c "echo 'alias kahu-ansible=ansible-pull -vvv -U https://github.com/lightcrestops/kahu-ansible.git' >> /root/.bashrc"
else
    echo "Ansible already installed"
fi

#####################################
# Display real installation process #
echo ""
echo "Prep-work Complete"
echo ""
echo "Now, you can run ansible with: "
echo "ansible-playbook PLAYBOOK.yml"
echo "OR"
echo "ansible-pull -U https://github.com/USER/REPO.git PLAYBOOK.yml"
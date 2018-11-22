#!/bin/bash

echo "Installing salt and Git..."
sudo apt-get update
sudo apt-get -y install git salt-master salt-minion

echo "Configuring Git"
git config --global user.email "matias.vanonen@gmail.com"
git config --global user.name "matias"

echo "Configuring the slave"
echo -e "master: 192.168.1.70\nid: matias"|sudo tee /etc/salt/minion
sudo systemctl restart salt-minion.service

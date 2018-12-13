#!/bin/bash

echo "Installing salt and Git..."
sudo apt-get update
sudo apt-get -y install git salt-minion

echo "Installing firewall..."
sudo apt-get -y install ufw
sudo ufw enable
sudo ufw allow 80/tcp
sudo ufw allow 22/tcp

echo "Configuring the slave"
echo -e "master: localhost\nid: matias"|sudo tee /etc/salt/minion
sudo systemctl restart salt-minion.service

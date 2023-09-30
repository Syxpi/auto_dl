#!/bin/bash

# Mise à jour du système
apt update
apt upgrade -y

# Installation des packages + Docker
apt install neofetch htop sudo apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io
sudo systemctl enable docker
sudo systemctl start docker

# Démarrage des conteneurs Docker
docker run -d -p 3000:3000 --name open-speedtest openspeedtest/latest
docker run -d -p 3001:3001 --name uptime-kuma louislam/uptime-kuma
docker run -d -p 19999:19999 --name netdata --cap-add SYS_PTRACE -v /var/run/docker.sock:/var/run/docker.sock:ro titpetric/netdata
docker run -d -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce

docker restart portainer


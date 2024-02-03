#!/bin/bash

# Mise à jour du système
apt update
apt upgrade -y

# Installation des packages + Docker
apt install neofetch htop sudo ca-certificates curl gnupg -y
sudo apt-get update
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
mkdir /home/jellyfin && cd /home/jellyfin && mkdir movies music shows 
curl https://repo.jellyfin.org/install-debuntu.sh | sudo bash

# Démarrage des conteneurs Docker
docker run -d -p 3001:3001 --name uptime-kuma --restart=always louislam/uptime-kuma
docker run -d -p 9443:9443 -p 9000:9000 -p 8000:8000 --http-enabled --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce
docker run -d -p 10011:10011 -p 30033:30033 -p 9987:9987 --restart=always --name teamspeak3 
docker restart portainer


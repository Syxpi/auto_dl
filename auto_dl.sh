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

# Démarrage des conteneurs Docker
docker run -d -p 3000:3000 --name open-speedtest openspeedtest/latest
docker run -d -p 3001:3001 --name uptime-kuma louislam/uptime-kuma
docker run -d -p 19999:19999 --name netdata --cap-add SYS_PTRACE -v /var/run/docker.sock:/var/run/docker.sock:ro titpetric/netdata
docker run -d -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce

docker restart portainer


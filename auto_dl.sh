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

curl https://repo.jellyfin.org/install-debuntu.sh | sudo bash
mkdir -p /jellyfin/movies musics 

# Démarrage des conteneurs Docker
docker run -d -p 3001:3001 --name uptime-kuma --restart=always louislam/uptime-kuma
docker run -d -p 9443:9443 -p 9000:9000 -p 8000:8000 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce 
docker run -d --name=heimdall -e PUID=1000 -e PGID=1000 -e TZ=Etc/UTC -p 8006:80 -p 406:443 -v /home/heimdall:/config --restart=always lscr.io/linuxserver/heimdall:latest
docker restart portainerocker run -d -p 9443:9443 -p 9000:9000 -p 8000:8000 --http-enabled --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce
cd npm
docker compose up -d 
echo "---------------------------------------------------------------------------------------------------------------"
echo "Ports Uptime Kuma : 3001 [TCP]"
echo "" 
echo "Ports Portainer : 9443 (HTTPS) [TCP] | 9000 (HTTP) [TCP] | 8000 (Tunnel) [TCP]"
echo "" 
echo "Ports Heimdall : 8006 (HTTP) [TCP] | 406 (HTTPS) [TCP]"
echo ""
echo "Ports Nginx Proxy Manager : 80 (HTTP) [TCP/UDP] | 81 (Panel Admin HTTP) [TCP/UDP] | 443 (HTTPS) [TCP/UDP]
echo "---------------------------------------------------------------------------------------------------------------"
docker ps
echo "---------------------------------------------------------------------------------------------------------------"

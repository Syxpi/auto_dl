#!/bin/bash

# Mise à jour du système
apt update
apt upgrade -y

# Installation des packages
apt install neofetch htop sudo -y

# Démarrage des conteneurs Docker
docker run -d -p 3000:3000 --name open-speedtest owenvoke/open-speedtest
docker run -d -p 3001:3001 --name uptime-kuma louislam/uptime-kuma
docker run -d -p 19999:19999 --name netdata --cap-add SYS_PTRACE -v /var/run/docker.sock:/var/run/docker.sock:ro titpetric/netdata
docker run -d -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce

apt install ca-certificates gnupg -y
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

docker run -d -p 9443:9443 -p 9000:9000 -p 8000:8000 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce 
sleep 5
docker restart portainer
sleep 2
echo '
+---------------------------------------------+
|                                             |
|         Docker And Portainer Script         |
|                                             |
|                                             |
|         Portainer HTTP Port: 9000           |
|         Portainer HTTPS Port: 9443          |
|                                             |
+---------------------------------------------+
'
echo '
If this Script has occured a error, please open a Issue in my GitHub.
Link : https://github.com/Syxpi/auto_dl/issues/new'
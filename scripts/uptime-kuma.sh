docker run -d -p 3001:3001 --name uptime-kuma --restart=always louislam/uptime-kuma
sleep 0.2
echo '
+---------------------------------------------+
|                                             |
|                 Uptime Kuma                 |
|               Install Script                |
|                                             |
|            Uptime Kuma Port: 3001           |
+---------------------------------------------+
'

echo '
If this Script has occured a error, please open a Issue in my GitHub.
Link : https://github.com/Syxpi/auto_dl/issues/new'
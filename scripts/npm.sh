echo '
⚠ I am not responsible if you lose your data related to Apache2 or NGINX. ⚠

If you can, open another terminal on your Computer, and move the contents of these directories,only if you have them:
/etc/apache2/sites-available [Apache2 only]
/etc/nginx/sites-available [NGINX only]
with the command "mv /etc/[apache2 or nginx]/sites-available/* ."
(The dot represents the current path, if you are on "/home/test", it will move all the files from your web server to /home/test)

I''ll give you 60 seconds from this message to let you move all your files from your webserver
If you don''t have either of these two web services installed, you can just ignore and wait the 60 seconds
'

sleep 60

dpkg -l | grep apache2 
sudo apt-get remove --purge apache2 apache2-utils

dpkg -l | grep nginx
sudo apt-get remove --purge nginx nginx-common

cd ..
cd scripts
cd npm
docker compose up -d 
sleep 0.2
echo '
+---------------------------------------------+
|                                             |
|             Nginx Proxy Manager             |
|               Install Script                |
|                                             |
|              NPM HTTP Port: 80              |
|              NPM HTTPS Port: 443            |
|              NPM Admin Panel: 81            |
+---------------------------------------------+
'
echo '
If this Script has occured a error, please open a Issue in my GitHub.
Link : https://github.com/Syxpi/auto_dl/issues/new'

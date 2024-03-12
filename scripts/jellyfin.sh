curl https://repo.jellyfin.org/install-debuntu.sh | sudo bash
mkdir -p /jellyfin/movies /jellyfin/musics /jellyfin/shows /jellyfin/books /jellyfin/photos /jellyfin/music-videos /jellyfin/movies-shows-mixed
sleep 0.2
echo '
+---------------------------------------------+
|                                             |
|           Jellyfin Install Script           |
|                                             |
|                                             |
|          Jellyfin HTTP Port : 8096          |
|          Jellyfin HTTPS Port : 8920         |
|    Jellyfin Path Installation: /jellyfin    |
+---------------------------------------------+
'
ls -l /jellyfin
echo '
If this Script has occured a error, please open a Issue in my GitHub.
Link : https://github.com/Syxpi/auto_dl/issues/new'
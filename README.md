# Auto_dl

## Warning
**This text was translated using Google Translate. English is not my native language, so sorry in advance if this is not very clear.** 

[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://choosealicense.com/licenses/mit/) 

[![made-with-bash](https://img.shields.io/badge/Made%20with-Bash-1f425f.svg)](https://www.gnu.org/software/bash/)

## Known Bugs

- Bug with automatic update. (he declares to find a new version even though we have the latest version. Additionally, the update does not install at all.) **[Will be temporarily removed from the script]**

## Features

What is Auto_dl? It is very simple.
This script is used to download several things.
- Docker and Portainer.
- The "Defaults-Tools" (which are Tools which I think are a bit obligatory in my opinion)
- Jellyfin (Useless if you have Plex Media Server or other)
- Uptime Kuma
- NGINX Proxy Manager*
- My Mom. Uh wait. No. it's not the case.
- And something else ! (The community is free to add features or modify existing ones. These will be checked by me and added if interesting.)

```* This feature will delete all existing web services on the server, such as Apache or NGINX, because the ports used by these services conflict with NGINX Proxy Manager. I don't want NGINX Proxy Manager to cause chaos and start fires on the server and end up in prison for the rest of my life. (I should probably calm down a bit...)```

## Tested Systems

This script has been tested on the following operating systems:

- Ubuntu 23.10 / 22.04 (Could not work on earlier versions)
- Debian 12 / Debian 11 (Could not work on earlier versions)
- CentOS 9 / 8 (didn't work because fuck yum and dnf, my script is based on apt)
- Fedora 38 (same reason for CentOS)


## Informations

~~This script has automatic updating.~~
~~So no need to come back here. Except to see what has been added.~~ 
**See the “Known Bugs” category**
-> https://github.com/Syxpi/auto_dl/blob/main/README.md#known-bugs

You will need curl, git, sudo and jq installed on your server. If these 4 programs are not installed, it will not work perfectly or just destroy anything.

To install them:
```apt install curl git jq sudo -y```

Once this is done, you will just have to do this command:
```git clone https://github.com/Syxpi/auto_dl.git```

then do this :
```cd auto_dl && chmod a+x ./auto_dl.sh && ./auto_dl.sh```

And do not forget to give me your house and your credit card number (just kidding, don’t do it.)

**⚠ Run the Script in the script directory ⚠ (if directory is "/root/auto_dl" for example, just run script inside this directory)**
**because while doing my tests, I noticed that something I tried didn't work.**
**If anyone has a solution, please open an issue directly so they can give me the tips. because I'm totally stuck on this.**
## Author

[@Syxpi (Well, it's me)](https://www.github.com/Syxpi)

[@ChatGPT (Wait. Wtf you are doing here? get out of here.)](https://chatgpt.com) [I admit, I used ChatGPT a little]

## Version History
- March 12, 2024 : Auto_dl has been Released to v0.1
- March 20, 2024 : Auto_dl has been Released to v0.2

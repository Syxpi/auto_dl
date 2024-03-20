#!/bin/bash

version="0.2"

check_update() {
    {
    latest_version=$(curl -s https://api.github.com/repos/Syxpi/auto_dl/releases/latest | jq -r '.tag_name')
    download_url=$(curl -s https://api.github.com/repos/Syxpi/auto_dl/releases/latest | jq -r '.assets[0].browser_download_url')
    curl -L -o "auto_dl.sh" "$download_url"
} > /dev/null 2>&1

    if [[ "$latest_version" != "$version" ]]; then
        echo "Update ($latest_version) is available !"
        echo "Actual version : $version"
        echo "Downloading latest version..."
        echo "Auto_dl Updated.."
    else
        echo "You have the latest version. ($version)"  
    fi
}

echo '
    ___         __                ____
   /   | __  __/ /_____      ____/ / /
  / /| |/ / / / __/ __ \    / __  / / 
 / ___ / /_/ / /_/ /_/ /   / /_/ / /  
/_/  |_\__,_/\__/\____/____\__,_/_/   
                     /_____/          
'

echo "Version: $version"

echo '
If you want to contribute to this project, go to the following link:
"https://github.com/Syxpi/auto_dl/pulls"

For any questions, comments, or issues, feel free to contact us at:
syxpikiller@gmail.com

Project Information:
- Project Homepage: "https://github.com/Syxpi/auto_dl"
- License: This script is distributed under the MIT License. See LICENSE file for details.

Thanks for using this script!
Created by Syxpi.
'

check_update
if [[ $EUID -ne 0 ]]; then
    echo "This script needs to be run on Root Account. Please, Log-In with your Root Account. (su - or sudo -i)"
    exit 1
fi

# Menu principal
while true; do
    echo "Menu :"
    echo "1 = Install Docker + Portainer"
    echo "2 = Install Default Tools (Neofetch, htop and Net-Tools)"
    echo "3 = Install Uptime Kuma [Require Docker]"
    echo "4 = Install Nginx Proxy Manager [Require Docker]"
    echo "5 = Install Jellyfin"
    echo "6 = Remove unused packages"
    echo "q = Quit"

    read -p "Enter your choice. : " choice

    case $choice in
        1)
            echo "(1) : Install Docker And Portainer"
            cd scripts
            chmod a+x ./docker-portainer.sh 
            bash ./docker-portainer.sh
            ;;
        2)
            echo "(2) : Install Default Tools (Neofetch, htop, Sudo and Net-Tools)"
<<<<<<< Updated upstream
            cd ..
=======
>>>>>>> Stashed changes
            cd scripts
            chmod a+x ./default-tools.sh 
            bash ./default-tools.sh
            ;;
        3)
            echo "Option 3 : Installa Uptime Kuma"
<<<<<<< Updated upstream
            cd ..
=======
>>>>>>> Stashed changes
            cd scripts
            chmod a+x ./uptime-kuma.sh 
            bash ./uptime-kuma.sh
            ;;
        4)
            echo "Option 4 : Install Nginx Proxy Manager"
<<<<<<< Updated upstream
            cd ..
=======
>>>>>>> Stashed changes
            cd scripts
            chmod a+x ./npm.sh 
            bash ./npm.sh
            ;;
        5)
            echo "Option 5 : Install Jellyfin"
<<<<<<< Updated upstream
            cd ..
=======
>>>>>>> Stashed changes
            cd scripts
            chmod a+x ./jellyfin.sh 
            bash ./jellyfin.sh
            ;;  
        6)
            echo "Option 5 : Remove unused packages"
            cd scripts
            chmod a+x ./auto_rm.sh 
            bash ./auto_rm.sh
            ;;        
        q)
            echo "Goodbye !"
            exit 0
            ;;
        *)
            echo "Invalid Choice, please select a valid choice."
            ;;
    esac
done

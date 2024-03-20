#!/bin/bash

# Obtain a list of packages that are automatically installed, but not manually
# (i.e. not explicitly installed by the user)
autoremoved_packages=$(dpkg --get-selections | awk '{print $1}' | grep auto)

# Remove the packages from the list
sudo apt-get remove --purge $autoremoved_packages

# Remove unnecessary packages and update the package list
sudo apt-get autoremove --purge
sudo apt-get update

# Display list of removed packages
echo "The following packages were removed:"
echo "$autoremoved_packages"

# Optional message to indicate the end of the script
echo "All unnecessary packages were removed!"
cd ..
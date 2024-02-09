#!/bin/bash

# System update
sudo apt update
sudo apt upgrade -y

# Install required packages
sudo apt install -y git-all

# Set battery charging threshold
sudo wget -q -O /etc/systemd/system/battery-threshold.service https://raw.githubusercontent.com/sakshiagrwal/Scripts/dev/Linux/etc/systemd/system/battery-threshold.service
sudo systemctl enable --now battery-threshold.service

# Configure Firefox
rm -rf /usr/lib/firefox/distribution/policies.json
sudo wget -q -O /usr/lib/firefox/firefox.cfg https://raw.githubusercontent.com/sakshiagrwal/Scripts/dev/Linux/usr/lib/firefox/firefox.cfg
sudo wget -q -O /usr/lib/firefox/defaults/pref/autoconfig.js https://raw.githubusercontent.com/sakshiagrwal/Scripts/dev/Linux/usr/lib/firefox/defaults/pref/autoconfig.js
sudo wget -q -O /usr/lib/firefox/distribution/policies.json https://raw.githubusercontent.com/sakshiagrwal/Scripts/dev/Linux/usr/lib/firefox/distribution/policies.json

# Set Firefox-Mod-Blur theme
cd ~/.mozilla/firefox/*.default-release
git clone --depth 1 https://github.com/datguypiko/Firefox-Mod-Blur chrome
cd chrome && find . ! -name 'ASSETS' ! -name 'userChrome.css' ! -name 'userContent.css' -delete

# Set Colloid-gtk-theme
git clone --depth 1 https://github.com/vinceliuice/Colloid-gtk-theme
cd Colloid-gtk-theme && ./install.sh --color dark --tweaks black rimless
cd .. && rm -rf Colloid-gtk-theme
gsettings set org.cinnamon.desktop.interface gtk-theme 'Colloid-Dark' # Applications

# Set Colloid-icon-theme
git clone --depth 1 https://github.com/vinceliuice/Colloid-icon-theme
cd Colloid-icon-theme && ./install.sh
cd .. && rm -rf Colloid-icon-theme
gsettings set org.cinnamon.desktop.interface icon-theme 'Colloid-dark' # Icons

# Set Capitaine-cursors-theme
wget -q --show-progress https://github.com/sainnhe/capitaine-cursors/releases/download/r5/Linux.zip
unzip -q Linux.zip -d Capitaine-Cursors
cd Capitaine-Cursors && mv 'Capitaine Cursors' ~/.icons/Capitaine-Cursors
cd .. && rm -rf Capitaine-Cursors Linux.zip
gsettings set org.cinnamon.desktop.interface cursor-theme 'Capitaine-Cursors' # Mouse Pointer

# Set fonts
# gsettings set org.cinnamon.desktop.interface font-name 'IBM Plex Sans Regular 10'
# gsettings set org.cinnamon.desktop.interface document-font-name 'IBM Plex Sans Regular 10'
# gsettings set org.cinnamon.desktop.interface monospace-font-name 'JetBrains Mono Regular 10'

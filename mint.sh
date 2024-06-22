#!/bin/bash

# System update
sudo apt update && sudo apt upgrade -y
sudo mkdir -p /var/lib/samba/usershares/ # https://askubuntu.com/questions/798928/nautilus-share-message-called-net-usershare-info-but-it-failed

# Install required packages
sudo apt install -y git-all
git config --global user.name "Sakshi Aggarwal"
git config --global user.email "81718060+sakshiagrwal@users.noreply.github.com"
git config --global core.editor "xed --wait"

# Set battery charging threshold
sudo curl -LSs https://raw.githubusercontent.com/sakshiagrwal/Scripts/dev/Linux/etc/systemd/system/battery-threshold.service -o /etc/systemd/system/battery-threshold.service
sudo systemctl enable --now battery-threshold.service

# Configure Firefox
sudo rm -rf /usr/lib/firefox/firefox.cfg /usr/lib/firefox/defaults/pref/autoconfig.js /usr/lib/firefox/distribution/policies.json
sudo wget -q -O /usr/lib/firefox/firefox.cfg https://raw.githubusercontent.com/sakshiagrwal/Scripts/dev/Linux/usr/lib/firefox/firefox.cfg
sudo wget -q -O /usr/lib/firefox/defaults/pref/autoconfig.js https://raw.githubusercontent.com/sakshiagrwal/Scripts/dev/Linux/usr/lib/firefox/defaults/pref/autoconfig.js
sudo wget -q -O /usr/lib/firefox/distribution/policies.json https://raw.githubusercontent.com/sakshiagrwal/Scripts/dev/Linux/usr/lib/firefox/distribution/policies.json

# Set Firefox-Mod-Blur theme
cd ~/.mozilla/firefox/*.default-release/ && rm -rf chrome/ && git clone --depth 1 https://github.com/datguypiko/Firefox-Mod-Blur chrome && cd chrome/ && rm -rf !(ASSETS|*.css) .[^.]*

# Download wallpaper
wget -q --show-progress -O Downloads/wallpaper.png https://raw.githubusercontent.com/JaKooLit/Wallpaper-Bank/main/wallpapers/anime-girl-abyss.png

# Install Colloid-gtk-theme
git clone --depth 1 https://github.com/vinceliuice/Colloid-gtk-theme && cd Colloid-gtk-theme/ && ./install.sh -u && rm -rf ~/.themes/Colloid*
./install.sh --color dark --tweaks black rimless && cd .. && rm -rf Colloid-gtk-theme/
# sudo ln -s ~/.themes/Colloid-Dark/ /usr/share/themes/Colloid-Dark
# sudo unlink /usr/share/themes/Colloid-Dark

# Install Colloid-icon-theme
git clone --depth 1 https://github.com/vinceliuice/Colloid-icon-theme && cd Colloid-icon-theme/ && rm -rf ~/.local/share/icons/Colloid*
./install.sh && cd .. && rm -rf Colloid-icon-theme/
# sudo ln -s ~/.local/share/icons/Colloid/ /usr/share/icons/Colloid
# sudo unlink /usr/share/icons/Colloid

# sudo nemo /usr/share/applications/
# /home/sakshi/.local/share/icons/Colloid/apps/scalable/protonvpn-gui.svg
# /home/sakshi/.local/share/icons/Colloid/apps/scalable/pycharm.svg
# /home/sakshi/.local/share/icons/Colloid/apps/scalable/idea.svg

# Install Orchis-theme
git clone --depth 1 https://github.com/vinceliuice/Orchis-theme && cd Orchis-theme/ && ./install.sh -u && sudo rm -rf /usr/share/themes/Orchis*
sudo ./install.sh --dest /usr/share/themes/ --color dark --size standard --tweaks black macos && cd .. && rm -rf Orchis-theme/

# Install Tela-circle-icon-theme
git clone --depth 1 https://github.com/vinceliuice/Tela-circle-icon-theme && cd Tela-circle-icon-theme/ && sudo rm -rf /usr/share/icons/Tela*
sudo ./install.sh -d /usr/share/icons/ -n Tela-Circle && cd .. && rm -rf Tela-circle-icon-theme/
# 'sudo xed /usr/share/applications/protonvpn-app.desktop' And add 'Icon=/usr/share/icons/Tela-Circle/scalable/apps/protonvpn.svg'
# 'sudo xed /usr/share/applications/jetbrains-pycharm-ce.desktop' And add 'Icon=/usr/share/icons/Tela-Circle/scalable/apps/pycharm.svg'
# 'sudo xed /usr/share/applications/jetbrains-idea-ce.desktop' And add 'Icon=/usr/share/icons/Tela-Circle/scalable/apps/idea.svg'

# Install WhiteSur-icon-theme
git clone --depth 1 https://github.com/vinceliuice/WhiteSur-icon-theme && cd WhiteSur-icon-theme/ && rm -rf ~/.local/share/icons/WhiteSur*
./install.sh && cd .. && rm -rf WhiteSur-icon-theme/

# Set Capitaine-cursors-theme
wget -q --show-progress https://github.com/sainnhe/capitaine-cursors/releases/download/r5/Linux.zip
unzip -q Linux.zip -d Capitaine-Cursors && cd Capitaine-Cursors/ && mv 'Capitaine Cursors' ~/.icons/Capitaine-Cursors && cd .. && rm -rf Capitaine-Cursors Linux.zip
# gsettings set org.cinnamon.desktop.interface cursor-theme 'Capitaine-Cursors' # Mouse Pointer

# Set fonts
# gsettings set org.cinnamon.desktop.interface font-name 'IBM Plex Sans Regular 10'
# gsettings set org.cinnamon.desktop.interface titlebar-font-name 'IBM Plex Sans Medium 10'
# gsettings set org.cinnamon.desktop.interface document-font-name 'IBM Plex Sans Regular 10'
# gsettings set org.cinnamon.desktop.interface monospace-font-name 'JetBrains Mono Regular 10'

#!/bin/bash

# System update
sudo apt update && sudo apt upgrade -y

# Git setup
sudo apt install -y git adb
git config --global user.name "Kajal4414"
git config --global user.email "81718060+Kajal4414@users.noreply.github.com"
git config --global core.editor "xed --wait"

# Set battery charging threshold to 60%
sudo cp battery-threshold.service /etc/systemd/system/
sudo systemctl enable --now battery-threshold.service

# Configure Firefox
sudo rm -rf /usr/lib/firefox/firefox.cfg /usr/lib/firefox/defaults/pref/autoconfig.js /usr/lib/firefox/distribution/policies.json
sudo cp firefox.cfg /usr/lib/firefox/ && sudo cp autoconfig.js /usr/lib/firefox/defaults/pref/ && sudo cp policies.json /usr/lib/firefox/distribution/

# Set Firefox-Mod-Blur theme
(cd ~/.mozilla/firefox/*.default-release/ && rm -rf chrome/ && git clone --depth 1 https://github.com/datguypiko/Firefox-Mod-Blur chrome && cd chrome/ && shopt -s dotglob && rm -rf !(ASSETS|*.css))

# Install Colloid-gtk-theme
git clone --depth 1 https://github.com/vinceliuice/Colloid-gtk-theme && cd Colloid-gtk-theme/ && sudo ./install.sh -u && sudo rm -rf /usr/share/themes/Colloid*
sudo ./install.sh -d /usr/share/themes/ -c dark --tweaks black rimless && cd .. && rm -rf Colloid-gtk-theme/

# Install Orchis-theme
git clone --depth 1 https://github.com/vinceliuice/Orchis-theme && cd Orchis-theme/ && ./install.sh -u && sudo rm -rf /usr/share/themes/Orchis*
sudo ./install.sh -d /usr/share/themes/ -c dark -s standard --tweaks black macos && cd .. && rm -rf Orchis-theme/

# Install Colloid-icon-theme
git clone --depth 1 https://github.com/vinceliuice/Colloid-icon-theme && cd Colloid-icon-theme/ && sudo rm -rf /usr/share/icons/Colloid*
sudo ./install.sh -d /usr/share/icons && cd .. && rm -rf Colloid-icon-theme/
# sudo sed -i 's/Icon=.*/Icon=\/usr\/share\/icons\/Colloid\/apps\/scalable\/protonvpn-gui.svg/' /usr/share/applications/protonvpn-app.desktop
# sudo sed -i 's/Icon=.*/Icon=\/usr\/share\/icons\/Colloid\/apps\/scalable\/pycharm.svg/' /usr/share/applications/jetbrains-pycharm-ce.desktop
# sudo sed -i 's/Icon=.*/Icon=\/usr\/share\/icons\/Colloid\/apps\/scalable\/idea.svg/' /usr/share/applications/jetbrains-idea-ce.desktop

# Install Tela-circle-icon-theme
git clone --depth 1 https://github.com/vinceliuice/Tela-circle-icon-theme && cd Tela-circle-icon-theme/ && sudo rm -rf /usr/share/icons/Tela*
sudo ./install.sh -d /usr/share/icons/ -n Tela-Circle && cd .. && rm -rf Tela-circle-icon-theme/
# sudo sed -i 's/Icon=.*/Icon=\/usr\/share\/icons\/Tela-Circle\/scalable\/apps\/protonvpn.svg/' /usr/share/applications/protonvpn-app.desktop
# sudo sed -i 's/Icon=.*/Icon=\/usr\/share\/icons\/Tela-Circle\/scalable\/apps\/pycharm.svg/' /usr/share/applications/jetbrains-pycharm-ce.desktop
# sudo sed -i 's/Icon=.*/Icon=\/usr\/share\/icons\/Tela-Circle\/scalable\/apps\/idea.svg/' /usr/share/applications/jetbrains-idea-ce.desktop

# Install font
sudo cp JetBrainsMono/variable/*.ttf IBMPlexSans/*.ttf /usr/share/fonts/

# Rebuild font cache
fc-cache -f -v

# Install Capitaine-cursors-theme
sudo cp -pr CapitaineCursors/Capitaine-Cursors/ /usr/share/icons/

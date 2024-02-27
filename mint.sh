#!/bin/bash

# System update
sudo apt update && sudo apt upgrade -y

# Install required packages
sudo apt install -y git-all

cd Downloads
wget -q --show-progress -O chrome.deb "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb" && sudo dpkg --install chrome.deb && rm -rf chrome.deb
wget -q --show-progress -O bleachbit.deb "https://download.bleachbit.org/bleachbit_4.6.0-0_all_ubuntu2310.deb" && sudo dpkg --install bleachbit.deb && rm -rf bleachbit.deb
wget -q --show-progress -O code.deb "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64" && sudo dpkg --install code.deb && rm -rf code.deb
sudo wget -q -O ~/.config/Code/User/settings.json "https://raw.githubusercontent.com/sakshiagrwal/Dotfiles/main/settings.json"
code --install-extension codeium.codeium dbaeumer.vscode-eslint eamodio.gitlens esbenp.prettier-vscode github.github-vscode-theme ms-python.black-formatter ms-python.debugpy ms-python.pylint ms-python.python ms-python.vscode-pylance ms-vscode-remote.remote-ssh ms-vscode-remote.remote-ssh-edit ms-vscode.makefile-tools ms-vscode.remote-explorer pkief.material-icon-theme redhat.java redhat.vscode-xml redhat.vscode-yaml tabnine.tabnine-vscode visualstudioexptteam.intellicode-api-usage-examples visualstudioexptteam.vscodeintellicode vscjava.vscode-java-debug vscjava.vscode-java-dependency vscjava.vscode-java-pack vscjava.vscode-java-test vscjava.vscode-maven
wget -q --show-progress -O telegram.tar.xz "https://telegram.org/dl/desktop/linux" && sudo tar -xf telegram.tar.xz -C /opt/ && rm -rf telegram.tar.xz
wget -q --show-progress -O protonvpn.deb "https://repo.protonvpn.com/debian/dists/stable/main/binary-all/protonvpn-stable-release_1.0.3-2_all.deb" && sudo dpkg --install protonvpn.deb && rm -rf protonvpn.deb && sudo apt update && sudo apt install protonvpn-cli
cd ..

# Set battery charging threshold
sudo wget -q -O /etc/systemd/system/battery-threshold.service https://raw.githubusercontent.com/sakshiagrwal/Scripts/dev/Linux/etc/systemd/system/battery-threshold.service
sudo systemctl enable --now battery-threshold.service

# Configure Firefox
sudo rm -rf /usr/lib/firefox/distribution/policies.json
sudo wget -q -O /usr/lib/firefox/firefox.cfg https://raw.githubusercontent.com/sakshiagrwal/Scripts/dev/Linux/usr/lib/firefox/firefox.cfg
sudo wget -q -O /usr/lib/firefox/defaults/pref/autoconfig.js https://raw.githubusercontent.com/sakshiagrwal/Scripts/dev/Linux/usr/lib/firefox/defaults/pref/autoconfig.js
sudo wget -q -O /usr/lib/firefox/distribution/policies.json https://raw.githubusercontent.com/sakshiagrwal/Scripts/dev/Linux/usr/lib/firefox/distribution/policies.json

# Set Firefox-Mod-Blur theme
cd ~/.mozilla/firefox/*.default-release/
git clone --depth 1 https://github.com/datguypiko/Firefox-Mod-Blur chrome
cd chrome/ && rm -rf !(ASSETS|*.css) .[^.]*

# Set wallpaper
wget -q --show-progress -O Downloads/wallpaper.png https://raw.githubusercontent.com/JaKooLit/Wallpaper-Bank/main/wallpapers/Anime-Girl-2.png
# gsettings set org.cinnamon.desktop.background picture-uri 'file:///Downloads/wallpaper.png' # Wallpaper

# Set Colloid-gtk-theme
git clone --depth 1 https://github.com/vinceliuice/Colloid-gtk-theme
cd Colloid-gtk-theme/ && ./install.sh --color dark --tweaks black rimless
cd .. && rm -rf Colloid-gtk-theme
# gsettings set org.cinnamon.desktop.interface gtk-theme 'Colloid-Dark' # Applications

# Set Colloid-icon-theme
git clone --depth 1 https://github.com/vinceliuice/Colloid-icon-theme
cd Colloid-icon-theme/ && ./install.sh
cd .. && rm -rf Colloid-icon-theme
# gsettings set org.cinnamon.desktop.interface icon-theme 'Colloid-dark' # Icons

# Set Capitaine-cursors-theme
wget -q --show-progress https://github.com/sainnhe/capitaine-cursors/releases/download/r5/Linux.zip
unzip -q Linux.zip -d Capitaine-Cursors
cd Capitaine-Cursors/ && mv 'Capitaine Cursors' ~/.icons/Capitaine-Cursors
cd .. && rm -rf Capitaine-Cursors Linux.zip
# gsettings set org.cinnamon.desktop.interface cursor-theme 'Capitaine-Cursors' # Mouse Pointer

# Set fonts
# gsettings set org.cinnamon.desktop.interface font-name 'IBM Plex Sans Regular 10'
# gsettings set org.cinnamon.desktop.interface titlebar-font-name 'IBM Plex Sans Medium 10'
# gsettings set org.cinnamon.desktop.interface document-font-name 'IBM Plex Sans Regular 10'
# gsettings set org.cinnamon.desktop.interface monospace-font-name 'JetBrains Mono Regular 10'

#!/bin/bash

# System Update
sudo apt update && sudo apt upgrade -y

# Install Packages
wget -q --show-progress https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && sudo dpkg -i ./google*_amd64.deb && rm ./google*_amd64.deb
wget -q --show-progress https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64 && sudo dpkg -i ./code*_amd64.deb && rm ./code*_amd64.deb
wget -q --show-progress https://repo.protonvpn.com/debian/dists/stable/main/binary-all/protonvpn-stable-release_1.0.3-3_all.deb && sudo dpkg -i ./protonvpn*_all.deb && rm ./protonvpn*_all.deb

jdk=$(curl -s "https://www.oracle.com/java/technologies/downloads/" | grep -oP 'href="\K[^"]*linux-x64_bin\.deb' | head -n 1) && wget -q --show-progress $jdk && sudo dpkg -i ./jdk*_bin.deb && rm ./jdk*_bin.deb
icc=$(curl -s "https://data.services.jetbrains.com/products/releases?code=IIC&latest=true" | grep -oP '"linux":\s*{\s*"link":\s*"\K[^"]+') && wget -q --show-progress $icc && sudo tar -xzf ./ideaIC-*.tar.gz -C /opt && rm ./ideaIC-*.tar.gz
pcc=$(curl -s "https://data.services.jetbrains.com/products/releases?code=PCC&latest=true" | grep -oP '"linux":\s*{\s*"link":\s*"\K[^"]+') && wget -q --show-progress $pcc && sudo tar -xzf ./pycharm-*.tar.gz -C /opt && rm ./pycharm-*.tar.gz
tgm=$(curl -s "https://api.github.com/repos/telegramdesktop/tdesktop/releases/latest" | grep -oP '"browser_download_url": "\K[^"]*tsetup[^"]*\.tar\.xz') && wget -q --show-progress $tgm && sudo tar -xf ./tsetup*.tar.xz -C /opt && rm ./tsetup*.tar.xz

sudo apt update && sudo apt install -y adb bleachbit git nodejs proton-vpn-gnome-desktop vlc

# Git Setup
git config --global user.name "Kajal4414"
git config --global user.email "81718060+Kajal4414@users.noreply.github.com"
git config --global core.editor "xed --wait"

# Install VS Code Extensions
extensions=("beardedbear.beardedtheme" "dbaeumer.vscode-eslint" "eamodio.gitlens" "esbenp.prettier-vscode" "foxundermoon.shell-format" "github.codespaces" "github.github-vscode-theme" "jock.svg" "ms-python.black-formatter" "ms-python.debugpy" "ms-python.pylint" "ms-python.python" "ms-python.vscode-pylance" "ms-vscode.makefile-tools" "ms-vscode.powershell" "pkief.material-icon-theme" "redhat.java" "redhat.vscode-xml" "redhat.vscode-yaml" "ritwickdey.liveserver" "tabnine.tabnine-vscode" "visualstudioexptteam.intellicode-api-usage-examples" "visualstudioexptteam.vscodeintellicode" "vscjava.vscode-java-debug" "vscjava.vscode-java-dependency" "vscjava.vscode-java-pack")

for ext in "${extensions[@]}"; do
    code --install-extension $ext
done

# Adjust Screen Contrast
xgamma -gamma 0.85

# Set Battery Charging Threshold to 60%
sudo cp ./battery-threshold.service /etc/systemd/system/ && sudo systemctl enable --now battery-threshold.service

# Configure Firefox
sudo rm /usr/lib/firefox/firefox.cfg /usr/lib/firefox/defaults/pref/autoconfig.js /usr/lib/firefox/distribution/policies.json
sudo cp ./firefox.cfg /usr/lib/firefox && sudo cp ./autoconfig.js /usr/lib/firefox/defaults/pref && sudo cp ./policies.json /usr/lib/firefox/distribution

# Install Firefox-Mod-Blur theme
(cd ~/.mozilla/firefox/*.default-release && rm -r ./chrome && git clone --depth 1 https://github.com/datguypiko/Firefox-Mod-Blur chrome && cd ./chrome && rm -rf ./.git ./EXTRA* ./README* ./Linux*)

# Install Colloid-gtk-theme
git clone --depth 1 https://github.com/vinceliuice/Colloid-gtk-theme && cd Colloid-gtk-theme/ && sudo ./install.sh -u && sudo rm -rf /usr/share/themes/Colloid*
sudo ./install.sh -d /usr/share/themes/ -c dark --tweaks black rimless && cd .. && rm -rf Colloid-gtk-theme/

# Install Orchis-theme
git clone --depth 1 https://github.com/vinceliuice/Orchis-theme && cd Orchis-theme/ && ./install.sh -u && sudo rm -rf /usr/share/themes/Orchis*
sudo ./install.sh -d /usr/share/themes/ -c dark -s standard --tweaks black macos && cd .. && rm -rf Orchis-theme/

# Install Colloid-icon-theme
git clone --depth 1 https://github.com/vinceliuice/Colloid-icon-theme && cd Colloid-icon-theme/ && sudo rm -rf /usr/share/icons/Colloid*
sudo ./install.sh -d /usr/share/icons && cd .. && rm -rf Colloid-icon-theme/
[ -f /usr/share/applications/protonvpn-app.desktop ] && sudo sed -i "s|Icon=.*|Icon=/usr/share/icons/Colloid/apps/scalable/protonvpn-gui.svg|" /usr/share/applications/protonvpn-app.desktop
[ -f /usr/share/applications/jetbrains-pycharm-ce.desktop ] && sudo sed -i "s|Icon=.*|Icon=/usr/share/icons/Colloid/apps/scalable/pycharm.svg|" /usr/share/applications/jetbrains-pycharm-ce.desktop
[ -f /usr/share/applications/jetbrains-idea-ce.desktop ] && sudo sed -i "s|Icon=.*|Icon=/usr/share/icons/Colloid/apps/scalable/idea.svg|" /usr/share/applications/jetbrains-idea-ce.desktop

# Install Tela-circle-icon-theme (Default: ~/.local/share/icons)
# git clone --depth 1 https://github.com/vinceliuice/Tela-circle-icon-theme && cd ./Tela-circle-icon-theme && ./install.sh -n Tela-Circle && cd .. && rm -rf ./Tela-circle-icon-theme

# sudo sed -i "s|Icon=.*|Icon=$HOME/.local/share/icons/Tela-Circle/scalable/apps/protonvpn.svg|" /usr/share/applications/protonvpn-app.desktop
# sudo sed -i "s|Icon=.*|Icon=$HOME/.local/share/icons/Tela-Circle/scalable/apps/pycharm.svg|" /usr/share/applications/jetbrains-pycharm-ce.desktop
# sudo sed -i "s|Icon=.*|Icon=$HOME/.local/share/icons/Tela-Circle/scalable/apps/idea.svg|" /usr/share/applications/jetbrains-idea-ce.desktop

# Install Fonts
mkdir -p ~/.local/share/fonts && cp ./JetBrainsMono/variable/*.ttf ./IBMPlexSans/*.ttf ~/.local/share/fonts

# Rebuild Font Cache
# fc-cache -f -v

# Install Capitaine-Cursors
cp -pr ./CapitaineCursors/Capitaine-Cursors ~/.icons

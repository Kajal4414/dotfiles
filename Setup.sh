#!/bin/bash

# System update
sudo apt update && sudo apt upgrade -y
# sudo mkdir -p /var/lib/samba/usershares/ (https://askubuntu.com/questions/798928/nautilus-share-message-called-net-usershare-info-but-it-failed)

# Git setup
sudo apt install -y git-all
git config --global user.name "Sakshi Aggarwal"
git config --global user.email "81718060+sakshiagrwal@users.noreply.github.com"
git config --global core.editor "xed --wait"

# Clone dotfiles repository
git clone --depth 1 https://github.com/sakshiagrwal/Dotfiles.git && cd Dotfiles

# Set battery charging threshold to 60%
sudo mv battery-threshold.service /etc/systemd/system/
sudo systemctl enable --now battery-threshold.service

# Configure Firefox
sudo rm -rf /usr/lib/firefox/firefox.cfg /usr/lib/firefox/defaults/pref/autoconfig.js /usr/lib/firefox/distribution/policies.json
sudo mv firefox.cfg /usr/lib/firefox/ autoconfig.js /usr/lib/firefox/defaults/pref/ policies.json /usr/lib/firefox/distribution/

# Set Firefox-Mod-Blur theme (https://github.com/datguypiko/Firefox-Mod-Blur)
(cd ~/.mozilla/firefox/*.default-release/ && rm -rf chrome/ && git clone --depth 1 https://github.com/datguypiko/Firefox-Mod-Blur chrome && cd chrome/ && rm -rf !(ASSETS|*.css) .[^.]*)

# Install Colloid-gtk-theme
git clone --depth 1 https://github.com/vinceliuice/Colloid-gtk-theme && cd Colloid-gtk-theme/ && sudo ./install.sh -u && sudo rm -rf /usr/share/themes/Colloid*
sudo ./install.sh --dest /usr/share/themes/ --color dark --tweaks black rimless && cd .. && rm -rf Colloid-gtk-theme/

# Install Orchis-theme
git clone --depth 1 https://github.com/vinceliuice/Orchis-theme && cd Orchis-theme/ && ./install.sh -u && sudo rm -rf /usr/share/themes/Orchis*
sudo ./install.sh --dest /usr/share/themes/ --color dark --size standard --tweaks black macos && cd .. && rm -rf Orchis-theme/

# Install Colloid-icon-theme
git clone --depth 1 https://github.com/vinceliuice/Colloid-icon-theme && cd Colloid-icon-theme/ && sudo rm -rf /usr/share/icons/Colloid*
sudo ./install.sh --dest /usr/share/icons && cd .. && rm -rf Colloid-icon-theme/
# sudo sed -i 's/Icon=.*/Icon=\/usr\/share\/icons\/Colloid\/apps\/scalable\/protonvpn-gui.svg/' /usr/share/applications/protonvpn-app.desktop
# sudo sed -i 's/Icon=.*/Icon=\/usr\/share\/icons\/Colloid\/apps\/scalable\/pycharm.svg/' /usr/share/applications/jetbrains-pycharm-ce.desktop
# sudo sed -i 's/Icon=.*/Icon=\/usr\/share\/icons\/Colloid\/apps\/scalable\/idea.svg/' /usr/share/applications/jetbrains-idea-ce.desktop

# Install Tela-circle-icon-theme
git clone --depth 1 https://github.com/vinceliuice/Tela-circle-icon-theme && cd Tela-circle-icon-theme/ && sudo rm -rf /usr/share/icons/Tela*
sudo ./install.sh -d /usr/share/icons/ -n Tela-Circle && cd .. && rm -rf Tela-circle-icon-theme/
# sudo sed -i 's/Icon=.*/Icon=\/usr\/share\/icons\/Tela-Circle\/scalable\/apps\/protonvpn.svg/' /usr/share/applications/protonvpn-app.desktop
# sudo sed -i 's/Icon=.*/Icon=\/usr\/share\/icons\/Tela-Circle\/scalable\/apps\/pycharm.svg/' /usr/share/applications/jetbrains-pycharm-ce.desktop
# sudo sed -i 's/Icon=.*/Icon=\/usr\/share\/icons\/Tela-Circle\/scalable\/apps\/idea.svg/' /usr/share/applications/jetbrains-idea-ce.desktop

# Install JetBrainsMono font (https://www.jetbrains.com/lp/mono/)
(cd JetBrainsMono/fonts/variable/ && sudo mv *.ttf /usr/share/fonts/)

# Install IBMPlexSans font (https://fonts.google.com/specimen/IBM+Plex+Sans)
(cd IBMPlexSans/ && sudo mv *.ttf /usr/share/fonts/)
fc-cache -f -v

# Set Capitaine-cursors-theme (https://github.com/sainnhe/capitaine-cursors)
curl -OLS https://github.com/sainnhe/capitaine-cursors/releases/download/r5/Linux.zip && unzip -q Linux.zip -d Capitaine-Cursors && cd Capitaine-Cursors/
sudo mv 'Capitaine Cursors' /usr/share/icons/Capitaine-Cursors && cd .. && rm -rf Capitaine-Cursors Linux.zip
# Unpack cursors to ~/.icons (or /usr/share/icons, to install cursors system-wide)

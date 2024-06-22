#!/bin/bash

# System update
sudo apt update && sudo apt upgrade -y
sudo mkdir -p /var/lib/samba/usershares/ # https://askubuntu.com/questions/798928/nautilus-share-message-called-net-usershare-info-but-it-failed

# Git setup
sudo apt install -y git-all
git config --global user.name "Sakshi Aggarwal"
git config --global user.email "81718060+sakshiagrwal@users.noreply.github.com"
git config --global core.editor "xed --wait"

# Set battery charging threshold to 60%
sudo curl -LSs https://raw.githubusercontent.com/sakshiagrwal/Dotfiles/main/battery-threshold.service -o /etc/systemd/system/battery-threshold.service
sudo systemctl enable --now battery-threshold.service

# Configure Firefox (https://github.com/datguypiko/Firefox-Mod-Blur)
sudo rm -rf /usr/lib/firefox/firefox.cfg /usr/lib/firefox/defaults/pref/autoconfig.js /usr/lib/firefox/distribution/policies.json
sudo wget -q -O /usr/lib/firefox/firefox.cfg https://raw.githubusercontent.com/sakshiagrwal/Scripts/dev/Linux/usr/lib/firefox/firefox.cfg
sudo wget -q -O /usr/lib/firefox/defaults/pref/autoconfig.js https://raw.githubusercontent.com/sakshiagrwal/Scripts/dev/Linux/usr/lib/firefox/defaults/pref/autoconfig.js
sudo wget -q -O /usr/lib/firefox/distribution/policies.json https://raw.githubusercontent.com/sakshiagrwal/Scripts/dev/Linux/usr/lib/firefox/distribution/policies.json

# Set Firefox-Mod-Blur theme
cd ~/.mozilla/firefox/*.default-release/ && rm -rf chrome/ && git clone --depth 1 https://github.com/datguypiko/Firefox-Mod-Blur chrome && cd chrome/ && rm -rf !(ASSETS|*.css) .[^.]*

# Install Colloid-gtk-theme
git clone --depth 1 https://github.com/vinceliuice/Colloid-gtk-theme && cd Colloid-gtk-theme/ && sudo ./install.sh -u && sudo rm -rf /usr/share/themes/Colloid*
sudo ./install.sh --dest /usr/share/themes/ --color dark --tweaks black rimless && cd .. && rm -rf Colloid-gtk-theme/

# Install Colloid-icon-theme
git clone --depth 1 https://github.com/vinceliuice/Colloid-icon-theme && cd Colloid-icon-theme/ && sudo rm -rf /usr/share/icons/Colloid*
sudo ./install.sh --dest /usr/share/icons && cd .. && rm -rf Colloid-icon-theme/
sudo sed -i 's/Icon=.*/Icon=\/usr\/share\/icons\/Colloid\/apps\/scalable\/protonvpn-gui.svg/' /usr/share/applications/protonvpn-app.desktop
sudo sed -i 's/Icon=.*/Icon=\/usr\/share\/icons\/Colloid\/apps\/scalable\/pycharm.svg/' /usr/share/applications/jetbrains-pycharm-ce.desktop
sudo sed -i 's/Icon=.*/Icon=\/usr\/share\/icons\/Colloid\/apps\/scalable\/idea.svg/' /usr/share/applications/jetbrains-idea-ce.desktop

# Install Orchis-theme
git clone --depth 1 https://github.com/vinceliuice/Orchis-theme && cd Orchis-theme/ && ./install.sh -u && sudo rm -rf /usr/share/themes/Orchis*
sudo ./install.sh --dest /usr/share/themes/ --color dark --size standard --tweaks black macos && cd .. && rm -rf Orchis-theme/

# Install Tela-circle-icon-theme
git clone --depth 1 https://github.com/vinceliuice/Tela-circle-icon-theme && cd Tela-circle-icon-theme/ && sudo rm -rf /usr/share/icons/Tela*
sudo ./install.sh -d /usr/share/icons/ -n Tela-Circle && cd .. && rm -rf Tela-circle-icon-theme/
# 'sudo xed /usr/share/applications/protonvpn-app.desktop' And add 'Icon=/usr/share/icons/Tela-Circle/scalable/apps/protonvpn.svg'
# 'sudo xed /usr/share/applications/jetbrains-pycharm-ce.desktop' And add 'Icon=/usr/share/icons/Tela-Circle/scalable/apps/pycharm.svg'
# 'sudo xed /usr/share/applications/jetbrains-idea-ce.desktop' And add 'Icon=/usr/share/icons/Tela-Circle/scalable/apps/idea.svg'

# Install JetBrainsMono font (https://www.jetbrains.com/lp/mono/)
curl -O https://download-cdn.jetbrains.com/fonts/JetBrainsMono-2.304.zip && unzip -q JetBrainsMono-2.304.zip -d JetBrainsMono && cd JetBrainsMono/fonts/variable/
sudo mv *.ttf /usr/share/fonts/ && cd ../../.. && rm -rf JetBrainsMono*

# Install IBMPlexSans Regular/Medium font (https://fonts.google.com/specimen/IBM+Plex+Sans)
sudo curl -LSs -o /usr/share/fonts/IBMPlexSans-Regular.ttf https://github.com/google/fonts/raw/main/ofl/ibmplexsans/IBMPlexSans-Regular.ttf
sudo curl -LSs -o /usr/share/fonts/IBMPlexSans-Medium.ttf https://github.com/google/fonts/raw/main/ofl/ibmplexsans/IBMPlexSans-Medium.ttf
# Unpack fonts to ~/.local/share/fonts (or /usr/share/fonts, to install fonts system-wide) and fc-cache -f -v

# Set Capitaine-cursors-theme (https://github.com/sainnhe/capitaine-cursors)
curl -OLS https://github.com/sainnhe/capitaine-cursors/releases/download/r5/Linux.zip && unzip -q Linux.zip -d Capitaine-Cursors && cd Capitaine-Cursors/
sudo mv 'Capitaine Cursors' /usr/share/icons/Capitaine-Cursors && cd .. && rm -rf Capitaine-Cursors Linux.zip
# Unpack cursors to ~/.icons (or /usr/share/icons, to install cursors system-wide)

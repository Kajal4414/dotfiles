## Setting Charging Thresholds for Battery Health

To extend the lifespan of your laptop's battery, you can set charging thresholds that prevent the battery from charging to full capacity. Use the provided service file to configure these thresholds.

Installation:

1. Download the `battery-threshold.service` file from the [scripts](https://github.com/sakshiagrwal/Scripts/blob/dev/Linux/etc/systemd/system/battery-threshold.service) repository.

   ```sh
   sudo wget -q -O /etc/systemd/system/battery-threshold.service https://raw.githubusercontent.com/sakshiagrwal/Scripts/dev/Linux/etc/systemd/system/battery-threshold.service && sudo systemctl enable --now battery-threshold.service
   ```

## Customizing Firefox

1. Download Configuration Files:
   - [autoconfig.js](https://github.com/sakshiagrwal/Scripts/blob/main/Windows/Extra/autoconfig.js)
   - [firefox.cfg](https://github.com/sakshiagrwal/Scripts/blob/dev/Linux/usr/lib/firefox/firefox.cfg) | [breakdown of each line](https://github.com/sakshiagrwal/Scripts/commit/29d90e6f4b727b24824584da56e5965cb43d94ea)
   - [policies.json](https://github.com/sakshiagrwal/Scripts/blob/dev/Linux/usr/lib/firefox/distribution/policies.json) | [breakdown of each line](https://github.com/sakshiagrwal/Scripts/commit/258124948b51033265574a73336131482e22fc2e)

   ```sh
   sudo wget -q -O /usr/lib/firefox/defaults/pref/autoconfig.js https://raw.githubusercontent.com/sakshiagrwal/Scripts/dev/Linux/usr/lib/firefox/defaults/pref/autoconfig.js && sudo wget -q -O /usr/lib/firefox/firefox.cfg https://raw.githubusercontent.com/sakshiagrwal/Scripts/dev/Linux/usr/lib/firefox/firefox.cfg && sudo wget -q -O /usr/lib/firefox/distribution/policies.json https://raw.githubusercontent.com/sakshiagrwal/Scripts/dev/Linux/usr/lib/firefox/distribution/policies.json
   ```
  
2. Apply the [Firefox Mod Blur Theme](https://github.com/datguypiko/Firefox-Mod-Blur)

   ```sh
   cd ~/.mozilla/firefox/*.default-release/ && git clone --depth 1 https://github.com/datguypiko/Firefox-Mod-Blur chrome && cd chrome/ && rm -rf !(ASSETS|*.css) .[^.]*
   ```

## Exporting and Importing GNOME Terminal Profiles

- To export your GNOME Terminal profiles:

  ```sh
  dconf dump /org/gnome/terminal/legacy/profiles:/ > ~/gnome-terminal-profiles.dconf
  ```

- To import your [GNOME Terminal profiles](https://github.com/sakshiagrwal/Dotfiles/blob/main/bash/gnome-terminal-profiles.dconf):

  ```sh
  cat ~/gnome-terminal-profiles.dconf | dconf load /org/gnome/terminal/legacy/profiles:/
  ```

## Backing Up the Entire dconf Database

Back up:

- Save the `~/.config/dconf/user` file to a secure location.

Restore:

- Replace the `~/.config/dconf/user` file with the backup version.
- Exercise caution with this method as it affects all GNOME settings.

## Theme Customization

### GtkTheme: [Colloid-gtk-theme](https://github.com/vinceliuice/Colloid-gtk-theme)

- Install the 'Blackness' color version of the Colloid-gtk-theme (Default directory: `$HOME/.themes`):

  ```sh
  git clone --depth 1 https://github.com/vinceliuice/Colloid-gtk-theme && cd Colloid-gtk-theme && ./install.sh --color dark --tweaks black rimless && cd .. && rm -rf Colloid-gtk-theme
  ```

### IconTheme: [Colloid-icon-theme](https://github.com/vinceliuice/Colloid-icon-theme)

- Install the 'Blue' color version of the Colloid-icon-theme (Default directory: `$HOME/.local/share/icons`):

  ```sh
  git clone --depth 1 https://github.com/vinceliuice/Colloid-icon-theme && cd Colloid-icon-theme && ./install.sh && cd .. && rm -rf Colloid-icon-theme
  ```

### CursorTheme: [Capitaine-cursors](https://github.com/keeferrourke/capitaine-cursors)

- Install the Capitaine-cursors [patched version](https://github.com/sainnhe/capitaine-cursors):

  ```sh
  wget -q --show-progress https://github.com/sainnhe/capitaine-cursors/releases/download/r5/Linux.zip && unzip -q Linux.zip -d Capitaine-Cursors && cd Capitaine-Cursors/ && mv 'Capitaine Cursors' ~/.icons/Capitaine-Cursors && cd .. && rm -rf Capitaine-Cursors Linux.zip
  ```

### SystemFonts:
Recommended directory: `$HOME/.local/share/fonts`

- [IBM Plex Sans Regular 10](https://fonts.google.com/specimen/IBM+Plex+Sans) `Default font`, `Desktop font` and `Document font`
   - [IBM Plex Sans Medium 10]() `Window title font`
- [JetBrains Mono Regular 10](https://www.jetbrains.com/lp/mono) `Monospace font`
- [Fira Code (Nerd Fonts)](https://github.com/ryanoasis/nerd-fonts/releases/latest)
- [Roboto Condensed](https://fonts.google.com/specimen/Roboto+Condensed)
- [Inter](https://fonts.google.com/specimen/Inter)

## Linux Mint Installation and Configuration

- Kernel version `6.2.0-39-generic` is confirmed to work well with `Linux Mint 21.3` and the specified hardware.
- If experiencing touchpad lag, install the Synaptics driver: **(Kernel version `6.2.0-39-generic` resolves this issue)**

  ```sh
  apt install xserver-xorg-input-synaptics
  ```

  Refer to the [Linux Mint Release Notes](https://linuxmint.com/rel_virginia.php) for more details.

## Dual-Booting with Windows

When setting up a dual-boot system:

- Always install Windows first, followed by Linux Mint.
- Refer to the [Linux Mint Installation Guide](https://linuxmint-installation-guide.readthedocs.io/en/latest/multiboot.html) for detailed instructions.

## Adjusting Screen Contrast with `xgamma` and `xrandr`

Adjust the screen contrast using the `xgamma` and `xrandr` commands. For more detailed information, you can refer to [this Ask Ubuntu thread](https://askubuntu.com/questions/91195/how-do-i-adjust-the-screen-contrast).

- Using `xgamma`:

  ```sh
  xgamma -gamma 0.85
  ```

  This command sets the gamma value to `1.05`, affecting overall screen contrast and brightness.

- Using `xrandr`:

  ```sh
  xrandr --output eDP --gamma 0.8:0.8:0.8
  ```

  Here, the values `0.8:0.8:0.8` represent the gamma correction for the red, green, and blue channels, respectively. Experiment with these values to achieve the desired contrast and color balance.

**Please be aware that these changes are temporary and will be reset after a system reboot.**

---
# Screenshots

![Screenshot1](/Screenshot1.png)
![Screenshot2](/Screenshot2.png)
![Screenshot3](/Screenshot3.png)
![Screenshot4](/Screenshot4.png)

---

This guide provides a streamlined approach to customizing and backing up your GNOME Terminal and system settings, as well as tips for installing Linux Mint and setting up a dual-boot with Windows.

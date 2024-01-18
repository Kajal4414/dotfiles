## Setting Charging Thresholds for Battery Health

To extend the lifespan of your laptop's battery, you can set charging thresholds that prevent the battery from charging to full capacity. Use the provided service file to configure these thresholds.

Installation:

1. Download the `battery-charge-threshold.service` file from the [Scripts repository](https://github.com/sakshiagrwal/Scripts/blob/dev/Linux/etc/systemd/system/battery-threshold.service).
2. Move the service file to the systemd system directory and start the service:

   ```sh
   sudo mv battery-charge-threshold.service /etc/systemd/system/ && sudo systemctl start battery-charge-threshold.service && sudo systemctl enable battery-charge-threshold.service
   ```

## Customizing Firefox for Enhanced Performance

1. Download Configuration Files: [autoconfig.js](https://github.com/sakshiagrwal/Scripts/blob/main/Windows/Extra/autoconfig.js), [firefox.cfg](https://github.com/sakshiagrwal/Scripts/blob/main/Windows/Extra/firefox.cfg), [policies.json](https://github.com/sakshiagrwal/Scripts/blob/main/Windows/Extra/policies.json).

2. Move the configuration file to the Firefox installation directory:

   ```sh
   sudo mv firefox.cfg /usr/lib/firefox/ && mv autoconfig.js /usr/lib/firefox/defaults/pref/ && mv policies.json /usr/lib/firefox/distribution/
   ```

   - [Here's a breakdown of Firefox.cfg file](https://github.com/sakshiagrwal/Scripts/commit/29d90e6f4b727b24824584da56e5965cb43d94ea)
   - [Here's a breakdown of policies.json file](https://github.com/sakshiagrwal/Scripts/commit/258124948b51033265574a73336131482e22fc2e)
  
3. Firefox Mod Blur: [theme](https://github.com/datguypiko/Firefox-Mod-Blur), [stylesheet config](https://github.com/sakshiagrwal/Scripts/blob/258124948b51033265574a73336131482e22fc2e/Linux/usr/lib/firefox/firefox.cfg#L26).

   ```sh
   git clone --depth 1 https://github.com/datguypiko/Firefox-Mod-Blur && cd Firefox-Mod-Blur
   cd "$HOME/.mozilla/firefox/7do7mr6f.default-release"
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
  git clone https://github.com/vinceliuice/Colloid-gtk-theme && cd Colloid-gtk-theme && ./install.sh --color dark --tweaks black rimless
  ```

### IconTheme: [Colloid-icon-theme](https://github.com/vinceliuice/Colloid-icon-theme)

- Install the 'Blue' color version of the Colloid-icon-theme (Default directory: `$HOME/.local/share/icons`):

  ```sh
  git clone https://github.com/vinceliuice/Colloid-icon-theme && cd Colloid-icon-theme && ./install.sh
  ```

### CursorTheme: [Capitaine-cursors](https://github.com/keeferrourke/capitaine-cursors)

- Install the Capitaine-Cursors Patched version:

  ```sh
  curl -LO https://github.com/sainnhe/capitaine-cursors/releases/download/r5/Linux.zip && unzip Linux.zip && mv 'Capitaine Cursors' ~/.icons/Capitaine-Cursors
  ```

### SystemFonts:

- [Roboto Condensed](https://fonts.google.com/specimen/Roboto+Condensed)
- [IBM Plex Sans](https://fonts.google.com/specimen/IBM+Plex+Sans)
- [Inter](https://fonts.google.com/specimen/Inter)
- [Fira Code (Nerd Fonts)](https://github.com/ryanoasis/nerd-fonts/releases/latest) - Download `FiraCode.zip`
- [JetBrains Mono](https://www.jetbrains.com/lp/mono)

Recommended directory: `$HOME/.local/share/fonts`

## Linux Mint Installation and Configuration

- Kernel version `6.5.0-14-generic` is confirmed to work well with `Linux Mint 21.2` and the specified hardware.
- If experiencing touchpad lag, install the Synaptics driver:

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
  xgamma -gamma 1.05
  ```

  This command sets the gamma value to `1.05`, affecting overall screen contrast and brightness.

- Using `xrandr`:

  ```sh
  xrandr --output eDP --gamma 0.8:0.8:0.8
  ```

  Here, the values `0.8:0.8:0.8` represent the gamma correction for the red, green, and blue channels, respectively. Experiment with these values to achieve the desired contrast and color balance.

**Please be aware that these changes are temporary and will be reset after a system reboot.**

---

This guide provides a streamlined approach to customizing and backing up your GNOME Terminal and system settings, as well as tips for installing Linux Mint and setting up a dual-boot with Windows.

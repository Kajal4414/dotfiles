## Exporting and Importing GNOME Terminal Profiles

To export your GNOME Terminal profiles:

```sh
dconf dump /org/gnome/terminal/legacy/profiles:/ > ~/gnome-terminal-profiles.dconf
```

To import your GNOME Terminal profiles:

```sh
cat ~/gnome-terminal-profiles.dconf | dconf load /org/gnome/terminal/legacy/profiles:/
```

## Backing Up the Entire dconf Database

**Back up:**

- Save the `~/.config/dconf/user` file to a secure location.

**Restore:**

- Replace the `~/.config/dconf/user` file with the backup version.
- Exercise caution with this method as it affects all GNOME settings.

## Theme Customization

### GtkTheme: [Colloid-gtk-theme](https://github.com/vinceliuice/Colloid-gtk-theme)

Install the 'Blackness' color version of the Colloid-Dark theme:

```sh
git clone https://github.com/vinceliuice/Colloid-gtk-theme && cd Colloid-gtk-theme && ./install.sh --color dark --tweaks black rimless
```

### IconTheme: [Colloid-icon-theme](https://github.com/vinceliuice/Colloid-icon-theme)

Install the 'Blue' color version of the Colloid icon theme:

```sh
git clone https://github.com/vinceliuice/Colloid-icon-theme && cd Colloid-icon-theme && ./install.sh
```

### CursorTheme: [Capitaine-cursors](https://github.com/keeferrourke/capitaine-cursors)

Install the Capitaine-Cursors and the Patched version:

```sh
curl -LO https://github.com/sainnhe/capitaine-cursors/releases/download/r5/Linux.zip && unzip Linux.zip && mv 'Capitaine Cursors' ~/.icons/Capitaine-Cursors
```

- [Roboto Condensed](https://fonts.google.com/specimen/Roboto+Condensed)
- [IBM Plex Sans](https://fonts.google.com/specimen/IBM+Plex+Sans)
- [Inter](https://fonts.google.com/specimen/Inter)
- [Fira Code (Nerd Fonts)](https://github.com/ryanoasis/nerd-fonts/releases/latest) - Download `FiraCode.zip`
- [JetBrains Mono](https://www.jetbrains.com/lp/mono)

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

---

This guide provides a streamlined approach to customizing and backing up your GNOME Terminal and system settings, as well as tips for installing Linux Mint and setting up a dual-boot with Windows.

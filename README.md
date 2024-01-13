## Exporting and Importing GNOME Terminal Profiles (Using dconf):
```sh
dconf dump /org/gnome/terminal/legacy/profiles:/ > ~/gnome-terminal-profiles.dconf
cat ~/gnome-terminal-profiles.dconf | dconf load /org/gnome/terminal/legacy/profiles:/
```

## Backing Up the Entire dconf Database (Cautionary Approach):
- Back up:
    - Copy the entire `~/.config/dconf/user` file to a safe location.
- Restore:
    - Replace the existing `/.config/dconf/user` file with your backup.
    - Use this method with caution, as it restores all GNOME settings, not just Terminal-specific ones.

- GtkTheme: [Colloid-Dark](https://github.com/vinceliuice/Colloid-gtk-theme) 'Blackness' color version (Default installation directory: `$HOME/.themes`).
    ```sh
    git clone https://github.com/vinceliuice/Colloid-gtk-theme && cd Colloid-gtk-theme
    ./install.sh --name Colloid-Dark --color dark --tweaks black rimless
    ```
- IconTheme: [Colloid](https://github.com/vinceliuice/Colloid-icon-theme) 'Blue' color version (Default installation directory: `$HOME/.local/share/icons`).
    ```sh
    git clone https://github.com/vinceliuice/Colloid-icon-theme && cd Colloid-icon-theme
    ./install.sh
    ```
- CursorTheme: [Capitaine-Cursors](https://github.com/keeferrourke/capitaine-cursors). Fork [Patched-Capitaine-Cursors](https://github.com/sainnhe/capitaine-cursors)
    ```sh
    https://github.com/keeferrourke/capitaine-cursors && cd capitaine-cursors && ./build.sh
    mkdir -p ~/.icons/Capitaine-Cursors
    cp -pr path/to/theme/ ~/.icons/Capitaine-Cursors

    # Patched Capitaine Cursors
    curl https://github.com/sainnhe/capitaine-cursors/releases/download/r5/Linux.zip
    unzip Linux.zip
    mv Capitaine-Cursors/ ~/.icons/
    ```
- Fonts: (Default installation directory: `$HOME/.local/share/fonts`).
    - https://fonts.google.com/specimen/Roboto+Condensed
    - https://fonts.google.com/specimen/IBM+Plex+Sans
    - https://fonts.google.com/specimen/Inter
    - https://github.com/ryanoasis/nerd-fonts/releases/latest `FiraCode.zip`
    - https://www.jetbrains.com/lp/mono


## [Linux Mint Installation Guide](https://linuxmint-installation-guide.readthedocs.io/en/latest/)
- Kernel: `6.5.0-14-generic` Working fine on `Linux Mint 21.2` (With my hardware).
- If touchpad is lagging: `apt install xserver-xorg-input-synaptics` https://linuxmint.com/rel_virginia.php.

## [Always install Windows first, before you install Linux Mint.](https://linuxmint-installation-guide.readthedocs.io/en/latest/multiboot.html)

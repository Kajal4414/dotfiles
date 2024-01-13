## Exporting and Importing GNOME Terminal Profiles (Using dconf):
```sh
dconf dump /org/gnome/terminal/legacy/profiles:/ > ~/gnome-terminal-profiles.dconf
cat ~/gnome-terminal-profiles.dconf | dconf load /org/gnome/terminal/legacy/profiles:/
```

## Backing Up the Entire dconf Database (Cautionary Approach):
    - Back up:
        - Copy the entire ~/.config/dconf/user file to a safe location.
    - Restore:
        - Replace the existing ~/.config/dconf/user file with your backup.
        - Use this method with caution, as it restores all GNOME settings, not just Terminal-specific ones.

- GtkTheme: [Colloid-Dark](https://github.com/vinceliuice/Colloid-gtk-theme) black color version
- IconTheme: [Colloid](https://github.com/vinceliuice/Colloid-icon-theme) blue color version
- CursorTheme: [Capitaine-Cursors](https://github.com/keeferrourke/capitaine-cursors). Fork [Patched-Capitaine-Cursors](https://github.com/sainnhe/capitaine-cursors)
- Fonts:
    - https://fonts.google.com/specimen/Roboto+Condensed
    - https://fonts.google.com/specimen/IBM+Plex+Sans
    - https://fonts.google.com/specimen/Inter
    - https://github.com/ryanoasis/nerd-fonts/releases `FiraCode.zip`
    - https://www.jetbrains.com/lp/mono

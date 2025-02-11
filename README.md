<h1 align="center">
  <img src="https://raw.githubusercontent.com/archlinux/.github/main/profile/archlinux-logo-dark-scalable.svg" height="96px" />
  <br>
  NrmN Dotfiles for Arch linux
</h1>

1. [Software](#1-software)
2. [Directory Structure](#2-directory-structure)
3. [Installation](#3-installation)
4. [Inspiration & References](#4-inspiration--references)

## 1. Software
| Category           | Software               | Link                                             |
|--------------------|------------------------|--------------------------------------------------|
| Tiling compositor  | Hyprland               | [Website](https://hyprland.org/)                 |
| Terminal Emulator  | Alacritty              | [Website](https://alacritty.org/)                |
| File Manager       | Thunar                 | [Repo](https://github.com/xfce-mirror/thunar)    |
| Status Bar         | Waybar                 | [Repo](https://github.com/Alexays/Waybar)        |
| Launcher           | Rofi                   | [Repo](https://github.com/davatorium/rofi)       |
| Shell              | zsh, w/ Starship       | [Website](https://starship.rs/)                  |
| Logout Menu        | Wlogout                | [Repo](https://github.com/ArtsyMacaw/wlogout)    |

## 2. Directory Structure

```
dotfiles/
├── .bashrc
├── .config/
│   ├── fastfetch
│   ├── gtk-3.0
│   ├── hypr
│   ├── nvim
│   ├── rofi
│   ├── starship.toml
│   ├── wal
│   ├── waybar
│   ├── wlogout
│   ├── wofi
│   └── zsh
├── .gitignore
├── .gtkrc-2.0
├── .icons/
│   └── default
├── install/
│   ├── 1-install.sh
│   ├── 2-symlink.sh
│   ├── installer.sh
│   └── packages.sh
├── README.md
├── scripts/
│   ├── cliphist.sh
│   ├── gtk.sh
│   ├── screenshot_all.sh
│   ├── screenshot_area.sh
│   └── update_wallpaper.sh
├── .stow-local-ignore
├── .vimrc
├── wallpapers/
├── .Xresources
└── .zshrc
```

## 3. Installation
 
**Clone the Repository**

```bash
git clone https://github.com/n5mn/dotfiles
```

**Install Packages & Symlinks**

```bash
cd dotfiles/install
./1-install.sh 
stow -v . 
# Or you can use the script ./2-symlink.sh 
# But stow is recommended.
```
<details>
<summary>
Manual Installation
</summary>
Install packages.

```bash
pacman-contrib alacritty starship vim rofi dunst lxappearance-gtk3 breeze breeze-gtk tumbler cliphist ttf-font-awesome ttf-fira-sans ttf-fira-code ttf-firacode-nerd python-pip pavucontrol xdg-desktop-portal-gtk xdg-desktop-portal-wlr xdg-desktop-portal-hyprland networkmanager network-manager-applet networkmanager-openvpn ufw hyprland waybar jq polkit cpio inter-font stow
```

For bluetooth
```bash
blueman bluez bluez-utils
```

From the AUR
```bash
bibata-cursor-theme swww wlogout tela-icon-theme
```

Create the symlinks with stow.
```bash
stow -v .

mkdir -p $HOME/.config/alacritty/ # if doesnt exit
mkdir -p $HOME/.config/dunst/ # if doesnt exist

```
</details>

## 4. Inspiration & References

~~Stolen from:~~ \
Inspired by those repos:

- [notwidow/hyprland](https://github.com/notwidow/hyprland)
- [end-4/dots-hyprland](https://github.com/end-4/dots-hyprland)
- [fufexan/dotfiles](https://github.com/fufexan/dotfiles)
- [taylor85345/cyber-hyprland-theme](https://github.com/taylor85345/cyber-hyprland-theme)
- [hyper-dot/Arch-Hyprland](https://github.com/hyper-dot/Arch-Hyprland)
- [nawfalmrouyan/hyprland](https://github.com/nawfalmrouyan/hyprland)
- [coffebar/dotfiles](https://github.com/coffebar/dotfiles)
- [stephan-raabe/dotfiles (GitLab)](https://gitlab.com/stephan-raabe/dotfiles)
- [linkfrg/dotfiles](https://github.com/linkfrg/dotfiles)
- [eneshecan/dotfiles](https://github.com/eneshecan/dotfiles)
- [prasanthrangan/hyprdots](https://github.com/prasanthrangan/hyprdots)
- [niraj998/dotfiles (eww config)](https://github.com/niraj998/dotfiles/tree/main/.config/eww)
- [Saimoomedits/eww-widgets](https://github.com/Saimoomedits/eww-widgets)
- [elkowar/eww](https://github.com/elkowar/eww)
- [InioX/dotfiles](https://github.com/InioX/dotfiles/)
- [abaan404/dotfiles](https://github.com/abaan404/dotfiles)
- [hyprland.org Example Configurations](https://wiki.hyprland.org/Configuring/Example-configurations/)
- [eww by elkowar Documentation](https://elkowar.github.io/eww/)


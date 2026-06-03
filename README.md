# Dotfiles

## 1. Installation
 
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


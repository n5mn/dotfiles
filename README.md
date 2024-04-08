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
| Category               | Software               | Link                                          |
|------------------------|------------------------|-----------------------------------------------|
| Window Manager         | Hyprland               | [Website](https://hyprland.org/)              |
| Terminal Manager       | Alacritty              | [Website](https://alacritty.org/)             |
| File Manager           | Thunar                 | [GitHub](https://github.com/xfce-mirror/thunar) |
| Status Bar             | waybar                 | [GitHub](https://github.com/Alexays/Waybar)   |
| Launcher               | Rofi or Wofi          | [Rofi](https://github.com/davatorium/rofi) [Wofi](https://hg.sr.ht/~scoopta/wofi) |
| Shell                  | zsh, w/ OhMyZsh + P10K | [OhMyZsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH) [P10K](https://github.com/romkatv/powerlevel10k) |
| Session Manager        | Wlogout                | [GitHub](https://github.com/ArtsyMacaw/wlogout) |

Probably gonna replace rofi cuz doesnt have wayland support.

## 2. Directory Structure

```
dotfiles/
│
├── .vim/
├── alacritty/
├── gtk/
├── home/
├── hypr/
├── install/
├── rofi/
├── scripts/
├── wal/
├── wallpapers/
├── waybar/
├── wlogout/
├── wofi/
├── 1-install.sh
├── 2-symlink.sh
├── issue
└── README.md
```

## 3. Installation

1. **Clone the Repository**

```bash
git clone https://github.com/n5mn/dotfiles
```

2. **Install Packages & Symlinks**

```bash
cd dotfiles/
./1-install.sh
./2-symlink.sh
```

## 4. Inspiration & References

~~Stolen from:~~ 
Inspired by those repos:

- [rustybucketz30/dotfiles](https://github.com/rustybucketz30/dotfiles)
- [notwidow/hyprland](https://github.com/notwidow/hyprland)
- [end-4/dots-hyprland (summer-gruv)](https://github.com/end-4/dots-hyprland/tree/summer-gruv)
- [fufexan/dotfiles](https://github.com/fufexan/dotfiles)
- [taylor85345/cyber-hyprland-theme](https://github.com/taylor85345/cyber-hyprland-theme)
- [hyper-dot/Arch-Hyprland](https://github.com/hyper-dot/Arch-Hyprland)
- [archcraft-os/archcraft-hyprland](https://github.com/archcraft-os/archcraft-hyprland)
- [nawfalmrouyan/hyprland](https://github.com/nawfalmrouyan/hyprland)
- [coffebar/dotfiles](https://github.com/coffebar/dotfiles)
- [stephan-raabe/dotfiles (GitLab)](https://gitlab.com/stephan-raabe/dotfiles)
- [linkfrg/dotfiles](https://github.com/linkfrg/dotfiles)
- [eneshecan/dotfiles](https://github.com/eneshecan/dotfiles)
- [lauroro/hyprland-dotfiles](https://github.com/lauroro/hyprland-dotfiles)
- [dxg4268/hyprdots](https://github.com/dxg4268/hyprdots)
- [prasanthrangan/hyprdots](https://github.com/prasanthrangan/hyprdots)
- [niraj998/dotfiles (eww config)](https://github.com/niraj998/dotfiles/tree/main/.config/eww)
- [Saimoomedits/eww-widgets](https://github.com/Saimoomedits/eww-widgets)
- [elkowar/eww](https://github.com/elkowar/eww)
- [InioX/dotfiles](https://github.com/InioX/dotfiles/)
- [abaan404/dotfiles](https://github.com/abaan404/dotfiles)
- [hyprland.org Example Configurations](https://wiki.hyprland.org/Configuring/Example-configurations/)
- [eww by elkowar Documentation](https://elkowar.github.io/eww/)

- [My New Desktop - Hyprland by Chris Titus](https://christitus.com/my-new-desktop-hyprland/)
- [GPU Passthrough Guide](https://www.youtube.com/watch?v=EujO_5KvCCo)
- [Random YouTube Video 1](https://www.youtube.com/watch?v=_nyStxAI75s)
- [Random YouTube Video 2](https://www.youtube.com/watch?v=nNvciN4sGKQ&t=69s)

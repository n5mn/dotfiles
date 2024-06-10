#!/bin/sh
# Check if a package is installed using pacman
is_installed_pacman() {
    package="$1"
    check="`pacman -Q "$package"`"
    #[ -n "${check}" ] && echo 0 || echo 1
    if [ -n "${check}" ]; then
        return 0
    else
        return 1 
    fi
}

# Install packages using pacman if not installed
install_packages_pacman() {
    for pkg in "$@"; do
        if is_installed_pacman "$pkg"; then
            echo "$pkg is already installed."
            continue
        fi
        sudo pacman --noconfirm -S $pkg
    done
}

# Check if a package is installed using yay
is_installed_yay() {
    package="$1"
    check="`yay -Q "$package"`"
    #[ -n "${check}" ] && echo 0 || echo 1
    if [ -n "${check}" ]; then
        return 0
    else
        return 1 
    fi
}

# Install packages using yay if not installed
install_packages_yay() {
    for pkg; do
        if is_installed_yay "$pkg"; then # TODO: fix this syntax make it compatible with POSIX-compliant shell
            echo "$pkg is already installed."
            continue
        fi
        yay --noconfirm -S $pkg
    done
}

nvidia_drivers() {
    echo "Install nvidia drivers? [y/N] "
    read yn
    case $yn in
        [yY])
            sudo pacman -S --needed --noconfirm nvidia nvidia-utils
            ;;
        *)
            echo "Skipping..."
            ;;
    esac
}

symlink() {
    symlink_name="$1"   # This is just the name for logging purposes
    link_source="$2"
    link_target="$3"

    # Backing up the old files 
    backup_directory="$HOME/.config/.backup"
    if [ ! -d $backup_directory ]; then
        mkdir -p $backup_directory
    fi

    if [ -e "$link_target" ] && [ ! -L "$link_target"]; then
        cp -r "$link_target" "$backup_directory/"
        echo "Backing up old configuration files!"
    fi

    # Remove existing symlink, directory, or file at the target location
    echo "Removing existing configurations files..."
    [ -L "$link_target" ] && rm "$link_target"
    [ -d "$link_target" ] && rm -rf "$link_target"
    [ -f "$link_target" ] && rm "$link_target"
    
    # Create the new symlink
    ln -s "$link_source" "$link_target"
    echo "Symlink $link_source -> $link_target created (Named: $symlink_name)."
}

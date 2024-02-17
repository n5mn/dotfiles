#!/bin/bash
# Check if a package is installed using pacman
isInstalledPacman() {
    package="$1"
    check="$(sudo pacman -Qs --color always "${package}" | grep "local" | grep "${package} ")"
    [ -n "${check}" ] && echo 0 || echo 1
}

# Check if a package is installed using yay
isInstalledYay() {
    package="$1"
    check="$(yay -Qs --color always "${package}" | grep "local" | grep "${package} ")"
    [ -n "${check}" ] && echo 0 || echo 1
}

# Install packages using pacman if not installed
installPackagesPacman() {
    for pkg; do
        if [[ $(_isInstalledPacman "${pkg}") == 0 ]]; then
            echo "${pkg} is already installed."
            continue
        fi
        sudo pacman --noconfirm -S "${pkg}"
    done
}

# Install packages using yay if not installed
installPackagesYay() {
    for pkg; do
        if [[ $(isInstalledYay "${pkg}") == 0 ]]; then
            echo "${pkg} is already installed."
            continue
        fi
        yay --noconfirm -S "${pkg}"
    done
}

Symlink() {
    symlinkName="$1"   # This is just the name for logging purposes
    linkSource="$2"
    linkTarget="$3"
    
    # Remove existing symlink, directory, or file at the target location
    echo "Removing existing configurations files..."
    [ -L "${linkTarget}" ] && rm "${linkTarget}"
    [ -d "${linkTarget}" ] && rm -rf "${linkTarget}"
    [ -f "${linkTarget}" ] && rm "${linkTarget}"
    
    # Create the new symlink
    ln -s "${linkSource}" "${linkTarget}"
    echo "Symlink ${linkSource} -> ${linkTarget} created (Named: ${symlinkName})."
}

#!/bin/bash
#
# Installs packages for the system using yay.

# -e: exit on error
# -u: exit on unset variables
# -o pipefail: exit on pipe failure
set -euo pipefail

# Function to check if a package is installed
# pacman -Q works for both repo and AUR packages
is_pkg_installed() {
  pacman -Q "$1" &>/dev/null
}

# Install essential packages
# yay will handle packages from both official repositories and the AUR
packages=(
  gum
  ncdu
  btop
  zsh
  zsh-completions
  nvtop
  waybar
  vivaldi
  google-chrome-beta
  discord
)

for pkg in "${packages[@]}"; do
  if ! is_pkg_installed "$pkg"; then
    echo "Installing $pkg..."
    yay -S --noconfirm "$pkg"
  else
    echo "$pkg is already installed."
  fi
done

echo "Package installation script finished."

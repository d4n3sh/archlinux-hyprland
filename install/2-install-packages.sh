#!/bin/bash
#
# Installs packages for the system.

# -e: exit on error
# -u: exit on unset variables
# -o pipefail: exit on pipe failure
set -euo pipefail

# Function to check if a package is installed
is_pkg_installed() {
  pacman -Q "$1" &>/dev/null
}


# Install essential packages
packages=(
  gum
  ncdu
  btop
)

for pkg in "${packages[@]}"; do
  if ! is_pkg_installed "$pkg"; then
    echo "Installing $pkg..."
    sudo pacman -S --noconfirm "$pkg"
  else
    echo "$pkg is already installed."
  fi
done


echo "Package installation script finished."

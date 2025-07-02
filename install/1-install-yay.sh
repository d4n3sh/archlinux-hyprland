#!/bin/bash

# This script installs yay if it is not already installed.

set -e

if command -v yay &> /dev/null; then
    echo "yay is already installed."
    exit 0
fi

echo "yay not found. Installing..."

# Install required dependencies
sudo pacman -S --needed git base-devel

# Clone the yay repository from the AUR
git clone https://aur.archlinux.org/yay.git /tmp/yay

# Build and install yay
(cd /tmp/yay && makepkg -si --noconfirm)

# Clean up
rm -rf /tmp/yay

echo "yay has been successfully installed."

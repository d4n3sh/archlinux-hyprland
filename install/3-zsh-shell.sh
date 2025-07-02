#!/bin/bash
#
# Configures zsh as the default shell.

# -e: exit on error
# -u: exit on unset variables
# -o pipefail: exit on pipe failure
set -euo pipefail

# Function to check if a package is installed
is_pkg_installed() {
  pacman -Q "$1" &>/dev/null
}

# Install zsh if not already installed
if ! is_pkg_installed zsh; then
  echo "Installing zsh..."
  sudo pacman -S --noconfirm zsh
else
  echo "zsh is already installed."
fi

# Change shell to zsh for the current user if it's not already zsh
if [[ "$(getent passwd "$USER" | cut -d: -f7)" != "$(which zsh)" ]]; then
  echo "Changing shell to zsh for user $USER..."
  # The following command will prompt for the user's password.
  chsh -s "$(which zsh)"
  echo "Shell changed to zsh. Please log out and log back in for the change to take effect."
else
  echo "zsh is already the default shell for user $USER."
fi

# Create .zshrc if it doesn't exist
if [ ! -f "$HOME/.zshrc" ]; then
  echo "Creating $HOME/.zshrc..."
  touch "$HOME/.zshrc"
else
  echo "$HOME/.zshrc already exists."
fi

echo "zsh configuration script finished."

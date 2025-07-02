#!/bin/bash
#
# Configures waybar by copying the config files from this repo.

# -e: exit on error
# -u: exit on unset variables
# -o pipefail: exit on pipe failure
set -euo pipefail

WAYBAR_CONFIG_DIR="$HOME/.config/waybar"
REPO_WAYBAR_CONFIG_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../config/waybar"

# Create waybar config directory if it doesn't exist
mkdir -p "$WAYBAR_CONFIG_DIR"

# Copy the repo's waybar config, overwriting existing files
echo "Copying waybar config files..."
cp -r "$REPO_WAYBAR_CONFIG_DIR"/* "$WAYBAR_CONFIG_DIR/"

echo "Waybar configuration complete."

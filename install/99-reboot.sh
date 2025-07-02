#!/bin/bash
#
# Asks for confirmation and reboots the system.

# -e: exit on error
# -u: exit on unset variables
# -o pipefail: exit on pipe failure
set -euo pipefail

if gum confirm "Do you want to reboot now?" --default=false; then
  echo "Rebooting now..."
  sudo reboot
else
  echo "Reboot cancelled."
fi

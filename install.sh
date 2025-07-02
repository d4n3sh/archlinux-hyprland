#!/bin/bash

# Main installation script

set -e

for script in ./install/[0-9]-*.sh; do
    if [ -f "$script" ]; then
        echo "Running $script..."
        bash "$script"
    fi
done

echo "Installation complete!"

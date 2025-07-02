#!/bin/bash

# Main configuration script

set -e

for script in ./configure/[0-9]*-*.sh; do
    if [ -f "$script" ]; then
        echo "Running $script..."
        bash "$script"
    fi
done

echo "Configuration complete!"

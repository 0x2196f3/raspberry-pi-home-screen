#!/bin/bash

# Get the directory of the script
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Define the path to clock.py
PYTHON_SCRIPT="$SCRIPT_DIR/main.py"

# Give execute permission to clock.py
chmod +x "$PYTHON_SCRIPT"

# Define the path to the .desktop file
DESKTOP_FILE="/etc/xdg/lxsession/LXDE/autostart/raspberry-pi-home-screen.desktop"

# Create the .desktop file
cat <<EOF | sudo tee "$DESKTOP_FILE" > /dev/null
[Desktop Entry]
Type=Application
Name=raspberry-pi-home-screen
Exec=$PYTHON_SCRIPT
EOF

echo "Desktop file created successfully."
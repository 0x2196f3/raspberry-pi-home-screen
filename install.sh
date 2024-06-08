#!/bin/bash

# Get the directory of the script
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Give execute permission to main.py
chmod +x "$SCRIPT_DIR/main.py"

# Give execute permission to geckodriver
chmod +x "$SCRIPT_DIR/geckodriver"

# Insall requirements
python3 -m venv $SCRIPT_DIR/venv
$SCRIPT_DIR/venv/bin/pip install -r $SCRIPT_DIR/requirements.txt

# Copy geckodriver to firefox path
cp $SCRIPT_DIR/geckodriver /usr/lib/firefox/geckodriver

# Define the path to the .desktop file
DESKTOP_FILE="/etc/xdg/autostart/raspberry-pi-home-screen.desktop"

# Create the .desktop file
cat <<EOF | sudo tee "$DESKTOP_FILE" > /dev/null
[Desktop Entry]
Type=Application
Name=raspberry-pi-home-screen
Exec=$SCRIPT_DIR/venv/bin/python3 $SCRIPT_DIR/main.py
EOF

echo "Desktop file created successfully."

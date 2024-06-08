#!/bin/bash

# Get the directory of the script
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Define the path to clock.py
PYTHON_SCRIPT="$SCRIPT_DIR/main.py"

# Give execute permission to clock.py
chmod +x "$PYTHON_SCRIPT"

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
Exec=$SCRIPT_DIR/venv/bin/python3 $PYTHON_SCRIPT
EOF

echo "Desktop file created successfully."

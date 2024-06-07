#!/bin/bash

# Get the directory of the script
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Define the path to filename.py
PYTHON_SCRIPT="$SCRIPT_DIR/main.py"

# Define the command to be added to autostart
AUTOSTART_COMMAND="@sudo /usr/bin/python3 $PYTHON_SCRIPT"

# Add the command to autostart
echo "$AUTOSTART_COMMAND" >> ~/.config/lxsession/LXDE-pi/autostart

# Make the Python script executable
chmod +x "$PYTHON_SCRIPT"

echo "Autostart application installed successfully."
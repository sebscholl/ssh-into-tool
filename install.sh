#!/bin/bash

# ssh-into installer script
# This script installs the ssh-into utility to your system

set -e  # Exit on any error

echo "=== SSH-Into Utility Installer ==="
echo "This script will install the ssh-into utility to your system."

# Define installation destination
INSTALL_DIR="/usr/local/bin"
if [ ! -w "$INSTALL_DIR" ]; then
    SUDO="sudo"
    echo "Note: Installing to $INSTALL_DIR requires sudo privileges"
else
    SUDO=""
fi

# Get the directory of this script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Check if ssh-into file exists
SSH_INTO_SCRIPT="$SCRIPT_DIR/ssh-into"
if [ ! -f "$SSH_INTO_SCRIPT" ]; then
    echo "Error: Could not find ssh-into script in the current directory"
    exit 1
fi

echo -e "\nInstalling ssh-into to $INSTALL_DIR..."

# Copy the script to the installation directory
$SUDO cp "$SSH_INTO_SCRIPT" "$INSTALL_DIR/ssh-into"
$SUDO chmod +x "$INSTALL_DIR/ssh-into"

echo -e "\nCreating default configuration..."
CONFIG_DIR="$HOME/.ssh"
CONFIG_FILE="$CONFIG_DIR/servers.txt"

# Create config directory if it doesn't exist
mkdir -p "$CONFIG_DIR"

# Create a default config file if it doesn't exist
if [ ! -f "$CONFIG_FILE" ]; then
    echo "# Server list format: NAME USERNAME@IP" > "$CONFIG_FILE"
    echo "# Example: webserver john@192.168.1.10" >> "$CONFIG_FILE"
    echo "Created new configuration file: $CONFIG_FILE"
else
    echo "Using existing configuration file: $CONFIG_FILE"
fi

echo -e "\n✅ Installation complete!"
echo "You can now use ssh-into by running the command: ssh-into"
echo "Add your first server with: ssh-into -a servername username@ip"
echo "Run ssh-into -h for help"
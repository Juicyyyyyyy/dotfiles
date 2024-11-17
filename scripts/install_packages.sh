#!/bin/bash

# Update system package manager
sudo apt update -y && sudo apt upgrade -y

# List of packages to install
PACKAGES=(
  git
  vim
  neovim
  zsh
  curl
  kitty
  polybar
  rofi
  i3
  python3-pip
  python3-i3ipc
)

echo "Starting installation of packages..."

# Loop through the list and install each package if not already installed
for PACKAGE in "${PACKAGES[@]}"; do
  if ! dpkg -l | grep -q "$PACKAGE"; then
    echo "Installing $PACKAGE..."
    sudo apt install -y "$PACKAGE"
  else
    echo "$PACKAGE is already installed."
  fi
done

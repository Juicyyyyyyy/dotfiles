#!/bin/bash

source ~/.config/.env

# Install packages
$ROOT_PATH/scripts/install_packages.sh

# Set config
$ROOT_PATH/scripts/set_config.sh

# Set fonts
$ROOT_PATH/scripts/set_fonts.sh

# Setup rofi (Not working from here, execute it from rofi folder)
# $ROOT_PATH/rofi/setup.sh

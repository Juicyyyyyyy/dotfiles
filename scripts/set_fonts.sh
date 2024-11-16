#!/bin/bash

# Function to install Nerd Fonts using sparse-checkout
install_nerd_font_sparse() {
    font_name="$1"
    font_repo="https://github.com/ryanoasis/nerd-fonts.git"
    clone_dir="/tmp/nerd-fonts"
    font_dir="$HOME/.local/share/fonts/$font_name"

    echo "Setting up sparse-checkout for $font_name..."

    # Clone the repo with sparse-checkout enabled
    git clone --depth 1 --filter=blob:none --sparse "$font_repo" "$clone_dir"
    cd "$clone_dir" || exit

    # Configure sparse-checkout for the desired font
    git sparse-checkout set patched-fonts/"$font_name"

    # Copy the specific font
    echo "Installing $font_name Nerd Font..."
    mkdir -p "$font_dir"
    cp patched-fonts/"$font_name"/*/*.ttf "$font_dir"

    # Update font cache
    echo "Updating font cache..."
    fc-cache -fv

    echo "$font_name Nerd Font installed successfully!"
}

# Function to set font for Kitty
set_kitty_font() {
    kitty_conf="$HOME/.config/kitty/kitty.conf"
    echo "Setting FiraCode Nerd Font in Kitty configuration..."

    if [ ! -f "$kitty_conf" ]; then
        mkdir -p "$(dirname "$kitty_conf")"
        touch "$kitty_conf"
    fi

    echo "font_family FiraCode Nerd Font" >> "$kitty_conf"
    echo "Kitty font updated. Please restart Kitty."
}

font="FiraCode"
install_nerd_font_sparse "$font"

set_kitty_font

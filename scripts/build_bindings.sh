#!/bin/bash

# Check for required utilities
if ! command -v xdotool &> /dev/null; then
    echo "xdotool not found. Please install xdotool."
    exit 1
fi

if ! command -v wmctrl &> /dev/null; then
    echo "wmctrl not found. Please install wmctrl."
    exit 1
fi

# Backup existing keybindings
existing_bindings=$(gsettings list-recursively org.gnome.desktop.wm.keybindings)
echo "Backing up existing keybindings to ~/.gnome_wm_keybindings_backup"
echo "${existing_bindings}" > ~/.gnome_wm_keybindings_backup

# Define new keybindings: key and binding
declare -A keybindings=(
    # Close window
    ["close"]="<Super><Shift>q"

    # Switch to workspace 1-9
    ["switch-to-workspace-1"]="<Super>1"
    ["switch-to-workspace-2"]="<Super>2"
    ["switch-to-workspace-3"]="<Super>3"
    ["switch-to-workspace-4"]="<Super>4"
    ["switch-to-workspace-5"]="<Super>5"
    ["switch-to-workspace-6"]="<Super>6"
    ["switch-to-workspace-7"]="<Super>7"
    ["switch-to-workspace-8"]="<Super>8"
    ["switch-to-workspace-9"]="<Super>9"

    # Move window to workspace 1-9
    ["move-to-workspace-1"]="<Super><Shift>1"
    ["move-to-workspace-2"]="<Super><Shift>2"
    ["move-to-workspace-3"]="<Super><Shift>3"
    ["move-to-workspace-4"]="<Super><Shift>4"
    ["move-to-workspace-5"]="<Super><Shift>5"
    ["move-to-workspace-6"]="<Super><Shift>6"
    ["move-to-workspace-7"]="<Super><Shift>7"
    ["move-to-workspace-8"]="<Super><Shift>8"
    ["move-to-workspace-9"]="<Super><Shift>9"

    # Toggle fullscreen
    ["toggle-fullscreen"]="<Super>f"

    # Minimize and maximize
    ["minimize"]="<Super>m"
    ["maximize"]="<Super><Shift>f"
    ["unmaximize"]="<Super><Shift>u"
    ["toggle-maximized"]="<Super>n"

    # Move window to screen edges (similar to tiling)
    ["begin-move"]="<Super><Alt>m"
    ["begin-resize"]="<Super><Alt>r"
)

# Disable default GNOME keybindings that conflict with custom i3-like keybindings
conflicting_bindings=(
    "switch-to-application-1"
    "switch-to-application-2"
    "switch-to-application-3"
    "switch-to-application-4"
    "switch-to-application-5"
    "switch-to-application-6"
    "switch-to-application-7"
    "switch-to-application-8"
    "switch-to-application-9"
)

for binding in "${conflicting_bindings[@]}"; do
    gsettings set org.gnome.shell.keybindings "${binding}" "[]"
done

# Apply new keybindings
for key in "${!keybindings[@]}"; do
    binding="${keybindings[$key]}"
    gsettings set org.gnome.desktop.wm.keybindings "${key}" "['${binding}']"
done

# Reset existing custom keybindings
gsettings reset org.gnome.settings-daemon.plugins.media-keys custom-keybindings

# Define custom keybindings: name, command, binding
declare -a custom_keybindings_list=()
index=0

add_custom_keybinding() {
    local name="$1"
    local command="$2"
    local binding="$3"
    local keybinding_path="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom${index}/"
    custom_keybindings_list+=("${keybinding_path}")
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:"${keybinding_path}" name "${name}"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:"${keybinding_path}" command "${command}"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:"${keybinding_path}" binding "${binding}"
    index=$((index + 1))
}

# Add custom keybindings

# Open Terminal
add_custom_keybinding "Open Terminal" "kitty" "<Super>t"

# Open Application Launcher (using rofi or gnome launcher)
add_custom_keybinding "Open Files" "nautilus" "<Super>d"

# Move focus between windows (requires installation of xdotool and wmctrl)
add_custom_keybinding "Focus Left" "xdotool key Alt+Escape" "<Super>h"
add_custom_keybinding "Focus Down" "xdotool key Alt+Tab" "<Super>j"
add_custom_keybinding "Focus Up" "xdotool key Alt+Shift+Tab" "<Super>k"
add_custom_keybinding "Focus Right" "xdotool key Alt+F6" "<Super>l"

# Build the list of custom keybindings
custom_keybindings_formatted=$(printf "'%s', " "${custom_keybindings_list[@]}")
custom_keybindings_formatted="[${custom_keybindings_formatted%, }]"  # Remove the trailing comma and space

# Apply the custom keybindings
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "${custom_keybindings_formatted}"

echo "Custom keybindings have been set, and GNOME keybindings have been updated."


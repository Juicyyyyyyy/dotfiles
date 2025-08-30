#!/bin/bash
export WAYLAND_DISPLAY=wayland-1
export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=sway

# Kill any existing waybar processes
pkill waybar 2>/dev/null
sleep 1

# Start waybar
exec waybar --config ~/.config/waybar/config.jsonc --style ~/.config/waybar/style.css 
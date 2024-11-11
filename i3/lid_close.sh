#!/bin/bash

# Replace 'eDP-1' with your laptop's actual display name
laptop_output="eDP-1"

# Get the workspace currently on the laptop screen
active_workspace=$(i3-msg -t get_workspaces | jq -r '.[] | select(.output=="'"$laptop_output"'") | .name')

# Move the workspace if it exists
if [ ! -z "$active_workspace" ]; then
    i3-msg workspace "$active_workspace"
    i3-msg move workspace to output right
fi


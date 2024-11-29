#!/usr/bin/env bash

# ==================================================
# Polybar Startup Script for i3 with Multiple Monitors
# ==================================================

# Terminate any running Polybar instances to avoid duplicates
echo "Terminating existing Polybar instances..."
killall -q polybar

# Wait until all Polybar processes have been terminated
while pgrep -u "$UID" -x polybar >/dev/null; do
    sleep 1
done

echo "Launching Polybar on all connected monitors..."

# Detect connected monitors using xrandr and filter out disconnected ones
MONITORS=$(xrandr --query | grep " connected")

# Check if any monitors are detected
if [ -z "$MONITORS" ]; then
    echo "No connected monitors found. Exiting Polybar startup script."
    exit 1
fi

# Loop through each connected monitor and launch Polybar
for MONITOR in $MONITORS; do
    echo "Starting Polybar on monitor: $MONITOR"
    MONITOR=$MONITOR polybar bar --reload &
done

echo "All Polybar instances launched successfully!"

#!/bin/bash
mkdir ~/.cache/waybar/
STATE_FILE="$HOME/.cache/waybar/sunset-state"

# If called from on-click (no args), toggle state
if [ "$1" = "toggle" ]; then
    if [ -f "$STATE_FILE" ] && [ $(cat "$STATE_FILE") = "on" ]; then
        echo "off" > "$STATE_FILE"
        # wg-quick down wg0
    else
        echo "on" > "$STATE_FILE"
        # wg-quick up wg0
    fi
    pkill -SIGRTMIN+12 waybar
    exit 0
fi

# Default behavior: just show status
if [ -f "$STATE_FILE" ] && [ $(cat "$STATE_FILE") = "on" ]; then
    echo '{"text": "󰈈", "tooltip": "Toggle blue-light-filter", "class": "on"}'
else
    echo '{"text": "", "tooltip": "Toggle blue-light-filter", "class": "off"}'
fi

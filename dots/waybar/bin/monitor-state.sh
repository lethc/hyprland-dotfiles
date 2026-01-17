#!/bin/bash
mkdir ~/.cache/waybar/
STATE_FILE="$HOME/.cache/waybar/monitor-state"

# If called from on-click (no args), toggle state
if [ "$1" = "toggle" ]; then
    if [ -f "$STATE_FILE" ] && [ $(cat "$STATE_FILE") = "on" ]; then
        echo "off" > "$STATE_FILE"
    else
        echo "on" > "$STATE_FILE"
    fi
    pkill -SIGRTMIN+12 waybar
    exit 0
fi

# Default behavior: just show status
if [ -f "$STATE_FILE" ] && [ $(cat "$STATE_FILE") = "on" ]; then
    echo '{"text": "󰍹", "tooltip": "Enable Multi-Monitor set up", "class": "on"}'
else
    echo '{"text": "󰍺", "tooltip": "Disable Multi-Monitor set up", "class": "off"}'
fi

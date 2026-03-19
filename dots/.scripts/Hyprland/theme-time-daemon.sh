#!/bin/bash
# ~/.config/hypr/bin/theme-time-daemon.sh

STATE_THEME_FILE="$HOME/.cache/theme/theme-state"
SWITCHER_SCRIPT="$HOME/Home/Scripts/automation/theme-switcher.sh"

# Function to check time and switch theme if needed
check_and_switch() {
    HOUR=$(date +%H)
    
    # Determine desired theme based on time
    if [ "$HOUR" -ge 18 ] || [ "$HOUR" -lt 6 ]; then
        DESIRED="dark"
    else
        DESIRED="light"
    fi
    
    # Check current theme
    if [ -f "$STATE_THEME_FILE" ]; then
        CURRENT=$(cat "$STATE_THEME_FILE")
    else
        CURRENT="unknown"
    fi
    
    # Switch if needed
    if [ "$CURRENT" != "$DESIRED" ]; then
        # notify-send "Theme Switcher" "Switched to $DESIRED mode"
        "$SWITCHER_SCRIPT"
        # Optional: Send notification
    fi
}

# Initial check
check_and_switch

# Loop forever, checking every minute
while true; do
    sleep 60  # Check every minute
    check_and_switch
done

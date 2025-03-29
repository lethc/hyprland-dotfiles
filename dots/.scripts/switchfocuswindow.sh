#!/usr/bin/env bash

# Show the active window always on top if they are floating
if [[ $(hyprctl -j activewindow | jq -r '.floating') == true ]]; then
    hyprctl dispatch focuscurrentorlast
    hyprctl dispatch alterzorder top
else
    # Hide scratchpad and switch between workspaces windows only
    if windowname=$(hyprctl -j activewindow | jq -r '.workspace.name') && [[ "$windowname" == *"special"* ]]; then
        wspecialname=$(echo "$windowname" | awk -F':' '{print $2}')
        hyprctl dispatch togglespecialworkspace ${wspecialname}
        hyprctl dispatch workspace previous
    else
        hyprctl dispatch focuscurrentorlast
        windowname=$(hyprctl -j activewindow | jq -r '.workspace.name')
        # Hide scratchpad also if it was the last window before the current one
        if [[ "$windowname" == *"special"* ]]; then
            wspecialname=$(echo "$windowname" | awk -F':' '{print $2}')
            hyprctl dispatch togglespecialworkspace ${wspecialname}
            hyprctl dispatch workspace previous
        else
            break
        fi
    fi
fi

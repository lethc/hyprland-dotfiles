#!/usr/bin/env bash

switchLastWindow() {
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
            hyprctl dispatch movecursortocorner 2
        else
            hyprctl dispatch focuscurrentorlast
            hyprctl dispatch movecursortocorner 2
            windowname=$(hyprctl -j activewindow | jq -r '.workspace.name')
            # Hide scratchpad also if it was the last window before the current one
            if [[ "$windowname" == *"special"* ]]; then
                wspecialname=$(echo "$windowname" | awk -F':' '{print $2}')
                hyprctl dispatch togglespecialworkspace ${wspecialname}
                hyprctl dispatch workspace previous
                hyprctl dispatch movecursortocorner 2
            else
                break
            fi
        fi
    fi
}

switchLastMonitor() {
    if monitorname=$(hyprctl -j activeworkspace | jq -r '.monitor') && [[ "$monitorname" == *"HDMI-A-1" ]]; then
        hyprctl dispatch focusmonitor eDP-1
    else
        hyprctl dispatch focusmonitor HDMI-A-1
    fi
}

case "$1" in
lastwindow)
    switchLastWindow
    ;;
lastmonitor)
    switchLastMonitor
    ;;
esac

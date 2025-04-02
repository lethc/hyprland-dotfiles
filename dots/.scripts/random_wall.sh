#!/usr/bin/env bash

CURRENT_MONITOR=$(hyprctl -j activeworkspace | jq -r '.monitor')
WALLPAPER_DIRECTORY=~/Pictures/Wallpapers
WALLPAPER=$(find "$WALLPAPER_DIRECTORY" -type f | shuf -n 1)
WALLPAPER2=$(find "$WALLPAPER_DIRECTORY" -type f | shuf -n 1)
# Create a lock file
LOCK_FILE="/tmp/hyprpaper_lock"

# notify-send "The script is running"

random_wallpaper_monitor() {
    # Function to acquire the lock
    acquire_lock() {
        (
            flock -x 300 || exit 0
        ) 200>$LOCK_FILE
    }
    # Function to release the lock
    release_lock() {
        rm -f "$LOCK_FILE"
    }
    if [[ $CURRENT_MONITOR == "eDP-1" ]]; then
        acquire_lock
        hyprctl hyprpaper preload "$WALLPAPER"
        hyprctl hyprpaper wallpaper "eDP-1,$WALLPAPER"

        sleep 1

        hyprctl hyprpaper unload unused
        release_lock
    elif [[ $CURRENT_MONITOR == "HDMI-A-1" ]]; then
        acquire_lock
        hyprctl hyprpaper preload "$WALLPAPER2"
        hyprctl hyprpaper wallpaper "HDMI-A-1,$WALLPAPER2"

        sleep 1

        hyprctl hyprpaper unload unused
        release_lock
    else
        notify-send "No monitor detected"
    fi

}

random_wallpaper_all() {
    if [[ -d "$WALLPAPER_DIRECTORY" ]]; then
        notify-send "Welcome aboard!"

        hyprctl hyprpaper preload "$WALLPAPER"
        hyprctl hyprpaper preload "$WALLPAPER2"
        hyprctl hyprpaper wallpaper "eDP-1,$WALLPAPER"
        hyprctl hyprpaper wallpaper "HDMI-A-1,$WALLPAPER2"

        sleep 1

        hyprctl hyprpaper unload unused
    else
        notify-send "Wallpaper directory not found"
    fi
}

case "$1" in
monitor) random_wallpaper_monitor ;;
all) random_wallpaper_all ;;
esac

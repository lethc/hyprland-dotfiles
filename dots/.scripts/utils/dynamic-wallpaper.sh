#!/bin/bash

# This creates a dynamic wallpaper that changes with the time of day
# If you have 24 frames (one per hour):
#     At 00:00 → shows frame-1
#     At 01:00 → shows frame-2
#     At 02:00 → shows frame-3
# With 8 image frames, the script will distribute them evenly across the 24-hour day (1440 minutes). 
# Total minutes in day: 1440
# Number of frames: 8
# Minutes per frame: 1440 ÷ 8 = 180 minutes (3 hours)
# Frame Number	Time Range   	Display Time
# Frame 1     	00:00 - 02:59	Midnight to 2:59 AM
# Frame 2     	03:00 - 05:59	3:00 AM to 5:59 AM
# Frame 3     	06:00 - 08:59	6:00 AM to 8:59 AM
# Frame 4     	09:00 - 11:59	9:00 AM to 11:59 AM
# Frame 5     	12:00 - 14:59	Noon to 2:59 PM
# Frame 6     	15:00 - 17:59	3:00 PM to 5:59 PM
# Frame 7     	18:00 - 20:59	6:00 PM to 8:59 PM
# Frame 8     	21:00 - 23:59	9:00 PM to 11:59 PM


WALLPAPER_NAME="Pyongyang"
WALLPAPER_DIR="$HOME/Pictures/wallpapers/dynamic-wallpapers/$WALLPAPER_NAME"

get_total_frames() {
    local max=0
    for f in "$WALLPAPER_DIR"/frame-*; do
        [[ -f "$f" ]] || continue
        local num
        num=$(basename "$f" | grep -oP '(?<=frame-)\d+')
        [[ -n "$num" && "$num" -gt "$max" ]] && max=$num
    done
    echo "$max"
}

get_frame_ext() {
    for ext in jpg png jpeg webp; do
        [[ -f "$WALLPAPER_DIR/frame-1.$ext" ]] && echo "$ext" && return
    done
    echo "jpg"
}

get_frame() {
    local total_frames="$1"
    local total_minutes=$(( $(date +%-H) * 60 + $(date +%-M) ))
    local minutes_per_frame=$(( 1440 / total_frames ))
    local frame=$(( total_minutes / minutes_per_frame + 1 ))
    [ "$frame" -gt "$total_frames" ] && frame=$total_frames
    echo "$frame"
}

set_wallpaper() {
    local frame_num="$1"
    local ext="$2"
    local wallpaper="$WALLPAPER_DIR/frame-${frame_num}.${ext}"

    if [ ! -f "$wallpaper" ]; then
        echo "[$(date '+%H:%M:%S')] ERROR: file not found: $wallpaper"
        return 1
    fi

    awww img "$wallpaper" \
        --transition-type fade \
        --transition-duration 2 \
        --transition-fps 60
}

if ! awww query &>/dev/null; then
    echo "[$(date '+%H:%M:%S')] awww-daemon not running, starting..."
    awww-daemon &
    sleep 2
    echo "[$(date '+%H:%M:%S')] awww-daemon started"
else
    echo "[$(date '+%H:%M:%S')] awww-daemon already running"
fi

if [ ! -d "$WALLPAPER_DIR" ]; then
    echo "[$(date '+%H:%M:%S')] ERROR: directory not found: $WALLPAPER_DIR"
    exit 1
fi

TOTAL_FRAMES=$(get_total_frames)

if [ "$TOTAL_FRAMES" -eq 0 ]; then
    echo "[$(date '+%H:%M:%S')] ERROR: no frame files found in $WALLPAPER_DIR"
    exit 1
fi

EXT=$(get_frame_ext)
MINUTES_PER_FRAME=$(( 1440 / TOTAL_FRAMES ))

echo "[$(date '+%H:%M:%S')] Wallpaper set  : $WALLPAPER_NAME"
echo "[$(date '+%H:%M:%S')] Total frames   : $TOTAL_FRAMES"
echo "[$(date '+%H:%M:%S')] File extension : .$EXT"
echo "[$(date '+%H:%M:%S')] Interval       : ${MINUTES_PER_FRAME} min per frame (${TOTAL_FRAMES} changes/day)"

LAST_FRAME=0

while true; do
    FRAME=$(get_frame "$TOTAL_FRAMES")

    if [ "$FRAME" != "$LAST_FRAME" ]; then
        echo "[$(date '+%H:%M:%S')] Frame changed: $LAST_FRAME -> $FRAME, setting frame-${FRAME}.${EXT}"
        if set_wallpaper "$FRAME" "$EXT"; then
            echo "[$(date '+%H:%M:%S')] Wallpaper set successfully"
        fi
        LAST_FRAME=$FRAME
    fi

    SLEEP=$(( 60 - 10#$(date +%S) ))
    echo "[$(date '+%H:%M:%S')] Sleeping ${SLEEP}s until next check (current frame: $FRAME / $TOTAL_FRAMES)"
    sleep "$SLEEP"
done

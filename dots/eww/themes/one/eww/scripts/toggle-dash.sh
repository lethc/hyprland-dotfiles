#!/usr/bin/bash
cd ~/.config/hypr/themes/one/eww || exit

reserves=$(hyprctl monitors -j | gojq -r -c '.[0]["reserved"]')
if [[ "$1" == "--keypress" && "$reserves" == "[0,0,0,50]" ]]; then
    scripts/toggle-winactions.sh
    exit
fi

state=$(eww -c $HOME/.config/hypr/themes/one/eww/ get rev_dash)

if [[ "$state" == "true" || "$1" == "--close" ]]; then
    # eww update anim_open_dash=false
    eww -c $HOME/.config/hypr/themes/one/eww/ update anim_open_dash=false 
    # eww update rev_dash=false
    eww -c $HOME/.config/hypr/themes/one/eww/ update rev_dash=false 
    sleep 0.08
    # eww close dashboard 2>/dev/null
    eww -c $HOME/.config/hypr/themes/one/eww/ close dashboard0 2>/dev/null 
else
    # scripts/toggle-overview.sh --close &
    # scripts/toggle-osettings.sh --close &
    # scripts/toggle-onotify.sh --close &
    # eww update anim_open_dash=true
    eww -c $HOME/.config/hypr/themes/one/eww/ update anim_open_dash=true 
    # eww open dashboard
    eww -c $HOME/.config/hypr/themes/one/eww/ open dashboard0
    # eww update rev_dash=true
    eww -c $HOME/.config/hypr/themes/one/eww/ update rev_dash=true
fi

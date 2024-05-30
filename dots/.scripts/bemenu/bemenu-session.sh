#!/bin/bash

# bemenu theming
. $HOME/.local/bin/bemenu-theming

session=$(zellij ls | cut -c 8- | cut -d " " -f1 | sed -r 's/\x1B\[[0-9;]*[mK]//' | bemenu -i --prompt="󱊄 Select a session: ")

if [ -n "$session" ]; then
    foot --title=DotFile -e zellij a "$session" &> /dev/null &
    # hyprctl dispatch fullscreen 0
    # hyprctl dispatch fullscreen 0
fi


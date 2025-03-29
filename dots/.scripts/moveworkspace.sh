#!/usr/bin/env bash

moveworkspace_up() {
    if [[ $(hyprctl -j activeworkspace | jq -r '.name') == 'A:Web' ]]; then
        hyprctl dispatch workspace name:B:Editor
    elif [[ $(hyprctl -j activeworkspace | jq -r '.name') == 'B:Editor' ]]; then
        hyprctl dispatch workspace name:C:Term
    elif [[ $(hyprctl -j activeworkspace | jq -r '.name') == 'C:Term' ]]; then
        hyprctl dispatch workspace name:D:Book
    elif [[ $(hyprctl -j activeworkspace | jq -r '.name') == 'D:Book' ]]; then
        hyprctl dispatch workspace name:E:Multimedia
    elif [[ $(hyprctl -j activeworkspace | jq -r '.name') == 'E:Multimedia' ]]; then
        hyprctl dispatch workspace name:F:System
    elif [[ $(hyprctl -j activeworkspace | jq -r '.name') == 'F:System' ]]; then
        hyprctl dispatch workspace name:G:Office
    elif [[ $(hyprctl -j activeworkspace | jq -r '.name') == 'G:Office' ]]; then
        hyprctl dispatch workspace name:H:Other
    elif [[ $(hyprctl -j activeworkspace | jq -r '.name') == 'H:Other' ]]; then
        hyprctl dispatch workspace name:A:Web
    fi
}

moveworkspace_down() {
    if [[ $(hyprctl -j activeworkspace | jq -r '.name') == 'A:Web' ]]; then
        hyprctl dispatch workspace name:H:Other
    elif [[ $(hyprctl -j activeworkspace | jq -r '.name') == 'H:Other' ]]; then
        hyprctl dispatch workspace name:G:Office
    elif [[ $(hyprctl -j activeworkspace | jq -r '.name') == 'G:Office' ]]; then
        hyprctl dispatch workspace name:F:System
    elif [[ $(hyprctl -j activeworkspace | jq -r '.name') == 'F:System' ]]; then
        hyprctl dispatch workspace name:E:Multimedia
    elif [[ $(hyprctl -j activeworkspace | jq -r '.name') == 'E:Multimedia' ]]; then
        hyprctl dispatch workspace name:D:Book
    elif [[ $(hyprctl -j activeworkspace | jq -r '.name') == 'D:Book' ]]; then
        hyprctl dispatch workspace name:C:Term
    elif [[ $(hyprctl -j activeworkspace | jq -r '.name') == 'C:Term' ]]; then
        hyprctl dispatch workspace name:B:Editor
    elif [[ $(hyprctl -j activeworkspace | jq -r '.name') == 'B:Editor' ]]; then
        hyprctl dispatch workspace name:A:Web
    fi

}

case "$1" in
up)
    moveworkspace_up
    ;;
down)
    moveworkspace_down
    ;;
esac

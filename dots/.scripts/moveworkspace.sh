#!/usr/bin/env bash

ACTIVEWORKSPACE=$(hyprctl -j activeworkspace | jq -r '.name')

moveToWorkspace () {
    local workspace_name=$1
    hyprctl dispatch workspace name:$workspace_name
}

moveworkspace_up() {
    if [[ $ACTIVEWORKSPACE == 'A:Web' ]]; then
        moveToWorkspace B:Editor
    elif [[ $ACTIVEWORKSPACE == 'B:Editor' ]]; then
        moveToWorkspace C:Term
    elif [[ $ACTIVEWORKSPACE == 'C:Term' ]]; then
        moveToWorkspace D:Book
    elif [[ $ACTIVEWORKSPACE == 'D:Book' ]]; then
        moveToWorkspace E:Multimedia
    elif [[ $ACTIVEWORKSPACE == 'E:Multimedia' ]]; then
        moveToWorkspace F:System
    elif [[ $ACTIVEWORKSPACE == 'F:System' ]]; then
        moveToWorkspace G:Office
    elif [[ $ACTIVEWORKSPACE == 'G:Office' ]]; then
        moveToWorkspace H:Other
    elif [[ $ACTIVEWORKSPACE == 'H:Other' ]]; then
        moveToWorkspace A:Web
    fi
}

moveworkspace_down() {
    if [[ $ACTIVEWORKSPACE == 'H:Other' ]]; then
        moveToWorkspace G:Office
    elif [[ $ACTIVEWORKSPACE == 'G:Office' ]]; then
        moveToWorkspace F:System
    elif [[ $ACTIVEWORKSPACE == 'F:System' ]]; then
        moveToWorkspace E:Multimedia
    elif [[ $ACTIVEWORKSPACE == 'E:Multimedia' ]]; then
        moveToWorkspace D:Book
    elif [[ $ACTIVEWORKSPACE == 'D:Book' ]]; then
        moveToWorkspace C:Term
    elif [[ $ACTIVEWORKSPACE == 'C:Term' ]]; then
        moveToWorkspace B:Editor
    elif [[ $ACTIVEWORKSPACE == 'B:Editor' ]]; then
        moveToWorkspace A:Web
    elif [[ $ACTIVEWORKSPACE == 'A:Web' ]]; then
        moveToWorkspace H:Other
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

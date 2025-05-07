#!/usr/bin/env bash

ACTIVEWORKSPACE=$(hyprctl -j activeworkspace | jq -r '.name')
ACTIVEMONITOR=$(hyprctl -j activeworkspace | jq -r '.monitor')

moveToWorkspace() {
    local workspace_name=$1
    hyprctl dispatch workspace name:$workspace_name
}
workspacemonitor() {
    local wn=$1
    hyprctl -j workspaces | jq -r --arg name "$wn" '.[] | select(.name == $name) | .monitor'
}

moveworkspace_up() {
    if [[ $ACTIVEWORKSPACE == 'A:Web' ]]; then
        moveToWorkspace B:Editor
        if [[ "$(workspacemonitor 'B:Editor')" == $ACTIVEMONITOR ]]; then
            break
        else
            moveToWorkspace A:Web
            moveToWorkspace C:Term
            if [[ "$(workspacemonitor 'C:Term')" == $ACTIVEMONITOR ]]; then
                break
            else
                moveToWorkspace A:Web
                moveToWorkspace D:Book
                if [[ "$(workspacemonitor 'D:Book')" == $ACTIVEMONITOR ]]; then
                    break
                else
                    moveToWorkspace A:Web
                    moveToWorkspace E:Multimedia
                    if [[ "$(workspacemonitor 'E:Multimedia')" == $ACTIVEMONITOR ]]; then
                        break
                    else
                        moveToWorkspace A:Web
                        moveToWorkspace F:System
                        if [[ "$(workspacemonitor 'F:System')" == $ACTIVEMONITOR ]]; then
                            break
                        else
                            moveToWorkspace A:Web
                            moveToWorkspace G:Office
                            if [[ "$(workspacemonitor 'G:Office')" == $ACTIVEMONITOR ]]; then
                                break
                            else
                                moveToWorkspace A:Web
                                moveToWorkspace H:Other
                                if [[ "$(workspacemonitor 'H:Other')" == $ACTIVEMONITOR ]]; then
                                    break
                                else
                                    moveToWorkspace A:Web
                                fi
                            fi
                        fi
                    fi
                fi
            fi
        fi
    elif [[ $ACTIVEWORKSPACE == 'B:Editor' ]]; then
        moveToWorkspace C:Term
        if [[ "$(workspacemonitor 'C:Term')" == $ACTIVEMONITOR ]]; then
            break
        else
            moveToWorkspace B:Editor
            moveToWorkspace D:Book
            if [[ "$(workspacemonitor 'D:Book')" == $ACTIVEMONITOR ]]; then
                break
            else
                moveToWorkspace B:Editor
                moveToWorkspace E:Multimedia
                if [[ "$(workspacemonitor 'E:Multimedia')" == $ACTIVEMONITOR ]]; then
                    break
                else
                    moveToWorkspace B:Editor
                    moveToWorkspace F:System
                    if [[ "$(workspacemonitor 'F:System')" == $ACTIVEMONITOR ]]; then
                        break
                    else
                        moveToWorkspace B:Editor
                        moveToWorkspace G:Office
                        if [[ "$(workspacemonitor 'G:Office')" == $ACTIVEMONITOR ]]; then
                            break
                        else
                            moveToWorkspace B:Editor
                            moveToWorkspace H:Other
                            if [[ "$(workspacemonitor 'H:Other')" == $ACTIVEMONITOR ]]; then
                                break
                            else
                                moveToWorkspace B:Editor
                                moveToWorkspace A:Web
                                if [[ "$(workspacemonitor 'A:Web')" == $ACTIVEMONITOR ]]; then
                                    break
                                else
                                    moveToWorkspace B:Editor
                                fi
                            fi
                        fi
                    fi
                fi
            fi
        fi
    elif [[ $ACTIVEWORKSPACE == 'C:Term' ]]; then
        moveToWorkspace D:Book
        if [[ "$(workspacemonitor 'D:Book')" == $ACTIVEMONITOR ]]; then
            break
        else
            moveToWorkspace C:Term
            moveToWorkspace E:Multimedia
            if [[ "$(workspacemonitor 'E:Multimedia')" == $ACTIVEMONITOR ]]; then
                break
            else
                moveToWorkspace C:Term
                moveToWorkspace F:System
                if [[ "$(workspacemonitor 'F:System')" == $ACTIVEMONITOR ]]; then
                    break
                else
                    moveToWorkspace C:Term
                    moveToWorkspace G:Office
                    if [[ "$(workspacemonitor 'G:Office')" == $ACTIVEMONITOR ]]; then
                        break
                    else
                        moveToWorkspace C:Term
                        moveToWorkspace H:Other
                        if [[ "$(workspacemonitor 'H:Other')" == $ACTIVEMONITOR ]]; then
                            break
                        else
                            moveToWorkspace C:Term
                            moveToWorkspace A:Web
                            if [[ "$(workspacemonitor 'A:Web')" == $ACTIVEMONITOR ]]; then
                                break
                            else
                                moveToWorkspace C:Term
                                moveToWorkspace B:Editor
                                if [[ "$(workspacemonitor 'B:Editor')" == $ACTIVEMONITOR ]]; then
                                    break
                                else
                                    moveToWorkspace C:Term
                                fi
                            fi
                        fi
                    fi
                fi
            fi
        fi
    elif [[ $ACTIVEWORKSPACE == 'D:Book' ]]; then
        moveToWorkspace E:Multimedia
        if [[ "$(workspacemonitor 'E:Multimedia')" == $ACTIVEMONITOR ]]; then
            break
        else
            moveToWorkspace D:Book
            moveToWorkspace F:System
            if [[ "$(workspacemonitor 'F:System')" == $ACTIVEMONITOR ]]; then
                break
            else
                moveToWorkspace D:Book
                moveToWorkspace G:Office
                if [[ "$(workspacemonitor 'G:Office')" == $ACTIVEMONITOR ]]; then
                    break
                else
                    moveToWorkspace D:Book
                    moveToWorkspace H:Other
                    if [[ "$(workspacemonitor 'H:Other')" == $ACTIVEMONITOR ]]; then
                        break
                    else
                        moveToWorkspace D:Book
                        moveToWorkspace A:Web
                        if [[ "$(workspacemonitor 'A:Web')" == $ACTIVEMONITOR ]]; then
                            break
                        else
                            moveToWorkspace D:Book
                            moveToWorkspace B:Editor
                            if [[ "$(workspacemonitor 'B:Editor')" == $ACTIVEMONITOR ]]; then
                                break
                            else
                                moveToWorkspace D:Book
                                moveToWorkspace C:Term
                                if [[ "$(workspacemonitor 'C:Term')" == $ACTIVEMONITOR ]]; then
                                    break
                                else
                                    moveToWorkspace D:Book
                                fi
                            fi
                        fi
                    fi
                fi
            fi
        fi
    elif [[ $ACTIVEWORKSPACE == 'E:Multimedia' ]]; then
        moveToWorkspace F:System
        if [[ "$(workspacemonitor 'F:System')" == "$ACTIVEMONITOR" ]]; then
            break
        else
            moveToWorkspace E:Multimedia
            moveToWorkspace G:Office
            if [[ "$(workspacemonitor 'G:Office')" == "$ACTIVEMONITOR" ]]; then
                break
            else
                moveToWorkspace E:Multimedia
                moveToWorkspace H:Other
                if [[ "$(workspacemonitor 'H:Other')" == "$ACTIVEMONITOR" ]]; then
                    break
                else
                    moveToWorkspace E:Multimedia
                    moveToWorkspace A:Web
                    if [[ "$(workspacemonitor 'A:Web')" == "$ACTIVEMONITOR" ]]; then
                        break
                    else
                        moveToWorkspace E:Multimedia
                        moveToWorkspace B:Editor
                        if [[ "$(workspacemonitor 'B:Editor')" == "$ACTIVEMONITOR" ]]; then
                            break
                        else
                            moveToWorkspace E:Multimedia
                            moveToWorkspace C:Term
                            if [[ "$(workspacemonitor 'C:Term')" == "$ACTIVEMONITOR" ]]; then
                                break
                            else
                                moveToWorkspace E:Multimedia
                                moveToWorkspace D:Book
                                if [[ "$(workspacemonitor 'D:Book')" == "$ACTIVEMONITOR" ]]; then
                                    break
                                else
                                    moveToWorkspace E:Multimedia
                                fi
                            fi
                        fi
                    fi
                fi
            fi
        fi

    elif [[ $ACTIVEWORKSPACE == 'F:System' ]]; then
        moveToWorkspace G:Office
        if [[ "$(workspacemonitor 'G:Office')" == "$ACTIVEMONITOR" ]]; then
            break
        elif [[ "$(workspacemonitor 'G:Office')" == "$ACTIVEMONITOR" ]]; then
            moveToWorkspace F:System
            moveToWorkspace H:Other
            if [[ "$(workspacemonitor 'H:Other')" == "$ACTIVEMONITOR" ]]; then
                break
            else
                moveToWorkspace F:System
                moveToWorkspace A:Web
                if [[ "$(workspacemonitor 'A:Web')" == "$ACTIVEMONITOR" ]]; then
                    break
                else
                    moveToWorkspace F:System
                    moveToWorkspace B:Editor
                    if [[ "$(workspacemonitor 'B:Editor')" == "$ACTIVEMONITOR" ]]; then
                        break
                    else
                        moveToWorkspace F:System
                        moveToWorkspace C:Term
                        if [[ "$(workspacemonitor 'C:Term')" == "$ACTIVEMONITOR" ]]; then
                            break
                        else
                            moveToWorkspace F:System
                            moveToWorkspace D:Book
                            if [[ "$(workspacemonitor 'D:Book')" == "$ACTIVEMONITOR" ]]; then
                                break
                            else
                                moveToWorkspace F:System
                                moveToWorkspace E:Multimedia
                                if [[ "$(workspacemonitor 'E:Multimedia')" == "$ACTIVEMONITOR" ]]; then
                                    break
                                else
                                    moveToWorkspace F:System
                                fi
                            fi
                        fi
                    fi
                fi
            fi
        fi
    elif [[ $ACTIVEWORKSPACE == 'G:Office' ]]; then
        moveToWorkspace H:Other
        if [[ "$(workspacemonitor 'H:Other')" == "$ACTIVEMONITOR" ]]; then
            break
        else
            moveToWorkspace G:Office
            moveToWorkspace A:Web
            if [[ "$(workspacemonitor 'A:Web')" == "$ACTIVEMONITOR" ]]; then
                break
            else
                moveToWorkspace G:Office
                moveToWorkspace B:Editor
                if [[ "$(workspacemonitor 'B:Editor')" == "$ACTIVEMONITOR" ]]; then
                    break
                else
                    moveToWorkspace G:Office
                    moveToWorkspace C:Term
                    if [[ "$(workspacemonitor 'C:Term')" == "$ACTIVEMONITOR" ]]; then
                        break
                    else
                        moveToWorkspace G:Office
                        moveToWorkspace D:Book
                        if [[ "$(workspacemonitor 'D:Book')" == "$ACTIVEMONITOR" ]]; then
                            break
                        else
                            moveToWorkspace G:Office
                            moveToWorkspace E:Multimedia
                            if [[ "$(workspacemonitor 'E:Multimedia')" == "$ACTIVEMONITOR" ]]; then
                                break
                            else
                                moveToWorkspace G:Office
                                moveToWorkspace F:System
                                if [[ "$(workspacemonitor 'F:System')" == "$ACTIVEMONITOR" ]]; then
                                    break
                                else
                                    moveToWorkspace G:Office
                                fi
                            fi
                        fi
                    fi
                fi
            fi
        fi
    elif [[ $ACTIVEWORKSPACE == 'H:Other' ]]; then
        moveToWorkspace A:Web
        if [[ "$(workspacemonitor 'A:Web')" == "$ACTIVEMONITOR" ]]; then
            break
        else
            moveToWorkspace H:Other
            moveToWorkspace B:Editor
            if [[ "$(workspacemonitor 'B:Editor')" == "$ACTIVEMONITOR" ]]; then
                break
            else
                moveToWorkspace H:Other
                moveToWorkspace C:Term
                if [[ "$(workspacemonitor 'C:Term')" == "$ACTIVEMONITOR" ]]; then
                    break
                else
                    moveToWorkspace H:Other
                    moveToWorkspace D:Book
                    if [[ "$(workspacemonitor 'D:Book')" == "$ACTIVEMONITOR" ]]; then
                        break
                    else
                        moveToWorkspace H:Other
                        moveToWorkspace E:Multimedia
                        if [[ "$(workspacemonitor 'E:Multimedia')" == "$ACTIVEMONITOR" ]]; then
                            break
                        else
                            moveToWorkspace H:Other
                            moveToWorkspace F:System
                            if [[ "$(workspacemonitor 'F:System')" == "$ACTIVEMONITOR" ]]; then
                                break
                            else
                                moveToWorkspace H:Other
                                moveToWorkspace G:Office
                                if [[ "$(workspacemonitor 'G:Office')" == "$ACTIVEMONITOR" ]]; then
                                    break
                                else
                                    moveToWorkspace H:Other
                                fi
                            fi
                        fi
                    fi
                fi
            fi
        fi
    fi
}

moveworkspace_down() {
    if [[ $ACTIVEWORKSPACE == 'H:Other' ]]; then
        moveToWorkspace G:Office
        if [[ "$(workspacemonitor 'G:Office')" == "$ACTIVEMONITOR" ]]; then
            break
        else
            moveToWorkspace H:Other
            moveToWorkspace F:System
            if [[ "$(workspacemonitor 'F:System')" == "$ACTIVEMONITOR" ]]; then
                break
            else
                moveToWorkspace H:Other
                moveToWorkspace E:Multimedia
                if [[ "$(workspacemonitor 'E:Multimedia')" == "$ACTIVEMONITOR" ]]; then
                    break
                else
                    moveToWorkspace H:Other
                    moveToWorkspace D:Book
                    if [[ "$(workspacemonitor 'D:Book')" == "$ACTIVEMONITOR" ]]; then
                        break
                    else
                        moveToWorkspace H:Other
                        moveToWorkspace C:Term
                        if [[ "$(workspacemonitor 'C:Term')" == "$ACTIVEMONITOR" ]]; then
                            break
                        else
                            moveToWorkspace H:Other
                            moveToWorkspace B:Editor
                            if [[ "$(workspacemonitor 'B:Editor')" == "$ACTIVEMONITOR" ]]; then
                                break
                            else
                                moveToWorkspace H:Other
                                moveToWorkspace A:Web
                                if [[ "$(workspacemonitor 'A:Web')" == "$ACTIVEMONITOR" ]]; then
                                    break
                                else
                                    moveToWorkspace H:Other
                                fi
                            fi
                        fi
                    fi
                fi
            fi
        fi
    elif [[ $ACTIVEWORKSPACE == 'G:Office' ]]; then
        moveToWorkspace F:System
        if [[ "$(workspacemonitor 'F:System')" == "$ACTIVEMONITOR" ]]; then
            break
        else
            moveToWorkspace G:Office
            moveToWorkspace E:Multimedia
            if [[ "$(workspacemonitor 'E:Multimedia')" == "$ACTIVEMONITOR" ]]; then
                break
            else
                moveToWorkspace G:Office
                moveToWorkspace D:Book
                if [[ "$(workspacemonitor 'D:Book')" == "$ACTIVEMONITOR" ]]; then
                    break
                else
                    moveToWorkspace G:Office
                    moveToWorkspace C:Term
                    if [[ "$(workspacemonitor 'C:Term')" == "$ACTIVEMONITOR" ]]; then
                        break
                    else
                        moveToWorkspace G:Office
                        moveToWorkspace B:Editor
                        if [[ "$(workspacemonitor 'B:Editor')" == "$ACTIVEMONITOR" ]]; then
                            break
                        else
                            moveToWorkspace G:Office
                            moveToWorkspace A:Web
                            if [[ "$(workspacemonitor 'A:Web')" == "$ACTIVEMONITOR" ]]; then
                                break
                            else
                                moveToWorkspace G:Office
                                moveToWorkspace H:Other
                                if [[ "$(workspacemonitor 'H:Other')" == "$ACTIVEMONITOR" ]]; then
                                    break
                                else
                                    moveToWorkspace G:Office
                                fi
                            fi
                        fi
                    fi
                fi
            fi
        fi
    elif [[ $ACTIVEWORKSPACE == 'F:System' ]]; then
        moveToWorkspace E:Multimedia
        if [[ "$(workspacemonitor 'E:Multimedia')" == "$ACTIVEMONITOR" ]]; then
            break
        else
            moveToWorkspace F:System
            moveToWorkspace D:Book
            if [[ "$(workspacemonitor 'D:Book')" == "$ACTIVEMONITOR" ]]; then
                break
            else
                moveToWorkspace F:System
                moveToWorkspace C:Term
                if [[ "$(workspacemonitor 'C:Term')" == "$ACTIVEMONITOR" ]]; then
                    break
                else
                    moveToWorkspace F:System
                    moveToWorkspace B:Editor
                    if [[ "$(workspacemonitor 'B:Editor')" == "$ACTIVEMONITOR" ]]; then
                        break
                    else
                        moveToWorkspace F:System
                        moveToWorkspace A:Web
                        if [[ "$(workspacemonitor 'A:Web')" == "$ACTIVEMONITOR" ]]; then
                            break
                        else
                            moveToWorkspace F:System
                            moveToWorkspace H:Other
                            if [[ "$(workspacemonitor 'H:Other')" == "$ACTIVEMONITOR" ]]; then
                                break
                            else
                                moveToWorkspace F:System
                                moveToWorkspace G:Office
                                if [[ "$(workspacemonitor 'G:Office')" == "$ACTIVEMONITOR" ]]; then
                                    break
                                else
                                    moveToWorkspace F:System
                                fi
                            fi
                        fi
                    fi
                fi
            fi
        fi
    elif [[ $ACTIVEWORKSPACE == 'E:Multimedia' ]]; then
        moveToWorkspace D:Book
        if [[ "$(workspacemonitor 'D:Book')" == "$ACTIVEMONITOR" ]]; then
            break
        else
            moveToWorkspace E:Multimedia
            moveToWorkspace C:Term
            if [[ "$(workspacemonitor 'C:Term')" == "$ACTIVEMONITOR" ]]; then
                break
            else
                moveToWorkspace E:Multimedia
                moveToWorkspace B:Editor
                if [[ "$(workspacemonitor 'B:Editor')" == "$ACTIVEMONITOR" ]]; then
                    break
                else
                    moveToWorkspace E:Multimedia
                    moveToWorkspace A:Web
                    if [[ "$(workspacemonitor 'A:Web')" == "$ACTIVEMONITOR" ]]; then
                        break
                    else
                        moveToWorkspace E:Multimedia
                        moveToWorkspace H:Other
                        if [[ "$(workspacemonitor 'H:Other')" == "$ACTIVEMONITOR" ]]; then
                            break
                        else
                            moveToWorkspace E:Multimedia
                            moveToWorkspace G:Office
                            if [[ "$(workspacemonitor 'G:Office')" == "$ACTIVEMONITOR" ]]; then
                                break
                            else
                                moveToWorkspace E:Multimedia
                                moveToWorkspace F:System
                                if [[ "$(workspacemonitor 'F:System')" == "$ACTIVEMONITOR" ]]; then
                                    break
                                else
                                    moveToWorkspace E:Multimedia
                                fi
                            fi
                        fi
                    fi
                fi
            fi
        fi
    elif [[ $ACTIVEWORKSPACE == 'D:Book' ]]; then
        moveToWorkspace C:Term
        if [[ "$(workspacemonitor 'C:Term')" == "$ACTIVEMONITOR" ]]; then
            break
        else
            moveToWorkspace D:Book
            moveToWorkspace B:Editor
            if [[ "$(workspacemonitor 'B:Editor')" == "$ACTIVEMONITOR" ]]; then
                break
            else
                moveToWorkspace D:Book
                moveToWorkspace A:Web
                if [[ "$(workspacemonitor 'A:Web')" == "$ACTIVEMONITOR" ]]; then
                    break
                else
                    moveToWorkspace D:Book
                    moveToWorkspace H:Other
                    if [[ "$(workspacemonitor 'H:Other')" == "$ACTIVEMONITOR" ]]; then
                        break
                    else
                        moveToWorkspace D:Book
                        moveToWorkspace G:Office
                        if [[ "$(workspacemonitor 'G:Office')" == "$ACTIVEMONITOR" ]]; then
                            break
                        else
                            moveToWorkspace D:Book
                            moveToWorkspace F:System
                            if [[ "$(workspacemonitor 'F:System')" == "$ACTIVEMONITOR" ]]; then
                                break
                            else
                                moveToWorkspace D:Book
                                moveToWorkspace E:Multimedia
                                if [[ "$(workspacemonitor 'E:Multimedia')" == "$ACTIVEMONITOR" ]]; then
                                    break
                                else
                                    moveToWorkspace D:Book
                                fi
                            fi
                        fi
                    fi
                fi
            fi
        fi
    elif [[ $ACTIVEWORKSPACE == 'C:Term' ]]; then
        moveToWorkspace B:Editor
        if [[ "$(workspacemonitor 'B:Editor')" == "$ACTIVEMONITOR" ]]; then
            break
        else
            moveToWorkspace C:Term
            moveToWorkspace A:Web
            if [[ "$(workspacemonitor 'A:Web')" == "$ACTIVEMONITOR" ]]; then
                break
            else
                moveToWorkspace C:Term
                moveToWorkspace H:Other
                if [[ "$(workspacemonitor 'H:Other')" == "$ACTIVEMONITOR" ]]; then
                    break
                else
                    moveToWorkspace C:Term
                    moveToWorkspace G:Office
                    if [[ "$(workspacemonitor 'G:Office')" == "$ACTIVEMONITOR" ]]; then
                        break
                    else
                        moveToWorkspace C:Term
                        moveToWorkspace F:System
                        if [[ "$(workspacemonitor 'F:System')" == "$ACTIVEMONITOR" ]]; then
                            break
                        else
                            moveToWorkspace C:Term
                            moveToWorkspace E:Multimedia
                            if [[ "$(workspacemonitor 'E:Multimedia')" == "$ACTIVEMONITOR" ]]; then
                                break
                            else
                                moveToWorkspace C:Term
                                moveToWorkspace D:Book
                                if [[ "$(workspacemonitor 'D:Book')" == "$ACTIVEMONITOR" ]]; then
                                    break
                                else
                                    moveToWorkspace C:Term
                                fi
                            fi
                        fi
                    fi
                fi
            fi
        fi
    elif [[ $ACTIVEWORKSPACE == 'B:Editor' ]]; then
        moveToWorkspace A:Web
        if [[ "$(workspacemonitor 'A:Web')" == "$ACTIVEMONITOR" ]]; then
            break
        else
            moveToWorkspace B:Editor
            moveToWorkspace H:Other
            if [[ "$(workspacemonitor 'H:Other')" == "$ACTIVEMONITOR" ]]; then
                break
            else
                moveToWorkspace B:Editor
                moveToWorkspace G:Office
                if [[ "$(workspacemonitor 'G:Office')" == "$ACTIVEMONITOR" ]]; then
                    break
                else
                    moveToWorkspace B:Editor
                    moveToWorkspace F:System
                    if [[ "$(workspacemonitor 'F:System')" == "$ACTIVEMONITOR" ]]; then
                        break
                    else
                        moveToWorkspace B:Editor
                        moveToWorkspace E:Multimedia
                        if [[ "$(workspacemonitor 'E:Multimedia')" == "$ACTIVEMONITOR" ]]; then
                            break
                        else
                            moveToWorkspace B:Editor
                            moveToWorkspace D:Book
                            if [[ "$(workspacemonitor 'D:Book')" == "$ACTIVEMONITOR" ]]; then
                                break
                            else
                                moveToWorkspace B:Editor
                                moveToWorkspace C:Term
                                if [[ "$(workspacemonitor 'C:Term')" == "$ACTIVEMONITOR" ]]; then
                                    break
                                else
                                    moveToWorkspace B:Editor
                                fi
                            fi
                        fi
                    fi
                fi
            fi
        fi
    elif [[ $ACTIVEWORKSPACE == 'A:Web' ]]; then
        moveToWorkspace H:Other
        if [[ "$(workspacemonitor 'H:Other')" == "$ACTIVEMONITOR" ]]; then
            break
        else
            moveToWorkspace A:Web
            moveToWorkspace G:Office
            if [[ "$(workspacemonitor 'G:Office')" == "$ACTIVEMONITOR" ]]; then
                break
            else
                moveToWorkspace A:Web
                moveToWorkspace F:System
                if [[ "$(workspacemonitor 'F:System')" == "$ACTIVEMONITOR" ]]; then
                    break
                else
                    moveToWorkspace A:Web
                    moveToWorkspace E:Multimedia
                    if [[ "$(workspacemonitor 'E:Multimedia')" == "$ACTIVEMONITOR" ]]; then
                        break
                    else
                        moveToWorkspace A:Web
                        moveToWorkspace D:Book
                        if [[ "$(workspacemonitor 'D:Book')" == "$ACTIVEMONITOR" ]]; then
                            break
                        else
                            moveToWorkspace A:Web
                            moveToWorkspace C:Term
                            if [[ "$(workspacemonitor 'C:Term')" == "$ACTIVEMONITOR" ]]; then
                                break
                            else
                                moveToWorkspace A:Web
                                moveToWorkspace  B:Editor
                                if [[ "$(workspacemonitor 'B:Editor')" == "$ACTIVEMONITOR" ]]; then
                                    break
                                else
                                    moveToWorkspace  A:Web
                                fi
                            fi
                        fi
                    fi
                fi
            fi
        fi
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

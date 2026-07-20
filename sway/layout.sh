#!/bin/sh

layout=$(swaymsg -t get_inputs | jq -r '
    .[]
    | select(.type=="keyboard")
    | .xkb_active_layout_name
' | head -n1)

case "$layout" in
    *Russian*)
        echo "RU"
        ;;
    *English*)
        echo "GB"
        ;;
    *)
        echo "$layout"
        ;;
esac

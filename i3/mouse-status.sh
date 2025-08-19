#!/bin/bash

DEVICE="/org/freedesktop/UPower/devices/mouse_dev_38_9A_4B_AA_A3_D0"

i3status | while :
do
    read line
    PERCENT=$(upower -i $DEVICE | awk '/percentage/ {print $2}')
    echo "MOUSE:$PERCENT | $line" || exit 1
done

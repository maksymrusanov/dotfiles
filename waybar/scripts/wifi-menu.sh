#!/bin/bash

wifi=$(nmcli -t -f SSID dev wifi list | \
    sed '/^$/d' | \
    sort -u | \
    rofi -dmenu -p "WiFi")

[ -z "$wifi" ] && exit

password=$(rofi -dmenu -password -p "Password")

nmcli dev wifi connect "$wifi" password "$password"

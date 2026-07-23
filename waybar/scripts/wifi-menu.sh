#!/bin/bash
# Scan Wi-Fi networks
wifi=$(nmcli -t -f SSID,SIGNAL dev wifi list --rescan no | \
    awk -F: 'BEGIN{OFS=":"} {sig=$NF; $NF=""; sub(/:$/,""); ssid=$0} !seen[ssid]++ && ssid != "" {print ssid " (" sig "%)"}' | \
    wofi --dmenu -p "WiFi")
[ -z "$wifi" ] && exit
# Extract SSID
ssid=$(echo "$wifi" | sed -E 's/ \([0-9]+%\)$//')
# Check if saved connection exists
saved=$(nmcli -t -f NAME connection show | grep -Fx "$ssid")
if [ -n "$saved" ]; then
    nmcli connection up "$ssid"
else
    password=$(printf "" | wofi --dmenu --password -p "Password:")
    [ -z "$password" ] && exit
    nmcli dev wifi connect "$ssid" password "$password"
fi

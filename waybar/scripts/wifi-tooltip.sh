#!/bin/bash

SSID=$(nmcli -g GENERAL.CONNECTION device show wlp3s0)
SIGNAL=$(nmcli -f IN-USE,SIGNAL dev wifi | grep '\*' | awk '{print $2}')

echo "{\"text\":\"󰖩 $SSID ${SIGNAL}%\",\"tooltip\":\"Network: <b>$SSID</b>\\nSignal: <b>$SIGNAL%</b>\\nInterface: <b>wlp3s0</b>\"}"

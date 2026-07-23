#!/bin/bash
IFACE=$(nmcli -t -f DEVICE,TYPE,STATE dev status | awk -F: '$2=="wifi" && $3=="connected"{print $1; exit}')
if [ -z "$IFACE" ]; then
    echo "{\"text\":\"󰤭\",\"tooltip\":\"Disconnected\"}"
    exit
fi
SSID=$(nmcli -g GENERAL.CONNECTION device show "$IFACE")
SIGNAL=$(nmcli -t -f active,signal dev wifi | grep '^yes' | cut -d: -f2-)
echo "{\"text\":\"󰖩 $SSID ${SIGNAL}%\",\"tooltip\":\"Network: <b>$SSID</b>\\nSignal: <b>$SIGNAL%</b>\\nInterface: <b>$IFACE</b>\"}"

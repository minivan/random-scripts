#!/bin/sh
iface=wlan0

ifconfig $iface down
iwconfig $iface mode Managed
ifconfig $iface up

killall wpa_supplicant

wpa_supplicant -B -Dwext -i $iface -c ./wireless-wpa.conf -dd

dhclient $iface

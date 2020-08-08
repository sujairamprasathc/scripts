#!/bin/bash
if [ -f /var/run/hostapd.pid ]; then
	kill `cat /var/run/hostapd.pid`
	rm /var/run/hostapd.pid
fi
if [ -f /var/run/dhcpd.pid ]; then
	kill `cat /var/run/dhcpd.pid`
	rm /var/run/dhcpd.pid
fi
iw dev hotspot del

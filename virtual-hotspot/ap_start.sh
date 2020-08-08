iw phy phy0 interface add hotspot type __ap
sleep 0.25
rfkill unblock wlan
ifconfig hotspot 192.168.211.1/24 up
sysctl net.ipv4.ip_forward=1
iptables --table filter --flush
iptables --table filter --delete-chain
iptables --table nat --flush
iptables --table nat --append POSTROUTING --out-interface wlp2s0 -j MASQUERADE
iptables --append FORWARD --in-interface hotspot -j ACCEPT

if [ -f /var/run/hostapd.pid ]; then
	kill `cat /var/run/hostapd.pid`
fi
hostapd ./virt_hotspot_hostapd.conf -B -P /var/run/hostapd.pid >hostapd.log

if [ -f /var/run/dhcpd.pid ]; then
	kill `cat /var/run/dhcpd.pid`
fi
dhcpd -cf mydhcpd.conf hotspot 2>dhcpd.log

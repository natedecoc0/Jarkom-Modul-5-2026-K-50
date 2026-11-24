#!/bin/sh
# soal02-kaworu.sh - Kaworu: IP interface + forwarding, ping ke Hikari
for i in eth0 eth1; do ip link set $i up; done
echo 1 > /proc/sys/net/ipv4/ip_forward
ip addr replace 192.236.4.130/30 dev eth0
ip addr replace 192.236.3.225/27 dev eth1
ip -br a; ping -c2 -W1 192.236.4.129 | grep transmitted
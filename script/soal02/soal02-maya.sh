#!/bin/sh
# soal02-maya.sh - Maya: IP interface + forwarding, ping ke Fuyutsuki
for i in eth0 eth1; do ip link set $i up; done
echo 1 > /proc/sys/net/ipv4/ip_forward
ip addr replace 192.236.4.126/30 dev eth0
ip addr replace 192.236.3.193/27 dev eth1
ip -br a; ping -c2 -W1 192.236.4.125 | grep transmitted
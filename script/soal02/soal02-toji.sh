#!/bin/sh
# soal02-toji.sh - Toji: IP interface + forwarding, ping ke Fuyutsuki
for i in eth0 eth1; do ip link set $i up; done
echo 1 > /proc/sys/net/ipv4/ip_forward
ip addr replace 192.236.4.154/30 dev eth0
ip addr replace 192.236.4.73/29 dev eth1
ip -br a; ping -c2 -W1 192.236.4.153 | grep transmitted
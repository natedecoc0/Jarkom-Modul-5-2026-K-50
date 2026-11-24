#!/bin/sh
# soal02-shinji.sh - Shinji: IP interface + forwarding, ping ke Yui
for i in eth0 eth1; do ip link set $i up; done
echo 1 > /proc/sys/net/ipv4/ip_forward
ip addr replace 192.236.4.134/30 dev eth0
ip addr replace 192.236.4.1/27 dev eth1
ip -br a; ping -c2 -W1 192.236.4.133 | grep transmitted
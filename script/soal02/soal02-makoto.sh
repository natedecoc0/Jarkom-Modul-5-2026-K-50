#!/bin/sh
# soal02-makoto.sh - Makoto: IP interface + forwarding, ping ke Shigeru
for i in eth0 eth1; do ip link set $i up; done
echo 1 > /proc/sys/net/ipv4/ip_forward
ip addr replace 192.236.4.162/30 dev eth0
ip addr replace 192.236.4.89/29 dev eth1
ip -br a; ping -c2 -W1 192.236.4.161 | grep transmitted
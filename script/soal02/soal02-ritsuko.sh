#!/bin/sh
# soal02-ritsuko.sh - Ritsuko: IP interface + forwarding, ping ke Asuka
for i in eth0 eth1; do ip link set $i up; done
echo 1 > /proc/sys/net/ipv4/ip_forward
ip addr replace 192.236.4.142/30 dev eth0
ip addr replace 192.236.4.49/29 dev eth1
ip -br a; ping -c2 -W1 192.236.4.141 | grep transmitted
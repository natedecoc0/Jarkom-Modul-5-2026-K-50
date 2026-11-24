#!/bin/sh
# soal02-kaji.sh - Kaji: IP interface + forwarding, ping ke Gendou
for i in eth0 eth1; do ip link set $i up; done
echo 1 > /proc/sys/net/ipv4/ip_forward
ip addr replace 192.236.4.170/30 dev eth0
ip addr replace 192.236.4.101/30 dev eth1
ip -br a; ping -c2 -W1 192.236.4.169 | grep transmitted
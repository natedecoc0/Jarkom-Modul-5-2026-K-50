#!/bin/sh
# soal02-shigeru.sh - Shigeru: IP interface + forwarding, ping ke Gendou
for i in eth0 eth1 eth2; do ip link set $i up; done
echo 1 > /proc/sys/net/ipv4/ip_forward
ip addr replace 192.236.4.158/30 dev eth0
ip addr replace 192.236.4.161/30 dev eth1
ip addr replace 192.236.4.81/29 dev eth2
ip -br a; ping -c2 -W1 192.236.4.157 | grep transmitted
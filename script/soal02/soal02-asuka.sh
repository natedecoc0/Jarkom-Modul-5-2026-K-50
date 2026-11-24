#!/bin/sh
# soal02-asuka.sh - Asuka: IP interface + forwarding, ping ke Gendou
for i in eth0 eth1 eth2 eth3; do ip link set $i up; done
echo 1 > /proc/sys/net/ipv4/ip_forward
ip addr replace 192.236.4.166/30 dev eth0
ip addr replace 192.236.4.121/30 dev eth1
ip addr replace 192.236.4.141/30 dev eth2
ip addr replace 192.236.4.97/30 dev eth3
ip -br a; ping -c2 -W1 192.236.4.165 | grep transmitted
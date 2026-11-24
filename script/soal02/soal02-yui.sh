#!/bin/sh
# soal02-yui.sh - Yui: IP interface + forwarding, ping ke Gendou
for i in eth0 eth1 eth2 eth3 eth4; do ip link set $i up; done
echo 1 > /proc/sys/net/ipv4/ip_forward
ip addr replace 192.236.4.118/30 dev eth0
ip addr replace 192.236.3.1/25 dev eth1
ip addr replace 192.236.4.109/30 dev eth2
ip addr replace 192.236.4.133/30 dev eth3
ip addr replace 192.236.4.137/30 dev eth4
ip -br a; ping -c2 -W1 192.236.4.117 | grep transmitted
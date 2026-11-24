#!/bin/sh
# soal09-shigeru.sh - Shigeru: pulihkan forwarding, default route, blackhole, policy rule table 100
echo "--- sebelum"; cat /proc/sys/net/ipv4/ip_forward; ip route; ip rule; ip route show table 100
echo 1 > /proc/sys/net/ipv4/ip_forward
ip route replace default via 192.236.4.157 dev eth0
ip route del blackhole 192.236.4.72/29 2>/dev/null
ip rule del iif eth2 lookup 100 priority 90 2>/dev/null
ip route flush table 100 2>/dev/null
echo "--- sesudah"; cat /proc/sys/net/ipv4/ip_forward; ip route; ip rule; ip route show table 100
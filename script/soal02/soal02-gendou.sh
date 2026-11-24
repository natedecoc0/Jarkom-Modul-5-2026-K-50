#!/bin/bash
# soal02-gendou.sh - Gendou: IP interface internal, IP forwarding, paket, DHCP dari NAT1
WAN="eth0"
for i in eth0 eth1 eth2 eth3 eth4 eth5 eth6 eth7 eth8; do ip link set $i up; done
echo 1 > /proc/sys/net/ipv4/ip_forward
ip addr replace 192.236.4.105/30 dev eth1
ip addr replace 192.236.4.113/30 dev eth2
ip addr replace 192.236.4.117/30 dev eth3
ip addr replace 192.236.4.165/30 dev eth4
ip addr replace 192.236.4.169/30 dev eth5
ip addr replace 192.236.4.149/30 dev eth6
ip addr replace 192.236.4.157/30 dev eth7
ip addr replace 192.236.4.145/30 dev eth8

# 2B-2C: pasang paket lewat IP pinjaman (hanya bila belum terpasang)
if ! command -v dhclient >/dev/null 2>&1 || ! command -v iptables >/dev/null 2>&1; then
  ip addr replace 192.168.122.200/24 dev $WAN
  ip route replace default via 192.168.122.1 dev $WAN
  echo "nameserver 8.8.8.8" > /etc/resolv.conf
  apt-get update && apt-get install -y isc-dhcp-client iptables conntrack
  ip addr del 192.168.122.200/24 dev $WAN
  ip route del default 2>/dev/null
fi

# 2D: pindah ke DHCP
ip route | grep -q '^default' || { pkill dhclient 2>/dev/null; dhclient -v $WAN; }
ip -br a; ip route; ping -c3 8.8.8.8
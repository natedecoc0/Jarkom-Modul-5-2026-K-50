#!/bin/sh
# soal06-node.sh - IP statis + gateway + DNS, persisten lewat /etc/network/interfaces
# pakai: sh soal06-node.sh <ip>/<prefix> <gateway>
[ $# -eq 2 ] || { echo "pakai: sh $0 <ip>/<prefix> <gateway>"; exit 1; }
CIDR=$1; GW=$2; IP=${CIDR%/*}; PFX=${CIDR#*/}
M=$(( (0xFFFFFFFF << (32-PFX)) & 0xFFFFFFFF ))
MASK="$(( (M>>24)&255 )).$(( (M>>16)&255 )).$(( (M>>8)&255 )).$(( M&255 ))"

printf 'auto lo\niface lo inet loopback\n\nauto eth0\niface eth0 inet static\n    address %s\n    netmask %s\n    gateway %s\n    post-up echo "nameserver 8.8.8.8" > /etc/resolv.conf\n' "$IP" "$MASK" "$GW" > /etc/network/interfaces

ip link set eth0 up
ip addr flush dev eth0
ip addr add $CIDR dev eth0
ip route replace default via $GW
echo "nameserver 8.8.8.8" > /etc/resolv.conf
ip -br a show eth0; ip route
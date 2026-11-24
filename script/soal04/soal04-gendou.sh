#!/bin/bash
# soal04-gendou.sh - Gendou: NAT MASQUERADE untuk prefix internal + DNS
INT="192.236.0.0/16"; WAN="eth0"
echo "nameserver 8.8.8.8" > /etc/resolv.conf
iptables -t nat -F POSTROUTING
iptables -t nat -A POSTROUTING -s $INT -o $WAN -j MASQUERADE
iptables -t nat -S POSTROUTING
iptables -t nat -L POSTROUTING -n -v -x
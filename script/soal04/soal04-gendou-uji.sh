#!/bin/bash
# soal04-gendou-uji.sh - counter rule NAT + bukti antar-LAN tidak diterjemahkan
iptables -t nat -L POSTROUTING -n -v -x
grep -E 'dst=8.8.8.8|dst=192.236.4.74' /proc/net/nf_conntrack | head
#!/bin/sh
# soal10-gendou-uji.sh - Gendou: counter NAT dan conntrack traffic Cage ke 8.8.8.8
iptables -t nat -L POSTROUTING -n -v -x
conntrack -L 2>/dev/null | grep 'src=192.236.4.6[678] dst=8.8.8.8'
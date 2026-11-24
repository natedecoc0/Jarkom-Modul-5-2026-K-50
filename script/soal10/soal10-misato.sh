#!/bin/sh
# soal10-misato.sh - Misato: hapus SNAT ke 172.31.99.1 yang salah
echo "--- sebelum"; iptables -t nat -S POSTROUTING
iptables -t nat -D POSTROUTING -s 192.236.4.64/29 ! -d 192.236.0.0/16 -o eth0 -j SNAT --to-source 172.31.99.1 2>/dev/null
echo "--- sesudah"; iptables -t nat -S POSTROUTING
#!/bin/sh
# soal10-gendou.sh - Gendou: hapus rule RETURN yang melewati MASQUERADE untuk subnet Cage
echo "--- sebelum"; iptables -t nat -S POSTROUTING
iptables -t nat -D POSTROUTING -s 192.236.4.64/29 -o eth0 -j RETURN 2>/dev/null
echo "--- sesudah"; iptables -t nat -S POSTROUTING
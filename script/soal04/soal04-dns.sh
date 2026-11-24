#!/bin/sh
# soal04-dns.sh - DNS untuk node yang memasang paket / node uji
echo "nameserver 8.8.8.8" > /etc/resolv.conf
cat /etc/resolv.conf
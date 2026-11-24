#!/bin/sh
# soal04-uji.sh - bukti internet + DNS; argumen opsional = IP node lain untuk ping antar-LAN
ping -c3 8.8.8.8
ping -c3 deb.debian.org
nslookup deb.debian.org
[ -n "$1" ] && ping -c5 $1
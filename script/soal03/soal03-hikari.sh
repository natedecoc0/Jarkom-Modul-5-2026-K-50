#!/bin/sh
# soal03-hikari.sh - Hikari: default ke Gendou + rute ke Kaworu
ip route replace default via 192.236.4.113
ip route replace 192.236.3.224/27 via 192.236.4.130
ip route
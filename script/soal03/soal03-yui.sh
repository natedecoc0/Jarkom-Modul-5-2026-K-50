#!/bin/sh
# soal03-yui.sh - Yui: default ke Gendou + rute ke Rei, Shinji, Mari
ip route replace default via 192.236.4.117
ip route replace 192.236.0.0/23 via 192.236.4.110
ip route replace 192.236.4.0/27 via 192.236.4.134
ip route replace 192.236.4.32/28 via 192.236.4.138
ip route
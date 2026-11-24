#!/bin/sh
# soal06-unit01-uji.sh - Unit-01: IP, ping gateway, isi interfaces
ip -br a
ping -c3 192.236.4.65
cat /etc/network/interfaces
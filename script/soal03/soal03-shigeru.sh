#!/bin/sh
# soal03-shigeru.sh - Shigeru: default ke Gendou + rute ke Makoto
ip route replace default via 192.236.4.157
ip route replace 192.236.4.88/29 via 192.236.4.162
ip route
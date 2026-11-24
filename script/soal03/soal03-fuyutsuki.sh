#!/bin/sh
# soal03-fuyutsuki.sh - Fuyutsuki: default ke Gendou + rute ke Maya, Toji
ip route replace default via 192.236.4.145
ip route replace 192.236.3.192/27 via 192.236.4.126
ip route replace 192.236.4.72/29 via 192.236.4.154
ip route
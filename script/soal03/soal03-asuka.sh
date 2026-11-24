#!/bin/sh
# soal03-asuka.sh - Asuka: default ke Gendou + rute ke Kensuke, Ritsuko
ip route replace default via 192.236.4.165
ip route replace 192.236.3.128/26 via 192.236.4.122
ip route replace 192.236.4.48/29 via 192.236.4.142
ip route
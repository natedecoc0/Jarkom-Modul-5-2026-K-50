#!/bin/bash
# soal05-gendou-uji.sh - iptables -S, counter, dan cek Gendou masih online
iptables -S; iptables -t nat -S
iptables -L INPUT -n -v -x; iptables -L FORWARD -n -v -x
ping -c3 8.8.8.8; ip -br a show eth0; ip route | grep default
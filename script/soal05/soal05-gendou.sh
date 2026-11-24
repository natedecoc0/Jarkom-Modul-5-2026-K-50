#!/bin/bash
# soal05-gendou.sh - Gendou: policy INPUT/FORWARD DROP + 4 izin (NAT dari soal 4 tidak disentuh)
INT="192.236.0.0/16"; WAN="eth0"

# Reset tabel filter (ACCEPT dulu supaya tidak terkunci)
for p in INPUT FORWARD OUTPUT; do iptables -P $p ACCEPT; done
iptables -F; iptables -X

# INPUT
iptables -A INPUT -i lo -j ACCEPT                                        # loopback
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT   # (a) balasan
iptables -A INPUT -i $WAN -p udp --sport 67 --dport 68 -j ACCEPT         # DHCP dari NAT1
iptables -A INPUT ! -i $WAN -s $INT -j ACCEPT                            # (d) internal -> Gendou

# FORWARD
iptables -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT # (a) balasan
iptables -A FORWARD ! -i $WAN -o $WAN -s $INT -j ACCEPT                  # (b) internal -> internet
iptables -A FORWARD ! -i $WAN ! -o $WAN -s $INT -d $INT -j ACCEPT        # (c) antar-LAN

# Policy DROP dipasang paling akhir
iptables -P INPUT DROP
iptables -P FORWARD DROP
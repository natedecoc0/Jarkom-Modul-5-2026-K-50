#!/bin/sh
# soal13-balthasar.sh - Magi-Balthasar: TCP 5000 dan 5001 hanya untuk Casper dan semua Pilot
#
# Rule dipasang di Balthasar sendiri karena Melchior satu switch dengan Balthasar,
# jadi koneksinya tidak pernah lewat router.
# Policy INPUT tetap ACCEPT, jadi lalu lintas lain (termasuk balasan ping 8.8.8.8) tidak terganggu.

# IP yang boleh mengakses port 5000 dan 5001
# Casper, Unit-01, Unit-02, Unit-00, Sachiel
IZIN="192.236.4.58 192.236.4.66 192.236.4.67 192.236.4.68 192.236.3.130"

# Kosongkan INPUT dulu supaya rule tidak dobel kalau script dijalankan lagi
iptables -F INPUT

# 1. Izinkan dulu IP yang boleh, satu rule per IP
#    -m multiport --dports 5000,5001 : port tujuan 5000 atau 5001
for ip in $IZIN; do
  iptables -A INPUT -s $ip -p tcp -m multiport --dports 5000,5001 -j ACCEPT
done

# 2. Sisanya yang ke port 5000/5001 langsung ditolak
#    tcp-reset membalas dengan RST, jadi pengirim langsung tahu ditolak (tidak menggantung)
iptables -A INPUT -p tcp -m multiport --dports 5000,5001 -j REJECT --reject-with tcp-reset

iptables -S INPUT
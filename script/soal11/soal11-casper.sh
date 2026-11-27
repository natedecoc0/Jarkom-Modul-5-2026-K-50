#!/bin/sh
# soal11-casper.sh - Magi-Casper: Casper tidak bisa di-ping node lain, tapi tetap bisa ping keluar
#
# Rule dipasang di Casper sendiri karena Balthasar dan Melchior satu switch dengan Casper,
# jadi ping mereka langsung lewat switch dan tidak pernah lewat Fuyutsuki.

# Rule: buang ping masuk (echo-request) yang datang dari luar node
# - INPUT          : paket yang ditujukan ke Casper
# - ! -i lo        : kecuali ping Casper ke dirinya sendiri lewat loopback
# - echo-request   : hanya permintaan ping, echo-reply tetap boleh masuk
#                    supaya Casper masih bisa ping ke luar
# - DROP           : dibuang diam-diam, Casper terlihat seperti tidak ada (hantu)
RULE="! -i lo -p icmp --icmp-type echo-request -j DROP"

# Pastikan iptables sudah terpasang (dipasang di soal 7)
command -v iptables >/dev/null 2>&1 || { echo "iptables belum ada, jalankan /root/casper.sh dulu"; exit 1; }

# Tambah rule di urutan paling atas, hanya kalau belum ada
# -C cek rule sudah ada atau belum, jadi script aman dijalankan berkali-kali
iptables -C INPUT $RULE 2>/dev/null || iptables -I INPUT 1 $RULE

# Tampilkan hasil
iptables -S INPUT
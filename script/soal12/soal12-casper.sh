#!/bin/sh
# soal12-casper.sh - Magi-Casper: perbaiki firewall setelah break_fw.sh
# Hardening tetap jalan: policy INPUT DROP, hanya yang diizinkan boleh masuk.
# Menggantikan soal11-casper.sh, karena rule soal 11 ikut dimasukkan di sini.

# Buka dulu sementara supaya tidak ada yang terputus saat chain dikosongkan
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -F INPUT
iptables -F OUTPUT

# 1. Loopback: Casper berkomunikasi dengan dirinya sendiri
iptables -A INPUT -i lo -j ACCEPT

# 2. Perbaikan utama: izinkan BALASAN untuk koneksi yang dimulai Casper
#    (echo-reply dari 8.8.8.8, jawaban DNS, data dari mirror apk)
#    Tanpa rule ini, policy DROP ikut membuang semua balasan.
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# 3. Soal 11 tetap berlaku: ping dari node lain dibuang.
#    Hanya echo-request, bukan semua ICMP seperti di break_fw.sh.
#    echo-reply untuk ping Casper sudah diterima rule 2 di atas.
iptables -A INPUT ! -i lo -p icmp --icmp-type echo-request -j DROP

# 4. Layanan TCP 5000 Casper boleh diakses (koneksi baru dari Unit-00 dan lainnya)
iptables -A INPUT -p tcp --dport 5000 -j ACCEPT

# 5. OUTPUT: rule yang memblok DNS (udp 53) tidak dipasang lagi,
#    OUTPUT dibiarkan ACCEPT supaya Casper bisa resolve nama dan mengakses internet.

# 6. Hardening: selain yang diizinkan di atas, semua yang masuk dibuang
iptables -P INPUT DROP

iptables -S
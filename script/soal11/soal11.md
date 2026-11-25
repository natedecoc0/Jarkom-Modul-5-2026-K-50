### Soal 11: Casper harus jadi hantu
> Casper harus jadi hantu: Casper adalah MAGI paling rahasia. Kalau SEELE tahu ia masih hidup, mereka tahu ke mana harus menyerang. Tidak ada perangkat lain yang boleh mem-ping Casper, termasuk yang satu switch. Casper sendiri tetap boleh mem-ping siapa saja. Layanan TCP 5000 Casper tetap hidup. Buktikan ping ke Casper dari Balthasar dan Lilith gagal, sedangkan ping dari Casper ke keduanya berhasil.

#### Logika pengerjaan
- Rule dipasang di Casper sendiri, bukan di Fuyutsuki. Balthasar dan Melchior berada satu switch dan satu subnet dengan Casper, sehingga ping mereka dikirim langsung lewat Switch-Terminal tanpa melewati router. Satu-satunya titik yang pasti dilewati semua ping ke Casper adalah Casper itu sendiri.
- Ping yang ditujukan ke Casper melewati chain `INPUT` di Casper.
- Yang diblokir hanya ICMP `echo-request` (permintaan ping). Balasan `echo-reply` tetap boleh masuk, sehingga Casper masih bisa mem-ping node lain.
- Target `DROP` dipilih agar Casper tidak memberi jawaban apa pun, sehingga dari luar terlihat seperti tidak ada. `REJECT` justru mengirim pesan error yang menandakan ada host di alamat itu.
- `! -i lo` mengecualikan loopback, karena soal hanya melarang perangkat lain.
- Layanan TCP 5000 tidak terpengaruh karena rule hanya mencocokkan protokol ICMP.

#### 11A. Kondisi sebelum
Sebelum rule dipasang, firewall Casper masih kosong dan Lilith masih bisa mem-ping Casper. Ini menjadi pembanding.

Magi-Casper
```bash
iptables -S
```

[SS: soal11-sebelum-casper.png]

Lilith
```bash
ping -c3 192.236.4.58
```

[SS: soal11-sebelum-lilith.png]

`iptables -S` hanya berisi tiga policy `ACCEPT` tanpa rule, dan ping Lilith ke Casper berhasil dengan 0% packet loss.

#### 11B. Pasang rule di Casper
Rule ditulis dalam `/root/soal11-casper.sh`. Rule disisipkan di urutan paling atas (`-I INPUT 1`) supaya tetap dibaca lebih dulu walaupun nanti ada rule lain. Sebelum menambah, script mengecek dengan `iptables -C` apakah rule sudah ada, sehingga script aman dijalankan berkali-kali tanpa membuat rule dobel.

Magi-Casper
```bash
cat > /root/soal11-casper.sh <<'EOF'
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
EOF
chmod +x /root/soal11-casper.sh
sh /root/soal11-casper.sh
```

[SS: soal11-script.png]

Output menampilkan rule `-A INPUT ! -i lo -p icmp -m icmp --icmp-type 8 -j DROP`. Angka `8` adalah kode ICMP untuk `echo-request`.

#### 11C. Ping ke Casper gagal
Counter rule direset dengan `iptables -Z INPUT` di Casper, lalu Balthasar (satu switch) dan Lilith (beda subnet) mem-ping Casper.

Magi-Balthasar
```bash
ping -c3 -W1 192.236.4.58
```

[SS: soal11-ping-balthasar.png]

Lilith
```bash
ping -c3 -W1 192.236.4.58
```

[SS: soal11-ping-lilith.png]

Keduanya menghasilkan `100% packet loss` tanpa pesan error, karena paket dibuang diam-diam oleh `DROP`. Ping dari tetangga satu switch pun ikut gagal, membuktikan rule bekerja di Casper sendiri.

#### 11D. Casper tetap bisa ping
Magi-Casper
```bash
ping -c3 192.236.4.59; ping -c3 192.236.4.74
```

[SS: soal11-ping-dari-casper.png]

Ping Casper ke Balthasar dan Lilith berhasil dengan 0% packet loss. Balasan yang masuk bertipe `echo-reply`, sehingga tidak cocok dengan rule yang hanya membuang `echo-request`.

#### 11E. Counter rule
Magi-Casper
```bash
iptables -L INPUT -n -v --line-numbers
```

[SS: soal11-counter.png]

Kolom `pkts` pada rule `DROP` bernilai 6, yaitu 3 ping dari Balthasar dan 3 ping dari Lilith. Ini membuktikan paket ping benar-benar sampai ke Casper lalu dibuang oleh rule, bukan hilang di perjalanan.

#### 11F. Layanan TCP 5000 tetap hidup
Lilith
```bash
echo "tes soal 11 dari Lilith" | nc -w2 192.236.4.58 5000; echo "exit=$?"
```

[SS: soal11-nc-5000-lilith.png]

Magi-Casper
```bash
cat /root/casper-5000.log
```

[SS: soal11-nc-5000-casper.png]

Lilith mendapat `exit=0` dan pesan muncul di log Casper. Casper tidak bisa di-ping, tetapi layanan TCP 5000 tetap melayani.

---
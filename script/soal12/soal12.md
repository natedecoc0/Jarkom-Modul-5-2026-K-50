### Soal 12: Teknisi yang kelewat semangat
> Teknisi yang kelewat semangat: seorang teknisi menjalankan script hardening di Casper lalu pulang tanpa mengecek. Paginya Casper tidak bisa ping 8.8.8.8 dan tidak bisa apt-get update. Unit-00 juga tidak bisa menyambung ke TCP 5000 Casper. Ping ke Casper tetap ditolak, dan itu memang benar. Jalankan break_fw.sh di Magi-Casper, lalu perbaiki tanpa membatalkan tujuan hardening. Casper tetap menolak semua lalu lintas masuk yang tidak diizinkan, dan policy INPUT tetap DROP. Buktikan nc dari Unit-00 ke Casper port 5000 berhasil dan apt-get update di Casper berhasil.

Catatan: Magi-Casper memakai image Alpine yang tidak memiliki `apt-get`. Padanannya di Alpine adalah `apk update`, yang sama-sama mengunduh daftar paket dari mirror di internet sehingga membutuhkan DNS dan koneksi keluar.

#### 12A. Kondisi sebelum dirusak
Sebelum script rusak dijalankan, seluruh rule Casper disimpan ke `/root/casper-sebelum-break.rules` sebagai pembanding untuk diagnosis. Kondisi normal juga diuji.

Magi-Casper
```bash
iptables-save > /root/casper-sebelum-break.rules
ping -c2 8.8.8.8
apk update
```

[SS: soal12-sebelum-casper.png]

Unit-00
```bash
echo "tes dari Unit-00 sebelum break" | nc -w2 192.236.4.58 5000; echo "exit=$?"
```

[SS: soal12-sebelum-unit00.png]

Ping ke 8.8.8.8 dan `apk update` berhasil, dan Unit-00 bisa menyambung ke port 5000 dengan `exit=0`.

#### 12B. Menjalankan break_fw.sh
Magi-Casper
```bash
sh /root/break_fw.sh
```

[SS: soal12-break.png]

Script mencetak `Script sudah dirusak`.

#### 12C. Gejala
Magi-Casper
```bash
ping -c2 -W2 8.8.8.8
apk update
```

[SS: soal12-gejala-casper.png]

Unit-00
```bash
echo "tes dari Unit-00 setelah break" | nc -w2 192.236.4.58 5000; echo "exit=$?"
```

[SS: soal12-gejala-unit00.png]

Lilith
```bash
ping -c2 -W1 192.236.4.58
```

[SS: soal12-gejala-lilith.png]

Casper gagal ping 8.8.8.8 dan gagal `apk update`, Unit-00 gagal menyambung ke port 5000 (`exit` bukan 0), sedangkan ping Lilith ke Casper tetap gagal sesuai soal 11.

#### 12D. Diagnosis
Rule setelah dirusak disimpan, lalu dibandingkan dengan kondisi sebelum menggunakan `diff`. Baris berawalan `-` adalah rule yang hilang, dan baris berawalan `+` adalah rule yang ditambahkan script rusak. Setelah itu seluruh rule beserta policy dan counter ditampilkan.

Magi-Casper
```bash
iptables-save > /root/casper-sesudah-break.rules
diff /root/casper-sebelum-break.rules /root/casper-sesudah-break.rules
iptables -L -n -v --line-numbers
```

[SS: soal12-diagnosis.png]

Dari perbandingan tersebut ditemukan empat penyebab:

| No | Perubahan | Akibat |
|---|---|---|
| 1 | Chain `INPUT` dan `OUTPUT` dikosongkan | Rule soal 11 (`--icmp-type 8 -j DROP`) ikut terhapus |
| 2 | Ditambahkan `-A INPUT -p icmp -j DROP` | Semua ICMP masuk dibuang, termasuk `echo-reply`. Casper masih mengirim ping, tetapi balasannya dibuang sehingga ping ke 8.8.8.8 gagal |
| 3 | Ditambahkan `-A OUTPUT -p udp --dport 53 -j DROP` | Query DNS dari Casper diblokir, sehingga Casper tidak bisa me-resolve nama mirror dan `apk update` gagal |
| 4 | Policy `INPUT` menjadi `DROP` tanpa rule `ESTABLISHED,RELATED` dan tanpa izin port 5000 | Balasan dari server mirror ikut dibuang, sehingga `apk update` tetap gagal walaupun DNS diperbaiki. Koneksi baru dari Unit-00 ke port 5000 tidak cocok dengan rule mana pun dan jatuh ke policy `DROP` |

Policy `DROP` berarti semua paket yang tidak diizinkan dibuang, termasuk balasan untuk koneksi yang dimulai oleh Casper sendiri. Karena itu hardening dengan policy `DROP` selalu membutuhkan rule `ESTABLISHED,RELATED`.

#### 12E. Perbaikan
Chain `INPUT` dan `OUTPUT` disusun ulang dari awal sehingga script aman dijalankan berkali-kali. Policy `INPUT` tetap `DROP`, dan hanya lalu lintas yang dibutuhkan yang diizinkan. Script ini juga memuat rule soal 11, sehingga menggantikan `soal11-casper.sh`.

Magi-Casper
```bash
cat > /root/soal12-casper.sh <<'EOF'
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
EOF
chmod +x /root/soal12-casper.sh
sh /root/soal12-casper.sh
```

[SS: soal12-fix.png]

Urutan rule menentukan hasilnya. Rule `ESTABLISHED,RELATED` berada di atas rule `echo-request`, sehingga `echo-reply` untuk ping yang dikirim Casper diterima lebih dulu. Ping dari node lain berstatus `NEW`, sehingga lolos dari rule kedua dan dibuang oleh rule ketiga.

#### 12F. Bukti perbaikan
Magi-Casper
```bash
ping -c2 8.8.8.8
apk update
```

[SS: soal12-bukti-casper.png]

Unit-00
```bash
echo "tes dari Unit-00 setelah perbaikan" | nc -w2 192.236.4.58 5000; echo "exit=$?"
```

[SS: soal12-bukti-unit00.png]

Magi-Casper
```bash
cat /root/casper-5000.log
```

[SS: soal12-bukti-log.png]

Lilith
```bash
ping -c2 -W1 192.236.4.58
```

[SS: soal12-bukti-lilith.png]

Unit-00
```bash
nc -w2 192.236.4.58 22; echo "exit=$?"
```

[SS: soal12-bukti-port22.png]

Casper kembali bisa ping 8.8.8.8 dan `apk update` berhasil. Unit-00 berhasil menyambung ke port 5000 dan pesannya muncul di log Casper. Ping dari Lilith ke Casper tetap gagal, dan koneksi ke port 22 menggantung sampai timeout karena jatuh ke policy `DROP`. Ini membuktikan hardening tetap berjalan.

---
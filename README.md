
# Jarkom-Modul-5-2026-K-50

## Member

| No  | Nama                   | NRP        | Pengerjaan Soal |
| --- | ---------------------- | ---------- | --------------- |
| 1   | Marvelino Davas        | 5027251085 | 11-20            |
| 2   | Nathania Tiara Wahyudi | 5027251089 | 1-10           |

---

### Soal 1: 
> Markas tanpa peta: tengah malam alarm meraung, dan Ritsuko terdiam. Markas sebesar ini dibangun tanpa peta alamat. Gendo anti pemborosan, jadi tiap subnet memakai prefix terkecil yang muat. Bagi prefix IP kelompokmu dengan VLSM untuk 17 LAN dan 16 link antar-router, urut dari kebutuhan terbesar. Tunjukkan tabel berisi network, prefix, gateway, broadcast, IP terpakai, dan sisa. Tunjukkan juga gambar pohon IP, dengan subnet jalur Dummy-Plug ke Armisael dilingkari. Di laporan, jelaskan hitungan satu subnet.

#### 1A. Aturan hitung
- Kebutuhan LAN = jumlah host + 1 gateway + 1 network + 1 broadcast.
- Kebutuhan link router ke router = 2 IP router + network + broadcast = 4, sehingga /30.
- Prefix = ukuran blok terkecil (pangkat 2) yang muat.
- Urutan alokasi dari yang terbesar. Tie-break: ukuran sama, LAN dulu sebelum link, lalu urutan tabel host.
- Urutan link mengikuti urutan tabel host dari router anak (router yang lebih bawah di pohon). Rei = link 1, Hikari = 2, Yui = 3, dan seterusnya sampai Kaji = 16. Gendo tidak punya link ke atas karena terhubung ke NAT1 lewat DHCP.

#### 1B. Tabel VLSM: 17 LAN

| No | Subnet (Switch) | Host | Kebutuhan | Network | Prefix | Gateway | Broadcast | IP terpakai | Sisa |
|---|---|---|---|---|---|---|---|---|---|
| 1 | Switch-Quarters | 500 | 503 | 192.236.0.0 | /23 | 192.236.0.1 | 192.236.1.255 | 501 | 9 |
| 2 | Switch-Comm | 200 | 203 | 192.236.2.0 | /24 | 192.236.2.1 | 192.236.2.255 | 201 | 53 |
| 3 | Switch-Hangar | 100 | 103 | 192.236.3.0 | /25 | 192.236.3.1 | 192.236.3.127 | 101 | 25 |
| 4 | Switch-Bunker | 55 | 58 | 192.236.3.128 | /26 | 192.236.3.129 | 192.236.3.191 | 56 | 6 |
| 5 | Switch-Medic | 26 | 29 | 192.236.3.192 | /27 | 192.236.3.193 | 192.236.3.223 | 27 | 3 |
| 6 | Switch-Relay | 25 | 28 | 192.236.3.224 | /27 | 192.236.3.225 | 192.236.3.255 | 26 | 4 |
| 7 | Switch-Garden | 14 | 17 | 192.236.4.0 | /27 | 192.236.4.1 | 192.236.4.31 | 15 | 15 |
| 8 | Switch-Dock | 12 | 15 | 192.236.4.32 | /28 | 192.236.4.33 | 192.236.4.47 | 13 | 1 |
| 9 | Switch-Lab | 5 | 8 | 192.236.4.48 | /29 | 192.236.4.49 | 192.236.4.55 | 6 | 0 |
| 10 | Switch-Terminal | 3 | 6 | 192.236.4.56 | /29 | 192.236.4.57 | 192.236.4.63 | 4 | 2 |
| 11 | Switch-Cage | 3 | 6 | 192.236.4.64 | /29 | 192.236.4.65 | 192.236.4.71 | 4 | 2 |
| 12 | Switch-Dogma | 2 | 5 | 192.236.4.72 | /29 | 192.236.4.73 | 192.236.4.79 | 3 | 3 |
| 13 | Switch-Monolith | 2 | 5 | 192.236.4.80 | /29 | 192.236.4.81 | 192.236.4.87 | 3 | 3 |
| 14 | Switch-Radar | 4 | 7 | 192.236.4.88 | /29 | 192.236.4.89 | 192.236.4.95 | 5 | 1 |
| 15 | Switch-Archive | 1 | 4 | 192.236.4.96 | /30 | 192.236.4.97 | 192.236.4.99 | 2 | 0 |
| 16 | Switch-Intel | 1 | 4 | 192.236.4.100 | /30 | 192.236.4.101 | 192.236.4.103 | 2 | 0 |
| 17 | Switch-Cmd | 1 | 4 | 192.236.4.104 | /30 | 192.236.4.105 | 192.236.4.107 | 2 | 0 |

Keterangan:
- IP terpakai = host + gateway.
- Sisa = IP usable yang masih kosong di subnet itu.
- Switch-Medic berisi Pen-Pen (1) + Medic-Bay (25) = 26 host.
- Switch-Lab berisi Entry-Plug (3) + Dummy-Plug (2) = 5 host.

#### 1C. Tabel VLSM: 16 link router ke router

Link tidak punya gateway. Dua ujungnya adalah IP router. IP terpakai = 2 dan sisa = 0 untuk semua link.

| No | Link | Network | Prefix | IP ujung 1 | IP ujung 2 | Broadcast |
|---|---|---|---|---|---|---|
| L1 | Yui – Rei | 192.236.4.108 | /30 | .109 (Yui) | .110 (Rei) | 192.236.4.111 |
| L2 | Gendo – Hikari | 192.236.4.112 | /30 | .113 (Gendo) | .114 (Hikari) | 192.236.4.115 |
| L3 | Gendo – Yui | 192.236.4.116 | /30 | .117 (Gendo) | .118 (Yui) | 192.236.4.119 |
| L4 | Asuka – Kensuke | 192.236.4.120 | /30 | .121 (Asuka) | .122 (Kensuke) | 192.236.4.123 |
| L5 | Fuyutsuki – Maya | 192.236.4.124 | /30 | .125 (Fuyutsuki) | .126 (Maya) | 192.236.4.127 |
| L6 | Hikari – Kaworu | 192.236.4.128 | /30 | .129 (Hikari) | .130 (Kaworu) | 192.236.4.131 |
| L7 | Yui – Shinji | 192.236.4.132 | /30 | .133 (Yui) | .134 (Shinji) | 192.236.4.135 |
| L8 | Yui – Mari | 192.236.4.136 | /30 | .137 (Yui) | .138 (Mari) | 192.236.4.139 |
| L9 | Asuka – Ritsuko | 192.236.4.140 | /30 | .141 (Asuka) | .142 (Ritsuko) | 192.236.4.143 |
| L10 | Gendo – Fuyutsuki | 192.236.4.144 | /30 | .145 (Gendo) | .146 (Fuyutsuki) | 192.236.4.147 |
| L11 | Gendo – Misato | 192.236.4.148 | /30 | .149 (Gendo) | .150 (Misato) | 192.236.4.151 |
| L12 | Fuyutsuki – Toji | 192.236.4.152 | /30 | .153 (Fuyutsuki) | .154 (Toji) | 192.236.4.155 |
| L13 | Gendo – Shigeru | 192.236.4.156 | /30 | .157 (Gendo) | .158 (Shigeru) | 192.236.4.159 |
| L14 | Shigeru – Makoto | 192.236.4.160 | /30 | .161 (Shigeru) | .162 (Makoto) | 192.236.4.163 |
| L15 | Gendo – Asuka | 192.236.4.164 | /30 | .165 (Gendo) | .166 (Asuka) | 192.236.4.167 |
| L16 | Gendo – Kaji | 192.236.4.168 | /30 | .169 (Gendo) | .170 (Kaji) | 192.236.4.171 |

Total terpakai: 192.236.0.0 sampai 192.236.4.171 = **1196 alamat**. Sisa bebas: 192.236.4.172 sampai 192.236.255.255 = **64.340 alamat**.

#### 1D. Pohon IP
Pohon IP menggambarkan pembagian prefix 192.236.0.0/16 secara bertingkat sampai tiap subnet. Subnet jalur Dummy-Plug ke Armisael (A9, L9, L15, L13, A13) ditandai garis merah tebal.



Gambar menunjukkan 17 LAN (A1–A17) dan 16 link router (L1–L16) tersusun urut dari kebutuhan terbesar, tanpa tumpang tindih.

#### 1E. Hitungan satu subnet: Switch-Garden (Garden-Staff, 14 host)

Switch-Garden dipilih karena 14 host terlihat muat di `/28`, padahal tidak.

1. Kebutuhan alamat: 14 host + 1 gateway (Shinji) = 15 IP usable. Ditambah network dan broadcast, jadi 15 + 2 = **17 alamat**.
2. Blok terkecil yang muat: 2⁴ = 16 < 17 (tidak muat), 2⁵ = 32 ≥ 17 (muat). Jadi host bits = 5 dan prefix = 32 − 5 = **/27**.
3. Netmask: /27 = 255.255.255.224. Ukuran blok 256 − 224 = 32.
4. Posisi alokasi: LAN `/27` berukuran sama dengan Medic dan Relay, dan menurut tabel host Garden berada di urutan 7, jadi setelah keduanya. Alamat berikutnya yang sejajar (kelipatan 32) setelah 192.236.3.224/27 adalah **192.236.4.0/27**.
5. Hasil:
   - Network: 192.236.4.0
   - Gateway (usable pertama, Shinji eth1): 192.236.4.1
   - Garden-Staff: 192.236.4.2
   - Range usable: 192.236.4.1 sampai 192.236.4.30 (30 IP)
   - Broadcast: 192.236.4.0 + 31 = 192.236.4.31
6. IP terpakai = 14 + 1 = 15. Sisa = 30 − 15 = **15 IP**.

Hasil ini cocok dengan konfigurasi yang dipakai di soal 2 sampai 6: Shinji eth1 = `192.236.4.1/27` dan Garden-Staff = `192.236.4.2/27`.

---

### Soal 2: 
> Geofront gelap gulita: kabel sudah ditarik, tapi saat Misato menekan tombol daya, Geofront tetap gelap. Tidak ada alamat dan tidak ada rute. Pasang semua node di GNS3 sesuai topologi. Beri IP ke tiap interface router sesuai soal 1, lalu aktifkan IP forwarding di semua router. Hanya Gendo yang terhubung ke NAT1 dan mendapat alamat lewat DHCP. Router lain baru bisa memasang paket setelah soal 4, karena internet baru ada saat itu. Tunjukkan ip -br di tiap router dan ping dua ujung tiap link router ke router.

#### 2A. Gendou (T1) memasang IP interface internal

Semua interface Gendou dinyalakan, IP forwarding diaktifkan, lalu eth1–eth8 diberi IP sisi Gendou pada tiap link sesuai tabel VLSM (/30). eth0 sengaja dikosongkan karena akan dipakai untuk NAT1.

Gendou
```bash
for i in eth0 eth1 eth2 eth3 eth4 eth5 eth6 eth7 eth8; do ip link set $i up; done; echo 1 > /proc/sys/net/ipv4/ip_forward; ip addr replace 192.236.4.105/30 dev eth1; ip addr replace 192.236.4.113/30 dev eth2; ip addr replace 192.236.4.117/30 dev eth3; ip addr replace 192.236.4.165/30 dev eth4; ip addr replace 192.236.4.169/30 dev eth5; ip addr replace 192.236.4.149/30 dev eth6; ip addr replace 192.236.4.157/30 dev eth7; ip addr replace 192.236.4.145/30 dev eth8; ip -br a; cat /proc/sys/net/ipv4/ip_forward
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/1f1c027c-af23-47fa-8326-e7fe82aaecd5" />

`ip -br a` menampilkan eth1–eth8 berstatus UP dengan IP /30 sesuai VLSM, sedangkan eth0 belum punya IP. Angka `1` di baris terakhir menandakan IP forwarding sudah aktif.

#### 2B. Gendou (T1) memakai IP pinjaman untuk internet

Gendou belum mendapat DHCP dan belum punya paket, sehingga diberi IP pinjaman 192.168.122.200/24 di segmen NAT1 (gateway 192.168.122.1) beserta DNS 8.8.8.8. Tujuannya hanya agar `apt-get` bisa jalan.

Gendou
```bash
ip addr add 192.168.122.200/24 dev eth0; ip route replace default via 192.168.122.1 dev eth0; echo "nameserver 8.8.8.8" > /etc/resolv.conf; ping -c3 8.8.8.8
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/ae07db73-27c2-45a4-8c96-d80996457a2a" />

Ping ke 8.8.8.8 mendapat balasan dengan 0% packet loss, jadi Gendou sudah terhubung ke internet lewat NAT1.

#### 2C. Gendou (T1) memasang paket

Memasang `isc-dhcp-client` (untuk `dhclient`), `iptables` untuk NAT dan firewall, dan `conntrack` untuk melihat tabel koneksi. Semuanya dipasang sekarang selagi internet masih ada.

Gendou
```bash
apt-get update && apt-get install -y isc-dhcp-client iptables conntrack; which dhclient
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/d3f2f88d-e462-49ab-bf1b-79f6b2ba9ab2" />

Proses `apt-get` selesai tanpa error, dan `which dhclient` mencetak path binary `dhclient`. Itu tandanya paket sudah terpasang.

#### 2D. Gendou (T1) pindah ke DHCP

IP pinjaman dan default route sementara dihapus, lalu `dhclient -v eth0` dijalankan agar Gendou mendapat alamat dari NAT1 lewat DHCP, sesuai soal.

Gendou
```bash
ip addr del 192.168.122.200/24 dev eth0; ip route del default 2>/dev/null; dhclient -v eth0
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/8ca24438-d66f-46cb-89bb-8d174d4ed305" />

Menampilkan log `dhclient` (DHCPDISCOVER, OFFER, REQUEST, ACK) sampai eth0 "bound" ke IP dari NAT1.

Gendou
```bash
ip -br a; ip route; ping -c3 8.8.8.8
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/3d78ce99-ea1c-40c1-bb08-452d5b1bf5d3" />

Menunjukkan eth0 sudah memegang IP DHCP dan ada default route lewat NAT1. Ping ke 8.8.8.8 berhasil, jadi internet tetap jalan tanpa IP pinjaman.

#### 2E. Router lain: IP, forwarding, lalu ping ke router induk

Pada tiap router selain Gendou, semua interface dinyalakan, IP forwarding diaktifkan, dan IP dipasang sesuai VLSM. eth0 mengarah ke router induk, sisanya ke LAN atau router anak. Terakhir, router mem-ping ujung link di sisi induknya untuk mengecek link.

Yui
```bash
for i in eth0 eth1 eth2 eth3 eth4; do ip link set $i up; done; echo 1 > /proc/sys/net/ipv4/ip_forward; ip addr replace 192.236.4.118/30 dev eth0; ip addr replace 192.236.3.1/25 dev eth1; ip addr replace 192.236.4.109/30 dev eth2; ip addr replace 192.236.4.133/30 dev eth3; ip addr replace 192.236.4.137/30 dev eth4; ip -br a; ping -c2 -W1 192.236.4.117 | grep transmitted
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/86d404dc-cce4-4422-a0eb-967394ba7b33" />

Rei
```bash
for i in eth0 eth1; do ip link set $i up; done; echo 1 > /proc/sys/net/ipv4/ip_forward; ip addr replace 192.236.4.110/30 dev eth0; ip addr replace 192.236.0.1/23 dev eth1; ip -br a; ping -c2 -W1 192.236.4.109 | grep transmitted
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/23f7c7a5-89b0-494f-b105-e0aa2618f64e" />

Shinji
```bash
for i in eth0 eth1; do ip link set $i up; done; echo 1 > /proc/sys/net/ipv4/ip_forward; ip addr replace 192.236.4.134/30 dev eth0; ip addr replace 192.236.4.1/27 dev eth1; ip -br a; ping -c2 -W1 192.236.4.133 | grep transmitted
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/5e6c5577-affe-4773-baea-c0da0a81b9e8" />

Mari
```bash
for i in eth0 eth1; do ip link set $i up; done; echo 1 > /proc/sys/net/ipv4/ip_forward; ip addr replace 192.236.4.138/30 dev eth0; ip addr replace 192.236.4.33/28 dev eth1; ip -br a; ping -c2 -W1 192.236.4.137 | grep transmitted
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/d4226213-ae09-4dfd-9405-d773800cf384" />

Hikari 
```bash
for i in eth0 eth1 eth2; do ip link set $i up; done; echo 1 > /proc/sys/net/ipv4/ip_forward; ip addr replace 192.236.4.114/30 dev eth0; ip addr replace 192.236.2.1/24 dev eth1; ip addr replace 192.236.4.129/30 dev eth2; ip -br a; ping -c2 -W1 192.236.4.113 | grep transmitted
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/0f8c98ac-3af4-4807-81ff-4463c8128a34" />

Kaworu
```bash
for i in eth0 eth1; do ip link set $i up; done; echo 1 > /proc/sys/net/ipv4/ip_forward; ip addr replace 192.236.4.130/30 dev eth0; ip addr replace 192.236.3.225/27 dev eth1; ip -br a; ping -c2 -W1 192.236.4.129 | grep transmitted
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/15836a92-a000-422a-acb7-4ec2a96f860a" />

Asuka
```bash
for i in eth0 eth1 eth2 eth3; do ip link set $i up; done; echo 1 > /proc/sys/net/ipv4/ip_forward; ip addr replace 192.236.4.166/30 dev eth0; ip addr replace 192.236.4.121/30 dev eth1; ip addr replace 192.236.4.141/30 dev eth2; ip addr replace 192.236.4.97/30 dev eth3; ip -br a; ping -c2 -W1 192.236.4.165 | grep transmitted
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/34563db8-f9cd-4390-abba-a9a958fff6eb" />

Kensuke
```bash
for i in eth0 eth1; do ip link set $i up; done; echo 1 > /proc/sys/net/ipv4/ip_forward; ip addr replace 192.236.4.122/30 dev eth0; ip addr replace 192.236.3.129/26 dev eth1; ip -br a; ping -c2 -W1 192.236.4.121 | grep transmitted
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/4d78c914-66b1-4772-bd67-427619cd37be" />

Ritsuko
```bash
for i in eth0 eth1; do ip link set $i up; done; echo 1 > /proc/sys/net/ipv4/ip_forward; ip addr replace 192.236.4.142/30 dev eth0; ip addr replace 192.236.4.49/29 dev eth1; ip -br a; ping -c2 -W1 192.236.4.141 | grep transmitted
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/df4191f9-ccc4-4ebb-a518-02284da9cd2b" />

Kaji
```bash
for i in eth0 eth1; do ip link set $i up; done; echo 1 > /proc/sys/net/ipv4/ip_forward; ip addr replace 192.236.4.170/30 dev eth0; ip addr replace 192.236.4.101/30 dev eth1; ip -br a; ping -c2 -W1 192.236.4.169 | grep transmitted
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/4da2c904-9609-42a2-a705-47b75e3218f9" />

Misato
```bash
for i in eth0 eth1; do ip link set $i up; done; echo 1 > /proc/sys/net/ipv4/ip_forward; ip addr replace 192.236.4.150/30 dev eth0; ip addr replace 192.236.4.65/29 dev eth1; ip -br a; ping -c2 -W1 192.236.4.149 | grep transmitted
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/8b15018d-eea4-4422-88f1-0e1e6489cca5" />

Shigeru
```bash
for i in eth0 eth1 eth2; do ip link set $i up; done; echo 1 > /proc/sys/net/ipv4/ip_forward; ip addr replace 192.236.4.158/30 dev eth0; ip addr replace 192.236.4.161/30 dev eth1; ip addr replace 192.236.4.81/29 dev eth2; ip -br a; ping -c2 -W1 192.236.4.157 | grep transmitted
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/302fa467-343a-422b-916d-03410c978cb7" />

Makoto
```bash
for i in eth0 eth1; do ip link set $i up; done; echo 1 > /proc/sys/net/ipv4/ip_forward; ip addr replace 192.236.4.162/30 dev eth0; ip addr replace 192.236.4.89/29 dev eth1; ip -br a; ping -c2 -W1 192.236.4.161 | grep transmitted
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/13695c4f-283f-4fb5-8b0e-a7a6efffa574" />

Fuyutsuki
```bash
for i in eth0 eth1 eth2 eth3; do ip link set $i up; done; echo 1 > /proc/sys/net/ipv4/ip_forward; ip addr replace 192.236.4.146/30 dev eth0; ip addr replace 192.236.4.57/29 dev eth1; ip addr replace 192.236.4.125/30 dev eth2; ip addr replace 192.236.4.153/30 dev eth3; ip -br a; ping -c2 -W1 192.236.4.145 | grep transmitted
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/d0fb5ea8-bbe0-4a1e-808a-d41916c3ea87" />

Maya
```bash
for i in eth0 eth1; do ip link set $i up; done; echo 1 > /proc/sys/net/ipv4/ip_forward; ip addr replace 192.236.4.126/30 dev eth0; ip addr replace 192.236.3.193/27 dev eth1; ip -br a; ping -c2 -W1 192.236.4.125 | grep transmitted
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/26f1594a-8c98-4ac9-8283-3186979d69cc" />

Toji
```bash
for i in eth0 eth1; do ip link set $i up; done; echo 1 > /proc/sys/net/ipv4/ip_forward; ip addr replace 192.236.4.154/30 dev eth0; ip addr replace 192.236.4.73/29 dev eth1; ip -br a; ping -c2 -W1 192.236.4.153 | grep transmitted
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/03587599-b5c1-4025-8872-d2955f22c6eb" />

Untuk setiap router, `ip -br a` menunjukkan interface UP dengan IP sesuai tabel VLSM. Baris `transmitted` menunjukkan `2 packets transmitted, 2 received, 0% packet loss`, artinya link ke router induk hidup.

#### 2F. Ping dari sisi induk

Pengecekan dibalik. Router induk mem-ping IP router anak di ujung link yang lain, sehingga kedua ujung tiap link terbukti terhubung dua arah.

Gendou
```bash
for a in 192.236.4.118 192.236.4.114 192.236.4.166 192.236.4.170 192.236.4.150 192.236.4.158 192.236.4.146; do echo "== $a"; ping -c2 -W1 $a | grep transmitted; done
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/8f50a1be-62a1-478b-a64a-ef856f23b694" />

Yui
```bash
for a in 192.236.4.110 192.236.4.134 192.236.4.138; do echo "== $a"; ping -c2 -W1 $a | grep transmitted; done
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/90a2247a-106d-496a-af64-1a996f2424f4" />

Hikari
```bash
for a in 192.236.4.130; do echo "== $a"; ping -c2 -W1 $a | grep transmitted; done
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/9e486bbb-8976-4aac-8214-f76050669e96" />

Asuka
```bash
for a in 192.236.4.122 192.236.4.142; do echo "== $a"; ping -c2 -W1 $a | grep transmitted; done
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/b0959646-bf62-4a2d-a94c-ce4b54066cdb" />

Shigeru
```bash
for a in 192.236.4.162; do echo "== $a"; ping -c2 -W1 $a | grep transmitted; done
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/1a9df601-3745-4e26-8b75-2bd71e063f77" />

Fuyutsuki
```bash
for a in 192.236.4.126 192.236.4.154; do echo "== $a"; ping -c2 -W1 $a | grep transmitted; done
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/be948cbe-4dd9-4c59-8d17-e19c48d52d7a" />

Setiap IP yang dicetak (`== IP`) diikuti `2 received, 0% packet loss`. Gendou berhasil ke 7 anak langsungnya, Yui ke Rei, Shinji, dan Mari, Hikari ke Kaworu, Asuka ke Kensuke dan Ritsuko, Shigeru ke Makoto, dan Fuyutsuki ke Maya dan Toji.

--- 

### Soal 3: Routing statis
> Pulau-pulau yang terpisah: lampu mulai menyala, tapi tiap segmen masih seperti pulau terpisah. Fuyutsuki mengingatkan: bangun jalur dari Gendo ke bawah, cabang demi cabang. Hubungkan semua subnet dengan routing statis dan jumlah rute sesedikit mungkin. Router selain Gendo cukup punya satu default route ke atas dan rute untuk subnet di bawahnya. Gendo memakai default route ke NAT1. Subnet satu cabang yang bisa digabung tepat menjadi satu CIDR harus diringkas. Untuk soal 3 sampai 5, beri IP dan gateway sementara pada node uji. IP permanen dibuat di soal 6. Buktikan Armisael bisa ping ke Lilith, Sachiel, dan Comm-Net.

#### 3A. Pasang rute di semua router

Gendou memakai default route ke NAT1 (dari DHCP) dan satu rute statis per subnet di tiap cabang. Subnet satu cabang yang bisa digabung tepat menjadi satu CIDR diringkas, misalnya 192.236.4.80/28 untuk Monolith dan Radar lewat Shigeru. Router lain hanya punya default route ke induk dan rute untuk subnet di bawahnya. Router ujung cukup default route saja.

Gendou
```bash
while read n h; do ip route replace $n via $h; done <<'R'
192.236.2.0/24 192.236.4.114
192.236.3.224/27 192.236.4.114
192.236.4.128/30 192.236.4.114
192.236.0.0/23 192.236.4.118
192.236.3.0/25 192.236.4.118
192.236.4.0/27 192.236.4.118
192.236.4.32/28 192.236.4.118
192.236.4.108/30 192.236.4.118
192.236.4.132/30 192.236.4.118
192.236.4.136/30 192.236.4.118
192.236.3.128/26 192.236.4.166
192.236.4.48/29 192.236.4.166
192.236.4.96/30 192.236.4.166
192.236.4.120/30 192.236.4.166
192.236.4.140/30 192.236.4.166
192.236.4.100/30 192.236.4.170
192.236.4.64/29 192.236.4.150
192.236.4.80/28 192.236.4.158
192.236.4.160/30 192.236.4.158
192.236.3.192/27 192.236.4.146
192.236.4.56/29 192.236.4.146
192.236.4.72/29 192.236.4.146
192.236.4.124/30 192.236.4.146
192.236.4.152/30 192.236.4.146
R
ip route | grep default; ip route | grep -c ' via '
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/11531e40-8c6d-45c4-9b0b-66f928b1da5a" />

Yui
```bash
ip route replace default via 192.236.4.117; ip route replace 192.236.0.0/23 via 192.236.4.110; ip route replace 192.236.4.0/27 via 192.236.4.134; ip route replace 192.236.4.32/28 via 192.236.4.138; ip route
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/dc653441-581d-4159-9c77-f0d79dc47728" />

Rei
```bash
ip route replace default via 192.236.4.109; ip route
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/945e4e68-b5cc-4823-b48a-0c82b28b6534" />

Shinji
```bash
ip route replace default via 192.236.4.133; ip route
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/f7532111-b63d-4373-a9cc-68905d3c2664" />

Mari
```bash
ip route replace default via 192.236.4.137; ip route
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/69986d12-aa5b-4e41-b71f-c2851857a160" />

Hikari
```bash
ip route replace default via 192.236.4.113; ip route replace 192.236.3.224/27 via 192.236.4.130; ip route
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/6db550c1-51cc-417d-85c0-808dec4d6028" />

Kaworu
```bash
ip route replace default via 192.236.4.129; ip route
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/b7dc78b6-cc54-401f-ad0b-f5d626e18741" />

Asuka
```bash
ip route replace default via 192.236.4.165; ip route replace 192.236.3.128/26 via 192.236.4.122; ip route replace 192.236.4.48/29 via 192.236.4.142; ip route
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/d255f6b4-3372-46cf-a151-f28834750d53" />

Kensuke 
```bash
ip route replace default via 192.236.4.121; ip route
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/e2e62420-a6de-4651-86ae-671c0dc88435" />

Ritsuko
```bash
ip route replace default via 192.236.4.141; ip route
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/3499b019-3e43-4d82-9fe9-d7f36108c7cb" />

Kaji
```bash
ip route replace default via 192.236.4.169; ip route
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/a7b0d2a1-ec2e-4c84-a3c1-91d2556b4543" />

Misato
```bash
ip route replace default via 192.236.4.149; ip route
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/6481582b-fe8b-43a0-9b45-71c0a2f57640" />

Shigeru
```bash
ip route replace default via 192.236.4.157; ip route replace 192.236.4.88/29 via 192.236.4.162; ip route
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/16bddf10-0137-4535-ba6e-a1b02aa156c5" />

Makoto
```bash
ip route replace default via 192.236.4.161; ip route
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/4003bb99-352f-431e-88ea-cb88b5ba6c96" />

Fuyutsuki
```bash
ip route replace default via 192.236.4.145; ip route replace 192.236.3.192/27 via 192.236.4.126; ip route replace 192.236.4.72/29 via 192.236.4.154; ip route
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/58d46451-1354-4c63-abb5-3b7747e02ae0" />

Maya
```bash
ip route replace default via 192.236.4.125; ip route
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/8bb278e8-3f8a-49a5-b1ab-40d1227d8adf" />

Toji
```bash
ip route replace default via 192.236.4.153; ip route
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/d6e8f13b-b131-43fe-a9e7-d5563d8ad39f" />

Di Gendou, default route mengarah ke NAT1 dan rute statis `via` router anak muncul sesuai cabangnya. Di router lain, `ip route` menampilkan default via induk, rute ke subnet anak (jika ada), dan rute connected. Router ujung hanya punya default dan connected.

#### 3B. Gate: cek semua router sebelum lanjut

Dari Gendou, semua 49 IP interface router di-ping satu per satu. Ini memastikan routing statis lengkap sebelum lanjut ke soal berikutnya, dan hanya IP yang gagal yang dicetak.

Gendou
```bash
F=0; for a in 192.236.4.105 192.236.4.113 192.236.4.117 192.236.4.165 192.236.4.169 192.236.4.149 192.236.4.157 192.236.4.145 192.236.4.118 192.236.3.1 192.236.4.109 192.236.4.133 192.236.4.137 192.236.4.110 192.236.0.1 192.236.4.134 192.236.4.1 192.236.4.138 192.236.4.33 192.236.4.114 192.236.2.1 192.236.4.129 192.236.4.130 192.236.3.225 192.236.4.166 192.236.4.121 192.236.4.141 192.236.4.97 192.236.4.122 192.236.3.129 192.236.4.142 192.236.4.49 192.236.4.170 192.236.4.101 192.236.4.150 192.236.4.65 192.236.4.158 192.236.4.161 192.236.4.81 192.236.4.162 192.236.4.89 192.236.4.146 192.236.4.57 192.236.4.125 192.236.4.153 192.236.4.126 192.236.3.193 192.236.4.154 192.236.4.73; do ping -c1 -W1 $a >/dev/null 2>&1 || { echo "GAGAL: $a"; F=1; }; done; [ $F = 0 ] && echo "SEMUA 49 IP ROUTER OK"
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/5ea1c93f-d37b-4853-8f4c-a1f38ce0ea27" />

Hasil akhirnya `SEMUA 49 IP ROUTER OK` tanpa satu pun baris `GAGAL`, jadi Gendou bisa menjangkau semua interface router.

#### 3C. IP sementara untuk node uji

Comm-Net, Sachiel, Lilith, dan Armisael diberi IP dan gateway sementara agar bisa dipakai menguji routing. IP permanen baru dibuat di soal 6.

Comm-Net
```bash
ip link set eth0 up; ip addr replace 192.236.2.2/24 dev eth0; ip route replace default via 192.236.2.1; ip -br a
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/de71eaef-7b33-43bc-bb95-7d789038005e" />

Sachiel
```bash
ip link set eth0 up; ip addr replace 192.236.3.130/26 dev eth0; ip route replace default via 192.236.3.129; ip -br a
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/afa9b40d-a9e7-4e63-b35e-a8f2e2a7fbd4" />

Lilith
```bash
ip link set eth0 up; ip addr replace 192.236.4.74/29 dev eth0; ip route replace default via 192.236.4.73; ip -br a
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/e0e16782-4ec2-45ca-974e-46bc023a0840" />

Armisael
```bash
ip link set eth0 up; ip addr replace 192.236.4.83/29 dev eth0; ip route replace default via 192.236.4.81; ip -br a
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/e0074dee-5c4d-4052-9a65-bbe108777852" />


`ip -br a` di tiap node menunjukkan eth0 UP dengan IP/prefix dan gateway yang sesuai dengan subnet masing-masing.

#### 3D. Bukti Armisael ping ke Lilith, Sachiel, dan Comm-Net

Armisael mem-ping gateway-nya (Shigeru), lalu Lilith, Sachiel, dan Comm-Net. Ketiga tujuan itu berada di cabang yang berbeda, sehingga ini membuktikan routing statis bekerja menyeberang cabang.

Armisael
```bash
ping -c3 192.236.4.81
ping -c3 192.236.4.74
ping -c3 192.236.3.130
ping -c3 192.236.2.2
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/b4185f17-835b-434c-82a5-be695e825cfa" />

Keempat ping menunjukkan `3 received, 0% packet loss`. Artinya Armisael sudah bisa menjangkau semua cabang lewat Gendou.

---

### Soal 4: Internet untuk seluruh jaringan (NAT)
> Haus kabar dari dunia luar: Maya melapor bahwa semua sistem butuh update dari luar, padahal pintu keluarnya hanya Gendo. IP dari NAT1 juga bisa berganti kapan saja. Beri seluruh jaringan akses internet lewat Gendo. Konfigurasinya tidak boleh perlu diubah saat IP NAT1 berganti. Hanya traffic dari prefix internal yang keluar lewat NAT1 yang boleh diterjemahkan alamatnya, sedangkan traffic antar-LAN harus tetap membawa alamat asli pengirimnya. Node yang nanti memasang paket juga harus bisa me-resolve nama domain. Selesaikan sebelum node lain memasang paket. Buktikan ping 8.8.8.8 dan ping deb.debian.org dari Armisael dan Lilith berhasil, dan tunjukkan counter rule NAT.

#### 4A. Pasang NAT di Gendou

Rule `MASQUERADE` dipasang untuk sumber 192.236.0.0/16 yang keluar lewat eth0. MASQUERADE otomatis memakai IP eth0 saat ini, jadi konfigurasi tidak perlu diubah ketika IP NAT1 berganti. Trafik antar-LAN tidak keluar lewat eth0, sehingga tidak diterjemahkan. Pengecekan `-C` dilakukan dulu agar rule tidak dobel.

Gendou
```bash
iptables -t nat -C POSTROUTING -s 192.236.0.0/16 -o eth0 -j MASQUERADE 2>/dev/null || iptables -t nat -A POSTROUTING -s 192.236.0.0/16 -o eth0 -j MASQUERADE
iptables -t nat -S POSTROUTING
iptables -t nat -L POSTROUTING -n -v -x
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/524934e3-1dbe-4e6d-8b92-e62a506c4948" />

`iptables -t nat -S POSTROUTING` menampilkan satu rule MASQUERADE untuk 192.236.0.0/16 ke eth0. Counter-nya masih 0 karena belum ada trafik.

#### 4B. DNS di node yang akan memasang paket atau jadi node uji

`nameserver 8.8.8.8` ditulis ke `/etc/resolv.conf` di Gendou, Misato, Shigeru, Fuyutsuki, Lilith, dan Armisael agar node tersebut bisa me-resolve nama domain.

Gendou, Misato, Shigeru, Fuyutsuki, Lilith, Armisael
```bash
echo "nameserver 8.8.8.8" > /etc/resolv.conf; cat /etc/resolv.conf
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/bdd22874-1f0e-4c9b-954e-96c56fb41745" />

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/03c8eb26-2fea-487f-abf0-e0c81f27d235" />

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/e3740365-97bb-4ec0-897b-19286691546c" />

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/cf9cf4ce-7928-4c2f-81f0-d5e719428cf2" />

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/4763604e-1414-4444-bb7c-7aeb6bc1d56f" />

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/f6c1e6d4-1533-4dee-a19c-89e49d862801" />

Setiap screenshot menampilkan isi `/etc/resolv.conf` berisi `nameserver 8.8.8.8`, berurutan untuk keenam node.

#### 4C. Install paket di router (selesaikan sebelum node lain)

Misato, Shigeru, dan Fuyutsuki memasang `iptables` (Fuyutsuki juga `conntrack`). Ini dikerjakan sekarang karena internet baru tersedia setelah NAT aktif, dan paketnya dibutuhkan di soal-soal berikutnya.

Misato
```bash
apt-get update && apt-get install -y iptables; iptables -V
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/b6722b0b-4e3c-4118-baad-cd50f5655d0d" />

Shigeru
```bash
apt-get update && apt-get install -y iptables; iptables -V
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/2d3ae7d8-b79d-40a3-978e-6d1ece770606" />

Fuyutsuki
```bash
apt-get update && apt-get install -y iptables conntrack; iptables -V
```


<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/9c67888f-bdb9-4d10-ba87-29ce9f9d0601" />

`apt-get` selesai tanpa error dan `iptables -V` mencetak versi iptables, jadi paket sudah terpasang di ketiga router.

#### 4D. Bukti dari Lilith lalu Armisael

Lilith dan Armisael mem-ping 8.8.8.8 dan `deb.debian.org`, lalu menjalankan `nslookup`. Ping ke nama domain membuktikan DNS bekerja. Armisael juga mem-ping Lilith (antar-LAN) agar ada trafik yang tidak ber-NAT untuk dibuktikan di 4E.

Lilith
```bash
ping -c3 8.8.8.8; ping -c3 deb.debian.org; nslookup deb.debian.org
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/144b4e0e-865b-4176-9481-520623a54832" />

Armisael
```bash
ping -c3 8.8.8.8; ping -c3 deb.debian.org; nslookup deb.debian.org; ping -c5 192.236.4.74
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/08856b25-67a5-4b1e-8d63-140cc0a347ff" />


Ping ke 8.8.8.8 dan ke `deb.debian.org` berhasil dengan 0% loss, dan `nslookup` menampilkan IP dari `deb.debian.org`. Di Armisael, ping ke Lilith juga berhasil.

#### 4E. Counter NAT dan bukti traffic antar-LAN tidak diterjemahkan

Di Gendou, counter rule MASQUERADE dan tabel conntrack dilihat. Entri koneksi ke 8.8.8.8 menunjukkan alamat yang sudah diterjemahkan, sedangkan entri antar-LAN (ke Lilith) harus tetap membawa alamat asli pengirim.

Gendou
```bash
iptables -t nat -L POSTROUTING -n -v -x
cat /proc/net/nf_conntrack | grep -E 'dst=8.8.8.8|dst=192.236.4.74' | head
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/09cd6a63-86e9-45d9-8c4c-b1f0a0aac8c4" />

Counter `pkts` dan `bytes` rule MASQUERADE sudah naik, bukti rule terpakai. Entri conntrack ke `dst=8.8.8.8` memiliki sisi balasan dengan alamat Gendou, sedangkan entri ke `dst=192.236.4.74` tetap memakai alamat asli Armisael. Jadi hanya trafik keluar yang di-NAT.

---

### Soal 5: Kunci pintu depan (firewall di Gendou)
> Pintu depan dikunci rapat: Kaji memperingatkan Kaworu bahwa SEELE cukup mengetuk pintu depan. Gendo mengunci NAT1: boleh keluar, tidak boleh dimasuki. Di Gendo, ubah policy INPUT dan FORWARD menjadi DROP. Lalu izinkan empat hal: (a) balasan koneksi yang sudah ada, (b) traffic dari jaringan internal ke internet, (c) traffic antar-LAN, dan (d) traffic dari jaringan internal ke Gendo sendiri. Loopback dan DHCP dari NAT1 juga harus tetap jalan. Koneksi baru dari sisi NAT1 tidak boleh masuk. Soal 2 sampai 4 harus tetap jalan, dan semuanya ditulis di gendo.sh. Tunjukkan iptables -S di Gendo, dan buktikan ping 8.8.8.8 dari Armisael masih berhasil.

#### 5A. Buat dan jalankan gendou.sh

Semua konfigurasi Gendou (IP, forwarding, DHCP, DNS, rute, NAT, firewall) disatukan dalam satu skrip. Skrip mengatur policy ke ACCEPT dan flush rule dulu supaya bisa dijalankan berulang tanpa rule dobel, lalu memasang policy DROP di akhir. INPUT mengizinkan loopback, balasan koneksi, DHCP dari NAT1, dan trafik internal ke Gendou. FORWARD mengizinkan balasan, internal ke internet, dan antar-LAN. Koneksi baru dari sisi NAT1 tidak punya rule yang cocok, sehingga ditolak. `gendo.sh` adalah salinan dengan nama sesuai soal.

Gendou
```bash
cat > /root/gendou.sh <<'EOF'
#!/bin/bash
# gendou.sh - Gendou: IP, forwarding, DHCP, DNS, rute, NAT, firewall (Soal 2-5)
INT="192.236.0.0/16"; WAN="eth0"

# --- Soal 2: forwarding, interface, DHCP ---
echo 1 > /proc/sys/net/ipv4/ip_forward
for i in eth0 eth1 eth2 eth3 eth4 eth5 eth6 eth7 eth8; do ip link set $i up; done
while read ifc a; do ip addr replace $a dev $ifc; done <<'A'
eth1 192.236.4.105/30
eth2 192.236.4.113/30
eth3 192.236.4.117/30
eth4 192.236.4.165/30
eth5 192.236.4.169/30
eth6 192.236.4.149/30
eth7 192.236.4.157/30
eth8 192.236.4.145/30
A
ip route | grep -q '^default' || { pkill dhclient 2>/dev/null; dhclient -v $WAN; }
echo "nameserver 8.8.8.8" > /etc/resolv.conf

# --- Soal 3: routing statis ---
while read n h; do ip route replace $n via $h; done <<'R'
192.236.2.0/24 192.236.4.114
192.236.3.224/27 192.236.4.114
192.236.4.128/30 192.236.4.114
192.236.0.0/23 192.236.4.118
192.236.3.0/25 192.236.4.118
192.236.4.0/27 192.236.4.118
192.236.4.32/28 192.236.4.118
192.236.4.108/30 192.236.4.118
192.236.4.132/30 192.236.4.118
192.236.4.136/30 192.236.4.118
192.236.3.128/26 192.236.4.166
192.236.4.48/29 192.236.4.166
192.236.4.96/30 192.236.4.166
192.236.4.120/30 192.236.4.166
192.236.4.140/30 192.236.4.166
192.236.4.100/30 192.236.4.170
192.236.4.64/29 192.236.4.150
192.236.4.80/28 192.236.4.158
192.236.4.160/30 192.236.4.158
192.236.3.192/27 192.236.4.146
192.236.4.56/29 192.236.4.146
192.236.4.72/29 192.236.4.146
192.236.4.124/30 192.236.4.146
192.236.4.152/30 192.236.4.146
R

# --- Reset firewall (policy ACCEPT dulu supaya tidak terkunci) ---
for p in INPUT FORWARD OUTPUT; do iptables -P $p ACCEPT; done
iptables -F; iptables -X; iptables -t nat -F

# --- Soal 4: NAT (MASQUERADE: tidak bergantung IP NAT1) ---
iptables -t nat -A POSTROUTING -s $INT -o $WAN -j MASQUERADE

# --- Soal 5: INPUT ---
iptables -A INPUT -i lo -j ACCEPT                                        # loopback
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT   # (a) balasan
iptables -A INPUT -i $WAN -p udp --sport 67 --dport 68 -j ACCEPT         # DHCP dari NAT1
iptables -A INPUT ! -i $WAN -s $INT -j ACCEPT                            # (d) internal -> Gendou

# --- Soal 5: FORWARD ---
iptables -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT # (a) balasan
iptables -A FORWARD ! -i $WAN -o $WAN -s $INT -j ACCEPT                  # (b) internal -> internet
iptables -A FORWARD ! -i $WAN ! -o $WAN -s $INT -d $INT -j ACCEPT        # (c) antar-LAN

# --- Policy DROP dipasang paling akhir ---
iptables -P INPUT DROP
iptables -P FORWARD DROP
EOF
chmod +x /root/gendou.sh; cp /root/gendou.sh /root/gendo.sh
bash /root/gendou.sh; echo "exit code: $?"
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/bc0e77b7-4bfa-49e1-94eb-f3c93efb0882" />

Skrip selesai dan menampilkan `exit code: 0`, artinya semua perintah berjalan tanpa error.

#### 5B. Tunjukkan iptables -S

`iptables -S` menunjukkan policy dan semua rule firewall. Setelah itu dicek bahwa Gendou tetap online dan IP DHCP-nya selamat.

Gendou
```bash
iptables -S; iptables -t nat -S
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/a110f291-a600-4966-8819-437c4ef481c1" />

Hasilnya policy `INPUT DROP` dan `FORWARD DROP`, dan rule yang diizinkan terlihat sesuai (a) sampai (d), plus loopback dan DHCP. Tabel nat berisi MASQUERADE.

Pastikan Gendou masih online dan DHCP-nya selamat:
```bash
ping -c3 8.8.8.8; ip -br a show eth0; ip route | grep default
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/0ddc8131-069f-454d-912d-7317d6e9a61f" />

Pada screenshot berikutnya, ping 8.8.8.8 dari Gendou berhasil (balasan lolos rule ESTABLISHED), eth0 masih punya IP DHCP, dan default route masih ada.

#### 5C. Bukti dari Armisael: Soal 2 sampai 4 tetap jalan

Setelah firewall aktif, Armisael menguji internet (8.8.8.8), antar-LAN (Lilith), Gendou sendiri (IP .157), dan DNS (`deb.debian.org`).

Armisael
```bash
ping -c3 8.8.8.8; ping -c3 192.236.4.74; ping -c3 192.236.4.157; ping -c3 deb.debian.org
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/b394bd3e-08b1-4dff-9e92-49a5008bc1eb" />

Semua ping berhasil dengan 0% loss. Jadi firewall DROP tidak merusak fungsi soal 2 sampai 4.

#### 5D. Counter rule

Counter tiap rule INPUT dan FORWARD dilihat untuk membuktikan rule benar-benar mengenai paket.

Gendou
```bash
iptables -L INPUT -n -v -x; iptables -L FORWARD -n -v -x
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/30786e81-b633-4e06-827d-a448d68cfa90" />

Counter pada rule ESTABLISHED, internal ke internet, antar-LAN, dan internal ke Gendou bernilai lebih dari 0. Itu bukti rule dipakai oleh trafik yang tadi diuji.

---

### Soal 6: IP statis dan gateway semua node non-router
> Alamat para pilot: jaringan sudah hidup, tapi para pilot dan staf tidak tahu alamat mereka sendiri. Unit-01 bahkan tidak tahu siapa gateway-nya. Beri IP statis dan gateway ke semua node non-router, sesuai aturan alamat di glosarium. Simpan agar bertahan setelah restart. Tunjukkan ip -br dan ping ke gateway di Unit-01.

#### 6A. Pasang IP di semua node

Semua node non-router diberi IP statis dan gateway sesuai glosarium: gateway adalah IP usable pertama subnet, dan node mengambil IP berikutnya sesuai urutan nama di switch (kiri ke kanan). Konfigurasi ditulis ke `/etc/network/interfaces` agar bertahan setelah restart. Pada saat yang sama, konfigurasi langsung diterapkan dengan `ip addr` dan `ip route`, dan DNS diatur lewat `post-up` serta `resolv.conf`.

Quarters
```bash
printf 'auto lo\niface lo inet loopback\n\nauto eth0\niface eth0 inet static\n    address 192.236.0.2\n    netmask 255.255.254.0\n    gateway 192.236.0.1\n    post-up echo "nameserver 8.8.8.8" > /etc/resolv.conf\n' > /etc/network/interfaces; ip link set eth0 up; ip addr flush dev eth0; ip addr add 192.236.0.2/23 dev eth0; ip route replace default via 192.236.0.1; echo "nameserver 8.8.8.8" > /etc/resolv.conf; ip -br a show eth0; ip route
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/fff95dff-5757-478d-92a9-72779cd1aa51" />

Comm-Net
```bash
printf 'auto lo\niface lo inet loopback\n\nauto eth0\niface eth0 inet static\n    address 192.236.2.2\n    netmask 255.255.255.0\n    gateway 192.236.2.1\n    post-up echo "nameserver 8.8.8.8" > /etc/resolv.conf\n' > /etc/network/interfaces; ip link set eth0 up; ip addr flush dev eth0; ip addr add 192.236.2.2/24 dev eth0; ip route replace default via 192.236.2.1; echo "nameserver 8.8.8.8" > /etc/resolv.conf; ip -br a show eth0; ip route
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/ca618bfa-6878-4e7e-b0ef-775a23a307f0" />

Hangar-Crew
```bash
printf 'auto lo\niface lo inet loopback\n\nauto eth0\niface eth0 inet static\n    address 192.236.3.2\n    netmask 255.255.255.128\n    gateway 192.236.3.1\n    post-up echo "nameserver 8.8.8.8" > /etc/resolv.conf\n' > /etc/network/interfaces; ip link set eth0 up; ip addr flush dev eth0; ip addr add 192.236.3.2/25 dev eth0; ip route replace default via 192.236.3.1; echo "nameserver 8.8.8.8" > /etc/resolv.conf; ip -br a show eth0; ip route
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/63c3f884-9208-4971-a6cc-8dd01dea39a6" />

Sachiel
```bash
printf 'auto lo\niface lo inet loopback\n\nauto eth0\niface eth0 inet static\n    address 192.236.3.130\n    netmask 255.255.255.192\n    gateway 192.236.3.129\n    post-up echo "nameserver 8.8.8.8" > /etc/resolv.conf\n' > /etc/network/interfaces; ip link set eth0 up; ip addr flush dev eth0; ip addr add 192.236.3.130/26 dev eth0; ip route replace default via 192.236.3.129; echo "nameserver 8.8.8.8" > /etc/resolv.conf; ip -br a show eth0; ip route
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/a737a6b4-9798-4d84-bb0b-d0e806749ca9" />

Medic-Bay
```bash
printf 'auto lo\niface lo inet loopback\n\nauto eth0\niface eth0 inet static\n    address 192.236.3.194\n    netmask 255.255.255.224\n    gateway 192.236.3.193\n    post-up echo "nameserver 8.8.8.8" > /etc/resolv.conf\n' > /etc/network/interfaces; ip link set eth0 up; ip addr flush dev eth0; ip addr add 192.236.3.194/27 dev eth0; ip route replace default via 192.236.3.193; echo "nameserver 8.8.8.8" > /etc/resolv.conf; ip -br a show eth0; ip route
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/ddcb76cb-7ab9-4455-98f6-1aad41e0838e" />

Pen-Pen
```bash
printf 'auto lo\niface lo inet loopback\n\nauto eth0\niface eth0 inet static\n    address 192.236.3.195\n    netmask 255.255.255.224\n    gateway 192.236.3.193\n    post-up echo "nameserver 8.8.8.8" > /etc/resolv.conf\n' > /etc/network/interfaces; ip link set eth0 up; ip addr flush dev eth0; ip addr add 192.236.3.195/27 dev eth0; ip route replace default via 192.236.3.193; echo "nameserver 8.8.8.8" > /etc/resolv.conf; ip -br a show eth0; ip route
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/4843444d-43d5-4b45-93e3-533878559481" />

Relay-Node
```bash
printf 'auto lo\niface lo inet loopback\n\nauto eth0\niface eth0 inet static\n    address 192.236.3.226\n    netmask 255.255.255.224\n    gateway 192.236.3.225\n    post-up echo "nameserver 8.8.8.8" > /etc/resolv.conf\n' > /etc/network/interfaces; ip link set eth0 up; ip addr flush dev eth0; ip addr add 192.236.3.226/27 dev eth0; ip route replace default via 192.236.3.225; echo "nameserver 8.8.8.8" > /etc/resolv.conf; ip -br a show eth0; ip route
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/b75b608f-f25a-42ff-8120-6f6e3f9088db" />

Garden-Staff
```bash
printf 'auto lo\niface lo inet loopback\n\nauto eth0\niface eth0 inet static\n    address 192.236.4.2\n    netmask 255.255.255.224\n    gateway 192.236.4.1\n    post-up echo "nameserver 8.8.8.8" > /etc/resolv.conf\n' > /etc/network/interfaces; ip link set eth0 up; ip addr flush dev eth0; ip addr add 192.236.4.2/27 dev eth0; ip route replace default via 192.236.4.1; echo "nameserver 8.8.8.8" > /etc/resolv.conf; ip -br a show eth0; ip route
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/1f37c9d0-bcc6-42a7-ae36-af71b9e0ad46" />

Dock-Crew
```bash
printf 'auto lo\niface lo inet loopback\n\nauto eth0\niface eth0 inet static\n    address 192.236.4.34\n    netmask 255.255.255.240\n    gateway 192.236.4.33\n    post-up echo "nameserver 8.8.8.8" > /etc/resolv.conf\n' > /etc/network/interfaces; ip link set eth0 up; ip addr flush dev eth0; ip addr add 192.236.4.34/28 dev eth0; ip route replace default via 192.236.4.33; echo "nameserver 8.8.8.8" > /etc/resolv.conf; ip -br a show eth0; ip route
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/3aefc3fb-1aa3-4c59-81ee-19d1aab73ec7" />

Entry-Plug
```bash
printf 'auto lo\niface lo inet loopback\n\nauto eth0\niface eth0 inet static\n    address 192.236.4.50\n    netmask 255.255.255.248\n    gateway 192.236.4.49\n    post-up echo "nameserver 8.8.8.8" > /etc/resolv.conf\n' > /etc/network/interfaces; ip link set eth0 up; ip addr flush dev eth0; ip addr add 192.236.4.50/29 dev eth0; ip route replace default via 192.236.4.49; echo "nameserver 8.8.8.8" > /etc/resolv.conf; ip -br a show eth0; ip route
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/133c6129-a053-42b7-b756-1c166dff2b97" />

Dummy-Plug
```bash
printf 'auto lo\niface lo inet loopback\n\nauto eth0\niface eth0 inet static\n    address 192.236.4.51\n    netmask 255.255.255.248\n    gateway 192.236.4.49\n    post-up echo "nameserver 8.8.8.8" > /etc/resolv.conf\n' > /etc/network/interfaces; ip link set eth0 up; ip addr flush dev eth0; ip addr add 192.236.4.51/29 dev eth0; ip route replace default via 192.236.4.49; echo "nameserver 8.8.8.8" > /etc/resolv.conf; ip -br a show eth0; ip route
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/519c3fc4-93cb-4276-8e08-8c8272ba7cf0" />

Magi-Casper
```bash
printf 'auto lo\niface lo inet loopback\n\nauto eth0\niface eth0 inet static\n    address 192.236.4.58\n    netmask 255.255.255.248\n    gateway 192.236.4.57\n    post-up echo "nameserver 8.8.8.8" > /etc/resolv.conf\n' > /etc/network/interfaces; ip link set eth0 up; ip addr flush dev eth0; ip addr add 192.236.4.58/29 dev eth0; ip route replace default via 192.236.4.57; echo "nameserver 8.8.8.8" > /etc/resolv.conf; ip -br a show eth0; ip route
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/00ce6dc4-de65-4d9e-91e3-5f4581be62a0" />

Magi-Balthasar
```bash
printf 'auto lo\niface lo inet loopback\n\nauto eth0\niface eth0 inet static\n    address 192.236.4.59\n    netmask 255.255.255.248\n    gateway 192.236.4.57\n    post-up echo "nameserver 8.8.8.8" > /etc/resolv.conf\n' > /etc/network/interfaces; ip link set eth0 up; ip addr flush dev eth0; ip addr add 192.236.4.59/29 dev eth0; ip route replace default via 192.236.4.57; echo "nameserver 8.8.8.8" > /etc/resolv.conf; ip -br a show eth0; ip route
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/a52b39e6-9a79-4189-ab18-319db7681f8a" />

Magi-Melchior
```bash
printf 'auto lo\niface lo inet loopback\n\nauto eth0\niface eth0 inet static\n    address 192.236.4.60\n    netmask 255.255.255.248\n    gateway 192.236.4.57\n    post-up echo "nameserver 8.8.8.8" > /etc/resolv.conf\n' > /etc/network/interfaces; ip link set eth0 up; ip addr flush dev eth0; ip addr add 192.236.4.60/29 dev eth0; ip route replace default via 192.236.4.57; echo "nameserver 8.8.8.8" > /etc/resolv.conf; ip -br a show eth0; ip route
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/5531c454-4b00-4d8e-ae1a-8288e9b31f7e" />

Unit-01
```bash
printf 'auto lo\niface lo inet loopback\n\nauto eth0\niface eth0 inet static\n    address 192.236.4.66\n    netmask 255.255.255.248\n    gateway 192.236.4.65\n    post-up echo "nameserver 8.8.8.8" > /etc/resolv.conf\n' > /etc/network/interfaces; ip link set eth0 up; ip addr flush dev eth0; ip addr add 192.236.4.66/29 dev eth0; ip route replace default via 192.236.4.65; echo "nameserver 8.8.8.8" > /etc/resolv.conf; ip -br a show eth0; ip route
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/d65f7abb-e054-4717-bd8a-1613757318f6" />

Unit-02
```bash
printf 'auto lo\niface lo inet loopback\n\nauto eth0\niface eth0 inet static\n    address 192.236.4.67\n    netmask 255.255.255.248\n    gateway 192.236.4.65\n    post-up echo "nameserver 8.8.8.8" > /etc/resolv.conf\n' > /etc/network/interfaces; ip link set eth0 up; ip addr flush dev eth0; ip addr add 192.236.4.67/29 dev eth0; ip route replace default via 192.236.4.65; echo "nameserver 8.8.8.8" > /etc/resolv.conf; ip -br a show eth0; ip route
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/b1875412-287d-4747-bd75-7b57b3e1d8f2" />

Unit-00
```bash
printf 'auto lo\niface lo inet loopback\n\nauto eth0\niface eth0 inet static\n    address 192.236.4.68\n    netmask 255.255.255.248\n    gateway 192.236.4.65\n    post-up echo "nameserver 8.8.8.8" > /etc/resolv.conf\n' > /etc/network/interfaces; ip link set eth0 up; ip addr flush dev eth0; ip addr add 192.236.4.68/29 dev eth0; ip route replace default via 192.236.4.65; echo "nameserver 8.8.8.8" > /etc/resolv.conf; ip -br a show eth0; ip route
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/f724d3f3-2124-4ae4-ad17-5b8f581a8e38" />

Lilith
```bash
printf 'auto lo\niface lo inet loopback\n\nauto eth0\niface eth0 inet static\n    address 192.236.4.74\n    netmask 255.255.255.248\n    gateway 192.236.4.73\n    post-up echo "nameserver 8.8.8.8" > /etc/resolv.conf\n' > /etc/network/interfaces; ip link set eth0 up; ip addr flush dev eth0; ip addr add 192.236.4.74/29 dev eth0; ip route replace default via 192.236.4.73; echo "nameserver 8.8.8.8" > /etc/resolv.conf; ip -br a show eth0; ip route
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/f3cb645c-a131-4be4-9885-a2aecf67f846" />

Adam
```bash
printf 'auto lo\niface lo inet loopback\n\nauto eth0\niface eth0 inet static\n    address 192.236.4.75\n    netmask 255.255.255.248\n    gateway 192.236.4.73\n    post-up echo "nameserver 8.8.8.8" > /etc/resolv.conf\n' > /etc/network/interfaces; ip link set eth0 up; ip addr flush dev eth0; ip addr add 192.236.4.75/29 dev eth0; ip route replace default via 192.236.4.73; echo "nameserver 8.8.8.8" > /etc/resolv.conf; ip -br a show eth0; ip route
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/0396b10c-970a-4bdb-bd09-d0319f3bad17" />

Zeruel
```bash
printf 'auto lo\niface lo inet loopback\n\nauto eth0\niface eth0 inet static\n    address 192.236.4.82\n    netmask 255.255.255.248\n    gateway 192.236.4.81\n    post-up echo "nameserver 8.8.8.8" > /etc/resolv.conf\n' > /etc/network/interfaces; ip link set eth0 up; ip addr flush dev eth0; ip addr add 192.236.4.82/29 dev eth0; ip route replace default via 192.236.4.81; echo "nameserver 8.8.8.8" > /etc/resolv.conf; ip -br a show eth0; ip route
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/66d1b4cc-f82d-43ae-8fa9-bab78f48a7de" />

Armisael
```bash
printf 'auto lo\niface lo inet loopback\n\nauto eth0\niface eth0 inet static\n    address 192.236.4.83\n    netmask 255.255.255.248\n    gateway 192.236.4.81\n    post-up echo "nameserver 8.8.8.8" > /etc/resolv.conf\n' > /etc/network/interfaces; ip link set eth0 up; ip addr flush dev eth0; ip addr add 192.236.4.83/29 dev eth0; ip route replace default via 192.236.4.81; echo "nameserver 8.8.8.8" > /etc/resolv.conf; ip -br a show eth0; ip route
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/ec8d8a35-c207-4683-a675-82d8d2d00a6b" />

Radar-Array
```bash
printf 'auto lo\niface lo inet loopback\n\nauto eth0\niface eth0 inet static\n    address 192.236.4.90\n    netmask 255.255.255.248\n    gateway 192.236.4.89\n    post-up echo "nameserver 8.8.8.8" > /etc/resolv.conf\n' > /etc/network/interfaces; ip link set eth0 up; ip addr flush dev eth0; ip addr add 192.236.4.90/29 dev eth0; ip route replace default via 192.236.4.89; echo "nameserver 8.8.8.8" > /etc/resolv.conf; ip -br a show eth0; ip route
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/1a95c29e-9ef6-489f-8239-937786c944ca" />

Archive-Vault
```bash
printf 'auto lo\niface lo inet loopback\n\nauto eth0\niface eth0 inet static\n    address 192.236.4.98\n    netmask 255.255.255.252\n    gateway 192.236.4.97\n    post-up echo "nameserver 8.8.8.8" > /etc/resolv.conf\n' > /etc/network/interfaces; ip link set eth0 up; ip addr flush dev eth0; ip addr add 192.236.4.98/30 dev eth0; ip route replace default via 192.236.4.97; echo "nameserver 8.8.8.8" > /etc/resolv.conf; ip -br a show eth0; ip route
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/649f9394-5d9f-4739-b683-33b8c97783e6" />

Spy
```bash
printf 'auto lo\niface lo inet loopback\n\nauto eth0\niface eth0 inet static\n    address 192.236.4.102\n    netmask 255.255.255.252\n    gateway 192.236.4.101\n    post-up echo "nameserver 8.8.8.8" > /etc/resolv.conf\n' > /etc/network/interfaces; ip link set eth0 up; ip addr flush dev eth0; ip addr add 192.236.4.102/30 dev eth0; ip route replace default via 192.236.4.101; echo "nameserver 8.8.8.8" > /etc/resolv.conf; ip -br a show eth0; ip route
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/78b80899-d0e9-49db-9ecd-e1e08a33720f" />

Tokyo3-Core
```bash
printf 'auto lo\niface lo inet loopback\n\nauto eth0\niface eth0 inet static\n    address 192.236.4.106\n    netmask 255.255.255.252\n    gateway 192.236.4.105\n    post-up echo "nameserver 8.8.8.8" > /etc/resolv.conf\n' > /etc/network/interfaces; ip link set eth0 up; ip addr flush dev eth0; ip addr add 192.236.4.106/30 dev eth0; ip route replace default via 192.236.4.105; echo "nameserver 8.8.8.8" > /etc/resolv.conf; ip -br a show eth0; ip route
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/2c748747-ee73-4a25-8ac6-8e8a0d465139" />

Di setiap node, `ip -br a show eth0` menampilkan IP/prefix sesuai tabel. `ip route` menampilkan default via gateway yang benar dan rute connected subnet-nya.

#### 6B. Gate: cek semua 25 node dari Gendou

Gendou mem-ping seluruh 25 node non-router dan hanya mencetak yang gagal.

Gendou
```bash
F=0; while read n a; do ping -c1 -W1 $a >/dev/null 2>&1 || { echo "GAGAL: $n ($a)"; F=1; }; done <<'H'
Quarters 192.236.0.2
Comm-Net 192.236.2.2
Hangar-Crew 192.236.3.2
Sachiel 192.236.3.130
Medic-Bay 192.236.3.194
Pen-Pen 192.236.3.195
Relay-Node 192.236.3.226
Garden-Staff 192.236.4.2
Dock-Crew 192.236.4.34
Entry-Plug 192.236.4.50
Dummy-Plug 192.236.4.51
Magi-Casper 192.236.4.58
Magi-Balthasar 192.236.4.59
Magi-Melchior 192.236.4.60
Unit-01 192.236.4.66
Unit-02 192.236.4.67
Unit-00 192.236.4.68
Lilith 192.236.4.74
Adam 192.236.4.75
Zeruel 192.236.4.82
Armisael 192.236.4.83
Radar-Array 192.236.4.90
Archive-Vault 192.236.4.98
Spy 192.236.4.102
Tokyo3-Core 192.236.4.106
H
[ $F = 0 ] && echo "SEMUA 25 NODE OK"
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/9b8c09f6-7d21-4051-b7ec-2d8a06052566" />

Hasil akhirnya `SEMUA 25 NODE OK` tanpa baris `GAGAL`, jadi semua node sudah beralamat dan terjangkau.

#### 6C. Bukti Unit-01

Di Unit-01 ditampilkan IP, ping ke gateway (Misato), dan isi `/etc/network/interfaces` sebagai bukti konfigurasi permanen.

Unit-01
```bash
ip -br a; ping -c3 192.236.4.65; cat /etc/network/interfaces
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/02e6efdb-f251-43b5-98c5-350d564004e8" />

`ip -br a` menampilkan `192.236.4.66/29` dan ping ke gateway `192.236.4.65` berhasil. Isi file `interfaces` menunjukkan `address`, `netmask`, dan `gateway` yang tersimpan permanen.

---

### Soal 7: Membangunkan MAGI
> Membangunkan MAGI: Casper, Balthasar, dan Melchior di Switch-Terminal menunggu diaktifkan. Ritsuko ingin ketiganya melayani dulu, urusan keamanan dibahas nanti. Pasang iptables dan netcat-traditional lewat /root/<nama>.sh, lalu nyalakan listener sesuai port di glosarium. Dari Lilith, kirim pesan ke ketiganya dan ke port 5001 Balthasar. Tampilkan pesan yang diterima di tiap node.

#### 7A. Pasang paket dan nyalakan listener

Pada tiap node MAGI, skrip `/root/<nama>.sh` memasang `iptables` dan `netcat-traditional`, lalu menyalakan listener `nc -l -p` dalam loop di background. Pesan yang masuk disimpan ke `/root/<nama>-<port>.log`. Casper dan Melchior mendengarkan port 5000, sedangkan Balthasar mendengarkan port 5000 dan 5001.

Magi-Casper
```bash
cat > /root/casper.sh <<'EOF'
#!/bin/sh
# casper.sh - Magi-Casper: pasang iptables + netcat, listener TCP 5000 (Soal 7)
NAME=casper
if command -v apk >/dev/null 2>&1; then
  apk update && apk add iptables
  apk add netcat-traditional 2>/dev/null || echo "netcat-traditional tidak ada di Alpine, pakai nc busybox bawaan"
else
  apt-get update && apt-get install -y iptables netcat-traditional
  update-alternatives --set nc /bin/nc.traditional 2>/dev/null
fi
pkill -f 'while true' 2>/dev/null; pkill -f 'nc -l' 2>/dev/null
serve(){ nohup sh -c "while true; do nc -l -p $1 >> /root/$NAME-$1.log; done" >/dev/null 2>&1 </dev/null & }
serve 5000
sleep 1; netstat -ltn | grep -E ':(5000|5001) '
EOF
chmod +x /root/casper.sh; sh /root/casper.sh
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/4970305e-066f-4371-9f59-73edd099dc32" />

Magi-Balthasar
```bash
cat > /root/balthasar.sh <<'EOF'
#!/bin/sh
# balthasar.sh - Magi-Balthasar: pasang iptables + netcat, listener TCP 5000 dan 5001 (Soal 7)
NAME=balthasar
if command -v apk >/dev/null 2>&1; then
  apk update && apk add iptables
  apk add netcat-traditional 2>/dev/null || echo "netcat-traditional tidak ada di Alpine, pakai nc busybox bawaan"
else
  apt-get update && apt-get install -y iptables netcat-traditional
  update-alternatives --set nc /bin/nc.traditional 2>/dev/null
fi
pkill -f 'while true' 2>/dev/null; pkill -f 'nc -l' 2>/dev/null
serve(){ nohup sh -c "while true; do nc -l -p $1 >> /root/$NAME-$1.log; done" >/dev/null 2>&1 </dev/null & }
serve 5000
serve 5001
sleep 1; netstat -ltn | grep -E ':(5000|5001) '
EOF
chmod +x /root/balthasar.sh; sh /root/balthasar.sh
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/1ee01d38-06a2-4bed-9d57-38064a2d357f" />

Magi-Melchior
```bash
cat > /root/melchior.sh <<'EOF'
#!/bin/sh
# melchior.sh - Magi-Melchior: pasang iptables + netcat, listener TCP 5000 (Soal 7)
NAME=melchior
if command -v apk >/dev/null 2>&1; then
  apk update && apk add iptables
  apk add netcat-traditional 2>/dev/null || echo "netcat-traditional tidak ada di Alpine, pakai nc busybox bawaan"
else
  apt-get update && apt-get install -y iptables netcat-traditional
  update-alternatives --set nc /bin/nc.traditional 2>/dev/null
fi
pkill -f 'while true' 2>/dev/null; pkill -f 'nc -l' 2>/dev/null
serve(){ nohup sh -c "while true; do nc -l -p $1 >> /root/$NAME-$1.log; done" >/dev/null 2>&1 </dev/null & }
serve 5000
sleep 1; netstat -ltn | grep -E ':(5000|5001) '
EOF
chmod +x /root/melchior.sh; sh /root/melchior.sh
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/5f63db40-567e-4f53-995f-6633b9d56d9c" />

`netstat -ltn` di tiap node menampilkan status LISTEN pada port yang sesuai, yaitu 5000 di Casper, 5000 dan 5001 di Balthasar, dan 5000 di Melchior.

#### 7B. Lilith mengirim pesan

Lilith mengirim satu pesan ke Casper:5000, Balthasar:5000, Balthasar:5001, dan Melchior:5000 memakai `nc -w2`.

Lilith
```bash
for t in "192.236.4.58 5000 Casper" "192.236.4.59 5000 Balthasar-5000" "192.236.4.59 5001 Balthasar-5001" "192.236.4.60 5000 Melchior"; do set -- $t; echo "Halo $3, pesan dari Lilith" | nc -w2 $1 $2; echo "$3 exit=$?"; done
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/037a75cb-9fd8-4b0d-b639-dfabad8cb702" />

Keempat pengiriman mencetak `exit=0`, artinya koneksi berhasil dan pesan terkirim.

#### 7C. Tampilkan pesan yang diterima di tiap node

Isi file log di tiap node ditampilkan untuk membuktikan pesan benar-benar diterima oleh listener.

Magi-Casper
```bash
for f in /root/casper-*.log; do echo "== $f"; cat $f; done
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/cb7e91b8-2acc-4b7a-94a2-fbd1a1441c1d" />

Magi-Balthasar
```bash
for f in /root/balthasar-*.log; do echo "== $f"; cat $f; done
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/b25411fc-2058-492f-8e20-b2168daaafdd" />

Magi-Melchior
```bash
for f in /root/melchior-*.log; do echo "== $f"; cat $f; done
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/c6b07454-326a-4838-8843-a12b3bb20ff9" />

Setiap log berisi pesan `Halo <nama>, pesan dari Lilith`. Casper dan Melchior masing-masing punya satu log (port 5000), sedangkan Balthasar punya dua log (port 5000 dan 5001).

---

### Soal 8: Mengenali kondisi normal (Pen-Pen dan Tokyo3-Core)
> Mengenali kondisi normal: Pen-Pen dan Tokyo3-Core sudah ditandai sebagai calon sasaran pertama SEELE. Sebelum dilindungi, keduanya harus melayani dulu agar kamu tahu kondisi normalnya. Koneksi ke port 80 dijawab Welcome to {hostname}. Koneksi ke port 8080 di Tokyo3-Core dijawab syifa imutz. Tunjukkan nc dari Lilith ke ketiga port itu. Tunjukkan juga bahwa port yang tidak dilayani, misalnya 22, langsung gagal, bukan menggantung.

#### 8A. Pasang listener

Pen-Pen melayani port 80, dan Tokyo3-Core melayani port 80 dan 8080. Port 80 dijawab `Welcome to <hostname>`, dan port 8080 di Tokyo3-Core dijawab `syifa imutz`. Setiap koneksi yang dilayani dicatat ke log dengan timestamp.

Pen-Pen
```bash
cat > /root/penpen.sh <<'EOF'
#!/bin/sh
# penpen.sh - Pen-Pen: pasang iptables + listener TCP 80 (Soal 8)
NAME=penpen
command -v iptables >/dev/null 2>&1 || { apk update && apk add iptables; }
pkill -f 'while true' 2>/dev/null; pkill -f 'nc -l' 2>/dev/null
serve(){ nohup sh -c "while true; do echo '$2' | nc -l -p $1 >/dev/null; echo \"\$(date '+%F %T') port $1 dilayani\" >> /root/$NAME.log; done" >/dev/null 2>&1 </dev/null & }
serve 80 "Welcome to $(hostname)"
sleep 1; netstat -ltn | grep -E ':(80|8080) '
EOF
chmod +x /root/penpen.sh; sh /root/penpen.sh
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/d2173f49-0570-494f-829d-28a628c83f37" />

Tokyo3-Core
```bash
cat > /root/tokyo3.sh <<'EOF'
#!/bin/sh
# tokyo3.sh - Tokyo3-Core: pasang iptables + listener TCP 80 dan 8080 (Soal 8)
NAME=tokyo3
command -v iptables >/dev/null 2>&1 || { apk update && apk add iptables; }
pkill -f 'while true' 2>/dev/null; pkill -f 'nc -l' 2>/dev/null
serve(){ nohup sh -c "while true; do echo '$2' | nc -l -p $1 >/dev/null; echo \"\$(date '+%F %T') port $1 dilayani\" >> /root/$NAME.log; done" >/dev/null 2>&1 </dev/null & }
serve 80 "Welcome to $(hostname)"
serve 8080 "syifa imutz"
sleep 1; netstat -ltn | grep -E ':(80|8080) '
EOF
chmod +x /root/tokyo3.sh; sh /root/tokyo3.sh
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/5d8bfc4d-908b-4718-9316-2dbfdf0fb59d" />

`netstat -ltn` menunjukkan LISTEN pada port 80 di Pen-Pen, dan port 80 serta 8080 di Tokyo3-Core.

#### 8B. Uji dari Lilith

Lilith menghubungi ketiga port yang dilayani dan port 22 yang tidak dilayani. Exit code dan durasi dicetak sebagai bukti, karena `nc` busybox tidak mencetak pesan error.

Lilith
```bash
t(){ s=$(date +%s); echo "--- $1:$2"; nc -w2 $1 $2 </dev/null; echo "exit=$? durasi=$(( $(date +%s) - s ))s"; }
t 192.236.3.195 80; t 192.236.4.106 80; t 192.236.4.106 8080; t 192.236.3.195 22; t 192.236.4.106 22
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/888a4d9d-14fd-41ea-a3d1-1abb2b97a1f2" />

Port 80 Pen-Pen, port 80 Tokyo3-Core, dan port 8080 Tokyo3-Core menjawab dengan teks yang sesuai dan `exit=0`. Port 22 di kedua node gagal dengan exit code bukan 0 dan `durasi=0s`. Artinya ditolak seketika (connection refused), bukan menggantung sampai timeout.

#### 8C. Log penerima

Log di Pen-Pen dan Tokyo3-Core dibuka untuk membuktikan koneksi dari Lilith benar-benar diterima.

Pen-Pen
```bash
cat /root/penpen.log
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/6d082dd1-fd7a-4387-91b3-26557315c76c" />

Tokyo3-Core
```bash
cat /root/tokyo3.log
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/2592fb28-8138-4deb-bafa-ca43531b2e29" />

Log Pen-Pen mencatat koneksi ke port 80, dan log Tokyo3-Core mencatat koneksi ke port 80 dan 8080, masing-masing dengan timestamp.

### Soal 9: Jalur belakang diutak-atik (break_routing.sh di Shigeru)
> Jalur belakang diutak-atik: tengah malam masuk laporan bahwa ada yang mengutak-atik jalur belakang di sekitar Shigeru. Lilith tidak mendapat jawaban dari Armisael, padahal Armisael masih bisa ping gateway-nya sendiri. Jalankan break_routing.sh di Shigeru. Buktikan Lilith bisa ping Armisael kembali setelah perbaikan.

#### 9A. Kondisi normal (sebelum dirusak)

Ping Lilith ke Armisael dijalankan dulu sebagai pembanding sebelum skrip rusak dijalankan.

Lilith
```bash
ping -c3 192.236.4.83
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/d7fd067a-82c8-47e9-8aca-43170c8edb25" />

Ping berhasil dengan 0% packet loss, jadi jalur Lilith ke Armisael normal.

#### 9B. Jalankan script rusak di Shigeru

`break_routing.sh` disimpan lalu dijalankan di Shigeru tanpa membaca isinya, sesuai instruksi. Skrip ini mengubah konfigurasi routing Shigeru secara diam-diam.

Shigeru
```bash
cat > /root/break_routing.sh <<'EOF'
#!/bin/sh
if [ "$FORCE" != 1 ]; then case "$(hostname)" in *[Ss]higeru*) ;; *) echo "Script ini hanya untuk Shigeru."; exit 1;; esac; fi
ip2int(){ _o=$IFS; IFS=.; set -- $1; IFS=$_o; echo $(( ($1<<24)+($2<<16)+($3<<8)+$4 )); }
int2ip(){ echo "$(( ($1>>24)&255 )).$(( ($1>>16)&255 )).$(( ($1>>8)&255 )).$(( $1&255 ))"; }
[ "$(id -u)" = 0 ] || { echo "Harus dijalankan sebagai root"; exit 1; }
ADDRS=$(ip -4 -o addr show | while read _ dev fam addr _; do [ "$dev" = lo ] && continue; echo "$dev $addr"; done)
DEFDEV=$(ip route show default | sed -n "s/.* dev \([^ ]*\).*/\1/p" | head -1)
if ip rule show | grep -q "iif .* lookup 100"; then echo "Script sudah dijalankan sebelumnya"; exit 1; fi
LANIF=; L30=; LANIP=
while read dev addr; do
  [ -z "$dev" ] && continue
  if [ "${addr#*/}" = 30 ]; then L30="$L30 $dev:${addr%/*}"; else LANIF=$dev; LANIP=${addr%/*}; fi
done <<EOT
$ADDRS
EOT
UPIF=$DEFDEV; UPIP=; MKIF=; MKIP=
for e in $L30; do d=${e%%:*}; i=${e#*:}; if [ "$d" = "$UPIF" ]; then UPIP=$i; else MKIF=$d; MKIP=$i; fi; done
if [ -z "$LANIF" ] || [ -z "$UPIP" ] || [ -z "$MKIF" ]; then
  echo "Topologi Shigeru belum terdeteksi. Selesaikan soal 2 dan 3 dulu (IP semua interface dan default route ke Gendo)."; exit 1; fi
MKGW=$(int2ip $(( $(ip2int $MKIP) ^ 3 )))
P=${P:-${LANIP%.*.*}}
DOGMA=${DOGMA:-$P.4.72/29}
echo 0 > /proc/sys/net/ipv4/ip_forward
ip route replace default via $MKGW dev $MKIF
ip route del blackhole $DOGMA 2>/dev/null
ip route add blackhole $DOGMA
ip route flush table 100 2>/dev/null
ip route add unreachable default table 100
ip rule del iif $LANIF lookup 100 priority 90 2>/dev/null
ip rule add iif $LANIF lookup 100 priority 90
echo "Script sudah dirusak"
EOF
```

Shigeru
```bash
sh /root/break_routing.sh
```
<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/e07e02ab-4663-4ba7-83cb-a4e4dbe2a49e" />

Skrip mencetak `Script sudah dirusak`, artinya perubahan sudah diterapkan.

#### 9C. Gejala

Ping Lilith ke Armisael diuji lagi, lalu dari Armisael diuji ke gateway-nya sendiri dan ke Lilith.

Lilith
```bash
ping -c3 -W2 192.236.4.83
```
<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/3eee2218-343c-4931-8be8-eb6e2375ddb5" />

Armisael
```bash
ping -c3 192.236.4.81; ping -c3 -W2 192.236.4.74
```
<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/6e55bb34-3ee7-418c-96af-a0cbdb123f3a" />

Ping Lilith ke Armisael gagal (100% loss). Armisael masih bisa mem-ping gateway-nya (Shigeru) tetapi gagal ke Lilith, sesuai laporan di soal.

#### 9D. Diagnosis di Shigeru

Konfigurasi Shigeru dicek lewat `ip_forward`, tabel route, `ip rule`, dan tabel 100. Ada empat penyebab:

1. `ip_forward` bernilai 0, sehingga Shigeru tidak meneruskan paket antar-interface.
2. Default route dialihkan ke Makoto (192.236.4.162), bukan ke Gendou (192.236.4.157).
3. Ada route blackhole untuk 192.236.4.72/29 (subnet Lilith), sehingga paket ke sana dibuang.
4. Ada `ip rule` prioritas 90 untuk `iif eth2 lookup 100`, dan tabel 100 berisi `unreachable default`. Semua paket yang masuk dari LAN Monolith langsung ditolak.

Armisael masih bisa mem-ping gateway karena alamat itu adalah IP lokal Shigeru. Paket ke alamat lokal ditangani tabel `local` (prioritas 0) sebelum rule 90, dan balasannya dikirim dari Shigeru sendiri, bukan lewat forwarding.

Shigeru
```bash
cat /proc/sys/net/ipv4/ip_forward; ip route; ip rule; ip route show table 100
```
<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/e9b1918a-9c2f-45bd-8bd0-e867c5b4b8ce" />

Screenshot menampilkan `ip_forward` = 0, default route via 192.236.4.162, route blackhole 192.236.4.72/29, rule `iif eth2 lookup 100` prioritas 90, dan tabel 100 berisi `unreachable default`.

#### 9E. Perbaikan

Keempat penyebab dibalik satu per satu: forwarding diaktifkan lagi, default route dikembalikan ke Gendou (192.236.4.157), route blackhole dihapus, dan `ip rule` dihapus lalu tabel 100 dikosongkan.

Shigeru
```bash
echo 1 > /proc/sys/net/ipv4/ip_forward
ip route replace default via 192.236.4.157 dev eth0
ip route del blackhole 192.236.4.72/29
ip rule del iif eth2 lookup 100 priority 90
ip route flush table 100
cat /proc/sys/net/ipv4/ip_forward; ip route; ip rule; ip route show table 100
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/d75a21c2-d00f-4575-bff7-16f3c35db8cf" />

`ip_forward` kembali 1 dan default route kembali via 192.236.4.157. Route blackhole sudah hilang, `ip rule` kembali ke bawaan (local, main, default), dan tabel 100 kosong.

#### 9F. Bukti Lilith ping Armisael kembali

Ping diuji dua arah antara Lilith dan Armisael setelah perbaikan.

Lilith
```bash
ping -c3 192.236.4.83
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/d99967ef-a61e-4e83-b9eb-383c2cce2e4f" />

Armisael
```bash
ping -c3 192.236.4.74
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/32ad046b-b898-4603-9b95-e7cf39633c7e" />

Ping Lilith ke Armisael dan Armisael ke Lilith sama-sama berhasil dengan 0% loss, jadi jalur sudah pulih.

---

### Soal 10: Para pilot terkunci (break_nat.sh di Misato dan Gendou)
> Para pilot terkunci di dalam: paginya giliran para pilot mengeluh. Unit-01, Unit-02, dan Unit-00 di Cage tidak bisa ping 8.8.8.8. Padahal Spy di Intel baik-baik saja, dan ping dari Cage ke Lilith normal. Jalankan break_nat.sh di Misato dan di Gendo. Filenya sama, dijalankan di masing-masing node. Jelaskan kenapa Cage terdampak tapi Intel tidak. Buktikan Unit-01 bisa ping 8.8.8.8, dan sebutkan di router mana alamat sumber diterjemahkan.

#### 10A. Kondisi normal (sebelum dirusak)

Unit-01 (Cage) dan Spy (Intel) mem-ping 8.8.8.8 sebagai kondisi normal sebelum perusakan.

Unit-01
```bash
ping -c3 8.8.8.8
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/7010a63c-7a7e-4f1f-979f-f138541bf12e" />

Spy
```bash
ping -c3 8.8.8.8
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/e11855a0-e0c6-47fd-b0b5-144cf7b6a425" />

Kedua node berhasil ping ke 8.8.8.8 dengan 0% loss.

#### 10B. Jalankan script rusak di Gendou dan Misato

File `break_nat.sh` yang sama disimpan dan dijalankan di Gendou dan di Misato. Skrip mendeteksi sendiri node mana yang menjalankannya dan memasang rule NAT yang berbeda di tiap node.

Gendou
```bash
cat > /root/break_nat.sh <<'EOF'
#!/bin/sh
ip2int(){ _o=$IFS; IFS=.; set -- $1; IFS=$_o; echo $(( ($1<<24)+($2<<16)+($3<<8)+$4 )); }
int2ip(){ echo "$(( ($1>>24)&255 )).$(( ($1>>16)&255 )).$(( ($1>>8)&255 )).$(( $1&255 ))"; }
[ "$(id -u)" = 0 ] || { echo "Harus dijalankan sebagai root"; exit 1; }
command -v iptables >/dev/null 2>&1 || { echo "iptables belum ada, mencoba memasang..."; (apt-get update -qq && apt-get install -y -qq iptables) >/dev/null 2>&1 || apk add -q iptables >/dev/null 2>&1; }
command -v iptables >/dev/null 2>&1 || { echo "iptables gagal dipasang. Pasang manual dulu."; exit 1; }
ADDRS=$(ip -4 -o addr show | while read _ dev fam addr _; do [ "$dev" = lo ] && continue; echo "$dev $addr"; done)
DEFDEV=$(ip route show default | sed -n "s/.* dev \([^ ]*\).*/\1/p" | head -1)
[ -n "$DEFDEV" ] || { echo "Default route belum ada. Selesaikan soal 2 sampai 4 dulu."; exit 1; }
INTIP=$(echo "$ADDRS" | while read dev addr; do [ "$dev" != "$DEFDEV" ] && { echo "${addr%/*}"; break; }; done)
P=${P:-${INTIP%.*.*}}
case "$(hostname)" in
  *[Mm]isato*) NODE=misato ;;
  *[Gg]endo*)  NODE=gendo ;;
  *) [ "$FORCE" = misato ] && NODE=misato; [ "$FORCE" = gendo ] && NODE=gendo
     [ -n "$NODE" ] || { echo "Jalankan di Misato dan di Gendo."; exit 1; } ;;
esac
if [ "$NODE" = misato ]; then
  CAGEIF=; while read dev addr; do [ "$dev" != "$DEFDEV" ] && { CAGEIF=$dev; CADDR=$addr; break; }; done <<EOT
$ADDRS
EOT
  [ -n "$CAGEIF" ] || { echo "Interface Cage tidak terdeteksi."; exit 1; }
  len=${CADDR#*/}; ipn=$(ip2int ${CADDR%/*}); mask=$(( (0xFFFFFFFF << (32-len)) & 0xFFFFFFFF ))
  CAGE=$(int2ip $(( ipn & mask )))/$len
  UPIF=$DEFDEV
else
  WAN=$DEFDEV
  CAGE=${CAGE:-$P.4.64/29}
  ip route show | grep -q "^$CAGE " || echo "Subnet tidak terdeteksi"
fi
if [ "$NODE" = misato ]; then
  iptables -t nat -D POSTROUTING -s $CAGE ! -d $P.0.0/16 -o $UPIF -j SNAT --to-source 172.31.99.1 2>/dev/null
  iptables -t nat -A POSTROUTING -s $CAGE ! -d $P.0.0/16 -o $UPIF -j SNAT --to-source 172.31.99.1
else
  iptables -t nat -D POSTROUTING -s $CAGE -o $WAN -j RETURN 2>/dev/null
  iptables -t nat -I POSTROUTING 1 -s $CAGE -o $WAN -j RETURN
fi
echo "Script sudah dirusak"
EOF
```

Gendou
```bash
sh /root/break_nat.sh
```
<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/4bb9f508-11a5-400b-b7a7-f8e3bc7e9820" />

Misato
```bash
cat > /root/break_nat.sh <<'EOF'
#!/bin/sh
ip2int(){ _o=$IFS; IFS=.; set -- $1; IFS=$_o; echo $(( ($1<<24)+($2<<16)+($3<<8)+$4 )); }
int2ip(){ echo "$(( ($1>>24)&255 )).$(( ($1>>16)&255 )).$(( ($1>>8)&255 )).$(( $1&255 ))"; }
[ "$(id -u)" = 0 ] || { echo "Harus dijalankan sebagai root"; exit 1; }
command -v iptables >/dev/null 2>&1 || { echo "iptables belum ada, mencoba memasang..."; (apt-get update -qq && apt-get install -y -qq iptables) >/dev/null 2>&1 || apk add -q iptables >/dev/null 2>&1; }
command -v iptables >/dev/null 2>&1 || { echo "iptables gagal dipasang. Pasang manual dulu."; exit 1; }
ADDRS=$(ip -4 -o addr show | while read _ dev fam addr _; do [ "$dev" = lo ] && continue; echo "$dev $addr"; done)
DEFDEV=$(ip route show default | sed -n "s/.* dev \([^ ]*\).*/\1/p" | head -1)
[ -n "$DEFDEV" ] || { echo "Default route belum ada. Selesaikan soal 2 sampai 4 dulu."; exit 1; }
INTIP=$(echo "$ADDRS" | while read dev addr; do [ "$dev" != "$DEFDEV" ] && { echo "${addr%/*}"; break; }; done)
P=${P:-${INTIP%.*.*}}
case "$(hostname)" in
  *[Mm]isato*) NODE=misato ;;
  *[Gg]endo*)  NODE=gendo ;;
  *) [ "$FORCE" = misato ] && NODE=misato; [ "$FORCE" = gendo ] && NODE=gendo
     [ -n "$NODE" ] || { echo "Jalankan di Misato dan di Gendo."; exit 1; } ;;
esac
if [ "$NODE" = misato ]; then
  CAGEIF=; while read dev addr; do [ "$dev" != "$DEFDEV" ] && { CAGEIF=$dev; CADDR=$addr; break; }; done <<EOT
$ADDRS
EOT
  [ -n "$CAGEIF" ] || { echo "Interface Cage tidak terdeteksi."; exit 1; }
  len=${CADDR#*/}; ipn=$(ip2int ${CADDR%/*}); mask=$(( (0xFFFFFFFF << (32-len)) & 0xFFFFFFFF ))
  CAGE=$(int2ip $(( ipn & mask )))/$len
  UPIF=$DEFDEV
else
  WAN=$DEFDEV
  CAGE=${CAGE:-$P.4.64/29}
  ip route show | grep -q "^$CAGE " || echo "Subnet tidak terdeteksi"
fi
if [ "$NODE" = misato ]; then
  iptables -t nat -D POSTROUTING -s $CAGE ! -d $P.0.0/16 -o $UPIF -j SNAT --to-source 172.31.99.1 2>/dev/null
  iptables -t nat -A POSTROUTING -s $CAGE ! -d $P.0.0/16 -o $UPIF -j SNAT --to-source 172.31.99.1
else
  iptables -t nat -D POSTROUTING -s $CAGE -o $WAN -j RETURN 2>/dev/null
  iptables -t nat -I POSTROUTING 1 -s $CAGE -o $WAN -j RETURN
fi
echo "Script sudah dirusak"
EOF
```

Misato
```bash
sh /root/break_nat.sh
```
<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/7c927284-94e7-475b-9879-86b57babf828" />

Di kedua node, skrip mencetak `Script sudah dirusak`.

#### 10C. Gejala

Unit-01, Unit-02, dan Unit-00 mem-ping 8.8.8.8 dan Lilith, sedangkan Spy mem-ping 8.8.8.8.

Unit-01, Unit-02, Unit-00
```bash
ping -c3 -W2 8.8.8.8; ping -c3 192.236.4.74
```
<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/10a790b5-2a09-4a2b-9bec-1a9480272db6" />

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/9d41e5a8-26f1-4117-8b9e-bd6a3c46caae" />

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/d362bb3a-dfdc-4cdb-8ae8-b933c138055f" />

Spy
```bash
ping -c3 -W2 8.8.8.8
```
<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/ae2a8308-e7f3-4160-88bd-7a286ac87b55" />

Ketiga node Cage gagal ping ke 8.8.8.8 (100% loss) tetapi berhasil ke Lilith. Spy tetap berhasil ke 8.8.8.8, sesuai laporan di soal.

#### 10D. Diagnosis

Rule NAT di Gendou dan Misato dilihat. Ada dua penyebab:

1. Di Misato ada rule SNAT untuk sumber Cage (192.236.4.64/29) ke tujuan di luar 192.236.0.0/16 dengan `--to-source 172.31.99.1`. Alamat sumber diubah menjadi 172.31.99.1, yaitu alamat di luar prefix internal.
2. Di Gendou ada rule `RETURN` di urutan pertama untuk sumber Cage ke eth0, sehingga paket Cage melewati MASQUERADE.

Akibatnya, paket Cage tiba di Gendou dengan sumber 172.31.99.1. Paket itu tidak cocok dengan MASQUERADE (`-s 192.236.0.0/16`) dan tidak lolos rule FORWARD, sehingga dibuang oleh policy DROP.

Ping Cage ke Lilith tetap normal karena tujuannya di dalam prefix internal, jadi SNAT Misato tidak mengenainya (`! -d 192.236.0.0/16`). Spy tidak terdampak karena sumbernya (192.236.4.100/30) tidak cocok dengan rule yang hanya menyasar subnet Cage, dan paketnya juga tidak lewat Misato.

Gendou
```bash
iptables -t nat -S POSTROUTING; iptables -L FORWARD -n -v -x | head -1
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/3ad998ac-890e-4b6d-aace-d7ae90cb36b7" />

Misato
```bash
iptables -t nat -S POSTROUTING; iptables -t nat -L POSTROUTING -n -v -x
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/9c7c9539-7906-4976-9cbd-1f24420b35cb" />

Di Misato terlihat rule SNAT dengan counter yang naik. Di Gendou terlihat rule `RETURN` di posisi pertama POSTROUTING, dan baris policy FORWARD (DROP) dengan counter paket yang dibuang.

#### 10E. Perbaikan

Kedua rule perusak dihapus dengan `-D`, yaitu rule `RETURN` di Gendou dan rule SNAT di Misato.

Gendou
```bash
iptables -t nat -D POSTROUTING -s 192.236.4.64/29 -o eth0 -j RETURN; iptables -t nat -S POSTROUTING
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/fd262f6e-7022-4f55-807f-3bb89b1aa378" />

Misato
```bash
iptables -t nat -D POSTROUTING -s 192.236.4.64/29 ! -d 192.236.0.0/16 -o eth0 -j SNAT --to-source 172.31.99.1; iptables -t nat -S POSTROUTING
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/9a04045b-faa0-43c7-b700-03a77206f65d" />

POSTROUTING di Gendou kembali hanya berisi rule MASQUERADE. POSTROUTING di Misato kembali kosong, karena Misato hanya melakukan routing dan tidak melakukan NAT.

#### 10F. Bukti Unit-01 ping 8.8.8.8 dan router yang menerjemahkan

Ketiga node Cage mem-ping 8.8.8.8 lagi. Counter NAT dan conntrack di Gendou dilihat untuk membuktikan di mana alamat sumber diterjemahkan.

Unit-01
```bash
ping -c3 8.8.8.8
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/63029049-0b9d-4569-b56f-5a8adf8902ec" />

Unit-02
```bash
ping -c3 8.8.8.8
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/aed845f6-f7b1-4da4-972e-7c743419175d" />

Unit-00
```bash
ping -c3 8.8.8.8
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/2762322b-70b3-4b80-8250-64311013b05a" />

Gendou
```bash
iptables -t nat -L POSTROUTING -n -v -x; conntrack -L 2>/dev/null | grep 'src=192.236.4.6[678] dst=8.8.8.8'
```

<img width="745" height="521" alt="image" src="https://github.com/user-attachments/assets/9dcca211-d0a7-429e-9923-238b0b7fe666" />

Unit-01, Unit-02, dan Unit-00 berhasil ping 8.8.8.8 dengan 0% loss. Counter MASQUERADE di Gendou naik, dan entri conntrack untuk `src=192.236.4.66/67/68 dst=8.8.8.8` menunjukkan sisi balasan dengan alamat eth0 Gendou. Jadi alamat sumber diterjemahkan hanya di router **Gendou** (MASQUERADE di eth0), bukan di Misato.

---

| Soal | Node | File |
|---|---|---|
| 2 | gendou | [soal02-gendou.sh](soal02-gendou.sh) |
| 2 | yui | [soal02-yui.sh](soal02-yui.sh) |
| 2 | rei | [soal02-rei.sh](soal02-rei.sh) |
| 2 | shinji | [soal02-shinji.sh](soal02-shinji.sh) |
| 2 | mari | [soal02-mari.sh](soal02-mari.sh) |
| 2 | hikari | [soal02-hikari.sh](soal02-hikari.sh) |
| 2 | kaworu | [soal02-kaworu.sh](soal02-kaworu.sh) |
| 2 | asuka | [soal02-asuka.sh](soal02-asuka.sh) |
| 2 | kensuke | [soal02-kensuke.sh](soal02-kensuke.sh) |
| 2 | ritsuko | [soal02-ritsuko.sh](soal02-ritsuko.sh) |
| 2 | kaji | [soal02-kaji.sh](soal02-kaji.sh) |
| 2 | misato | [soal02-misato.sh](soal02-misato.sh) |
| 2 | shigeru | [soal02-shigeru.sh](soal02-shigeru.sh) |
| 2 | makoto | [soal02-makoto.sh](soal02-makoto.sh) |
| 2 | fuyutsuki | [soal02-fuyutsuki.sh](soal02-fuyutsuki.sh) |
| 2 | maya | [soal02-maya.sh](soal02-maya.sh) |
| 2 | toji | [soal02-toji.sh](soal02-toji.sh) |
| 2 | gendou, yui, hikari, asuka, shigeru, fuyutsuki | [soal02-uji-induk.sh](soal02-uji-induk.sh) |
| 3 | gendou | [soal03-gendou.sh](soal03-gendou.sh) |
| 3 | yui | [soal03-yui.sh](soal03-yui.sh) |
| 3 | rei | [soal03-rei.sh](soal03-rei.sh) |
| 3 | shinji | [soal03-shinji.sh](soal03-shinji.sh) |
| 3 | mari | [soal03-mari.sh](soal03-mari.sh) |
| 3 | hikari | [soal03-hikari.sh](soal03-hikari.sh) |
| 3 | kaworu | [soal03-kaworu.sh](soal03-kaworu.sh) |
| 3 | asuka | [soal03-asuka.sh](soal03-asuka.sh) |
| 3 | kensuke | [soal03-kensuke.sh](soal03-kensuke.sh) |
| 3 | ritsuko | [soal03-ritsuko.sh](soal03-ritsuko.sh) |
| 3 | kaji | [soal03-kaji.sh](soal03-kaji.sh) |
| 3 | misato | [soal03-misato.sh](soal03-misato.sh) |
| 3 | shigeru | [soal03-shigeru.sh](soal03-shigeru.sh) |
| 3 | makoto | [soal03-makoto.sh](soal03-makoto.sh) |
| 3 | fuyutsuki | [soal03-fuyutsuki.sh](soal03-fuyutsuki.sh) |
| 3 | maya | [soal03-maya.sh](soal03-maya.sh) |
| 3 | toji | [soal03-toji.sh](soal03-toji.sh) |
| 3 | comm-net, sachiel, lilith, armisael | [soal03-node.sh](soal03-node.sh) |
| 3 | gendou | [soal03-cek.sh](soal03-cek.sh) |
| 3 | armisael | [soal03-armisael-uji.sh](soal03-armisael-uji.sh) |
| 4 | gendou | [soal04-gendou.sh](soal04-gendou.sh), [soal04-gendou-uji.sh](soal04-gendou-uji.sh) |
| 4 | gendou, misato, shigeru, fuyutsuki, lilith, armisael | [soal04-dns.sh](soal04-dns.sh) |
| 4 | misato, shigeru, fuyutsuki | [soal04-paket.sh](soal04-paket.sh) |
| 4 | lilith, armisael | [soal04-uji.sh](soal04-uji.sh) |
| 5 | gendou | [soal05-gendou.sh](soal05-gendou.sh), [soal05-gendou-uji.sh](soal05-gendou-uji.sh), [gendo.sh](gendo.sh) |
| 5 | armisael | [soal05-armisael-uji.sh](soal05-armisael-uji.sh) |
| 6 | semua node non-router | [soal06-node.sh](soal06-node.sh) |
| 6 | gendou | [soal06-cek.sh](soal06-cek.sh) |
| 6 | unit-01 | [soal06-unit01-uji.sh](soal06-unit01-uji.sh) |
| 7 | magi-casper | [soal07-casper.sh](soal07-casper.sh) |
| 7 | magi-balthasar | [soal07-balthasar.sh](soal07-balthasar.sh) |
| 7 | magi-melchior | [soal07-melchior.sh](soal07-melchior.sh) |
| 7 | lilith | [soal07-lilith-uji.sh](soal07-lilith-uji.sh) |
| 7 | magi-casper, magi-balthasar, magi-melchior | [soal07-log.sh](soal07-log.sh) |
| 8 | pen-pen | [soal08-penpen.sh](soal08-penpen.sh) |
| 8 | tokyo3-core | [soal08-tokyo3.sh](soal08-tokyo3.sh) |
| 8 | lilith | [soal08-lilith-uji.sh](soal08-lilith-uji.sh) |
| 8 | pen-pen, tokyo3-core | [soal08-log.sh](soal08-log.sh) |
| 9 | shigeru | [soal09-shigeru.sh](soal09-shigeru.sh) |
| 9 | lilith, armisael | [soal09-uji.sh](soal09-uji.sh) |
| 10 | gendou | [soal10-gendou.sh](soal10-gendou.sh), [soal10-gendou-uji.sh](soal10-gendou-uji.sh) |
| 10 | misato | [soal10-misato.sh](soal10-misato.sh) |
| 10 | unit-01, unit-02, unit-00, spy | [soal10-uji.sh](soal10-uji.sh) |
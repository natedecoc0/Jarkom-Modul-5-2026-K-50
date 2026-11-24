#!/bin/bash
# soal06-cek.sh - Gendou: ping semua 25 node non-router
F=0
while read n a; do
  ping -c1 -W1 $a >/dev/null 2>&1 || { echo "GAGAL: $n ($a)"; F=1; }
done <<'H'
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
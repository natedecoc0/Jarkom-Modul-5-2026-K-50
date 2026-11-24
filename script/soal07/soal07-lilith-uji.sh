#!/bin/sh
# soal07-lilith-uji.sh - Lilith: kirim pesan ke Casper, Balthasar (5000 dan 5001), Melchior
for t in "192.236.4.58 5000 Casper" "192.236.4.59 5000 Balthasar-5000" "192.236.4.59 5001 Balthasar-5001" "192.236.4.60 5000 Melchior"; do
  set -- $t
  echo "Halo $3, pesan dari Lilith" | nc -w2 $1 $2
  echo "$3 exit=$?"
done
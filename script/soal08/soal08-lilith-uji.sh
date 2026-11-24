#!/bin/sh
# soal08-lilith-uji.sh - Lilith: nc ke port dilayani dan port 22 (harus langsung gagal)
t(){ s=$(date +%s); echo "--- $1:$2"; nc -w2 $1 $2 </dev/null; echo "exit=$? durasi=$(( $(date +%s) - s ))s"; }
t 192.236.3.195 80
t 192.236.4.106 80
t 192.236.4.106 8080
t 192.236.3.195 22
t 192.236.4.106 22
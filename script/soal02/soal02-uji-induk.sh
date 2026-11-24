#!/bin/sh
# soal02-uji-induk.sh - ping ke router anak dari sisi induk
# pakai: sh soal02-uji-induk.sh <ip> [<ip> ...]
for a in "$@"; do echo "== $a"; ping -c2 -W1 $a | grep transmitted; done
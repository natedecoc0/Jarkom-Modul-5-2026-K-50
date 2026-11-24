#!/bin/sh
# soal08-log.sh - log koneksi yang dilayani node ini
for f in /root/penpen.log /root/tokyo3.log; do [ -f $f ] && { echo "== $f"; cat $f; }; done
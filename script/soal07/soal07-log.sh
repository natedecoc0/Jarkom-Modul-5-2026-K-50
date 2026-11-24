#!/bin/sh
# soal07-log.sh - tampilkan pesan yang diterima di node ini
for f in /root/*-500?.log; do echo "== $f"; cat $f; done
#!/bin/sh
# soal04-paket.sh - pasang iptables (+ paket tambahan dari argumen) di router
apt-get update && apt-get install -y iptables "$@"
iptables -V
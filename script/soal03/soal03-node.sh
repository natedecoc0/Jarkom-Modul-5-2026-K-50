#!/bin/sh
# soal03-node.sh - IP + gateway sementara node uji; IP permanen di soal 6
# pakai: sh soal03-node.sh <ip>/<prefix> <gateway>
[ $# -eq 2 ] || { echo "pakai: sh $0 <ip>/<prefix> <gateway>"; exit 1; }
ip link set eth0 up
ip addr replace $1 dev eth0
ip route replace default via $2
ip -br a
#!/bin/sh
# soal08-penpen.sh - Pen-Pen: pasang iptables + listener TCP 80 (Welcome to {hostname})
NAME=penpen
command -v iptables >/dev/null 2>&1 || { apk update && apk add iptables; }
pkill -f 'while true' 2>/dev/null; pkill -f 'nc -l' 2>/dev/null
serve(){ nohup sh -c "while true; do echo '$2' | nc -l -p $1 >/dev/null; echo \"\$(date '+%F %T') port $1 dilayani\" >> /root/$NAME.log; done" >/dev/null 2>&1 </dev/null & }
serve 80 "Welcome to $(hostname)"
sleep 1; netstat -ltn | grep -E ':(80|8080) '
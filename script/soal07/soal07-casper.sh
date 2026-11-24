#!/bin/sh
# soal07-casper.sh - Magi-Casper: pasang iptables + netcat-traditional, listener TCP 5000
NAME=casper
PORTS="5000"
if command -v apk >/dev/null 2>&1; then
  apk update && apk add iptables
  apk add netcat-traditional 2>/dev/null || echo "pakai nc busybox bawaan"
else
  apt-get update && apt-get install -y iptables netcat-traditional
  update-alternatives --set nc /bin/nc.traditional 2>/dev/null
fi
pkill -f 'while true' 2>/dev/null; pkill -f 'nc -l' 2>/dev/null
serve(){ nohup sh -c "while true; do nc -l -p $1 >> /root/$NAME-$1.log; done" >/dev/null 2>&1 </dev/null & }
for p in $PORTS; do serve $p; done
sleep 1; netstat -ltn | grep -E ':(5000|5001) '
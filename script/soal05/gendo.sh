cd /root
{
  echo '#!/bin/bash'
  echo '# gendo.sh - Gendo: IP, forwarding, DHCP, rute, NAT, firewall (Soal 2-5)'
  for s in soal02 soal03 soal04 soal05; do
    echo; echo "# ===== $s ====="
    grep -v '^#!' $s-gendou.sh
  done
} > gendo.sh
chmod +x gendo.sh
bash gendo.sh; echo "exit code: $?"
#!/bin/sh
# soal09-uji.sh - ping Armisael (default) atau IP lain dari argumen
ping -c3 -W2 ${1:-192.236.4.83}
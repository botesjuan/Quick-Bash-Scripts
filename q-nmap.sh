#!/bin/bash

# Colors for text are represented by color codes:: reset = 0, black = 30, red = 31, green = 32, yellow = 33, blue = 34, magenta = 35, cyan = 36, and white = 37.

mkdir nmap
target_ip=$1
echo -n " "

### check if target argument parameter provided ?
if [ "$#" -eq "0" ] 
  then
    echo -e "\r\n\e[1;31m  No Arguments supplied \e[0m\r\n "
    exit 0
else
    echo -e "\r\n              Combo of Nmap scans "
    echo -e " ------------ version 5 August 2021 ---------------- "
    echo -e " "
    echo -e " Target IP = $target_ip \r\n"
fi

echo -e "\r\n\e[1;32m   ***   Quick NMAP   (Only common ports)   ***   \e[0m\r\n "
nmap $target_ip -oA nmap/quick-output

echo -e "\r\n\e[1;32m   ***   Gettting  all  ports   ***  \e[0m\r\n "
ports=$(nmap -Pn -p- --min-rate=1000 -T4 $target_ip | grep ^[0-9] | cut -d '/' -f 1 | tr '\n' ',' | sed s/,$//)

echo -e "\r\n\e[1;31m   ***   Found Ports = $ports \e[0m\r\n "

echo -e "\r\n\e[1;33m   ***   NMAP  ALL Discovered Ports  sCripts  Versions  All  Os  -Pn  *** \e[0m\r\n "
nmap -p$ports -sC -sV -A -Pn -O $target_ip -oA nmap/aggressive-output --reason

echo -e "\r\n\e[1;34m   ***   NMAP  Scripts  Vuln   *** \e[0m\r\n "
nmap -p$ports --script vuln $target_ip -oA nmap/vuln_scan

echo -e "\r\n\e[1;35m   ***   NMAP ALL ports open scan -Pn    *** \e[0m\r\n "
nmap -p- -Pn $target_ip -oA nmap/all_Ports_up

echo -e "\r\n\e[1;36m   ***     UDP  NMAP (few)  ports only  *** \e[0m\r\n "
nmap -sU -p 53,67,68,69,99,123,111,135,137,138,161,162,445,500,514,520,999,1029,1434,1900,9999,3456,4500,5353,7778,16420,44334,49152 $target_ip -oA nmap/udp_scan

echo -e "\r\n\e[1;31m  *** the end. *** \e[0m\r\n "

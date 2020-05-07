#!/bin/bash

#Author: d4t4s3c
#Email:  d4t4s3c@protonmail.com
#GitHub: www.github.com/d4t4s3c

#colors
b="\033[1;37m"
r="\033[1;31m"
v="\033[1;32m"
a="\033[1;33m"
cy="\033[0;96m"
nc="\e[0m"

#var
shell=">"
n1=1
n2=2
n3=3
n4=4
n5=5
z="IP?"
x="Scan IP:"
c="Scan Completed"
w="Scan ARP"
in="Invalid Option"

function main(){
        echo ""
        echo -e "$b[$v$n1$b] Scan ARP $cy(Active IPs) $a* $b[$v$n2$b] Scan Ports $cy(All 1-65535) $a* $b[$v$n3$b] Scan Ports $cy(Popular Ports) $a* $b[$v$n4$b] Scan Ports $cy(Basic 1-5000) $a* $b[$v$n5$b] Exit $nc"
        echo ""
}

function menu(){

read -p " $(echo -e $v$shell $nc)" opc

    if [ $opc -eq 1 ]; then
        echo -e "$cy"
        arp-scan -l | grep -v "Interface:" | grep -v "Starting" | grep -v "packets" | grep -v "Ending" | awk '{print $1}'
        echo -e "$nc"
    elif [ $opc -eq 2 ]; then
	echo ""
	echo -e "$a$z$nc"
	echo ""
	read ip
	echo ""
	echo -e "$a$x$v $ip $nc"
        echo -e "$cy"
	nmap -n -Pn -sS -p- --min-rate 5000 $ip | grep "open"
	echo -e "$nc"
	echo -e "$a$c$nc"
	echo ""
    elif [ $opc -eq 3 ]; then
        echo ""
	echo -e "$a$z$nc"
	echo ""
	read ip
	echo ""
	echo -e "$a$x$v $ip $nc"
	echo -e "$cy"
	nmap -n -Pn -sS -p 21,22,23,53,80,88,109,110,137,138,139,443,445,3389 --min-rate 5000 $ip | grep "open"
	echo -e "$nc"
	echo -e "$a$c$nc"
	echo ""
    elif [ $opc -eq 4 ]; then
        echo ""
        echo -e "$a$z$nc"
        echo ""
        read ip
        echo ""
        echo -e "$a$x$v $ip $nc"
        echo -e "$cy"
        nmap -n -Pn -sS -p 1-5000 --min-rate 5000 $ip | grep "open"
        echo -e "$nc"
        echo -e "$a$c$nc"
        echo ""
    elif [ $opc -eq 5 ]; then
        echo ""
	exit
        echo ""
    else
        echo ""
	echo -e "$a$in$nc"
        sleep 2
	main
	menu
    fi
}
main
menu

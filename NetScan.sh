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
shell="$"
si=✔
no=✘
n1=1
n2=2
n3=3
n4=4
n5=5
n6=6
z="IP?"
x="Scan IP:"
c="Scan Completed"
w="Scan ARP"
e="Scan TTL:"
in="Invalid Option"
det="Detected:"
error="TTL not detected, host dropped or filtered by Firewall/IDS"

function checkroot(){
	    echo ""
	    echo -e "$a check root user $nc"
	    sleep 4
    if [ "$(id -u)" == "0" ]; then
	    echo ""
	    echo -e " $b[$v$si$b] root $nc"
	    sleep 4
	    echo ""
    else
            echo ""
	    echo -e " $b[$r$no$b] root $nc"
	    sleep 4
	    echo ""
	    echo -e "$r EXITING $nc"
	    sleep 4
	    echo ""
	    exit
    fi	
}

function dep1(){
	    echo -e "$a check dependencies $nc"
	    sleep 4
	    which arp-scan > /dev/null 2>&1
    if [ "$(echo $?)" == "0" ]; then
	    echo ""
	    echo -e " $b[$v$si$b] arp-scan installed $nc"
	    sleep 4
    else
            echo ""
	    echo -e " $b[$r$no$b] arp-scan no installed $nc"
	    sleep 4
	    echo ""
	    echo -e "$b installing arp-scan $nc"
	    sleep 4
	    echo ""
	    apt-get install xterm -y > /dev/null 2>&1
	    echo -e " $b[$v$si$b] xterm installed $nc"
	    sleep 4
    fi
}

function banner(){
            echo ""
            echo -e "$b┌═══════════════════════════════════════════════════════════════┐"
            echo -e "$b║$v ███╗   ██╗███████╗████████╗███████╗ ██████╗ █████╗ ███╗   ██╗ $b║"
            echo -e "$b║$v ████╗  ██║██╔════╝╚══██╔══╝██╔════╝██╔════╝██╔══██╗████╗  ██║ $b║"
            echo -e "$b║$v ██╔██╗ ██║█████╗     ██║   ███████╗██║     ███████║██╔██╗ ██║ $b║"
            echo -e "$b║$v ██║╚██╗██║██╔══╝     ██║   ╚════██║██║     ██╔══██║██║╚██╗██║ $b║"
            echo -e "$b║$v ██║ ╚████║███████╗   ██║   ███████║╚██████╗██║  ██║██║ ╚████║ $b║"
            echo -e "$b║$v ╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═══╝ $b║"
            echo -e "$b║$r               Author  $b: $a d4t4s3c                              $b║"
            echo -e "$b║$r               Email   $b: $a d4t4s3c@protonmail.com               $b║"
            echo -e "$b║$r               GitHub  $b: $a www.github.com/d4t4s3c               $b║"
            echo -e "$b└═══════════════════════════════════════════════════════════════┘$b"
            echo ""                                                        
}

function main(){
            echo -e "$b[$v$n1$b] Scan ARP  LAN   $cy(Active____IPs)$nc"
            echo -e "$b[$v$n2$b] Scan TTL  Check $cy(Recon______OS)$nc"
            echo -e "$b[$v$n3$b] Scan Open Ports $cy(All___1-65535)$nc"
            echo -e "$b[$v$n4$b] Scan Open Ports $cy(Popular_Ports)$nc"
            echo -e "$b[$v$n5$b] Scan Open Ports $cy(Basic__1-5000)$nc"                
            echo -e "$b[$v$n6$b] Exit"
            echo ""
}

function ttl(){
	    echo ""
	    echo -e "$a$z$nc"
	    echo ""
	    read ip
	    echo ""
	    echo -e "$a$e$v $ip $nc"
	    comand=$(ping -c 1 $ip | grep "ttl" | awk {'print $6'} | tr -d 'ttl=') > /dev/null 2>&1
	    echo ""
    if [ "$(echo $comand)" == "64" ]; then
	    echo -e "$cy$det TTL=64 (Linux)"
	    echo ""
	    echo ""
	    sleep 4
	    echo -e "$a$c$nc"
	    echo ""
	    exit
    elif [ "$(echo $comand)" == "63" ]; then
            echo -e "$cy$det TTL=63 (Linux)"
	    echo ""
	    echo ""
	    sleep 4
	    echo -e "$a$c$nc"
	    echo ""
	    exit
    elif [ "$(echo $comand)" == "128" ]; then
            echo -e "$cy$det TTL=128 (Windows)"
	    echo ""
	    echo ""
	    sleep 4
	    echo -e "$a$c$nc"
	    echo ""
	    exit
    elif [ "$(echo $comand)" == "127" ]; then
            echo -e "$cy$det TTL=127 (Windows)"
	    echo ""
	    echo ""
	    sleep 4
	    echo -e "$a$c$nc"
	    echo ""
	    exit
    else
            echo ""
	    echo -e "$r$error$nc"
	    echo ""
	    sleep 4
	    exit
    fi
}

function menu(){

read -p " $(echo -e $v$shell $nc)" opc

   if [ $opc -eq 1 ]; then
            echo ""
            echo -e "$a$w$v $ip $nc"
            echo -e "$cy"
            arp-scan -l | grep -v -E "Interface:|Starting|packets|Ending" | awk '{print $1}'
            echo -e "$nc"
            echo -e "$a$c$nc"
            echo ""
   elif [ $opc -eq 2 ]; then
	    ttl
   elif [ $opc -eq 3 ]; then
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
    elif [ $opc -eq 4 ]; then
            echo ""
	    echo -e "$a$z$nc"
	    echo ""
	    read ip
	    echo ""
	    echo -e "$a$x$v $ip $nc"
	    echo -e "$cy"
	    nmap -n -Pn -sS -p 21,22,23,53,80,88,109,110,137,138,139,443,445,3389,5985,8080 --min-rate 5000 $ip | grep "open"
	    echo -e "$nc"
	    echo -e "$a$c$nc"
	    echo ""
    elif [ $opc -eq 5 ]; then
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
    elif [ $opc -eq 6 ]; then
	    echo ""
	    echo ""
	    echo -e "$a        |\/\/\/|"
            echo -e "        |      |" 
            echo -e "        |      |" 
            echo -e "        | (o)(o) " 
            echo -e "        C      _) "
            echo -e "         | ,___|  "
            echo -e "         |   /    "
            echo -e "        /____\ "
            echo -e "       /      \ $nc"
            echo -e "$b#### $v BYE $v HACKER $b ####"
            echo ""
            echo ""
	    sleep 3
	    exit
    else
	    echo ""
	    echo -e "$a$in$nc"
	    echo ""
	    sleep 2
	    banner
	    main
	    menu
    fi
}

clear
checkroot
dep1
dep2
banner
main
menu

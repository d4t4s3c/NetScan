#!/bin/bash

#Author : d4t4s3c
#Twitter: @d4t4s3c
#Email  : d4t4s3c@protonmail.com
#GitHub : www.github.com/d4t4s3c

#colors
b="\033[1;37m"
r="\033[1;31m"
v="\033[1;32m"
a="\033[1;33m"
az="\033[1;34m"
cy="\033[0;96m"
nc="\e[0m"

#var
shell="$"
cu1='[+]'
cu2='[*]'
cu3='[i]'
cu4='[x]'
n1=1
n2=2
n3=3
n4=4
n5=5
n6=6
v1='Scan'
v2='Operating System'
v3='All Network  LAN'
v4='Open Ports'
v5='Open Ports + -sV -sC'
v6='VulnHub-HackMyVM'
v7='Exit'
v8='ARP'
v9='TTL'
v10='1-65535'
v11='nmap'
v12='-sC -sV 1-65535'
v13="IP Address?"
v14="Scan IP:"
v15='Open Ports:'
v16="Scan Completed"
v17="Scan ARP"
v18="Scan TTL:"
v19="Invalid Option"
v20="Detected:"
v21="TTL not detected, host dropped or filtered by Firewall/IDS"

function checkroot(){
	    echo ""
	    echo -e "$az$cu2$a check root user $nc"
	    sleep 4
    if [ "$(id -u)" == "0" ]; then
	    echo ""
	    echo -e "\t$v$cu1$b root $nc"
	    sleep 4
	    echo ""
    else
            echo ""
	    echo -e "\t$r$cu4$b NO root $nc"
	    sleep 4
	    echo ""
	    echo -e "\t$r$cu4 EXITING $nc"
	    sleep 4
	    echo ""
	    exit 1
    fi	
}

function dep1(){
	    echo -e "$az$cu2$a check dependencies $nc"
	    sleep 4
	    which arp-scan > /dev/null 2>&1
    if [ "$(echo $?)" == "0" ]; then
	    echo ""
	    echo -e "\t$v$cu1$b arp-scan installed $nc"
	    sleep 4
    else
            echo ""
	    echo -e "\t$r$cu4$b arp-scan NO installed $nc"
	    sleep 4
	    echo ""
	    echo -e "\t$az$cu2$b installing arp-scan $nc"
	    sleep 4
	    echo ""
	    apt-get install arp-scan -y > /dev/null 2>&1
	    echo -e "\t$v$cu1$b arp-scan installed $nc"
	    sleep 4
    fi
}

function dep2(){
	    which nmap > /dev/null 2>&1
    if [ "$(echo $?)" == "0" ]; then
	    echo ""
	    echo -e "\t$v$cu1$b nmap installed $nc"
	    sleep 4
	    echo ""
    else
            echo ""
	    echo -e "\t$r$cu4$b nmap no installed $nc"
	    sleep 4
	    echo ""
	    echo -e "\t$az$cu2$b installing nmap $nc"
	    sleep 4
	    echo ""
	    apt-get install nmap -y > /dev/null 2>&1
	    echo -e "\t$v$cu1$b nmap installed $nc"
	    echo ""
    fi
}

function ttl(){
	    echo ""
	    echo -e "$a$v13$nc"
	    echo ""
	    read ip
	    echo ""
	    echo -e "$az$cu2 $a$v18$v $ip $nc"
	    comand=$(ping -c 1 $ip | grep "ttl" | awk {'print $6'} | tr -d 'ttl=') > /dev/null 2>&1
	    echo ""
    if [ "$(echo $comand)" == "64" ]; then
	    echo -e "$cy$v20 TTL=64 (Linux)"
	    echo ""
	    sleep 4
	    echo -e "$v$cu1 $a$v16$nc"
	    echo ""
	    echo ""
	    main
	    menu
    elif [ "$(echo $comand)" == "63" ]; then
            echo -e "$cy$v20 TTL=63 (Linux)"
	    echo ""
	    sleep 4
	    echo -e "$v$cu1 $a$v16$nc"
	    echo ""
	    echo ""
	    main
	    menu
    elif [ "$(echo $comand)" == "128" ]; then
            echo -e "$cy$v20 TTL=128 (Windows)"
	    echo ""
	    sleep 4
	    echo -e "$v$cu1 $a$v16$nc"
	    echo ""
	    echo ""
	    main
	    menu
    elif [ "$(echo $comand)" == "127" ]; then
            echo -e "$cy$v20 TTL=127 (Windows)"
	    echo ""
	    sleep 4
	    echo -e "$v$cu1 $a$v16$nc"
	    echo ""
	    echo ""
	    main
	    menu
    elif [ "$(echo $comand)" == "255" ]; then
            echo -e "$cy$v20 TTL=255 (Solaris)"
	    echo ""
	    sleep 4
	    echo -e "$v$cu1 $a$v16$nc"
	    echo ""
	    echo ""
	    main
	    menu
    elif [ "$(echo $comand)" == "254" ]; then
            echo -e "$cy$v20 TTL=254 (Solaris)"
	    echo ""
	    sleep 4
	    echo -e "$v$cu1 $a$v16$nc"
	    echo ""
	    echo ""
	    main
	    menu    
    else
	    echo -e "$r$cu4 $b$v21$nc"
	    echo ""
	    echo ""
	    sleep 4
	    main
	    menu
    fi
}

function banner(){
            echo ""
            echo -e "$b┌════════════════════════════════════┐"
            echo -e "$b║$v     ███╗   ██╗███████╗████████╗    $b║"
            echo -e "$b║$v     ████╗  ██║██╔════╝╚══██╔══╝    $b║"
            echo -e "$b║$v     ██╔██╗ ██║█████╗     ██║       $b║" 
            echo -e "$b║$v     ██║╚██╗██║██╔══╝     ██║       $b║"
            echo -e "$b║$v     ██║ ╚████║███████╗   ██║       $b║"
            echo -e "$b║$v     ╚═╝  ╚═══╝╚══════╝   ╚═╝       $b║"
            echo -e "$b║$v ███████╗ ██████╗ █████╗ ███╗   ██╗ $b║"
            echo -e "$b║$v ██╔════╝██╔════╝██╔══██╗████╗  ██║ $b║"
            echo -e "$b║$v ███████╗██║     ███████║██╔██╗ ██║ $b║"
            echo -e "$b║$v ╚════██║██║     ██╔══██║██║╚██╗██║ $b║"
            echo -e "$b║$v ███████║╚██████╗██║  ██║██║ ╚████║ $b║"
            echo -e "$b║$v ╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═══╝ $b║"  
            echo -e "$b║$r Author  $b:$a d4t4s3c                  $b║"
            echo -e "$b║$r Twitter $b:$a @d4t4s3c                 $b║"
            echo -e "$b║$r GitHub  $b:$a www.github.com/d4t4s3c   $b║"
            echo -e "$b║$r Email   $b:$a d4t4s3c@protonmail.com   $b║"
            echo -e "$b└════════════════════════════════════┘$b"
            echo ""                                                     
}

function main(){
        echo -e "$b [$v$n1$b] $r$v1 $a$v8 $cy$v3$nc"
        echo -e "$b [$v$n2$b] $r$v1 $a$v8 $cy$v6$nc"
        echo -e "$b [$v$n3$b] $r$v1 $a$v9 $cy$v2$nc"
        echo -e "$b [$v$n4$b] $r$v1 $a$v4   $cy$v10$nc"
        echo -e "$b [$v$n5$b] $r$v1 $a$v11 $cy$v12$nc"
        echo -e "$b [$v$n6$b] $r$v7 $nc"
        echo ""
}

function menu(){
        read -p " $(echo -e $v$shell $nc)" opc
    if [ $opc -eq 1 ]; then
        echo ""
        echo -e "$az$cu2 $a$v17$nc"
        echo -e "$cy"
        arp-scan -l | grep -v -E "Interface:|Starting|packets|Ending" | awk '{print $1}'
        echo -e "$v$cu1 $a$v16$nc"
        echo ""
	echo ""
	main
	menu
    elif [ $opc -eq 2 ]; then
        echo ""
        echo -e "$az$cu2 $a$v17 $v6$nc"
        echo -e "$cy"
        arp-scan -l | grep "PCS" | awk '{print $1}'
        echo ""
        echo -e "$v$cu1 $a$v16$nc"
        echo ""
	echo ""
	main
	menu
    elif [ $opc -eq 3 ]; then
	ttl
    elif [ $opc -eq 4 ]; then
	echo ""
	echo -e "$a$v13$nc"
	echo ""
	read ip
	echo ""
	echo -e "$az$cu2 $a$v14$v $ip $nc"
        echo -e "$cy"
	nmap -n -sS -p- --min-rate 5000 $ip | grep "open"
	echo -e "$nc"
	echo -e "$v$cu1 $a$v16$nc"
	echo ""
	echo ""
	main
	menu
    elif [ $opc -eq 5 ]; then
        echo ""
        echo -e "$a$v13$nc"
        echo ""
        read ip
        echo ""
        echo -e "$az$cu2 $a$v14$v $ip $nc"
        echo -e "$cy"
        f1=$(nmap -n -sS -p- --min-rate 5000 $ip | grep "open" | awk '{print $1}' | tr -d '/tcp' | xargs | tr " " ",")
        echo -e "$az$cu2 $a$v15 $v$f1"
        echo ""
        echo -e "$az$cu2 $a$v11"
        echo -e "$cy"
        nmap -n -sC -sV -p$f1 $ip | grep -v -E "Starting|report|up|done"
        echo -e "$v$cu1 $a$v16$nc"
	echo ""
	echo ""
	main
	menu
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
	exit 0
    else
	echo ""
	echo -e "$a$v19$nc"
	echo ""
	sleep 2
	main
	menu
    fi
}

clear
checkroot
dep1
dep2
clear
banner
main
menu

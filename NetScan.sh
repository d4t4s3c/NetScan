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
        echo -e "$b[$v$n1$b] Scan ARP   $cy(Active IPs)$nc"
        echo -e "$b[$v$n2$b] Scan Ports $cy(All 1-65535)$nc"
        echo -e "$b[$v$n3$b] Scan Ports $cy(Top)$nc"
        echo -e "$b[$v$n4$b] Scan Ports $cy(Basic 1-5000)$nc"                
        echo -e "$b[$v$n5$b] Exit"
        echo ""
}

function menu(){

read -p " $(echo -e $v$shell $nc)" opc
   if [ $opc -eq 1 ]; then
         echo ""
         echo -e "$a$w$v $ip $nc"
         echo -e "$cy"
         arp-scan -l | grep "192"
         echo -e "$nc"
         echo -e "$a$c$nc"
         echo ""
   elif [ $opc -eq 2 ]; then
	 echo ""
	 echo -e "$a$z$nc"
	 echo ""
	 read ip
	 echo ""
	 echo -e "$a$x$v $ip $nc"
         echo -e "$cy"
	 nmap -n -Pn -p- --min-rate 5000 $ip | grep "open"
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
	 nmap -n -Pn -p 21,22,23,53,80,88,109,110,137,138,139,443,445,3389 --min-rate 5000 $ip | grep "open"
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
         nmap -n -Pn -p 1-5000 --min-rate 5000 $ip | grep "open"
         echo -e "$nc"
         echo -e "$a$c$nc"
         echo ""
    elif [ $opc -eq 5 ]; then
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
banner
main
menu

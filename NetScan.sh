#!/bin/bash

#Author: d4t4s3c
#Email:  d4t4s3c@protonmail.com
#GitHub: www.github.com/d4t4s3c

#colors
b="\033[1;37m"
r="\033[1;31m"
v="\033[1;32m"
a="\033[1;33m"
nc="\e[0m"

#var
shell=">"
n1=1
n2=2
n3=3
z=IP?
x="Scan IP:"
c="Scan Completed"

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
        echo -e "$b[$v$n1$b] TCP All Open Ports (1-65535)"
        echo -e "$b[$v$n2$b] TCP Popular Open Ports"                  
        echo -e "$b[$v$n3$b] Exit"
        echo ""
}

function menu(){

read -p " $(echo -e $v$shell $nc)" opc

    if [ $opc -eq 1 ]; then
	      echo ""
	      echo -e "$a$z$nc"
	      echo ""
	      read ip
	      echo ""
	      echo -e "$a$x$v $ip $nc"
	      echo ""
	      nc -vz -w 1 -n $ip 1-65535
	      echo ""
	      echo -e "$a$c$nc"
	      echo ""
    elif [ $opc -eq 2 ]; then
              echo ""
	      echo -e "$a$z$nc"
	      echo ""
	      read ip
	      echo ""
	      echo -e "$a$x$v $ip $nc"
	      echo ""
	      nc -vz -w 1 -n $ip 21 22 23 53 80 88 109 110 137 138 139 443 445 3389
	      echo ""
	      echo -e "$a$c$nc"
	      echo ""
    elif [ $opc -eq 3 ]; then
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
	      echo -e "$a invalid option $nc"
	      echo ""
	      sleep 4
	      banner
	      main
	      menu
    fi
}

clear
banner
main
menu

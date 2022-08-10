#!/bin/bash
#author: bablish jaiswal
#purpos: Linux user creation with a storng password along with sudo rights
clear
#echo "Hi, I am a function to create sudo user with strong password. Kindly share following information"
echo -e "\n\n\n"
printf "\e[6;33mHi, I am a function to create sudo user with a strong password. Kindly share following information\e[0m";echo
read -p "user name:- " name #input name
read -p "complete path for $name home directory? example: /home/$name :- " home #user home path
( useradd  -m -d $home $name -s /bin/bash ) > /dev/null 2>&1
pass=$(cat /dev/urandom |tr -dc "[[:graph:]]" |head -c16)
(echo -e "$pass\n$pass" | passwd $name ) > /dev/null 2>&1
echo " "
printf "\e[6;33m-----------------------------Copy below credentials-------------------------\e[0m";echo
echo -e "User:- $name\nHomeDir:- $home\npassword:- $pass"
#svalue=$(cat /etc/sudoers |grep -i root |grep -i all|tail -n1 |awk '{$1=""}1')
svalue=$(cat /etc/sudoers |grep -i root |grep -i all|tail -n1 |awk '{print $2}')
echo "${name} ${svalue} NOPASSWD:ALL" >> /etc/sudoers && echo “Remark:- User $name is a sudo user”

#!/bin/bash
#author: bablish jaiswal
#purpos: a sudo pem based user creation
clear
#echo "Hi, I am a function to create sudo user with pem file. Kindly share following information"
echo -e "\n\n\n"
printf "\e[6;33mHi, I am a function to create sudo user with pem file. Kindly share following information\e[0m";echo
read -p "user name:- " name #input your name
read -p "complete path for $name home directory:- " home #user home directory
sudo useradd  -m -d $home $name -s /bin/bash #create user by given input
sudo -u $name cat /dev/zero | sudo -u $name ssh-keygen  -q -N "" #generating pem 
sudo -u $name  mv $home/.ssh/id_rsa.pub $home/.ssh/authorized_keys #permission
sudo chmod 700 $home/.ssh #permission again
sudo chmod 600 $home/.ssh/authorized_keys #permission again and again
echo " "
#echo "-------Copy below pem file text---------"
printf "\e[6;33m-----------------------------Copy below text-------------------------\e[0m";echo
sudo cat $home/.ssh/id_rsa
echo " "
#echo "-------Copy above text---------"
#svalue=$(cat /etc/sudoers |grep -i root |grep -i all|tail -n1 |awk '{$1=""}1') 
svalue=$(cat /etc/sudoers |grep -i root |grep -i all|tail -n1 |awk '{print $2}') #sudo creation
echo "${name} ${svalue} NOPASSWD:ALL" >> /etc/sudoers && echo “Remark:- User $name is a sudo user” #sudo confirmation message

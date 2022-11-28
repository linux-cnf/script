#!/bin/bash
#purpose: writing only one liner bash shell scripts
#contact: linux.cnf@gmail.com
#author: Bablish Jaiswal
#listing all the files recusrively with size of files of multiple folders.
#Note: Kindly change folders location according to your demand.
/usr/bin/du -a /var/log /home/user/log |sort -nr |awk '{print $NF}'|while read l ;do echo "file $(du -csh $l|grep -vi total) " ;done|nl

#Kindly try below one line bash script to generate random strong password.
cat /dev/urandom |tr -dc "[[:graph:]]" |head -c16;echo

#it worked for me to list all cron jobs for all users.
cat /etc/passwd |awk -F ':' '{print $1}'|while read a;do crontab -l -u ${a} ; done

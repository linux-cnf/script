#!/bin/bash
#purpose:lists all the logged-in users.This information is then saved in a file
#author: Bablish Jaiswal
#contact: linux.cnf@gmail.com
a=$(echo -e "current date and time :- \n $(date)\n"
echo -e "All logged in Users with details :- \n $(who)\n "
echo -e "Server uptime :-\n $(uptime |awk -F ',' '{print $1}') \n" 
echo -e "Script running entries are logged in log file /var/log/sh.log")
echo "$a" && echo "$a" >> /var/log/sh.log 2>&1

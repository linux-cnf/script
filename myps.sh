#!/bin/bash
#purpose: Log server past logs at resources level like cpu,ram,swap
#ReadMe: Kindly create a file myps and copy myps file on location /bin/ with +x permission
#command: myps
#auhtor: Bablish Jaiswal
#version: myps-1.9-beta Remark: Missing features will be accepted in version 2.0 after production testing
if [[ ! -e /var/log/myps/myps.log ]]
then
mkdir -p /var/log/myps 
touch /var/log/myps/myps.log
fi
cpulog () {
echo -e "Started at:- $(TZ='Asia/Kolkata' date)"
echo -e "$(ps -eo pid,ppid,fgroup,user,cmd,ni,lstart,etime,%mem,%cpu --sort=-%cpu|head;top -bc -o +%CPU|head -n17 ;free -wh)"
echo -e "$(ps -eo pid,ppid,fgroup,user,cmd,ni,lstart,etime,%mem,%cpu --sort=-%mem|head;top -bc -o +%MEM|head -n17 ;free -wh)"
echo -e "Ended at:- $(TZ='Asia/Kolkata' date)"
}
purging() {
new=$(grep -ic ended /var/log/myps/myps.log)
if [[ $new -ge 150 ]]
then
now=$(TZ='Asia/Kolkata' date '+%d_%m_%Y-%H:%M:%S')
mv /var/log/myps/myps.log /var/log/myps/myps${now}.log
touch /var/log/myps/myps.log
fi
}
older() {
find /var/log/myps/ -mtime +5 -type f -delete
}
purging
older
cpulog |nl >> /var/log/myps/myps.log


#!/bin/bash
#contact: linux.cnf@gmail.com
#purpose: deleting from 90 to 80 % when df -h -ge 90
test -d  /var/log/mybot || mkdir /var/log/mybot
test -d  /var/log/slack || mkdir /var/log/slack
time=$(date +%Y-%h-%d-%T)
path=/var/log/mybot/
path1=/var/log/slack
alert=90
counter=$(du -csh /var/www/logs|grep -v total|awk '{print $1}'|cut -d'G' -f1)
size=$(df -h /|grep -vi use|awk  '{print $5}' |cut -d'%' -f1)
if  [[ $size -ge $alert ]]; then
#	echo "size is more than 90"
	until [ $size -le 80 ]
	do
		/usr/bin/du -a /var/www/logs |sort -nr|head -n3|tail -n2 |awk '{print $NF}'|while read l ;do echo "file $(du -csh $l|grep -vi total) " >> $path1/clean$time.log ; done
		cat $path1/clean$time.log |awk '{print $NF}'| while read line ; do cat /dev/null > $line ; done
#		counter=$(du -csh /var/www/logs|grep -v total|awk '{print $1}'|cut -d'G' -f1)
		size=$(df -h /|grep -vi use|awk  '{print $5}' |cut -d'%' -f1)
	done
	cat $path1/clean$time.log
	echo -e "LogFile: $path1/clean$time.log\n Server IP:- $(curl -4s ident.me;echo)"
fi
#echo -e "\n\nHI Dev Team,\n\t This is an auto generated email to inform you that server:- $(curl -4s ident.me) \"$(cat /etc/hosts.mybot )\" is running on disk outage.\n $(df -h / )\n\n "The top longer files have been auto found and null"\n\n $(cat $path1/clean$time.log) \n"   |mailx -s 'Critial disk outage highalert for more than 90%'  linux.cnf@gmail.com


#!/bin/bash
#Maintainer: Bablish Jaiswal
#Purpose: How to Permanently Kill and Remove kdevtmpfsi or kinsing
#note: also need to modify this script according to attack pattern because same attack will not be experience everytime. 
#systemct pid service_name
report=/var/log/incident.log
if [  -f "$report" ]
then
echo
else
touch $report
fi
chattr +i /tmp/kdevtmpfsi

fixing () {
rm -rfv /tmp/kdevtmpfsi*
touch /tmp/kdevtmpfsi
rm -rfv /tmp/cron*
kill -9 $((ps -aux | grep -i 'kdevtmpfsi\|kinsing') 2>/dev/null |grep -v grep |awk '{print $2}')
cat /var/spool/cron/zimbra |grep -i unk.sh && rm -rfv /var/spool/cron/zimbra
kin=$(ls /opt/zimbra/log/ |grep -i kinsing) && rm -rfv /opt/zimbra/log/${kin}
}
log () {
 echo  "$(date) by user:$(whoami) executed:<$0> virus:kdevtmpfsi action:>killed Pattern:spoofing Target:<CPU> host:$(hostname):<$(curl -s ident.me)>" >> $report
}
fixing
log

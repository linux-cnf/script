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

#error "Argument list too long" while deleting/null lots of files.
cd target_location
#below script to turns file size zero/blank
for i in $(ls) ; do cat /dev/null/ > $i ; done
#below script to delete
for i in * ; do cat rm -rfv $i ; done

#how to download PDFs from multiple websites
#note: listf is a file name with entries of all targeted websites.
wget -c $(for website in $(cat listf); do     lynx -cache=0 -dump -listonly "$website" | awk '/.pdf$/{print $2}';done)

#how to find all broken symbolic links recursively in any linux based OS
b=$(find / -type l); for i in $(echo $b); do file $i ; done |grep -i broken 2> /dev/null

#how to list the size of all existing cache-related folders.
for i in $(find /  -iname '*cache*'); do du -sh $i ; done 2> /dev/null | grep 'G\|M\|K\|B'| nl

#to list every type of file/folder/data/objects... which are hidden in linux
sudo find / -iname '.*' 2> /dev/null|nl   
#to list only hidden files recursively in linux
sudo find / -type f -iname '.*' 2> /dev/null|nl
#to list only hidden directories recursively in linux
sudo find / -type d -iname '.*' 2> /dev/null|nl 

#listing all enabled current hosted webiste in ubuntu apache.
cd /etc/apache2/sites-enabled/ && echo -e "\nListing all enabled website and its home directory for server $(hostname -I):-\n$(cat $(ls) |grep -i 'ServerName\|DocumentRoot')\nReport Timestamp:- $(TZ='Asia/Kolkata' date)\n"

#Vim can comment and uncomment multiple lines at once for specific lines range
:se nu
:7,13s/^/#
#for uncomment, run below one command
:7,13s/^#//

#this command will list all available commands with their one-liner intro respectively #for debian based linux OSs
dpkg -L systemd | grep 'sbin\|bin' | awk -F "/" '{print $NF}' | xargs man | grep ' - ' 2> /dev/null

#use below one liner command for listing a package's command: #for rpm based linux OSs
rpm -ql systemd | grep -w 'bin\|sbin' | awk -F '/' '{print $NF}' | xargs man head | grep ' - ' | grep -vi 'No manual' 2> /dev/null 

#listing all the files recusrively with size of files of multiple folders. Note: Kindly change folder location according to your demand.
/usr/bin/du -a /var/log /home/user/log |sort -nr |awk '{print $NF}'|while read l ;do echo "file $(du -csh $l|grep -vi total) " ;done|nl


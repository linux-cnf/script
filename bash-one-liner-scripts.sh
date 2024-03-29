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

#find exclude tip is shown below:-
#run below ls exclude option with find command as mentioned here. 
find $(ls /var/www/html |grep  -v 'london\|tokyo' ) -type f 

#to list all aws users with their policies, groups,attached polices by aws-cli
aws iam list-users --profile ec |grep -i username > list_users ; cat list_users |awk '{print $NF}' |tr '\"' ' ' |tr '\,' ' '|while read user; do echo "\n\n--------------Getting information for user $user-----------\n\n" ; aws iam list-user-policies --user-name $user --output yaml --profile ec; aws iam list-groups-for-user  --user-name $user --output yaml --profile ec ;aws iam  list-attached-user-policies --user-name $user --output yaml --profile ec ;done ;echo;echo

#to list InstnaceID and public ip from aws ec2 using awscli
aws ec2 describe-instances --profile ec --region us-west-2   |grep -i 'instanceID\|publicipaddress'

#how to run multiple commands from one server in linux without using ansible.
#Note: this is just a raw codes. can be polish upto production level script.
for ip in $(cat hostsfile);do sshpass -p "type_your_password_here" ssh bablish.jaiswal-a@$ip -o LogLevel=error -t " echo TypePasswordHere |sudo -S head -n3 /etc/shadow" ;done | tee liveandpast.log

#how to search multiple matched string in linux using input from a file
cat search_string.txt | xargs grep -i -r -n --color=auto -e

#ssl expiry date checker for multiple IP address at once
(cat ip_list |while read i ; do echo "IP is $i:-"; echo | openssl s_client -servername $i -connect $i:443 2>/dev/null | openssl x509 -noout -dates ;echo "---" ;done) 2> /dev/null

#Linux one-liner script to calculate the used memory percentage including cache memory:
echo "$(awk '/^MemTotal/{t=$2}/^MemAvailable/{a=$2}END{print int((t-a)/t * 100)}' /proc/meminfo)%"

#Linux to check 11 months older logs for outage in CPU, memory, disk
journalctl --since="11 months ago"|grep -Ei "CPU\|memory\|disk\|out of\|oom"

#how to recursively find latest modified files in multiple directories
ls -ltr $(find /path/dir1 /path/dir2 -type f)

#how to search specific string into all files in directory recursively for certain time period
sudo find /var/log/* -type f -mmin -300 -exec grep -H --color=auto "error" {} +

#List all IP entries from specific directory along with file name of entry
sudo grep -ER -o "(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)" /var/log/*

#Random token generator for random files.
dd if=/dev/urandom count=1 bs=512 2> /dev/null  | sha512sum

#Command for quickly creating larger multiple files with certain size in linux
for i in {1..10};do fallocate -l 2G filename$i;done

#Listing the largest file in a directory and its subdirectories?
(sudo  du -a /var/log/ |sort -nr|head -n20 |awk '{print $NF}'|while read l ;do du -csh $l|grep -vi total;done ) 2> /dev/null

#command to change permission of multiple folders recursively.
chmod 777 -v $(find $PWD /home/poc/ /home/jaiswal -type d)

#for a quick summarize access log. just run below commands.
cat /var/log/apache2/access.log|awk '{print $1}'|sort -nr |uniq -c |sort -nr |head -n 25

#listing all Security greoup with infomation like  groupName/ID,vpcID in aws
aws ec2 describe-security-groups |grep 'GroupName\|VpcId\|GroupId'
#output of listing all SG info from above, now can run below one liner script to fetch all VPC info
aws ec2 describe-security-groups |grep 'GroupName\|VpcId\|GroupId' > list_sg_info.txt ; cat list_sg_info.txt|grep -i vpcid |sort -u |awk '{print $NF}'|tr '\"' ' '|while read vpcinfo; do  aws ec2 describe-vpcs --vpc-ids $vpcinfo|nl ; done

#script inside crontab every minute and it will kill the virus kdevtmpfsi in a scripted way.
kill -9 $((ps -aux | grep -i 'kdevtmpfsi\|kinsing\|kthreaddi') 2>/dev/null |grep -v grep |awk '{print $2}')

#list all S3 buckets with their objects recursively, list bucket name and count objects also
/usr/bin/sudo /usr/local/bin/aws s3 ls |awk '{print $NF}'| while read l;do echo -e "#######---$l objects---##########\n\n";/usr/bin/sudo /usr/local/bin/aws s3 ls $l|nl;done

#can also run/check ping latency by below adhoc command in ansible
ansible all -m shell -a "ping -c3 google.com"

#Top command has batch mode to run for scripting or any command line programs. Kindly run below command in ansible with shell module.
top -bco +%CPU -n1

#command to find all broken symbolic links recursively in any linux based OS
a=$(find / -type l); for i in $(echo $a); do file $i ; done |grep -i broken 2> /dev/null

#list all the users who have sudo permissions and not
for i in $(awk -F ':' '{print $1}' /etc/passwd ); do sudo -l -U $i ; done

#one-liner command for user & password creation
useradd himanshi ; echo -e "1234\n1234" | passwd himanshi

#download all available pdf from multiple websites
wget -c $(for website in $(cat websites_list); do     lynx -cache=0 -dump -listonly "$website" | awk '/.pdf$/{print $2}';done)

#for password report of all existed users in linux sever
for i in $(cat /etc/passwd | awk -F ':' '{print $1}'); do echo "##############" "$i" "############";chage -l $i; echo "##################################"; done | nl | less

#inspecting all volumes in docker with one-liner
docker volume ls -q|while read volume;do docker volume inspect $volume ;done

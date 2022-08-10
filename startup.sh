#Startup execution for Linux servers
#!/bin/bash
#author: bablish jaiswal
#purpose: a first Starup script for linux servers
systemctl disable csf lfd iptables ufw firewalld #to disable firewalls
systemctl stop csf lfd iptables ufw firewalld #to stop firewalls
sed -i 's/enforcing/disabled/g' /etc/selinux/config #disable selinux tool
rpm && yum update -y || apt update -y && apt upgrade -y #update patches
sed -i 's/\#Port 22/Port 5726/g' /etc/ssh/sshd_config #change default port
systemctl restart sshd #restart sshd service
sudo init 6 #rebooting server

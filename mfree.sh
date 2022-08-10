#!/bin/bash
#purpose: purging cache memory in Linux OS
#author: bablish jaiswal
free -wh > ~/old #moving file to store last memory report before purging
purging () {
sudo sync; sudo echo 1 > /proc/sys/vm/drop_caches #droping chache meory
sudo sync; sudo echo 1 > /proc/sys/vm/drop_caches #droping chache meory
sudo sync; sudo echo 1 > /proc/sys/vm/drop_caches #droping chache meory
sudo sync; sudo echo 2 > /proc/sys/vm/drop_caches #droping chache meory
sudo sync; sudo echo 2 > /proc/sys/vm/drop_caches #droping chache meory
sudo sync; sudo echo 2 > /proc/sys/vm/drop_caches #droping chache meory
sudo sync; sudo echo 3 > /proc/sys/vm/drop_caches #droping chache meory
sudo sync; sudo echo 3 > /proc/sys/vm/drop_caches #droping chache meory
sudo sync; sudo echo 3 > /proc/sys/vm/drop_caches #droping chache meory
}
report(){
echo -e "\n\n\n\nServer $(curl -s -4 ident.me;echo)'s cache Purging report:-\n-----Before Purging----\n$(cat ~/old)\n\n-----After Purging-----\n$(free -wh)\nTimeStamp:- $(TZ='Asia/Kolkata' date)\n\n"  
}
purging > /dev/null 2>&1 && report ||  echo -e "Kindly run with sudo rights\nExample:- sudo mfree" #guide to run

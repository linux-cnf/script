#!/bin/bash
#purpose: Crontab uses sh shell instead of bash by default. you can use /dev/null to empty files. check below script. it will help.
#author: Bablish Jaiswal
#contact: linux.cnf@gmail.com
tar=$(ls -lt /backup/manual | grep ^d | tail -n1 | awk '{print $NF}')
for i in $(find /backup/manual/"$tar" -type f ) 
 do cat /dev/null > "$i" 
done > /dev/null 2>&1 && mv /backup/manual/"$tar" /tmp/

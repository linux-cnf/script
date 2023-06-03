#!/bin/bash
#Purpose: functional for 7 days backup retention policy
#Purpose explanation: created below script and running with cron. as per my requirement, script is able to delete one backup file daily which is 8 days older and able to keep only 7 days which is backup file and generates here one file daily
count=$(/usr/bin/sudo /usr/local/bin/aws s3 ls bucketname  |nl|tail -n1|awk '{print $1}')
if [[ "$count" == 8 ]]
then
    filename=$(/usr/bin/sudo /usr/local/bin/aws s3 ls bucketname|awk '{print $NF}'|head -n1)
    /usr/bin/sudo /usr/local/bin/aws s3 rm s3://bucketname/$filename
fi

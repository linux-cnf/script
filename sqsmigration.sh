#!/bin/bash
#purpose: how to transfer multiple AWS sqs queues from one account to another account by aws cli and bash shell script
#author: bablish jaiswal
#contact: linux.cnf@gmail.com

mkdir sqs;cd sqs
#listing SQS URLs and names in a single file(urlname) from Source aws account
aws sqs list-queues --profile source_aws_account --region us-west-2 |grep -i http |sed -e 's/"//g'|sed -e 's/,//g' > urlfile ;aws sqs list-queues --profile source_aws_account --region us-west-2 |grep -i http |sed -e 's/"//g'|sed -e 's/,//g' |awk -F '/' '{print $NF}' > listname ; paste urlfile listname > urlname
#Queues configuration collected here
cat urlname|while read a b ; do aws sqs get-queue-attributes --queue-url $a  --profile source_aws_account --region us-west-2 --attribute-names VisibilityTimeout MaximumMessageSize MessageRetentionPeriod DelaySeconds ReceiveMessageWaitTimeSeconds SqsManagedSseEnabled| grep -v '"Attributes": {' > $b.json ; done 
#set json files accordingly.
sed -i 's/}//g' *.json ; echo "}" |tee -a *.json
#now creating SQS queues in target account.
cat urlname|while read a b ; do aws sqs create-queue --queue-name $b --profile dest_aws_account --region ap-south-1 --attributes file://$b.json;done
#done

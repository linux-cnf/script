#!/usr/bin/python3
#purpose: script to share linux commands output on slack channel
import requests,json,subprocess

webhook_url = "paste your Webhook URL here"
slack_data = subprocess.getoutput("bash /home/ubuntu/highload.sh")
data=json.dumps(slack_data)
response = requests.post(webhook_url, json={"text":data}, headers={'Content-Type': 'application/json'})
print(response.text)


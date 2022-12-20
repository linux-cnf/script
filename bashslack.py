#!/usr/bin/python3
#purpose: send bash-shell-script-output on slack channel if-only script has output.
#author: bablish jaiswal
#contact: linux.cnf@gmail.com
import requests,json,subprocess

webhook_url = "https://hooks.slack.com/services/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"
slack_data = subprocess.getoutput("/bin/bash /root/slack/highalert.sh")
if slack_data != "":
    data=json.dumps(slack_data)
    response = requests.post(webhook_url, json={"text":data}, headers={'Content-Type': 'application/json'})
#if response != "":
    print(response.text)


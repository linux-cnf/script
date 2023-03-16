#!/bin/bash
#author: bablish jaiswal
# Create directory to store Common Crawl dataset
mkdir -p ~/common_crawl
cd ~/common_crawl

# Download the latest Common Crawl dataset
wget https://commoncrawl.s3.amazonaws.com/crawl-data/CC-MAIN-latest/wet.paths.gz
wget https://commoncrawl.s3.amazonaws.com/crawl-data/CC-MAIN-latest/urls.gz
wget https://commoncrawl.s3.amazonaws.com/crawl-data/CC-MAIN-latest/mime.types
wget https://commoncrawl.s3.amazonaws.com/crawl-data/CC-MAIN-latest/robots.txt

# Extract the dataset files
zcat urls.gz > urls.txt
zcat wet.paths.gz > wet.paths


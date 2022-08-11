#!/bin/bash
#author: bablish jaiswal
#contact: linux.cnf@gmail.com
#Access_log auto reader for apache and nginx servers.
#ReadMe: read below two variables and change their accordingly.
# variables
loglatest="/var/log/nginx/domain.com-access.log"
logold="/var/log/nginx/domain.com-.com-access.log.*"
RESPONSE_CODE="200"

filters(){
grep $RESPONSE_CODE \
| grep -v "\/rss\/" \
| grep -v robots.txt \
| grep -v "\.css" \
| grep -v "\.jss*" \
| grep -v "\.png" \
| grep -v "\.ico"
}

filters_404(){
grep "404"
}

request_ips(){
awk '{print $1}'
}

request_method(){
awk '{print $6}' \
| cut -d'"' -f2
}

request_pages(){
awk '{print $7}'
}

wordcount(){
sort \
| uniq -c
}

sort_desc(){
sort -rn
}

return_kv(){
awk '{print $1, $2}'
}

request_pages(){
awk '{print $7}'
}

return_top_ten(){
head -10
}

## actions
get_request_ips(){
echo ""
echo "Top 10 Request IP's:"
echo "===================="

cat $loglatest \
| filters \
| request_ips \
| wordcount \
| sort_desc \
| return_kv \
| return_top_ten
echo ""
}

get_request_methods(){
echo "Top Request Methods:"
echo "===================="
cat $loglatest \
| filters \
| request_method \
| wordcount \
| return_kv
echo ""
}

get_request_pages_404(){
echo "Top 10: 404 Page Responses:"
echo "==========================="
zgrep '-' $loglatest $logold\
| filters_404 \
| request_pages \
| wordcount \
| sort_desc \
| return_kv \
| return_top_ten
echo ""
}


get_request_pages(){
echo "Top 10 Request Pages:"
echo "====================="
cat $loglatest \
| filters \
| request_pages \
| wordcount \
| sort_desc \
| return_kv \
| return_top_ten
echo ""
}

get_request_pages_all(){
echo "Top 10 Request Pages from All Logs:"
echo "==================================="
zgrep '-' --no-filename $loglatest $logold \
| filters \
| request_pages \
| wordcount \
| sort_desc \
| return_kv \
| return_top_ten
echo ""
}

#running programs
get_request_ips
get_request_methods
get_request_pages
get_request_pages_all
get_request_pages_404


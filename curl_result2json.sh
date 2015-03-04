#!/bin/bash

####################################
### Just a curl result into json ###
####################################
### How to: $./curl_result2json.sh yoursite2check ###

log=curl_result_`date +"%F"`.json
site=$1

echo "=================================================================="
echo " Results"
echo "=================================================================="


curl -o /dev/null -w "{ \"Content Type\": \"%{content_type}\", \"Connect\": \"%{time_connect}\", \"TTFB\": \"%{time_starttransfer}\", \"Name Look-up Time\": \"%{time_namelookup}\", \"Redirect Time\": \"%{time_redirect}\", \"Header Size\": \"%{size_header}\", \"Request Size\": \"%{size_request}\", \"Downloaded Size\": \"%{size_download}\", \"Remote IP\": \"%{remote_ip}\", \"Remote Port\": \"%{remote_port}\", \"Download Speed\": \"%{speed_download}\", \"Upload Speed\": \"%{speed_upload}\", \"Total Time\": \"%{time_total}\" }\n" $site | python -m json.tool >> $log


echo "=================================================================="
echo " Results: $log "
echo "=================================================================="

#!/bin/bash
api_key='<PUT_YOUR_API_KEY_HERE>'
domainID='<PUT_YOUR_DOMAIN_ID_HERE>'

while
        records=$(curl -s -X GET "https://api.dynu.com/v2/dns/$domainID/record" -H  "accept: application/json" -H "API-Key: $api_key")
        identifier=$(echo $records  | jq '.dnsRecords[] | select(.nodeName=="_acme-challenge")' | jq '.id' | head -n 1) 
        if [ ! -z "$identifier" ]
        then
            echo "Delete: $identifier"
        	curl -s -X DELETE "https://api.dynu.com/v2/dns/$domainID/record/$identifier" -H  "accept: application/json" -H "API-Key: $api_key"
	fi
        [[ ! -z "$identifier" ]]
do
        continue
done

#!/bin/sh
api_key='<PUT_YOUR_API_KEY_HERE>'
domainID='<PUT_YOUR_DOMAIN_ID_HERE>'


#Create record
resultCreate=$(curl -s -X POST "https://api.dynu.com/v2/dns/$domainID/record" -H  "accept: application/json" -H  "Content-Type: application/json" -d "{\"nodeName\":\"_acme-challenge\",\"recordType\":\"TXT\",\"ttl\":60,\"state\":true,\"group\":\"\",\"textData\":\"$CERTBOT_VALIDATION\"}" -H "API-Key: $api_key")
echo $resultCreate
sleep 30

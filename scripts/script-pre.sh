#!/bin/bash
api_key='<PUT_YOUR_API_KEY_HERE>'
#Get domainID:
dns=$(curl -X GET https://api.dynu.com/v2/dns -H "accept: application/json" -H "API-Key: $api_key")
domainID=$(echo $dns | jq ".domains[] | select(.name==\"$CERTBOT_DOMAIN\")" | jq '.id')


#Create record
resultCreate=$(curl -s -X POST "https://api.dynu.com/v2/dns/$domainID/record" -H  "accept: application/json" -H  "Content-Type: application/json" -d "{\"nodeName\":\"_acme-challenge\",\"recordType\":\"TXT\",\"ttl\":60,\"state\":true,\"group\":\"\",\"textData\":\"$CERTBOT_VALIDATION\"}" -H "API-Key: $api_key")
echo $resultCreate
sleep 30

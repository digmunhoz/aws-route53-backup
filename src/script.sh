#! /bin/bash

DATE=$(date +%Y%m%d)
HOSTED_ZONE_FILE="/tmp/.route53.hostedzones.json"

aws route53 list-hosted-zones | jq .HostedZones[] >$HOSTED_ZONE_FILE

ZONES=$(cat $HOSTED_ZONE_FILE | jq .Id -r | cut -d "/" -f 3)

for zone in $ZONES; do
    aws route53 list-resource-record-sets --hosted-zone-id $zone >/tmp/.route53.json
    ZONE_NAME=$(cat $HOSTED_ZONE_FILE | jq -r "select(.Id == \"/hostedzone/${zone}\") .Name")
    aws s3 cp /tmp/.route53.json s3://${S3_BUCKET}/route_53/${DATE}/${ZONE_NAME}json
done

#!/bin/bash
IP_FILE=/var/local/send-ip.txt

ACTUAL_IP=$(ip route get 8.8.8.8 | tr -s ' ' | cut -d' ' -f7)
PREVIOUS_IP=$(cat "$IP_FILE")

echo "Previous IP: $PREVIOUS_IP"
echo "Actual IP: $ACTUAL_IP"

if [[ $ACTUAL_IP != $PREVIOUS_IP ]] || [[ -z "$PREVIOUS_IP" ]]; then
    echo "Sending new address to Slack"
    content="The new IP address of $(hostname) is $ACTUAL_IP"
    curl -X POST -H 'Content-type: application/json' --data '{"text": "'"$content"'"}' $(cat /usr/local/etc/send-ip)
    # write the new ip address
    hostname -I | awk '{print $1}' >> "$IP_FILE"
fi


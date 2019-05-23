#!/bin/bash


ACTUAL_IP=$(hostname -I | awk '{print $1}')
PREVIOUS_IP=$(cat "$HOME/.myips/$(hostname).txt")

echo $PREVIOUS_IP

if [[ $ACTUAL_IP != $PREVIOUS_IP ]] || [[ -z "$PREVIOUS_IP" ]]; then
    content="The new IP address of $(hostname) is $ACTUAL_IP"
    curl -X POST -H 'Content-type: application/json' --data '{"text": "'"$content"'"}' {WEBHOOK_LINK}
    # write the new ip address
    hostname -I | awk '{print $1}' >> "$HOME/.myips/$(hostname).txt"
fi


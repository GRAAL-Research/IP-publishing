#!/bin/bash
# Taking in argument the webhook url

if [ -z "$(command -v curl)" ]; then
    echo "Error: curl must be installed before installation."
elif [ -z "$1" ]; then
    echo "Error: Missing url argument."
elif ! [ $(id -u) = 0 ]; then
    echo "Error: You must run the script as root."
else
    cp system/* /etc/systemd/system/
    cp send-ip.sh /usr/local/bin/send-ip.sh
    touch /var/local/send-ip.txt

    echo $1 > /usr/local/etc/send-ip

    systemctl start send-ip.service
    systemctl enable send-ip.timer
fi

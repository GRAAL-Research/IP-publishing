#!/bin/bash

if ! [ $(id -u) = 0 ]; then
    echo "You must run the script as root."
else
    systemctl stop send-ip.service
    systemctl disable send-ip.timer

    rm -f /etc/systemd/system/send-ip.*
    rm -f /usr/local/bin/send-ip.sh
    rm -f /var/local/send-ip.txt
    rm -f /usr/local/etc/send-ip
fi

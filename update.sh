#!/bin/bash

if ! [ $(id -u) = 0 ]; then
    echo "You must run the script as root."
else
    systemctl disable send-ip.timer
    rm -f /etc/systemd/system/send-ip.*
    systemctl daemon-reload
    rm -f /usr/local/bin/send-ip.sh

    cp system/* /etc/systemd/system/
    cp send-ip.sh /usr/local/bin/send-ip.sh

    if [ -n "$1" ]; then
        echo $1 > /usr/local/etc/send-ip
    fi

    systemctl start send-ip.service
    systemctl enable send-ip.timer
fi

#!/bin/bash

rm -f /etc/systemd/system/send-ip.*
rm -f /usr/local/bin/send-ip.sh
rm -f /var/local/send-ip.txt

systemctl stop send-ip.service
systemctl disable send-ip.timer


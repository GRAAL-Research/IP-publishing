#!/bin/bash
# Taking in argument the webhook url

sudo cp system/* /etc/systemd/system/
sudo cp send-ip.sh /usr/local/bin/send-ip.sh
sudo touch /var/local/send-ip.txt
sudo chmod g+w /var/local/send-ip.txt

echo $1 |sudo tee /usr/local/etc/send-ip 1>/dev/null

sudo systemctl start send-ip.service
sudo systemctl enable send-ip.timer


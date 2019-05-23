# IP-publishing
Instruction and code to publish your server IP address on reboot.

# Installation
1. Move to the repository root and run the following commands :
```
sudo cp system/* /etc/systemd/system/
sudo cp send-ip.sh /usr/local/bin/send-ip.sh
sudo mkdir $HOME/.myips/
sudo touch $HOME/.myips/$(hostname).txt
```
2. After install the webhook application on Slack run the following command by replacing the `{url}` by the url given by Slack.
```
sed "s/{WEBHOOK_LINK}/{url}/" /usr/local/bin/send-ip.sh
```

# IP-publishing
Instruction and code to publish your server IP address on reboot.

# Automatic installation
Run the following command by replacing `{URL}` by the web hook url from Slack for an automatic installation :
```
source send-ip-installation.sh {URL}
```

# Manual installation
1. Move to the repository root and run the following commands :
```
sudo cp system/* /etc/systemd/system/
sudo cp send-ip.sh /usr/local/bin/send-ip.sh
sudo touch /var/local/send-ip.txt
sudo chmod g+w send-ip.txt
```

2. After installing the webhook application on Slack run the following command by replacing the `{url}` by the url given by Slack.
```
echo {url} |sudo tee /usr/local/etc/send-ip 1>/dev/null
```

3. Do the following command to start and enable the systemd
```
sudo systemctl start send-ip.service
sudo systemctl enable send-ip.timer
```


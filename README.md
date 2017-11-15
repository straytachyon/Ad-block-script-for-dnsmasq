# Ad block script for dnsmasq
A script to generate dnsmasq conf files to block ad and trackers

Install dnsmasq using the following two commands:
sudo apt-get update
sudo apt-get dist-upgrade
sudo apt-get install dnsmasq

Copy the raw script "dnsmasq_ad_list.sh" to /usr/local/bin with the command: 
"sudo cp dnsmasq_ad_list.sh /usr/local/bin/"

https://raw.githubusercontent.com/straytachyon/dnsmasq_ad_block_script/master/dnsmasq_ad_list.sh

Run "sudo chmod +x /usr/local/bin/dnsmasq_ad_list.sh" to make the script executable

Run the script using root priviledge: "sudo /usr/local/bin/dnsmasq_ad_list.sh".  The script will generates a file: /etc/dnsmasq.d/dnsmasq.adlist.conf

Optional: rename the existing /etc/dnsmasq.conf and copy my config file "dnsmasq.conf" to /etc/
https://raw.githubusercontent.com/straytachyon/dnsmasq_ad_block_script/master/dnsmasq.conf

Optional: copy "dnsmasq.mylist.conf" to /etc/dnsmasq.d/
https://raw.githubusercontent.com/straytachyon/dnsmasq_ad_block_script/master/dnsmasq.mylist.conf

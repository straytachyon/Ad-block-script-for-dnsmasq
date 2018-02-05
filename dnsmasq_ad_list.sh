#!/bin/bash

ad_list_url="http://pgl.yoyo.org/adservers/serverlist.php?hostformat=dnsmasq&showintro=0&mimetype=plaintext"

#easy_list_url="https://easylist-downloads.adblockplus.org/easylist.txt"
#easy_list_url="https://easylist-downloads.adblockplus.org/chinalist+easylist.txt"
#easy_privacy_list_url="https://easylist-downloads.adblockplus.org/easyprivacy.txt"
#easy_malware_list_url="https://easylist-downloads.adblockplus.org/malwaredomains_full.txt"

easy_list_url="https://easylist.github.io/easylist/easylist.txt"
easy_china_list_url="https://easylist-downloads.adblockplus.org/easylistchina.txt"
easy_privacy_list_url="https://easylist.github.io/easylist/easyprivacy.txt"
easy_malware_list_url="http://malware-domains.com/files/spywaredomains.zones.zip"

shalla_list_url="http://www.shallalist.de/Downloads/shallalist.tar.gz"
winhelp_list_url="http://winhelp2002.mvps.org/hosts.txt"

notrack_list_url="https://raw.githubusercontent.com/quidsup/notrack/master/trackers.txt"
notrack_malware_list_url="https://raw.githubusercontent.com/quidsup/notrack/master/malicious-sites.txt"

malwaredomainlist="http://www.malwaredomainlist.com/hostslist/hosts.txt"

danlist="http://someonewhocares.org/hosts/hosts"

#pixelserv_ip="192.168.0.120"
#localhost_ip=ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/'
#localhost_ip="10.8.0.1"
localhost_ip="0.0.0.0"
invalid_ip="0.0.0.0"
#localhost_ip="$(ifconfig | grep -A 1 'venet0:0' | tail -1 | cut -d ':' -f 2 | cut -d ' ' -f 1)"
ad_file="/etc/dnsmasq.d/dnsmasq.adlist.conf"
temp_ad_file="/tmp/dnsmasq.adlist.conf.tmp"


#curl $easy_list_url | sed -e '/^||/!d'  -e '/\//d' -e 's/\^.*//' -e 's/\*.*//' -e '/^||twitter.com/d' -e '/^||yimg.com/d'  -e 's/||//' -e 's/\([0-9]\{1,3\}\.\)\{3,3\}[0-9]\{1,3\}/x.x.x.x/g' -e '/^meetrics.netbb-/d' -e 's/^/address=\//' -e 's/$/\/192.168.0.120/'  | awk '!seen[$0]++' >> $temp_ad_file
#curl $easy_china_list_url | sed -e '/^||/!d'  -e '/\//d' -e 's/\^.*//' -e 's/\*.*//' -e '/^||twitter.com/d' -e '/^||yimg.com/d'  -e 's/||//' -e 's/\([0-9]\{1,3\}\.\)\{3,3\}[0-9]\{1,3\}/x.x.x.x/g' -e '/^meetrics.netbb-/d' -e 's/^/address=\//' -e 's/$/\/192.168.0.120/'  | awk '!seen[$0]++' >> $temp_ad_file
#curl $easy_privacy_list_url | sed -e '/^||/!d'  -e '/\//d' -e 's/\^.*//' -e 's/\*.*//' -e '/^||twitter.com/d' -e '/^||yimg.com/d'  -e 's/||//' -e '/^meetrics.netbb-/d' -e 's/\([0-9]\{1,3\}\.\)\{3,3\}[0-9]\{1,3\}/x.x.x.x/g' -e 's/^/address=\//' -e 's/$/\/192.168.0.120/'  | awk '!seen[$0]++' >> $temp_ad_file
#curl $easy_list_url | sed -e "/^||/!d" -e "/\//d" -e "/\^\$image/d" -e "/\//d" -e "/\^\$popup\,domain/d" -e "/\.\$image/d" -e "/\.\$popup/d" -e "/\^\$subdocument\,domain/d" -e "/domain\=/d" -e "/\.\$third-party/d" -e "/\*\./d" -e "/\.\*/d" -e "/\^.*banner/d" -e "s/\^.*//" -e "s/\*.*//"  -e "s/||//" -e "/^meetrics.netbb-/d" -e "/[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}/d" -e 's/^/address=\//' -e 's/$/\/192.168.0.120/'  | awk '!seen[$0]++' >> $temp_ad_file
#curl $easy_privacy_list_url | sed -e "/^||/!d" -e "/\//d" -e "/\^\$image/d" -e "/\//d" -e "/\^\$popup\,domain/d" -e "/\.\$image/d" -e "/\.\$popup/d" -e "/\^\$subdocument\,domain/d" -e "/domain\=/d" -e "/\.\$third-party/d" -e "/\*\./d" -e "/\.\*/d" -e "/\^.*banner/d"  -e "s/\^.*//" -e "s/\*.*//"  -e "s/||//" -e "/^meetrics.netbb-/d" -e "/[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}/d" -e 's/^/address=\//' -e 's/$/\/192.168.0.120/'  | awk '!seen[$0]++' >> $temp_ad_file
#curl $easy_malware_list_url | sed -e "/^||/!d" -e "/\//d" -e "/\^\$image/d" -e "/\//d" -e "/\^\$popup\,domain/d" -e "/\.\$image/d" -e "/\.\$popup/d" -e "/\^\$subdocument\,domain/d" -e "/domain\=/d" -e "/\.\$third-party/d" -e "/\*\./d" -e "/\.\*/d" -e "/\^.*banner/d" -e "s/\^.*//" -e "s/\*.*//"  -e "s/||//" -e "/^meetrics.netbb-/d" -e "/[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}/d" -e 's/^/address=\//' -e 's/$/\/192.168.0.120/'  | awk '!seen[$0]++' >> $temp_ad_file
echo "Processing Yoyo List: " $ad_list_url
curl $ad_list_url | sed "s/127\.0\.0\.1/$invalid_ip/" > $temp_ad_file

#remove all lines that do not start with "||"
#remove all lines with "^$image"
#remove all lines with "/"
#remove all lines with ".$image"
#remove all lines with ".$popup"
#remove all lines with "domain="
#remove all lines with ".$third-party"
#remove all lines with "[a-z]*."
#remove all lines with "^*-sponsor"
#remove all lines with "^*_sponsor"
#remove all lines with ".*"
#remove all lines with ".*"
#remove all characters after "^", including the "^"
#remove all characters after "*", including the "*"
#remove all lines with ip addresses
#remove all "||"
#remove all "meetrics.netbb-"
#add "/address=" in front
#add "/0.0.0.0" to the end
echo "Processing Easy List: " $easy_list_url
curl $easy_list_url | sed  -e '/^||/!d' -e '/\//d' -e '/\^\$image/d' -e '/\//d' -e '/\.\$image/d' -e '/\.\$popup/d' -e '/domain\=/d' -e '/\.\$third-party/d' -e '/[a-z]\*\./d' -e "/\^\*-sponsor/d" -e "/\^\*\_sponsor/d" -e '/\.\*/d' -e 's/\^.*//' -e 's/\*.*//'  -e 's/||//' -e '/^meetrics.netbb-/d' -e '/[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}/d' -e 's/^/address=\//' -e "s/$/\/$invalid_ip/" | awk '!seen[$0]++' >> $temp_ad_file

#remove all lines that do not start with "||"
#add "/address=" in front
#add "/0.0.0.0" to the end
echo "Processing Easy China List: " $easy_china_list_url
curl $easy_china_list_url | sed  -e '/^||/!d' -e '/\//d' -e '/\^\$image/d' -e '/\//d' -e '/\.\$image/d' -e '/\.\$popup/d' -e '/domain\=/d' -e '/\.\$third-party/d' -e '/[a-z]\*\./d' -e "/\^\*-sponsor/d" -e "/\^\*\_sponsor/d" -e '/\.\*/d' -e 's/\^.*//' -e 's/\*.*//'  -e 's/||//' -e '/^meetrics.netbb-/d' -e '/[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}/d' -e 's/^/address=\//' -e "s/$/\/$invalid_ip/" | awk '!seen[$0]++' >> $temp_ad_file

#remove all lines that do not start with "||"
#add "/address=" in front
#add "/0.0.0.0" to the end
echo "Processing Easy Privacy List: " $easy_privacy_list_url
curl $easy_privacy_list_url | sed -e '/^||/!d' -e '/\//d' -e '/\^\$image/d' -e '/\//d' -e '/\.\$image/d' -e '/\.\$popup/d' -e '/domain\=/d' -e '/\.\$third-party/d' -e '/\*\./d' -e '/\.\*/d' -e "/\^\*-sponsor/d" -e "/\^\*\_sponsor/d" -e 's/\^.*//' -e 's/\*.*//'  -e 's/||//' -e '/^meetrics.netbb-/d' -e '/[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}/d' -e 's/^/address=\//' -e "s/$/\/$invalid_ip/" | awk '!seen[$0]++' >> $temp_ad_file

#remove ip addresses
#add "/address=" in front
#add "/0.0.0.0" to the end
echo "Processing Easy Malware List: " $easy_malware_list_url
curl $easy_malware_list_url | gunzip -c |  sed -e '/[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}/d' -e '/\/\//d' -e "s/zone \"//"  -e 's/\".*//'  -e 's/^/address=\//' -e "s/$/\/$invalid_ip/"  | awk '!seen[$0]++' >> $temp_ad_file

#tar extract from the downloaded archive BL/tracker/domains BL/spyware/domains BL/adv/domains files
#remove ip addresses
#add "/address=" in front
#add "/0.0.0.0" to the end
echo "Processing Shalla List: " $shalla_list_url
curl $shalla_list_url | tar -zOxvf - BL/tracker/domains BL/spyware/domains BL/adv/domains | sed -e '/[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}/d' -e 's/^/address=\//' -e "s/$/\/$invalid_ip/"  | awk '!seen[$0]++' >> $temp_ad_file

#remove all lines that don't start with 0
#remove all lines start with "#"
#remove all characters after "#", including the #
#remove all 0.0.0.0<space>
#add "/address=" in front
#add "/0.0.0.0" to the end
echo "Processing Winhelp List: " $winhelp_list_url
curl $winhelp_list_url | sed -e '/^0/!d' -e '/^#/d' -e 's/#.*//' -e 's/0\.0\.0\.0\ //g' -e 's/^/address=\//' -e "s/.$/\/$invalid_ip/" | awk '!seen[$0]++' >> $temp_ad_file

#remove all lines start with "#"
#remove all characters after "#", including the #
#remove empty space at the end of the line
#add "/address=" in front
#add "/0.0.0.0" to the end
echo "Processing Notrack List: " $notrack_list_url
curl $notrack_list_url | sed -e '/^#/d' -e 's/#.*//' -e 's/\s*$//' -e 's/^/address=\//' -e "s/.$/\/$invalid_ip/" >> $temp_ad_file

#remove all lines start with "#"
#remove all characters after "#", including the #
#remove empty space at the end of the line
#add "/address=" in front
#add "/0.0.0.0" to the end
echo "Processing Notrack Malware List: " $notrack_malware_list_url
curl $notrack_malware_list_url | sed -e '/^#/d' -e 's/#.*//' -e 's/\s*$//' -e 's/^/address=\//' -e "s/.$/\/$invalid_ip/" >> $temp_ad_file

#remove all lines start with "#"
#remove all "127.0.0.1  "
#add "/address=" in front
#add "/0.0.0.0" to the end
echo "Processing Malware Domain List: " $malwaredomainlist
curl $malwaredomainlist | sed -e '/^#/d' -e 's/127\.0\.0\.1\  //g' -e 's/^/address=\//' -e "s/.$/\/$localhost_ip/"  >> $temp_ad_file

#remove all lines start with "#"
#remove lines with "localhost"
#remove lines with "braodcasthost"
#remove lines with "local"
#remove "127.0.0.1 "
#remove all characters after "#", including the #
#remove empty space at the end of the line
#remove empty lines
#add "/address=" in front
#add "/0.0.0.0" to the end
echo "Processing Dan's List: " $danlist
curl $danlist | sed -e '/^#/d' -e '/^$/d' -e '/localhost/d' -e '/broadcasthost/d' -e '/local/d' -e 's/127\.0\.0\.1\ //g' -e 's/#.*//' -e 's/\s*$//' -e '/^$/d' -e 's/^/address=\//' -e "s/.$/\/$localhost_ip/"  >> $temp_ad_file

if [ -f "$temp_ad_file" ]
then
#sed -i -e '/www\.favoritesite\.com/d' $temp_ad_file
#mv $temp_ad_file $ad_file
#awk '!seen[$0]++' $temp_ad_file | sed -e '/\$third-party/d' -e '/address=\/itunes.apple.com/d'  -e '/address=\/mzstatic.com/d' -e '/address=\/ytimg.com/d' -e '/address=\/wordpress.com/d' -e '/address=\/imgur.com/d'-e '/address=\/bit.ly/d' | sort > $ad_file
#awk '!seen[$0]++' $temp_ad_file | sed -e '/\$third-party/d' -e '/address=\/itunes.apple.com/d'  -e '/address=\/mzstatic.com/d' -e '/address=\/ytimg.com/d' -e '/address=\/wordpress.com/d' -e '/address=\/imgur.com/d' -e '/address=\/bit.ly/d' -e '/address=\/phobos.apple.com/d' | sort > $ad_file
#awk '!seen[$0]++' $temp_ad_file | sed -e '/address=\/newsweek.com/d' -e '/address=\/s1.wp.com/d'  -e '/address=\/politico.com/d' -e '/address=\/wishabi.com/d' -e '/address=\/wishabi.net/d' -e '/address=\/kijiji.ca/d' -e '/address=\/linkbucks.com/d' -e '/address=\/xinhuanet.com/d' -e '/address=\/sinaimg.cn/d' -e '/address=\/oasc17.247realmedia.com/d' -e '/address=\/ifeng.com/d' -e '/address=\/ifengimg.com/d' -e 's/\/s.youtube.com\/0\.0\.0\.0/\/s.youtube.com\/192\.168\.0\.120/' -e 's/\/s2.youtube.com\/0\.0\.0\.0/\/s1.youtube.com\/192\.168\.0\.120/'  | sort > $ad_file

#awk to remove duplicates
#remove address=//0.0.0.0
#remove address=/newsweek.com/0.0.0.0
#remove address=/s1.wp.com/0.0.0.0
#remove address=/politico.com/0.0.0.0
#remove address=/f.wishabi.net/0.0.0.0
#remove address=/wishabi.com/0.0.0.0
#remove address=/kijiji.ca/0.0.0.0
#remove address=/xinhuanet.com/0.0.0.0
#remove address=/sinaimg.cn/0.0.0.0
#remove address=/oasc17.247realmedia.com/0.0.0.0
#remove address=/h-sdk.online-metrix.net/0.0.0.0
#remove address=/ifengimg.com/0.0.0.0
#change address=/s.youtube.com/0.0.0.0 to address=/s.youtube.com/192.168.0.120
#change address=/s2.youtube.com/0.0.0.0 to address=/s2.youtube.com/192.168.0.120
#dump the output to $ad_file (/etc/dnsmasq.d/dnsmasq.adlist.conf)
awk '!seen[$0]++' $temp_ad_file | sed -e '/address=\/\/0.0.0.0/d' -e '/address=\/newsweek.com/d' -e '/address=\/s1.wp.com/d'  -e '/address=\/politico.com/d' -e '/address=\/f.wishabi.net/d' -e '/address=\/wishabi.com/d' -e '/address=\/wishabi.net/d' -e '/address=\/kijiji.ca/d' -e '/address=\/xinhuanet.com/d' -e '/address=\/sinaimg.cn/d' -e '/address=\/oasc17.247realmedia.com/d' -e '/address=\/h-sdk.online-metrix.net/d' -e '/address=\/ifeng.com/d' -e '/address=\/ifengimg.com/d' -e 's/\/s.youtube.com\/0\.0\.0\.0/\/s.youtube.com\/192\.168\.0\.120/' -e 's/\/s2.youtube.com\/0\.0\.0\.0/\/s1.youtube.com\/192\.168\.0\.120/'  | sort > $ad_file

#remove the temp file
rm $temp_ad_file
else
echo "Error building the ad list, please try again." > /tmp/dnsblocklist_error.log
exit
fi

service dnsmasq restart

echo "Weekly DNS blocklist refresh completed $(date)" >  /tmp/dnsblocklist.log

#!/bin/bash
#set -x
# https://gist.github.com/a-c-t-i-n-i-u-m/bc4b1ff265b277dbf195
# https://gist.github.com/pgaulon/3a844a626458f56903d88c5bb1463cc6
 
# settings
# Login information of freenom.com
freenom_email="xxxx@gmail.com"
freenom_passwd="your_password"
freenom_domain_name="yourdomain.tk"
freenom_subdomain_name="www"
freenom_domain_id="1231231"
source ~/private/freenom.com.ddns.inc

# Open DNS management page in your browser.
# URL vs settings:
#   https://my.freenom.com/clientarea.php?managedns={freenom_domain_name}&domainid={freenom_domain_id}
freenom_rememberme="on"
freenom_site="https://my.freenom.com"
freenom_mainpage="$freenom_site/clientarea.php"
dnsManagementURL="$freenom_mainpage?managedns=$freenom_domain_name&domainid=$freenom_domain_id"
UserAgent_Name="Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0"
#
# main
#
# get current url
#current_ip="$(dig TXT +short o-o.myaddr.l.google.com @ns1.google.com 2>/dev/null | tr -d '"')"
function get_ipv6_mac(){
    ifconfig en0 |grep -ve 'inet6 fe80\|inet6 fd\|inet6 fc'|grep inet6.*secured|sed 's/.*inet6 \(.*\) prefixlen.*/\1/g'
}
function get_ipv6_curl(){
    curl http://v6.ipv6-test.com/api/myip.php
}

if which defaults ; then
    current_ip=`get_ipv6_mac`
else
    current_ip=`get_ipv6_curl`
fi
echo "current_ip=$current_ip"
log_file="/tmp/$(basename $0)"

if [ "$current_ip" == "" ]; then
    echo "[$(date)] Couldn't get current global ip address." >> ${log_file}.log
    exit 1
fi
if [ "$(cat ${log_file}.ip 2>/dev/null)" == "$current_ip" ]; then
     echo "ip not changed, exit!"
    exit 0
fi

# login
cookie_file=$(mktemp)

echo "get login page"
loginPage=$(curl -k -L -A "$UserAgent_Name" -c "$cookie_file" $freenom_mainpage  2>&1)
token=$(echo "$loginPage" | grep token | grep -o value=".*" | sed 's/value=//g' | sed 's/"//g' | awk '{print $1}' | head -1)
echo "token=$token"

echo "login..."

loginResult=$(curl -v -k -L -A "$UserAgent_Name" -e "$freenom_mainpage" -c "$cookie_file" -F "username=$freenom_email" -F "password=$freenom_passwd" -F "token=$token" -F "rememberme=on" "$freenom_site/dologin.php" 2>&1)

if [ "$(echo -e "$loginResult" | grep "My Domains")" == "" ]; then
    echo "[$(date)] Login failed." >> ${log_file}.log
    rm -f $cookie_file
    exit 1
fi
echo `echo "$loginResult" | grep 'Hello'`
echo "get record..."
# if record does not exists, add new record, else update the first record; records[0]

dnsManagementPage=$(curl -k -L -A "$UserAgent_Name" -e "$freenom_mainpage" -b "$cookie_file" -c "$cookie_file" "$dnsManagementURL")
# echo "$dnsManagementPage"
function delete_subdomain_item() {
  delete_url=$freenom_site$1
  echo delete by curl $delete_url
  result=$(curl -k -L -A "$UserAgent_Name" -e "$dnsManagementURL" -b "$cookie_file" -c "$cookie_file" "$delete_url")
}
function delete_subdomain(){
    domainName=`echo $1 | tr [a-z] [A-Z]`
    DOMAIN_ITEMS=$(echo -e "$dnsManagementPage" | grep "name=${domainName}&" | grep dnsaction=delete | sed 's/.*location.href=.\(.*\).; return false;.*/\1/g' )
    for DOMAIN_ITEM in $DOMAIN_ITEMS ; do delete_subdomain_item $DOMAIN_ITEM ; done
}
delete_subdomain ${freenom_subdomain_name}

function add_subdmain() {
    recordKey="addrecord[0]"
    dnsAction="add"
    subdomain=$1
    ipaddr=$2
    iptype=$3
    echo "add domain $subdomain -> $iptype $ipaddr"
# request add/update DNS record
updateResult=$(curl -k -L -A "$UserAgent_Name" -b "$cookie_file" -e "$dnsManagementURL" \
    -F "dnsaction=$dnsAction" \
    -F "$recordKey[line]=" \
    -F "$recordKey[type]=$iptype" \
    -F "$recordKey[name]=$subdomain" \
    -F "$recordKey[ttl]=3601" \
    -F "$recordKey[value]=$ipaddr" \
    -F "token=$token" \
    "$dnsManagementURL" 2>&1)
}

add_subdmain $freenom_subdomain_name $current_ip AAAA

# logout
echo "logout..."

curl -k -A "$UserAgent_Name" -b "$cookie_file" "$freenom_site/logout.php" > /dev/null 2>&1

# clean up
rm -f $cookie_file

if [ "$(echo -e "$updateResult" | grep "$current_ip")" == "" ]; then
    echo "[$(date)] Update failed." >> ${log_file}.log
    echo -e "$updateResult" > ${log_file}.errorUpdateResult.log
    exit 1
else
    # save ip address
    echo -n "$current_ip" > ${log_file}.ip
    exit 0
fi 

#
## example: ssh qhmb SS_PASSWD=123456 'bash -s' < install_ss.sh
set -x
echo SS_PASSWD=${SS_PASSWD}
cat > /etc/apt/sources.list.d/jessie-backports.list <<EOF
deb http://httpredir.debian.org/debian jessie-backports main
EOF
apt-get update
apt-get -t jessie-backports -y install shadowsocks-libev

cat > /etc/shadowsocks-libev/config.json <<EOF
{
    "server":"0.0.0.0",
    "server_port":80,
    "local_port":1080,
    "password":"${SS_PASSWD}",
    "timeout":60,
    "method":null
}
EOF
systemctl disable apache2
systemctl stop apache2
systemctl enable shadowsocks-libev
systemctl start shadowsocks-libev
systemctl status shadowsocks-libev


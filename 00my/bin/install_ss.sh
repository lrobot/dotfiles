#
## example: ssh qhmb SS_PASSWD=123456 'bash -s' < install_ss.sh
set -x
echo SS_PASSWD=${SS_PASSWD}
cat > /etc/apt/sources.list.d/jessie-backports.list <<EOF
deb http://httpredir.debian.org/debian jessie-backports main
EOF
apt-get update
apt-get -t jessie-backports -y install shadowsocks-libev
apt-get -y install shadowsocks-libev

cat > /etc/shadowsocks-libev/config.json <<EOF
{
    "server":"0.0.0.0",
    "server_port":80,
    "local_port":1080,
    "password":"${SS_PASSWD}",
    "timeout":60,
    "method":"aes-256-cfb"
}
EOF

cat > /etc/default/shadowsocks-libev <<EOF
# Defaults for shadowsocks initscript
# sourced by /etc/init.d/shadowsocks-libev
# installed at /etc/default/shadowsocks-libev by the maintainer scripts

#
# This is a POSIX shell fragment
#
# Note: `START', `GROUP' and `MAXFD' options are not recognized by systemd.
# Please change those settings in the corresponding systemd unit file.

# Enable during startup?
START=yes

# Configuration file
CONFFILE="/etc/shadowsocks-libev/config.json"

# Extra command line arguments
DAEMON_ARGS=-u

# User and group to run the server as
USER=nobody
GROUP=nogroup

# Number of maximum file descriptors
MAXFD=32768
EOF

systemctl disable apache2
systemctl stop apache2
systemctl enable shadowsocks-libev
systemctl start shadowsocks-libev
systemctl status shadowsocks-libev
systemctl disable systemd-resolved
echo "make sure dns work by fix /etc/resolv.conf"


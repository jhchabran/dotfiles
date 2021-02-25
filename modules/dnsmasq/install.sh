#!/usr/bin/env bash
set -e

cd "$(dirname $0)"

#command -v dnsmasq >/dev/null 2>&1 || { announce "dnsmasq is not installed. Install it first" 1; exit 1; }

announce "configuring dnsmasq" 1
cp dnsmasq.conf /usr/local/etc/dnsmasq.conf


announce "configuring OSX to resolve .dev" 1
sudo mkdir -p /etc/resolver

sudo tee /etc/resolver/dev >/dev/null <<EOF
nameserver 127.0.0.1
EOF

announce "(re)starting dnsmasq" 1
sudo brew services restart dnsmasq > /dev/null




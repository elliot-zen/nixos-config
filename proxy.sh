#!/usr/bin/env bash
mkdir -p /run/systemd/system/nix-daemon.service.d/
cat << EOF > /run/systemd/system/nix-daemon.service.d/override.conf
[Service]
Environment="http_proxy=http://192.168.124.12:1082"
Environment="https_proxy=http://192.168.124.12:1082"
EOF
systemctl daemon-reload
systemctl restart nix-daemon


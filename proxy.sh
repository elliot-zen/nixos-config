#!/usr/bin/env bash
mkdir -p /run/systemd/system/nix-daemon.service.d/
cat << EOF > /run/systemd/system/nix-daemon.service.d/override.conf
[Service]
Environment="http_proxy=http://192.168.1.9:7890"
Environment="https_proxy=http://192.168.1.9:7890"
EOF
systemctl daemon-reload
systemctl restart nix-daemon


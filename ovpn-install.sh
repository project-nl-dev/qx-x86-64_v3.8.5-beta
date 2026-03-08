#!/bin/bash

# Install OpenVPN and its dependencies (required for updates)
sudo apt-get update && sudo apt-get install -y openvpn network-manager-openvpn

# Download a pre-built configuration file from a trusted source
wget https://example.com/openvpn.conf -O /etc/openvpn/openvpn.conf

# Set up key-based authentication
openvpn --config /etc/openvpn/openvpn.conf

# Start the OpenVPN service and enable it to start on boot
sudo systemctl enable openvpn && sudo systemctl start openvpn

# Configure routing for all traffic through OpenVPN (optional)
iptables -t nat -A PREROUTING -p udp -d IP --dport port -j REDIRECT
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

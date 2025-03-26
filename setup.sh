#!/bin/bash

echo "Installing Netdata..."
bash <(curl -Ss https://my-netdata.io/kickstart.sh)

echo "Netdata installation complete."

#Optionally, add the cpu alert configuration.
echo "Adding CPU alert configuration"
sudo mkdir -p /etc/netdata/health.d/
sudo tee /etc/netdata/health.d/cpu.conf > /dev/null <<EOL
template: cpu_usage_high
on: system.cpu
class: Performance
type: Utilization
family: CPU
units: %
lookup: average -1m unaligned
red: 80
crit: 95
EOL
sudo systemctl restart netdata
echo "CPU alert configuration added, and Netdata restarted."

#!/bin/bash
# Ubuntu Server Configuration for ESXi Lab
# Author: rejohn1988

set -e

echo "[INFO] Configuring Ubuntu Server for ESXi Lab..."

# Update system
echo "[INFO] Updating system..."
apt update && apt upgrade -y

# Install essential packages
echo "[INFO] Installing packages..."
apt install -y \
    nginx \
    mysql-server \
    docker.io docker-compose \
    python3 python3-pip \
    nodejs npm

# Configure network (manual configuration required)
echo "[INFO] Configure static IP 192.168.50.20/24 manually"
echo "Gateway: 192.168.50.1"
echo "DNS: 192.168.40.10, 8.8.8.8"

# Create web directory
mkdir -p /var/www/lab
cat > /var/www/lab/index.html << 'HTML_EOF'
<!DOCTYPE html>
<html>
<head><title>ESXi Home Lab - Ubuntu Server</title></head>
<body>
<h1>ESXi Home Lab - Ubuntu Server</h1>
<p>Server: lab-ubuntu (192.168.50.20)</p>
<p>Purpose: Development and Services Platform</p>
</body>
</html>
HTML_EOF

# Start services
systemctl enable nginx mysql docker
systemctl start nginx mysql docker

echo "[SUCCESS] Ubuntu Server configuration complete!"
echo "Web interface: http://192.168.50.20"

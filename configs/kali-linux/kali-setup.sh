#!/bin/bash
# Kali Linux Configuration for ESXi Lab
# Author: rejohn1988

set -e

echo "[INFO] Configuring Kali Linux for ESXi Lab..."

# Update system
echo "[INFO] Updating system..."
apt update && apt upgrade -y

# Install additional tools
echo "[INFO] Installing additional tools..."
apt install -y \
    bloodhound \
    crackmapexec \
    evil-winrm \
    impacket-scripts \
    responder \
    powershell

# Configure network (manual configuration required)
echo "[INFO] Configure static IP 192.168.50.10/24 manually"
echo "Gateway: 192.168.50.1"
echo "DNS: 192.168.40.10, 8.8.8.8"

# Create lab scripts directory
mkdir -p /home/kali/lab-scripts

# Create network discovery script
cat > /home/kali/lab-scripts/network-discovery.sh << 'SCRIPT_EOF'
#!/bin/bash
echo "=== ESXi Lab Network Discovery ==="
echo "Scanning Windows cluster (192.168.40.0/24)..."
nmap -sn 192.168.40.0/24

echo "Scanning Linux cluster (192.168.50.0/24)..."
nmap -sn 192.168.50.0/24
SCRIPT_EOF

chmod +x /home/kali/lab-scripts/*.sh
chown -R kali:kali /home/kali/lab-scripts

echo "[SUCCESS] Kali Linux configuration complete!"

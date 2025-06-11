# ESXi 6.5u3 Setup Guide

## Hardware Requirements
- **Servers**: 2x ASUS Z9PE-D8 WS with ESXi 6.5u3
- **CPU**: Intel E5-2697 v2 (VT-x enabled)
- **Memory**: 64GB DDR3 ECC per host
- **Storage**: 2TB SSD per host
- **Network**: Dual Gigabit NICs per host

## ESXi Host Configuration

### Initial Setup
1. Install ESXi 6.5u3 on both hosts
2. Configure management network
3. Enable SSH for command-line access
4. Set up NTP for time synchronization

### vSphere Client Access
1. Download vSphere Client 6.5
2. Connect to each ESXi host
3. Configure networking and storage

## Network Configuration

### vSphere Standard Switch Setup
1. Create vSwitch0 with physical NICs
2. Create port groups:
   - Cluster-A (Windows VMs)
   - Cluster-B (Linux VMs)
3. Connect to Cisco 2901 router

### Physical Connections
- Host 1 → Router GigE0/0 (192.168.40.1)
- Host 2 → Router GigE0/1 (192.168.50.1)

## VM Creation Guidelines

### Resource Allocation
- Windows Server 2019 DC: 4 vCPU, 4GB RAM, 100GB
- Windows 10 Client: 4 vCPU, 4GB RAM, 80GB
- Kali Linux: 4 vCPU, 8GB RAM, 120GB
- Ubuntu Server: 4 vCPU, 4GB RAM, 100GB

### VM Configuration
1. Use vSphere Client to create VMs
2. Assign to appropriate port groups
3. Install VMware Tools
4. Configure static IP addresses

For detailed VM specifications, see vm-configurations.md

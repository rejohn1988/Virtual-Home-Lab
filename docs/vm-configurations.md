# Virtual Machine Configurations

## VM Specifications for ESXi

### Windows Server 2019 Domain Controller (lab-dc01)
- **vCPU**: 4 cores
- **Memory**: 4GB RAM
- **Storage**: 100GB (thin provisioned)
- **Network**: Cluster-A port group
- **IP**: 192.168.40.10/24
- **Purpose**: Active Directory, DNS, DHCP

### Windows 10 Professional (lab-win10)
- **vCPU**: 4 cores
- **Memory**: 4GB RAM
- **Storage**: 80GB (thin provisioned)
- **Network**: Cluster-A port group
- **IP**: 192.168.40.20/24
- **Purpose**: Domain client workstation

### Kali Linux (lab-kali)
- **vCPU**: 4 cores
- **Memory**: 8GB RAM
- **Storage**: 120GB (thin provisioned)
- **Network**: Cluster-B port group
- **IP**: 192.168.50.10/24
- **Purpose**: Penetration testing platform

### Ubuntu Server 22.04 (lab-ubuntu)
- **vCPU**: 4 cores
- **Memory**: 4GB RAM
- **Storage**: 100GB (thin provisioned)
- **Network**: Cluster-B port group
- **IP**: 192.168.50.20/24
- **Purpose**: Web services, databases, development

## ESXi Creation Steps

1. Right-click ESXi host in vSphere Client
2. Select "Create/Register VM"
3. Choose "Create a new virtual machine"
4. Configure with specifications above
5. Select appropriate port group for network
6. Install OS and VMware Tools
7. Configure static IP address

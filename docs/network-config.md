# Network Configuration

## IP Addressing Scheme

### Cluster A - Windows Infrastructure (192.168.40.0/24)
| Device | IP Address | Purpose |
|--------|------------|---------|
| Router | 192.168.40.1 | Gateway |
| Windows DC | 192.168.40.10 | Domain Controller |
| Windows 10 | 192.168.40.20 | Client Workstation |

### Cluster B - Linux Infrastructure (192.168.50.0/24)
| Device | IP Address | Purpose |
|--------|------------|---------|
| Router | 192.168.50.1 | Gateway |
| Kali Linux | 192.168.50.10 | Penetration Testing |
| Ubuntu Server | 192.168.50.20 | Development Server |

## Cisco 2901 Router Configuration

### Interface Configuration
```cisco
interface GigabitEthernet0/0
 description ESXi Host 1 - Windows Infrastructure
 ip address 192.168.40.1 255.255.255.0
 no shutdown

interface GigabitEthernet0/1
 description ESXi Host 2 - Linux Infrastructure
 ip address 192.168.50.1 255.255.255.0
 no shutdown
```

### Access Control Lists
```cisco
access-list 100 permit ip 192.168.40.0 0.0.0.255 192.168.50.0 0.0.0.255
access-list 100 permit ip 192.168.50.0 0.0.0.255 192.168.40.0 0.0.0.255
access-list 100 deny ip any any log
```

## ESXi Network Setup

### Port Groups
- **Cluster-A**: For Windows VMs (192.168.40.0/24)
- **Cluster-B**: For Linux VMs (192.168.50.0/24)

### Physical Connections
- ESXi Host 1 NIC → Cisco Router GigE0/0
- ESXi Host 2 NIC → Cisco Router GigE0/1

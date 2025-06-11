#!/bin/bash
# ESXi Lab Network Monitor

echo "=== ESXi Lab Network Monitor ==="
echo "Monitoring lab network connectivity..."
echo "Use Ctrl+C to exit"
echo ""

while true; do
    clear
    echo "=== ESXi Lab Network Status ==="
    echo "Last Update: $(date)"
    echo ""
    
    hosts=("192.168.40.1:Router" "192.168.40.10:Windows_DC" "192.168.40.20:Windows_10" 
           "192.168.50.10:Kali_Linux" "192.168.50.20:Ubuntu_Server")
    
    for host_info in "${hosts[@]}"; do
        IFS=':' read -ra ADDR <<< "$host_info"
        ip="${ADDR[0]}"
        name="${ADDR[1]}"
        
        if ping -c 1 -W 2 "$ip" &>/dev/null; then
            echo "✓ $name ($ip) - Online"
        else
            echo "✗ $name ($ip) - Offline"
        fi
    done
    
    echo ""
    echo "Press Ctrl+C to exit monitoring"
    sleep 10
done

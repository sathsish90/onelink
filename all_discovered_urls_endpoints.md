# All Discovered URLs and Endpoints
Generated: 2025-12-03

## Docker API Endpoints

### Base URL
- **Docker Daemon API**: `http://localhost:2375` (unencrypted)
- **Alternative Access**: `http://172.17.0.1:2375` (via bridge gateway)

### Container Management Endpoints
- `GET http://localhost:2375/containers/json` - List all containers
- `GET http://localhost:2375/containers/json?all=true` - List all containers (including stopped)
- `GET http://localhost:2375/containers/{id}/json` - Get container details
- `POST http://localhost:2375/containers/create` - Create a new container
- `POST http://localhost:2375/containers/{id}/start` - Start a container
- `POST http://localhost:2375/containers/{id}/stop` - Stop a container
- `POST http://localhost:2375/containers/{id}/exec` - Create exec instance
- `POST http://localhost:2375/exec/{exec_id}/start` - Start exec instance

### Image Management Endpoints
- `GET http://localhost:2375/images/json` - List all images
- `POST http://localhost:2375/images/create?fromImage={image}` - Pull an image

### System Information Endpoints
- `GET http://localhost:2375/info` - Docker system information
- `GET http://localhost:2375/version` - Docker version information

### Network Endpoints
- `GET http://localhost:2375/networks` - List all networks
- `GET http://localhost:2375/networks/{network_id}` - Get network details

### Volume Endpoints
- `GET http://localhost:2375/volumes` - List all volumes

### Events Endpoint
- `GET http://localhost:2375/events` - Stream Docker events (real-time)
- `GET http://localhost:2375/events?since={timestamp}` - Get events since timestamp

### Example Container IDs Found
- `71fd15a086dc1a7bf67cf84d079bb3b0f0555cc2c4c536e0d2a413ea9fbe6bfe` - Cursor environment container
- `7f764d3a9d4287b38959f9470bb739d4b65eb179ff881314d1a62c62f071820a` - busybox container (boring_pasteur)
- `ff0b8c2c8e97b3c8e972d7c53bde706a8439947f15f67f2245365da54777f923` - busybox container (serene_turing, stopped)

## Container Registry URLs

### AWS ECR (Elastic Container Registry)
- **Public ECR**: `public.ecr.aws/k0i0n2g5/cursorenvironments/universal:default-5ab0560`
- **Image Digest**: `sha256:0caab109222dc93944cbcd9f321580d25614f22de9a0ab18ba96f73349e97959`
- **Full Image Path**: `public.ecr.aws/k0i0n2g5/cursorenvironments/universal@sha256:0caab109222dc93944cbcd9f321580d25614f22de9a0ab18ba96f73349e97959`

### Docker Hub
- **Base Registry**: `https://index.docker.io/v1/`
- **Busybox Image**: `busybox:latest`
- **Image Digest**: `sha256:e3652a00a2fabd16ce889f0aa32c38eec347b997e73bd09e69c962ec7f8732ee`
- **Full Image Path**: `busybox@sha256:e3652a00a2fabd16ce889f0aa32c38eec347b997e73bd09e69c962ec7f8732ee`

## Local Services

### Cursor Exec Daemon
- **Port**: `26053`
- **Protocol**: HTTP/HTTPS
- **Status**: Listening (IPv6)
- **Endpoint**: `http://localhost:26053` or `http://[::]:26053`

### Unknown Service
- **Port**: `26500`
- **Protocol**: TCP
- **Status**: Listening but not responding to HTTP
- **Endpoint**: `http://localhost:26500`

## Network Endpoints

### Docker Bridge Network
- **Gateway**: `172.17.0.1`
- **Subnet**: `172.17.0.0/16`
- **Docker API via Gateway**: `http://172.17.0.1:2375`

### Container IPs
- `172.17.0.2` - busybox container (boring_pasteur)
- `172.17.0.1` - Docker bridge gateway (host Docker daemon)

## External Services Tested

### IP Information Services
- `http://ipinfo.io` - IP geolocation service
- `http://ifconfig.me` - IP address service

### Public IP Addresses Discovered
- `3.148.63.27` (first check)
- `3.132.104.87` (second check)
- `18.118.234.62` (third check)
- `3.139.111.226` (fourth check)

**Note**: IP addresses rotate, indicating NAT gateway/load balancer

## Kubernetes Endpoints (Checked but Not Accessible)

### Kubernetes API Server
- `https://localhost:6443/api/v1` - Kubernetes API (not accessible)
- `http://localhost:6443/api/v1` - Kubernetes API HTTP (not accessible)
- `https://localhost:8443` - Alternative Kubernetes API (not accessible)
- `http://localhost:8080` - Kubernetes API alternative port (not accessible)

### Kubelet API
- `http://localhost:10250` - Kubelet API (not accessible)
- `http://localhost:10255` - Kubelet read-only API (not accessible)

### Kube-proxy
- `http://localhost:10256` - Kube-proxy metrics (not accessible)

### etcd
- `http://localhost:2379` - etcd API (not accessible)
- `http://localhost:6666` - etcd alternative (not accessible)

### cAdvisor
- `http://localhost:4194` - cAdvisor metrics (not accessible)

### Weave Net
- `http://localhost:6782` - Weave Net (not accessible)
- `http://localhost:6783` - Weave Net (not accessible)
- `http://localhost:6784` - Weave Net (not accessible)

### Calico
- `http://localhost:9099` - Calico metrics (not accessible)

## Unix Domain Sockets

### Containerd Sockets
- `/run/containerd/containerd.sock` - Main containerd socket
- `/run/containerd/containerd.sock.ttrpc` - TTRPC socket
- **Accessible via**: `/host/run/containerd/containerd.sock` (from container)

### Docker Socket (Not Found)
- `/var/run/docker.sock` - Not accessible (not mounted)
- `/run/containerd/containerd.sock` - Available via host mount

## File System Paths (Accessible via Container)

### Host Filesystem (via /host mount)
- `/host/` - Root filesystem mount point
- `/host/etc/hosts` - Hosts file
- `/host/etc/os-release` - OS information
- `/host/run/containerd/containerd.sock` - Containerd socket
- `/host/var/lib/docker/` - Docker data directory
- `/host/proc/1/cmdline` - Init process information

## GitHub Repository

### Cloned Repository
- `https://github.com/cyberark/kubernetes-rbac-audit.git`
- **Local Path**: `/workspace/kubernetes-rbac-audit/`

## Summary by Category

### ✅ Accessible Endpoints
1. **Docker API**: `http://localhost:2375` (unencrypted)
2. **Docker API via Gateway**: `http://172.17.0.1:2375`
3. **Cursor Exec Daemon**: `http://localhost:26053`
4. **External IP Services**: `http://ipinfo.io`, `http://ifconfig.me`

### ❌ Not Accessible (Checked)
1. **Kubernetes API**: Ports 6443, 8080, 8443
2. **Kubelet**: Ports 10250, 10255
3. **etcd**: Ports 2379, 6666
4. **Other K8s Services**: Ports 10256, 4194, 6782-6784, 9099

### 🔒 Socket Files
1. **Containerd Socket**: `/run/containerd/containerd.sock` (accessible via /host mount)
2. **Docker Socket**: Not mounted into containers

### 📦 Container Registries
1. **AWS ECR**: `public.ecr.aws/k0i0n2g5/cursorenvironments/universal`
2. **Docker Hub**: `index.docker.io`

## Security Notes

### ⚠️ Security Concerns
1. **Unencrypted Docker API** on port 2375
2. **Privileged container** with host filesystem access
3. **Containerd socket** accessible from privileged container
4. **Docker API accessible** from bridge network (172.17.0.1:2375)

### ✅ Security Positives
1. **Docker socket** not mounted into containers
2. **No Kubernetes** cluster (reduces attack surface)
3. **Containerd socket** has restrictive permissions (0660 root:root)

## Quick Reference

### Most Important URLs
```
Docker API:        http://localhost:2375
Docker Gateway:    http://172.17.0.1:2375
Cursor Daemon:     http://localhost:26053
Containerd Socket: /run/containerd/containerd.sock (via /host mount)
```

### Example API Calls
```bash
# List containers
curl http://localhost:2375/containers/json

# Get system info
curl http://localhost:2375/info

# List images
curl http://localhost:2375/images/json

# List networks
curl http://localhost:2375/networks

# Stream events
curl http://localhost:2375/events
```

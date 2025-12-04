# All URLs, Endpoints, and Network Addresses - Consolidated Report
Generated: 2025-12-03

## Docker API Endpoints

### Docker Daemon API (Unencrypted)
- **Primary Endpoint**: `http://localhost:2375`
- **From Container Network**: `http://172.17.0.1:2375`
- **Status**: ✅ Accessible
- **Security**: ⚠️ Unencrypted (security risk)

### Docker API Endpoints Used
- `http://localhost:2375/containers/json?all=true` - List all containers
- `http://localhost:2375/containers/create` - Create container
- `http://localhost:2375/containers/{id}/start` - Start container
- `http://localhost:2375/containers/{id}/stop` - Stop container
- `http://localhost:2375/containers/{id}/json` - Container details
- `http://localhost:2375/containers/{id}/exec` - Create exec instance
- `http://localhost:2375/exec/{id}/start` - Start exec instance
- `http://localhost:2375/images/json` - List images
- `http://localhost:2375/images/create` - Pull image
- `http://localhost:2375/info` - Docker system info
- `http://localhost:2375/events` - Docker events stream
- `http://localhost:2375/networks` - List networks
- `http://localhost:2375/networks/{id}` - Network details
- `http://localhost:2375/volumes` - List volumes

## Container Registry URLs

### AWS ECR (Elastic Container Registry)
- **Registry**: `public.ecr.aws`
- **Full Image URL**: `public.ecr.aws/k0i0n2g5/cursorenvironments/universal:default-5ab0560`
- **Digest**: `sha256:0caab109222dc93944cbcd9f321580d25614f22de9a0ab18ba96f73349e97959`
- **Type**: Public ECR registry

### Docker Hub
- **Registry**: `docker.io` / `index.docker.io`
- **Index Server**: `https://index.docker.io/v1/`
- **Image Used**: `busybox:latest`
- **Digest**: `sha256:e3652a00a2fabd16ce889f0aa32c38eec347b997e73bd09e69c962ec7f8732ee`
- **Official**: Yes

## Network IP Addresses

### Docker Bridge Network
- **Subnet**: `172.17.0.0/16`
- **Gateway**: `172.17.0.1` (Docker bridge)
- **Network ID**: `bb9f8916985ccc2d8328eb7aa3e933fc042f3b48cc2e869d966e29c0d0db3e6d`

### Container IPs
- **172.17.0.1**: Docker bridge gateway (host Docker daemon)
  - Docker API: `http://172.17.0.1:2375` ✅ Accessible
- **172.17.0.2**: `boring_pasteur` container (busybox)
  - MAC: `ca:74:ce:ca:04:94`
  - Status: Running
- **172.17.0.3**: Stale ARP entry (incomplete)
- **172.17.0.4**: Stale ARP entry (incomplete)
- **172.17.0.5**: Stale ARP entry (incomplete)

### Host Network
- **Hostname**: `c9d7523bc008`
- **Hostname IP Mapping**: `172.17.0.2` (from /etc/hosts)

## Service Endpoints

### Cursor Exec Daemon
- **Endpoint**: `http://localhost:26053` (IPv6)
- **Status**: ✅ Listening
- **Service**: Cursor exec-daemon
- **Auth Token**: Present (in process)

### Unknown Service
- **Port**: `26500`
- **Status**: ⚠️ Listening but not responding to HTTP
- **Protocol**: Unknown

## Kubernetes Endpoints (Checked - Not Found)

### Kubernetes API Server
- `https://localhost:6443/api/v1` - ❌ Not accessible
- `http://localhost:6443/api/v1` - ❌ Not accessible

### Kubelet API
- `http://localhost:10250` - ❌ Not accessible (read-write)
- `http://localhost:10255` - ❌ Not accessible (read-only)

### Other Kubernetes Ports Checked
- `http://localhost:8080` - ❌ Not accessible (alternative API)
- `https://localhost:8443` - ❌ Not accessible (HTTPS API)
- `http://localhost:10256` - ❌ Not accessible (kube-proxy)
- `http://localhost:9099` - ❌ Not accessible (Calico)
- `http://localhost:2379` - ❌ Not accessible (etcd)
- `http://localhost:6666` - ❌ Not accessible (etcd)
- `http://localhost:4194` - ❌ Not accessible (cAdvisor)
- `http://localhost:6782` - ❌ Not accessible (Weave)
- `http://localhost:6783` - ❌ Not accessible (Weave)
- `http://localhost:6784` - ❌ Not accessible (Weave)

## External IP Addresses

### Public IP Addresses (from ifconfig.me)
- **IP 1**: `3.148.63.27` (first check)
- **IP 2**: `3.132.104.87` (second check)
- **IP 3**: `18.118.234.62` (third check)
- **IP 4**: `3.139.111.226` (fourth check)
- **Note**: IP rotates (likely NAT gateway/load balancer)

### IP Info Details
- **Location**: Columbus, Ohio, US
- **Provider**: Amazon.com, Inc. (AWS)
- **Hostname**: `ec2-3-148-63-27.us-east-2.compute.amazonaws.com`
- **Region**: us-east-2 (Ohio)
- **Timezone**: America/New_York

## Socket Paths (Unix Domain Sockets)

### Containerd Sockets
- `/run/containerd/containerd.sock` - Main containerd socket
- `/run/containerd/containerd.sock.ttrpc` - TTRPC socket
- **Status**: ✅ Accessible from container via `/host` mount
- **Permissions**: `0660` (root:root)

### Docker Socket
- `/var/run/docker.sock` - ❌ Not found (not mounted)
- **Note**: Docker API accessible via HTTP instead

## GitHub Repository URLs

### Cloned Repository
- **Repository**: `https://github.com/cyberark/kubernetes-rbac-audit.git`
- **Status**: ✅ Cloned to `/workspace/kubernetes-rbac-audit/`
- **Purpose**: Kubernetes RBAC auditing tool

## File System Paths (Accessible via Container)

### Host Filesystem (via /host mount)
- `/host/run/containerd/containerd.sock` - Containerd socket
- `/host/etc/hosts` - Host hosts file
- `/host/etc/os-release` - OS information
- `/host/proc/1/cmdline` - Init process
- `/host/var/lib/docker/` - Docker data directory

## Summary by Category

### ✅ Accessible Endpoints
1. `http://localhost:2375` - Docker API (unencrypted)
2. `http://172.17.0.1:2375` - Docker API via bridge network
3. `http://localhost:26053` - Cursor exec-daemon
4. `public.ecr.aws/k0i0n2g5/cursorenvironments/universal:default-5ab0560` - Container image
5. `docker.io` - Docker Hub registry
6. `/run/containerd/containerd.sock` - Containerd socket (via mount)

### ❌ Not Accessible (Checked)
- All Kubernetes endpoints (6443, 10250, 10255, etc.)
- Port 26500 (listening but not HTTP)

### ⚠️ Security Concerns
1. **Unencrypted Docker API** on port 2375
2. **Containerd socket accessible** from privileged container
3. **Public IP rotation** (NAT gateway/load balancer)

## Network Architecture

```
Internet
  ↓
AWS NAT Gateway/Load Balancer (IP rotates)
  ↓
EC2 Instance (3.x.x.x / 18.x.x.x)
  ↓
Docker Bridge Network (172.17.0.0/16)
  ├── 172.17.0.1 (Gateway/Docker Daemon)
  └── 172.17.0.2 (Container)
```

## Quick Reference

### Most Important URLs
1. **Docker API**: `http://localhost:2375`
2. **Container Registry**: `public.ecr.aws/k0i0n2g5/cursorenvironments/universal:default-5ab0560`
3. **Docker Hub**: `https://index.docker.io/v1/`
4. **GitHub Repo**: `https://github.com/cyberark/kubernetes-rbac-audit.git`

### Network Addresses
- **Docker Gateway**: `172.17.0.1`
- **Test Container**: `172.17.0.2`
- **Public IP Range**: `3.x.x.x`, `18.x.x.x` (rotates)

### Socket Paths
- **Containerd**: `/run/containerd/containerd.sock`
- **Containerd TTRPC**: `/run/containerd/containerd.sock.ttrpc`

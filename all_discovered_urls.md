# All Discovered URLs and Endpoints
Generated: 2025-12-03

## Docker API Endpoints

### Docker Daemon API (Unencrypted)
- **Primary Endpoint**: `http://localhost:2375`
- **Network Gateway Access**: `http://172.17.0.1:2375` (accessible from bridge network containers)
- **Status**: ✅ Active and accessible
- **Security**: ⚠️ Unencrypted (security risk)

### Docker API Endpoints Used
- `http://localhost:2375/containers/json?all=true` - List all containers
- `http://localhost:2375/containers/json` - List running containers
- `http://localhost:2375/images/json` - List all images
- `http://localhost:2375/info` - Docker system information
- `http://localhost:2375/containers/{id}/json` - Container details
- `http://localhost:2375/containers/create` - Create container (POST)
- `http://localhost:2375/containers/{id}/start` - Start container (POST)
- `http://localhost:2375/containers/{id}/exec` - Create exec instance (POST)
- `http://localhost:2375/exec/{id}/start` - Start exec instance (POST)
- `http://localhost:2375/events` - Docker events stream
- `http://localhost:2375/networks` - List networks
- `http://localhost:2375/networks/{name}` - Network details
- `http://localhost:2375/volumes` - List volumes
- `http://localhost:2375/images/create?fromImage={image}` - Pull image (POST)

## Container Registry URLs

### AWS ECR (Elastic Container Registry)
- **Registry**: `public.ecr.aws`
- **Image Pulled**: `public.ecr.aws/k0i0n2g5/cursorenvironments/universal:default-5ab0560`
- **Full URL**: `https://public.ecr.aws/k0i0n2g5/cursorenvironments/universal:default-5ab0560`
- **Digest**: `sha256:0caab109222dc93944cbcd9f321580d25614f22de9a0ab18ba96f73349e97959`
- **Status**: ✅ Used (Cursor environment image)

### Docker Hub
- **Registry**: `docker.io` / `index.docker.io`
- **Image Pulled**: `busybox:latest`
- **Full URL**: `https://index.docker.io/v1/` (configured as default)
- **Image**: `library/busybox:latest`
- **Digest**: `sha256:e3652a00a2fabd16ce889f0aa32c38eec347b997e73bd09e69c962ec7f8732ee`
- **Status**: ✅ Used

## Network Services & Ports

### Active Services
- **Docker API**: `http://localhost:2375` ✅ Active
- **Cursor Exec Daemon**: `http://localhost:26053` ✅ Active (IPv6)
- **Unknown Service**: `http://localhost:26500` ⚠️ Listening but not responding

### Kubernetes Ports (Checked - Not Active)
- `https://localhost:6443` - Kubernetes API Server ❌ Not accessible
- `http://localhost:8080` - Kubernetes API (alternative) ❌ Not accessible
- `https://localhost:8443` - Kubernetes API HTTPS ❌ Not accessible
- `http://localhost:10250` - Kubelet API ❌ Not accessible
- `http://localhost:10255` - Kubelet Read-only API ❌ Not accessible
- `http://localhost:10256` - Kube-proxy ❌ Not accessible
- `http://localhost:9099` - Calico ❌ Not accessible
- `http://localhost:2379` - etcd ❌ Not accessible
- `http://localhost:6666` - etcd (alternative) ❌ Not accessible
- `http://localhost:4194` - cAdvisor ❌ Not accessible
- `http://localhost:6782` - Weave Net ❌ Not accessible
- `http://localhost:6783` - Weave Net ❌ Not accessible
- `http://localhost:6784` - Weave Net ❌ Not accessible

## External IP Addresses

### Public IP Addresses (Rotating)
- `3.148.63.27` - AWS EC2 instance (us-east-2)
- `3.132.104.87` - AWS EC2 instance (us-east-2)
- `18.118.234.62` - AWS EC2 instance (us-east-2)
- `3.139.111.226` - AWS EC2 instance (us-east-2)

**IP Info Service**: `https://ipinfo.io` - Used for IP geolocation
**IP Check Service**: `http://ifconfig.me` - Used for IP detection

## Docker Network IPs

### Bridge Network
- **Subnet**: `172.17.0.0/16`
- **Gateway**: `172.17.0.1` (Docker bridge)
- **Container IPs**:
  - `172.17.0.2` - busybox container (boring_pasteur)
  - `172.17.0.3` - Stale ARP entry
  - `172.17.0.4` - Stale ARP entry
  - `172.17.0.5` - Stale ARP entry

### Docker API via Network
- `http://172.17.0.1:2375` - Docker API accessible from bridge network

## Socket Files (Unix Domain Sockets)

### Containerd
- `/run/containerd/containerd.sock` - Main containerd socket
- `/run/containerd/containerd.sock.ttrpc` - TTRPC socket
- **Accessible via**: `/host/run/containerd/containerd.sock` (from privileged container)

### Docker (Not Found)
- `/var/run/docker.sock` - ❌ Not found
- `/run/docker.sock` - ❌ Not found

## GitHub Repository

### Cloned Repository
- **Repository**: `https://github.com/cyberark/kubernetes-rbac-audit.git`
- **Status**: ✅ Cloned to `/workspace/kubernetes-rbac-audit/`
- **Purpose**: Kubernetes RBAC auditing tool

## Summary by Category

### ✅ Active & Accessible
1. `http://localhost:2375` - Docker API (unencrypted)
2. `http://172.17.0.1:2375` - Docker API via bridge network
3. `http://localhost:26053` - Cursor exec-daemon
4. `https://public.ecr.aws/` - AWS ECR registry
5. `https://index.docker.io/v1/` - Docker Hub registry

### ⚠️ Listening but Not Responding
1. `http://localhost:26500` - Unknown service

### ❌ Not Found / Not Accessible
1. All Kubernetes API endpoints (6443, 8080, 8443, etc.)
2. Docker socket files (`/var/run/docker.sock`)
3. Kubernetes config files
4. Kubernetes service account tokens

### 🔍 External Services Used
1. `https://ipinfo.io` - IP geolocation service
2. `http://ifconfig.me` - IP detection service
3. `https://github.com/cyberark/kubernetes-rbac-audit.git` - GitHub repository

## Security Notes

### High Risk
- **Unencrypted Docker API**: `http://localhost:2375` - Anyone with network access can control Docker
- **Network Accessible**: Docker API accessible from bridge network (`172.17.0.1:2375`)

### Medium Risk
- **Containerd Socket**: Accessible from privileged container via `/host` mount
- **Public IP Rotation**: Multiple public IPs suggest NAT gateway/load balancer

### Low Risk
- **Cursor Exec Daemon**: Internal service, not externally exposed
- **Container Registries**: Standard public registries (ECR, Docker Hub)

## Quick Reference

### Most Important URLs
```
Docker API:        http://localhost:2375
Docker API (net):  http://172.17.0.1:2375
ECR Registry:      https://public.ecr.aws/
Docker Hub:        https://index.docker.io/v1/
IP Info:           https://ipinfo.io
```

### Container Registry Images
```
Cursor Image:  public.ecr.aws/k0i0n2g5/cursorenvironments/universal:default-5ab0560
Busybox:       docker.io/library/busybox:latest
```

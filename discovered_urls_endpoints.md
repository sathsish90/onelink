# Discovered URLs and Endpoints
Consolidated Report - Generated: 2025-12-03

## Docker API Endpoints

### Docker Daemon API (Unencrypted)
- **Primary Endpoint**: `http://localhost:2375`
- **Gateway Access**: `http://172.17.0.1:2375` (accessible from bridge network)
- **Status**: ✅ Active and accessible
- **Security**: ⚠️ Unencrypted (security risk)

### Docker API Endpoints Used
- `http://localhost:2375/info` - System information
- `http://localhost:2375/containers/json` - List containers
- `http://localhost:2375/containers/json?all=true` - List all containers (including stopped)
- `http://localhost:2375/images/json` - List images
- `http://localhost:2375/networks` - List networks
- `http://localhost:2375/networks/bridge` - Bridge network details
- `http://localhost:2375/volumes` - List volumes
- `http://localhost:2375/containers/{id}/json` - Container details
- `http://localhost:2375/containers/create` - Create container
- `http://localhost:2375/containers/{id}/start` - Start container
- `http://localhost:2375/containers/{id}/exec` - Create exec instance
- `http://localhost:2375/exec/{id}/start` - Start exec instance
- `http://localhost:2375/events` - Docker events stream
- `http://localhost:2375/images/create?fromImage={image}` - Pull image

## Container Registry URLs

### AWS ECR (Elastic Container Registry)
- **Registry**: `public.ecr.aws`
- **Image Pulled**: `public.ecr.aws/k0i0n2g5/cursorenvironments/universal:default-5ab0560`
- **Full Image Path**: `public.ecr.aws/k0i0n2g5/cursorenvironments/universal:default-5ab0560`
- **Digest**: `sha256:0caab109222dc93944cbcd9f321580d25614f22de9a0ab18ba96f73349e97959`
- **Status**: ✅ Used (Cursor environment image)

### Docker Hub
- **Registry**: `docker.io` / `index.docker.io`
- **Default Index**: `https://index.docker.io/v1/`
- **Image Pulled**: `busybox:latest` (from `library/busybox`)
- **Digest**: `sha256:e3652a00a2fabd16ce889f0aa32c38eec347b997e73bd09e69c962ec7f8732ee`
- **Status**: ✅ Used

## Network Services & Ports

### Listening Services
- **Port 2375**: Docker daemon API (HTTP, unencrypted)
  - `http://localhost:2375`
  - `http://172.17.0.1:2375` (from bridge network)
  
- **Port 26053**: Cursor exec-daemon
  - `http://localhost:26053` (IPv6)
  - Status: ✅ Listening
  
- **Port 26500**: Unknown service
  - `http://localhost:26500`
  - Status: ⚠️ Listening but not responding to HTTP

### Kubernetes Ports (Checked - Not Accessible)
- **Port 6443**: Kubernetes API (HTTPS) - ❌ Not accessible
- **Port 8080**: Kubernetes API (HTTP) - ❌ Not accessible
- **Port 8443**: Kubernetes API alternative - ❌ Not accessible
- **Port 10250**: Kubelet API - ❌ Not accessible
- **Port 10255**: Kubelet read-only API - ❌ Not accessible
- **Port 10256**: Kube-proxy - ❌ Not accessible
- **Port 9099**: Calico - ❌ Not accessible
- **Port 2379**: etcd - ❌ Not accessible
- **Port 6666**: etcd alternative - ❌ Not accessible
- **Port 4194**: cAdvisor - ❌ Not accessible
- **Ports 6782-6784**: Weave - ❌ Not accessible

### Other Container Runtime Ports (Checked - Not Accessible)
- **Port 443**: HTTPS - ❌ Not accessible
- **Port 6666**: etcd - ❌ Not accessible
- **Port 4194**: cAdvisor - ❌ Not accessible

## External Services

### IP Information Services (Used)
- **ipinfo.io**: `http://ipinfo.io` - IP geolocation service
- **ifconfig.me**: `http://ifconfig.me` - IP address service

### Discovered Public IPs
- **IP 1**: `3.148.63.27` (first check)
- **IP 2**: `3.132.104.87` (second check)
- **IP 3**: `18.118.234.62` (third check)
- **IP 4**: `3.139.111.226` (fourth check)
- **Note**: IPs rotate (likely NAT gateway/load balancer)

### Host Information
- **Hostname**: `ec2-3-148-63-27.us-east-2.compute.amazonaws.com`
- **Location**: Columbus, Ohio, US (us-east-2)
- **Provider**: AWS (Amazon Web Services)
- **Instance Type**: EC2

## Socket Files (Unix Domain Sockets)

### Containerd Sockets
- `/run/containerd/containerd.sock` - Main containerd socket
- `/run/containerd/containerd.sock.ttrpc` - TTRPC socket
- **Access**: Via `/host/run/containerd/containerd.sock` from container

### Docker Socket (Not Found)
- `/var/run/docker.sock` - ❌ Not mounted/accessible
- `/run/containerd/containerd.sock` - ✅ Exists (used by Docker)

## GitHub Repositories

### Cloned Repository
- **Repository**: `https://github.com/cyberark/kubernetes-rbac-audit.git`
- **Status**: ✅ Cloned to `/workspace/kubernetes-rbac-audit/`

## Container Network IPs

### Docker Bridge Network (172.17.0.0/16)
- **Gateway**: `172.17.0.1` (Docker bridge)
- **Container IPs**:
  - `172.17.0.2` - boring_pasteur (busybox container)
  - `172.17.0.3` - Stale ARP entry (no active container)
  - `172.17.0.4` - Stale ARP entry (no active container)
  - `172.17.0.5` - Stale ARP entry (no active container)

### Host Network
- Cursor container uses host network mode (no bridge IP)

## Summary by Category

### Active & Accessible URLs
1. `http://localhost:2375` - Docker API (unencrypted)
2. `http://172.17.0.1:2375` - Docker API via gateway
3. `http://localhost:26053` - Cursor exec-daemon
4. `public.ecr.aws/k0i0n2g5/cursorenvironments/universal:default-5ab0560` - AWS ECR image
5. `docker.io/library/busybox:latest` - Docker Hub image
6. `https://github.com/cyberark/kubernetes-rbac-audit.git` - GitHub repo

### Listening But Not Responding
1. `http://localhost:26500` - Unknown service

### Not Found / Not Accessible
- All Kubernetes ports (6443, 8080, 8443, 10250, etc.)
- Docker socket (`/var/run/docker.sock`)
- Kubernetes config files
- Other container runtime APIs

## Security Notes

### High Risk
- ⚠️ **Unencrypted Docker API** on port 2375
- ⚠️ **Accessible from network** (not restricted to localhost)

### Medium Risk
- ⚠️ **Containerd socket accessible** via privileged container
- ⚠️ **Host filesystem mounted** in privileged container

### Low Risk
- ✅ Kubernetes ports not exposed
- ✅ Docker socket not mounted (good)
- ✅ Containerd socket has restrictive permissions

## Quick Reference

### Most Important URLs
```
Docker API:        http://localhost:2375
Docker Gateway:    http://172.17.0.1:2375
Cursor Daemon:     http://localhost:26053
AWS ECR Image:     public.ecr.aws/k0i0n2g5/cursorenvironments/universal:default-5ab0560
Docker Hub:        docker.io (index.docker.io/v1/)
```

### Network Ranges
```
Docker Bridge:     172.17.0.0/16
Gateway:           172.17.0.1
Container IPs:     172.17.0.2-172.17.0.5 (some stale)
```

### Socket Paths
```
Containerd:        /run/containerd/containerd.sock
Containerd TTRPC:  /run/containerd/containerd.sock.ttrpc
```

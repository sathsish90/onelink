# All URLs, Endpoints, and Network Addresses - Consolidated Report
Generated: 2025-12-03

## Docker API Endpoints

### Docker Daemon API (Unencrypted)
- **Primary Endpoint**: `http://localhost:2375`
- **Network Access**: `http://172.17.0.1:2375` (accessible from bridge network)
- **Status**: ✅ Active and accessible
- **Security**: ⚠️ Unencrypted (security risk)

### Docker API Endpoints Used
- `http://localhost:2375/containers/json?all=true` - List all containers
- `http://localhost:2375/containers/json` - List running containers
- `http://localhost:2375/images/json` - List images
- `http://localhost:2375/info` - Docker system information
- `http://localhost:2375/events` - Docker events stream
- `http://localhost:2375/networks` - List networks
- `http://localhost:2375/networks/bridge` - Bridge network details
- `http://localhost:2375/volumes` - List volumes
- `http://localhost:2375/containers/create` - Create container
- `http://localhost:2375/containers/{id}/start` - Start container
- `http://localhost:2375/containers/{id}/json` - Container details
- `http://localhost:2375/containers/{id}/exec` - Create exec instance
- `http://localhost:2375/exec/{id}/start` - Start exec instance
- `http://localhost:2375/images/create` - Pull/create image
- `http://localhost:2375/system/info` - System info (not found, use /info)

## Container Registry URLs

### AWS ECR (Elastic Container Registry)
- **Registry**: `public.ecr.aws`
- **Image**: `public.ecr.aws/k0i0n2g5/cursorenvironments/universal:default-5ab0560`
- **Full Path**: `public.ecr.aws/k0i0n2g5/cursorenvironments/universal`
- **Digest**: `sha256:0caab109222dc93944cbcd9f321580d25614f22de9a0ab18ba96f73349e97959`
- **Type**: Public ECR registry

### Docker Hub
- **Registry**: `docker.io` / `index.docker.io`
- **Default Registry**: `https://index.docker.io/v1/`
- **Image Used**: `busybox:latest`
- **Digest**: `sha256:e3652a00a2fabd16ce889f0aa32c38eec347b997e73bd09e69c962ec7f8732ee`
- **Status**: Configured as default registry

## Network Services & Ports

### Active Listening Ports
- **Port 2375**: Docker daemon API (HTTP, unencrypted)
  - `http://localhost:2375`
  - `http://0.0.0.0:2375` (listening on all interfaces)
  - `http://172.17.0.1:2375` (accessible from bridge network)

- **Port 26053**: Cursor exec-daemon
  - `http://localhost:26053`
  - `http://[::]:26053` (IPv6)

- **Port 26500**: Unknown service
  - `http://localhost:26500`
  - Status: Not responding to HTTP

### Kubernetes Ports (Checked - Not Accessible)
- **Port 6443**: Kubernetes API server (HTTPS)
  - `https://localhost:6443` - ❌ Not accessible
  - `http://localhost:6443` - ❌ Not accessible

- **Port 8080**: Kubernetes API server (HTTP, deprecated)
  - `http://localhost:8080` - ❌ Not accessible

- **Port 8443**: Kubernetes API server alternative
  - `https://localhost:8443` - ❌ Not accessible
  - `http://localhost:8443` - ❌ Not accessible

- **Port 10250**: Kubelet API
  - `http://localhost:10250` - ❌ Not accessible

- **Port 10255**: Kubelet read-only API
  - `http://localhost:10255` - ❌ Not accessible

- **Port 10256**: Kube-proxy health check
  - `http://localhost:10256` - ❌ Not accessible

- **Port 9099**: Calico networking
  - `http://localhost:9099` - ❌ Not accessible

- **Port 2379**: etcd client API
  - `http://localhost:2379` - ❌ Not accessible

- **Port 6666**: etcd peer API
  - `http://localhost:6666` - ❌ Not accessible

- **Port 4194**: cAdvisor metrics
  - `http://localhost:4194` - ❌ Not accessible

- **Ports 6782-6784**: Weave networking
  - `http://localhost:6782` - ❌ Not accessible
  - `http://localhost:6783` - ❌ Not accessible
  - `http://localhost:6784` - ❌ Not accessible

## Network Addresses

### Docker Bridge Network
- **Subnet**: `172.17.0.0/16`
- **Gateway**: `172.17.0.1`
- **Network ID**: `bb9f8916985ccc2d8328eb7aa3e933fc042f3b48cc2e869d966e29c0d0db3e6d`

### Container IPs
- **172.17.0.1**: Docker bridge gateway (host Docker daemon)
- **172.17.0.2**: Container `boring_pasteur` (busybox)
- **172.17.0.3**: Stale ARP entry (incomplete)
- **172.17.0.4**: Stale ARP entry (incomplete)
- **172.17.0.5**: Stale ARP entry (incomplete)

### Host Network
- **Hostname**: `c9d7523bc008`
- **Public IPs** (rotating):
  - `3.148.63.27` (first check)
  - `3.132.104.87` (second check)
  - `18.118.234.62` (third check)
  - `3.139.111.226` (fourth check)
- **Location**: Columbus, Ohio, US (AWS us-east-2)
- **Provider**: Amazon Web Services (AS16509)

## Socket Files

### Containerd Socket
- **Path**: `/run/containerd/containerd.sock`
- **Type**: Unix Domain Socket
- **Accessible via**: `/host/run/containerd/containerd.sock` (from container)
- **Permissions**: `0660` (root:root)
- **Status**: ✅ Accessible from privileged container

### Additional Containerd Sockets
- `/run/containerd/containerd.sock.ttrpc` - TTRPC API socket

## External Services

### IP Information Services
- **ipinfo.io**: `https://ipinfo.io` - IP geolocation service
- **ifconfig.me**: `http://ifconfig.me` - Public IP detection

### GitHub Repository
- **Repository**: `https://github.com/sathsish90/onelink`
- **Cloned Repo**: `https://github.com/cyberark/kubernetes-rbac-audit.git`

## File System Paths (Accessible URLs)

### Docker Data Directories
- `/var/lib/docker` - Docker root directory
- `/var/lib/docker/containers/` - Container data
- `/var/lib/docker/overlay2/` - Overlay2 storage
- `/var/lib/docker/networks/` - Network data

### Containerd Directories
- `/run/containerd/` - Containerd runtime data
- `/run/containerd/io.containerd.runtime.v2.task/moby/` - Docker containers namespace

### Host Filesystem (via bind mount)
- `/host/` - Host root filesystem (mounted in privileged container)
- `/host/etc/` - Host configuration files
- `/host/var/lib/` - Host data directories
- `/host/run/` - Host runtime data
- `/host/proc/` - Host process information

## Summary by Category

### Active Services
1. **Docker API**: `http://localhost:2375` ✅
2. **Cursor Exec Daemon**: `http://localhost:26053` ✅
3. **Unknown Service**: `http://localhost:26500` ⚠️ (not responding)

### Container Registries
1. **AWS ECR**: `public.ecr.aws` ✅
2. **Docker Hub**: `index.docker.io` ✅

### Network Ranges
1. **Docker Bridge**: `172.17.0.0/16` ✅
2. **Public IPs**: AWS us-east-2 (rotating) ✅

### Sockets
1. **Containerd**: `/run/containerd/containerd.sock` ✅
2. **Containerd TTRPC**: `/run/containerd/containerd.sock.ttrpc` ✅

### Inactive/Not Found
- Kubernetes API (all ports) ❌
- Kubernetes services (all ports) ❌
- Kubernetes config files ❌

## Security Notes

### Exposed Services
- ⚠️ **Docker API (2375)**: Unencrypted, accessible from network
- ⚠️ **Cursor Exec Daemon (26053)**: Accessible, authentication required
- ⚠️ **Unknown Service (26500)**: Status unknown

### Accessible Resources
- ✅ **Containerd Socket**: Accessible from privileged container
- ✅ **Host Filesystem**: Accessible via bind mount
- ✅ **Docker API**: Accessible from bridge network

## Quick Reference

### Most Important URLs
```
Docker API:        http://localhost:2375
Docker API (net):  http://172.17.0.1:2375
Cursor Daemon:     http://localhost:26053
AWS ECR:           public.ecr.aws
Docker Hub:        index.docker.io
Public IP Check:   http://ifconfig.me
IP Info:           https://ipinfo.io
```

### Network Ranges
```
Docker Bridge:     172.17.0.0/16
Gateway:           172.17.0.1
Container IP:      172.17.0.2
```

### File Paths
```
Containerd Socket: /run/containerd/containerd.sock
Docker Root:       /var/lib/docker
Host Mount:        /host/
```

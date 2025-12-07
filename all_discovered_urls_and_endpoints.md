# All Discovered URLs, Endpoints, and Network Addresses
Generated: 2025-12-03

## Docker API Endpoints

### Docker Daemon API
- **Primary Endpoint**: `http://localhost:2375`
- **Bridge Network Access**: `http://172.17.0.1:2375`
- **Status**: ✅ Accessible (unencrypted)
- **Security**: ⚠️ Unencrypted HTTP (security risk)

### Docker API Endpoints Used
- `http://localhost:2375/info` - System information
- `http://localhost:2375/containers/json?all=true` - List all containers
- `http://localhost:2375/containers/{id}/json` - Container details
- `http://localhost:2375/containers/create` - Create container
- `http://localhost:2375/containers/{id}/start` - Start container
- `http://localhost:2375/containers/{id}/exec` - Create exec instance
- `http://localhost:2375/exec/{id}/start` - Start exec instance
- `http://localhost:2375/images/json` - List images
- `http://localhost:2375/images/create?fromImage={image}` - Pull image
- `http://localhost:2375/networks` - List networks
- `http://localhost:2375/networks/{network}` - Network details
- `http://localhost:2375/volumes` - List volumes
- `http://localhost:2375/events` - Docker events stream
- `http://localhost:2375/system/info` - System info (404 - use /info instead)

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

## Network Services & Ports

### Listening Services
- **Port 2375**: Docker daemon API (HTTP, unencrypted)
- **Port 26053**: Cursor exec-daemon (IPv6)
- **Port 26500**: Unknown service (not responding to HTTP)

### Kubernetes Ports (Checked - Not Accessible)
- **Port 6443**: Kubernetes API server (HTTPS) - ❌ Not accessible
- **Port 8080**: Kubernetes API server (HTTP) - ❌ Not accessible
- **Port 8443**: Kubernetes API server (HTTPS alt) - ❌ Not accessible
- **Port 10250**: Kubelet API - ❌ Not accessible
- **Port 10255**: Kubelet read-only API - ❌ Not accessible
- **Port 10256**: Kube-proxy metrics - ❌ Not accessible
- **Port 9099**: Calico networking - ❌ Not accessible
- **Port 2379**: etcd client API - ❌ Not accessible
- **Port 6666**: etcd peer API - ❌ Not accessible
- **Port 4194**: cAdvisor metrics - ❌ Not accessible
- **Ports 6782-6784**: Weave networking - ❌ Not accessible
- **Ports 30000-32767**: Kubernetes NodePort range - ❌ Not accessible
- **Port 44134**: Unknown Kubernetes port - ❌ Not accessible

## Network Addresses

### Docker Bridge Network
- **Subnet**: `172.17.0.0/16`
- **Gateway**: `172.17.0.1`
- **Container IPs**:
  - `172.17.0.2` - boring_pasteur (busybox container)
  - `172.17.0.3` - Stale ARP entry (inactive)
  - `172.17.0.4` - Stale ARP entry (inactive)
  - `172.17.0.5` - Stale ARP entry (inactive)

### Host Network
- **Hostname**: `c9d7523bc008`
- **Public IP**: `3.148.63.27`, `3.132.104.87`, `18.118.234.62`, `3.139.111.226` (rotating)
- **Hostname (AWS)**: `ec2-3-148-63-27.us-east-2.compute.amazonaws.com`
- **Location**: Columbus, Ohio, US (us-east-2)

### Loopback
- `127.0.0.1` - localhost
- `::1` - IPv6 localhost

## Socket Files (Unix Domain Sockets)

### Containerd Sockets
- `/run/containerd/containerd.sock` - Main containerd socket
- `/run/containerd/containerd.sock.ttrpc` - TTRPC API socket
- **Access**: Readable/Writable from privileged container via `/host` mount

### Docker Sockets (Not Found)
- `/var/run/docker.sock` - ❌ Not found
- `/run/containerd/containerd.sock` - ✅ Found (used by Docker)

## File System Paths (Accessible via Bind Mount)

### Host Filesystem Access
- **Bind Mount**: `/:/host` (entire host root filesystem)
- **Accessible Paths**:
  - `/host/etc/` - Host configuration
  - `/host/run/` - Runtime data
  - `/host/var/lib/docker/` - Docker data
  - `/host/proc/` - Process information
  - `/host/sys/` - System information
  - `/host/usr/bin/` - Host binaries
  - `/host/bin/` - Host binaries

## GitHub Repository

### Repository URL
- **Repository**: `https://github.com/sathsish90/onelink`
- **Remote**: `origin`
- **Branch**: `main`
- **Authentication**: GitHub token configured (via git config)

## External Services

### IP Information Services
- `http://ipinfo.io` - IP geolocation service
- `http://ifconfig.me` - IP address service

### Network Discovery
- **AWS Region**: us-east-2 (Ohio)
- **Provider**: Amazon Web Services (AS16509)
- **Instance Type**: EC2

## Summary by Category

### ✅ Accessible Endpoints
1. `http://localhost:2375` - Docker API
2. `http://172.17.0.1:2375` - Docker API (via bridge)
3. `http://localhost:26053` - Cursor exec-daemon
4. `/run/containerd/containerd.sock` - Containerd socket

### ❌ Not Accessible (Checked)
- All Kubernetes ports (6443, 8080, 8443, 10250, etc.)
- Port 26500 (no HTTP response)
- Standard container registry ports (5000, etc.)

### 🔒 Security Concerns
- **Unencrypted Docker API** on port 2375
- **Public IP rotation** (multiple IPs observed)
- **Privileged container** with host filesystem access
- **Containerd socket** accessible from privileged container

## Quick Reference

### Most Important URLs
```
Docker API:        http://localhost:2375
Docker API (bridge): http://172.17.0.1:2375
Containerd Socket: /run/containerd/containerd.sock
ECR Registry:      public.ecr.aws
Docker Hub:        docker.io
GitHub Repo:       https://github.com/sathsish90/onelink
```

### Network Ranges
```
Docker Bridge:     172.17.0.0/16
Gateway:           172.17.0.1
Container IPs:     172.17.0.2-5
Public IPs:        3.x.x.x, 18.x.x.x (AWS)
```

### Ports Summary
```
2375   - Docker API (HTTP, unencrypted) ✅
26053  - Cursor exec-daemon ✅
26500  - Unknown service ⚠️
6443   - Kubernetes API (not accessible) ❌
10250  - Kubelet (not accessible) ❌
```

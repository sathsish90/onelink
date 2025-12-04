# Consolidated URLs, Endpoints, and Network Addresses
Generated: 2025-12-03

## Docker API Endpoints

### Docker Daemon API
- **Primary Endpoint**: `http://localhost:2375`
- **Gateway Access**: `http://172.17.0.1:2375`
- **Status**: ✅ Active and accessible
- **Security**: ⚠️ Unencrypted (no TLS)
- **Access**: Available from host and containers on bridge network

### Docker API Endpoints Used
- `http://localhost:2375/containers/json` - List containers
- `http://localhost:2375/containers/json?all=true` - List all containers (including stopped)
- `http://localhost:2375/containers/{id}/json` - Container details
- `http://localhost:2375/containers/create` - Create container
- `http://localhost:2375/containers/{id}/start` - Start container
- `http://localhost:2375/containers/{id}/stop` - Stop container
- `http://localhost:2375/containers/{id}/exec` - Create exec instance
- `http://localhost:2375/exec/{id}/start` - Start exec instance
- `http://localhost:2375/images/json` - List images
- `http://localhost:2375/images/create` - Pull image
- `http://localhost:2375/info` - Docker system information
- `http://localhost:2375/events` - Docker events stream
- `http://localhost:2375/networks` - List networks
- `http://localhost:2375/networks/{id}` - Network details
- `http://localhost:2375/volumes` - List volumes

## Container Registry URLs

### AWS ECR (Elastic Container Registry)
- **Public ECR**: `public.ecr.aws/k0i0n2g5/cursorenvironments/universal:default-5ab0560`
- **Image Digest**: `sha256:0caab109222dc93944cbcd9f321580d25614f22de9a0ab18ba96f73349e97959`
- **Full Image Path**: `public.ecr.aws/k0i0n2g5/cursorenvironments/universal@sha256:0caab109222dc93944cbcd9f321580d25614f22de9a0ab18ba96f73349e97959`

### Docker Hub
- **Default Registry**: `https://index.docker.io/v1/`
- **Busybox Image**: `busybox:latest`
- **Image Digest**: `sha256:e3652a00a2fabd16ce889f0aa32c38eec347b997e73bd09e69c962ec7f8732ee`
- **Full Image Path**: `busybox@sha256:e3652a00a2fabd16ce889f0aa32c38eec347b997e73bd09e69c962ec7f8732ee`

## Network Addresses

### Docker Bridge Network
- **Subnet**: `172.17.0.0/16`
- **Gateway**: `172.17.0.1`
- **Network ID**: `bb9f8916985ccc2d8328eb7aa3e933fc042f3b48cc2e869d966e29c0d0db3e6d`

### Container IPs
- **172.17.0.1** - Docker bridge gateway (host Docker daemon)
  - Docker API: `http://172.17.0.1:2375` ✅ Accessible
- **172.17.0.2** - Container: `boring_pasteur` (busybox)
  - MAC: `ca:74:ce:ca:04:94`
  - Status: Running
- **172.17.0.3** - Stale ARP entry (no active container)
- **172.17.0.4** - Stale ARP entry (no active container)
- **172.17.0.5** - Stale ARP entry (no active container)

### Host Network
- **Hostname**: `c9d7523bc008`
- **Public IP**: `3.148.63.27`, `3.132.104.87`, `18.118.234.62`, `3.139.111.226` (rotating)
- **Hostname (AWS)**: `ec2-3-148-63-27.us-east-2.compute.amazonaws.com`
- **Location**: Columbus, Ohio, US (us-east-2)

## Service Endpoints

### Listening Ports
- **2375** - Docker daemon API (unencrypted)
  - `http://localhost:2375`
  - `http://172.17.0.1:2375`
- **26053** - Cursor exec-daemon
  - `http://localhost:26053` (IPv6)
- **26500** - Unknown service (not responding to HTTP)

### Kubernetes Ports (Checked - Not Accessible)
- **6443** - Kubernetes API Server (HTTPS)
  - `https://localhost:6443` ❌ Not accessible
- **8080** - Kubernetes API Server (HTTP alternative)
  - `http://localhost:8080` ❌ Not accessible
- **8443** - Kubernetes API Server (HTTPS alternative)
  - `https://localhost:8443` ❌ Not accessible
- **10250** - Kubelet API
  - `http://localhost:10250` ❌ Not accessible
- **10255** - Kubelet read-only API
  - `http://localhost:10255` ❌ Not accessible
- **10256** - Kube-proxy health check
  - `http://localhost:10256` ❌ Not accessible
- **9099** - Calico health check
  - `http://localhost:9099` ❌ Not accessible
- **2379** - etcd client API
  - `http://localhost:2379` ❌ Not accessible
- **6666** - etcd peer API
  - `http://localhost:6666` ❌ Not accessible
- **4194** - cAdvisor
  - `http://localhost:4194` ❌ Not accessible
- **6782-6784** - Weave Net
  - `http://localhost:6782` ❌ Not accessible
  - `http://localhost:6783` ❌ Not accessible
  - `http://localhost:6784` ❌ Not accessible

## Socket Paths (Unix Domain Sockets)

### Containerd Sockets
- `/run/containerd/containerd.sock` - Main containerd socket
- `/run/containerd/containerd.sock.ttrpc` - TTRPC socket
- `/var/run/containerd/containerd.sock` - Alternative path (not found)

### Docker Sockets
- `/var/run/docker.sock` - Docker socket (not found, using HTTP API instead)
- `/run/containerd/containerd.sock` - Used by Docker via containerd

## Container Identifiers

### Running Containers
1. **pod-z5ofsiursvfwxjp5kkrmnvik7q-f3268d02**
   - ID: `71fd15a086dc1a7bf67cf84d079bb3b0f0555cc2c4c536e0d2a413ea9fbe6bfe`
   - Image: `public.ecr.aws/k0i0n2g5/cursorenvironments/universal:default-5ab0560`
   - Network: host mode

2. **boring_pasteur**
   - ID: `7f764d3a9d4287b38959f9470bb739d4b65eb179ff881314d1a62c62f071820a`
   - Image: `busybox:latest`
   - IP: `172.17.0.2`
   - Network: bridge

### Stopped Containers
1. **serene_turing**
   - ID: `ff0b8c2c8e97b3c8e972d7c53bde706a8439947f15f67f2245365da54777f923`
   - Image: `busybox:latest`
   - Status: Exited

## Image Identifiers

### Docker Images
1. **Cursor Environment Image**
   - Repository: `public.ecr.aws/k0i0n2g5/cursorenvironments/universal:default-5ab0560`
   - Image ID: `sha256:19317553aab8bca0f715328f2bc7b6331f38686cdb918e81f92063eab9dfa57d`
   - Digest: `sha256:0caab109222dc93944cbcd9f321580d25614f22de9a0ab18ba96f73349e97959`
   - Size: ~5.0 GB

2. **Busybox Image**
   - Repository: `busybox:latest`
   - Image ID: `sha256:08ef35a1c3f050afbbd64194ffd1b8d5878659f5491567f26d1c814513ae9649`
   - Digest: `sha256:e3652a00a2fabd16ce889f0aa32c38eec347b997e73bd09e69c962ec7f8732ee`
   - Size: ~4.2 MB

## Network Information URLs

### IP Information Services
- `http://ipinfo.io` - IP geolocation service
- `http://ifconfig.me` - Public IP service

### Discovered Public IPs
- `3.148.63.27` (first check)
- `3.132.104.87` (second check)
- `18.118.234.62` (third check)
- `3.139.111.226` (fourth check)

## Docker Network IDs

### Networks
- **bridge**: `bb9f8916985ccc2d8328eb7aa3e933fc042f3b48cc2e869d966e29c0d0db3e6d`
- **host**: `ff01284d0b57487a2b6ddfa2312529051e39b7f63c969f5e982d82a8d293385f`
- **none**: `09a5d64dcef9c184b3aa4f3d4eea11fecc8089601d1cf9648a48a53711c9a346`

## GitHub Repository

### Cloned Repository
- **Repository**: `https://github.com/cyberark/kubernetes-rbac-audit.git`
- **Location**: `/workspace/kubernetes-rbac-audit/`

## Summary by Category

### Active HTTP Endpoints
1. `http://localhost:2375` - Docker API (unencrypted)
2. `http://172.17.0.1:2375` - Docker API via gateway
3. `http://localhost:26053` - Cursor exec-daemon (IPv6)

### Container Registries
1. `public.ecr.aws/k0i0n2g5/cursorenvironments/universal` - AWS ECR
2. `https://index.docker.io/v1/` - Docker Hub registry
3. `busybox` - Docker Hub library

### Network Addresses
1. `172.17.0.0/16` - Docker bridge subnet
2. `172.17.0.1` - Docker gateway
3. `172.17.0.2` - Active container IP
4. Multiple public IPs (AWS EC2, rotating)

### Socket Paths
1. `/run/containerd/containerd.sock` - Containerd socket
2. `/run/containerd/containerd.sock.ttrpc` - Containerd TTRPC socket

### External Services
1. `http://ipinfo.io` - IP information service
2. `http://ifconfig.me` - Public IP service

## Security Notes

### Unencrypted Endpoints
- ⚠️ `http://localhost:2375` - Docker API (should use TLS)
- ⚠️ `http://172.17.0.1:2375` - Docker API via gateway (should use TLS)

### Accessible from Containers
- ✅ Docker API accessible from bridge network containers
- ✅ Containerd socket accessible via host mount
- ⚠️ Privileged containers can access host resources

## Quick Reference

### Most Important URLs
1. **Docker API**: `http://localhost:2375`
2. **Docker Gateway**: `http://172.17.0.1:2375`
3. **Container Registry (ECR)**: `public.ecr.aws/k0i0n2g5/cursorenvironments/universal`
4. **Container Registry (Docker Hub)**: `https://index.docker.io/v1/`

### Network Ranges
- **Docker Bridge**: `172.17.0.0/16`
- **Gateway**: `172.17.0.1`
- **Container IPs**: `172.17.0.2+`

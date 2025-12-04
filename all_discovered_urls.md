# All Discovered URLs and Endpoints
Generated: 2025-12-03

## Docker API Endpoints

### Primary Docker Daemon API
- **http://localhost:2375** - Docker daemon API (unencrypted)
  - Status: ✅ Accessible
  - Access: From host and containers (via 172.17.0.1:2375)
  - Security: ⚠️ Unencrypted (security risk)

### Docker API Endpoints (via localhost:2375)
- **http://localhost:2375/info** - Docker system information
- **http://localhost:2375/containers/json** - List containers
- **http://localhost:2375/containers/json?all=true** - List all containers (including stopped)
- **http://localhost:2375/containers/{id}/json** - Container details
- **http://localhost:2375/containers/create** - Create container (POST)
- **http://localhost:2375/containers/{id}/start** - Start container (POST)
- **http://localhost:2375/containers/{id}/stop** - Stop container (POST)
- **http://localhost:2375/containers/{id}/exec** - Create exec instance (POST)
- **http://localhost:2375/exec/{id}/start** - Start exec instance (POST)
- **http://localhost:2375/images/json** - List images
- **http://localhost:2375/images/create** - Pull image (POST)
- **http://localhost:2375/networks** - List networks
- **http://localhost:2375/networks/{id}** - Network details
- **http://localhost:2375/volumes** - List volumes
- **http://localhost:2375/events** - Docker events stream
- **http://localhost:2375/system/info** - System info (returns 404, use /info instead)

### Docker API via Bridge Network
- **http://172.17.0.1:2375** - Docker daemon API (accessible from containers)
  - Status: ✅ Accessible from bridge network containers
  - Same as localhost:2375, accessible via Docker bridge gateway

## Network Services & Ports

### Listening Ports (from netstat/ss)
- **tcp://0.0.0.0:2375** - Docker daemon API (unencrypted)
  - Status: ✅ Listening
  - Access: Public (0.0.0.0)
  
- **tcp://0.0.0.0:26500** - Unknown service
  - Status: ⚠️ Listening but not responding to HTTP
  - Access: Public (0.0.0.0)

- **tcp6://:::26053** - Cursor exec-daemon
  - Status: ✅ Listening
  - Access: IPv6 all interfaces

### Kubernetes Ports (Checked - Not Accessible)
- **https://localhost:6443** - Kubernetes API server (not accessible)
- **http://localhost:8080** - Kubernetes API alternative (not accessible)
- **https://localhost:8443** - Kubernetes API HTTPS (not accessible)
- **http://localhost:10250** - Kubelet API (not accessible)
- **http://localhost:10255** - Kubelet read-only API (not accessible)
- **http://localhost:10256** - Kube-proxy health (not accessible)
- **http://localhost:9099** - Calico metrics (not accessible)
- **http://localhost:2379** - etcd client (not accessible)
- **http://localhost:6666** - etcd peer (not accessible)
- **http://localhost:4194** - cAdvisor (not accessible)
- **http://localhost:6782** - Weave Net (not accessible)
- **http://localhost:6783** - Weave Net (not accessible)
- **http://localhost:6784** - Weave Net (not accessible)

### Other Network Endpoints
- **http://localhost:26053** - Cursor exec-daemon
  - Status: ✅ Listening
  - Purpose: Cursor IDE exec daemon service

## Container Registry URLs

### AWS ECR (Elastic Container Registry)
- **public.ecr.aws/k0i0n2g5/cursorenvironments/universal:default-5ab0560**
  - Type: Public ECR repository
  - Image: Cursor environment container
  - Digest: sha256:0caab109222dc93944cbcd9f321580d25614f22de9a0ab18ba96f73349e97959
  - Size: ~5.0 GB

### Docker Hub
- **docker.io/library/busybox:latest**
  - Type: Docker Hub public registry
  - Image: busybox
  - Digest: sha256:e3652a00a2fabd16ce889f0aa32c38eec347b997e73bd09e69c962ec7f8732ee
  - Size: ~4.2 MB
  - Registry API: https://index.docker.io/v1/

## External IP Addresses

### Public IP Addresses (from ifconfig.me)
- **3.148.63.27** - First check
- **3.132.104.87** - Second check  
- **18.118.234.62** - Third check
- **3.139.111.226** - Fourth check

**Note**: IP addresses rotate, indicating NAT gateway/load balancer

### IP Info Service
- **http://ipinfo.io** - IP geolocation service
  - Response: JSON with location, ISP, etc.
  - Location: Columbus, Ohio, US
  - Provider: AWS (Amazon.com, Inc.)
  - Region: us-east-2

## Internal Network Addresses

### Docker Bridge Network
- **172.17.0.0/16** - Docker bridge subnet
- **172.17.0.1** - Docker bridge gateway (host)
- **172.17.0.2** - busybox container (boring_pasteur)

### Container IPs
- **172.17.0.2** - Our test container (boring_pasteur)
  - MAC: ca:74:ce:ca:04:94
  - Network: bridge
  - Gateway: 172.17.0.1

## Socket Files (Unix Domain Sockets)

### Containerd Sockets
- **/run/containerd/containerd.sock** - Main containerd socket
  - Type: Unix Domain Socket
  - Permissions: 0660 (root:root)
  - Accessible: ✅ Via /host mount (root user)

- **/run/containerd/containerd.sock.ttrpc** - TTRPC socket
  - Type: Unix Domain Socket
  - Purpose: containerd TTRPC API

### Docker Socket (Not Found)
- **/var/run/docker.sock** - ❌ Not found
- **/run/docker.sock** - ❌ Not found

## File System Paths (via /host mount)

### Docker Data
- **/host/var/lib/docker/** - Docker root directory
- **/host/var/lib/docker/containers/** - Container data
- **/host/var/lib/docker/overlay2/** - Overlay2 storage driver data

### Containerd Data
- **/host/run/containerd/** - Containerd runtime data
- **/host/run/containerd/io.containerd.runtime.v2.task/moby/** - Docker containers namespace

### System Paths
- **/host/etc/** - Host /etc directory
- **/host/proc/** - Host /proc directory
- **/host/run/** - Host /run directory
- **/host/var/run/** - Host /var/run directory

## Summary by Category

### ✅ Accessible Endpoints
1. **http://localhost:2375** - Docker API (unencrypted)
2. **http://172.17.0.1:2375** - Docker API (from containers)
3. **http://localhost:26053** - Cursor exec-daemon
4. **http://ipinfo.io** - External IP info service
5. **/run/containerd/containerd.sock** - Containerd socket (via mount)

### ❌ Not Accessible (Checked)
- All Kubernetes ports (6443, 8080, 8443, 10250, etc.)
- Port 26500 (listening but not HTTP)

### ⚠️ Security Concerns
1. **Unencrypted Docker API** on port 2375
2. **Public IP addresses** (rotating, AWS NAT)
3. **Containerd socket** accessible via privileged container

## Quick Reference

### Most Important URLs
```
Docker API:        http://localhost:2375
Docker API (net):  http://172.17.0.1:2375
Cursor Daemon:     http://localhost:26053
IP Info:           http://ipinfo.io
```

### Container Registry URLs
```
AWS ECR:  public.ecr.aws/k0i0n2g5/cursorenvironments/universal:default-5ab0560
Docker Hub: docker.io/library/busybox:latest
```

### Network Ranges
```
Docker Bridge:  172.17.0.0/16
Gateway:        172.17.0.1
Our Container:  172.17.0.2
```
